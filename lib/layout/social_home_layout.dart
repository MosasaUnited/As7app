import 'package:as7app/cubit/cubit.dart';
import 'package:as7app/cubit/states.dart';
import 'package:as7app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
        appBar: AppBar(
          title: Text(
            'News Feed',
          ),
        ),
        body: ConditionalBuilder(
          condition: SocialCubit.get(context).model != null,
          builder: (context)
          {
            var model = SocialCubit.get(context).model;

            return Column(
              children: [
                if(!model.isEmailVerified)
                  Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                        ),
                        Expanded(
                          child: Text(
                              'Please Verify Your Email'),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        defaultButton(
                            width: 70.0,
                            function: (){},
                            text: 'Send'),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        ),
        );
      },

    );
  }
}
