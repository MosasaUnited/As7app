import 'package:as7app/cubit/cubit.dart';
import 'package:as7app/cubit/states.dart';
import 'package:as7app/shared/components/components.dart';
import 'package:as7app/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var  userModel = SocialCubit.get(context).userModel;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                IconBroken.Arrow___Left_2,
              ), onPressed: ()
            {
              Navigator.pop(context);
            },
            ),
            titleSpacing: 1.0,
            title: Text(
              'Edit Profile',
            ),
            actions: [
              TextButton(
                onPressed: (){},
                child: Text(
                  'Update',
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
            ],

          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 190.0,
                    child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children:
                        [
                          Align(
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children:[
                                Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      '${userModel!.cover}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                                IconButton(
                                    onPressed: (){},
                                    icon: CircleAvatar(
                                      radius: 20.0,
                                      child: Icon(
                                        IconBroken.Camera,
                                        size: 18.0,
                                      ),
                                    ),),
                            ]),
                            alignment: AlignmentDirectional.topCenter,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children:
                            [
                              CircleAvatar(
                              radius: 63.0,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: NetworkImage(
                                  '${userModel.image}',
                                ),
                              ),
                            ),
                              IconButton(
                                onPressed: (){},
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 18.0,
                                  ),
                                ),),
                          ]),
                        ]),
                  ),
                  SizedBox(
                height: 5.0,
              ),

                  defaultFormField(
                  controller: nameController,
                  type: TextInputType.name,
                  validate: (String? value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Name Must Not to Be Empty';
                    }
                  },
                  label: 'Name',
                  prefix: IconBroken.User,
              ),
                  SizedBox(
                    height: 15.0,
                  ),

                  defaultFormField(
                    controller: bioController,
                    type: TextInputType.name,
                    validate: (String? value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'Bio Must Not to Be Empty';
                      }
                    },
                    label: 'Bio',
                    prefix: IconBroken.Bookmark,
                  )
              ],
              ),
            ),
          ),

        );
      },
    );
  }
}
