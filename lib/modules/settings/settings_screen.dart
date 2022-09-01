import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Padding(
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
                  child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://img.freepik.com/free-photo/group-friends-jumping-top-hill_273609-15304.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
              ),
                  alignment: AlignmentDirectional.topCenter,
                ),
                CircleAvatar(
                  radius: 63.0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/pretty-glad-brunette-asian-woman-stands-half-turned-against-pink-wall-has-good-mood-wears-stylish-jacket-with-hood-thinks-about-something-pleasant-poses-happy-indoor-emotions-concept_273609-49492.jpg?w=1380&t=st=1660793864~exp=1660794464~hmac=a76308a68e849637c76eaa0d2fd7c5ea81c36ceb6d6c0bee146c0f72b488237e',
                    ),
                  ),
                ),
            ]),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Mostafa Saad',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'bio...',
            style: Theme.of(context).textTheme.caption,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Column(
                    children: [
                      Text(
                        '100',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        'Posts',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
