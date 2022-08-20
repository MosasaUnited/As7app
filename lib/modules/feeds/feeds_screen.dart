import 'package:as7app/shared/components/components.dart';
import 'package:as7app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Column(
        children:
        [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 20.0,
            margin: EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Image.network(
                  'https://img.freepik.com/free-photo/group-friends-jumping-top-hill_273609-15304.jpg',
                  fit: BoxFit.cover,
                  height: 180.0,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Communicate With Your Friends',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white,)),
                ),
              ]
            ),
          ),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 20.0,
            margin: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15.0,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/pretty-glad-brunette-asian-woman-stands-half-turned-against-pink-wall-has-good-mood-wears-stylish-jacket-with-hood-thinks-about-something-pleasant-poses-happy-indoor-emotions-concept_273609-49492.jpg?w=1380&t=st=1660793864~exp=1660794464~hmac=a76308a68e849637c76eaa0d2fd7c5ea81c36ceb6d6c0bee146c0f72b488237e',
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Mostafa Saad',
                                  style: TextStyle(
                                    height: 1.3,
                                  ),
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: defaultColor,
                                  size: 14.0,)
                              ],
                            ),
                            Text(
                              'August 18, 2022 at 6:07 am',
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                height: 1.3,
                              ),

                            ),
                          ],
                        ),
                      ),
                      IconButton(onPressed: (){},
                          icon: Icon(
                            Icons.more_horiz,
                            size: 15.0,
                          ),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey[300],

                    ),
                  ),
                  Text(
                    'History will have to record that the greatest tragedy of this period of social transition was not the strident clamor of the bad people, but the appalling silence of the good people',
                    style: TextStyle(
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Wrap(
                        children:
                        [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: 6.0,
                            ),
                            child: Container(
                              height: 20.0,
                              child: MaterialButton(
                                onPressed: (){},
                                height: 25.0,
                                minWidth: 1.0,
                                padding: EdgeInsets.zero,
                                child: Text(
                                  '#software',
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: defaultColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: 6.0,
                            ),
                            child: Container(
                              height: 20.0,
                              child: MaterialButton(
                                onPressed: (){},
                                height: 25.0,
                                minWidth: 1.0,
                                padding: EdgeInsets.zero,
                                child: Text(
                                  '#devleoper ',
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: defaultColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: 6.0,
                            ),
                            child: Container(
                              height: 20.0,
                              child: MaterialButton(
                                onPressed: (){},
                                height: 25.0,
                                minWidth: 1.0,
                                padding: EdgeInsets.zero,
                                child: Text(
                                  '#engineer',
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: defaultColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: 6.0,
                            ),
                            child: Container(
                              height: 20.0,
                              child: MaterialButton(
                                onPressed: (){},
                                height: 25.0,
                                minWidth: 1.0,
                                padding: EdgeInsets.zero,
                                child: Text(
                                  '#motivation',
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: defaultColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: 6.0,
                            ),
                            child: Container(
                              height: 20.0,
                              child: MaterialButton(
                                onPressed: (){},
                                height: 25.0,
                                minWidth: 1.0,
                                padding: EdgeInsets.zero,
                                child: Text(
                                  '#flutter',
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: defaultColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: 6.0,
                            ),
                            child: Container(
                              height: 20.0,
                              child: MaterialButton(
                                onPressed: (){},
                                height: 25.0,
                                minWidth: 1.0,
                                padding: EdgeInsets.zero,
                                child: Text(
                                  '#let\'sdoit',
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: defaultColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 140.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://img.freepik.com/free-vector/multicultural-people-standing-together_74855-6583.jpg?w=1480&t=st=1660799033~exp=1660799633~hmac=2338f9fe6ed3c27542bf04ce4102a31cce7b97ce9286c7e10192cf96b9664f49',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Row(
                      children:
                      [
                        Expanded(
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                children:
                                [
                                  Icon(
                                    IconBroken.Heart,
                                    size: 16.0,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    '140',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){},
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:
                                [
                                  Icon(
                                    IconBroken.Chat,
                                    size: 16.0,
                                    color: Colors.purple,
                                  ),
                                  Text(
                                    '160',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){},
                          ),
                        ),
                      ],
                    ),
                  ),
                  ])
              ),
            ),
        ],
      ),
    );
  }
}
