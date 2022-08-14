import 'package:as7app/cubit/cubit.dart';
import 'package:as7app/cubit/states.dart';
import 'package:as7app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            return Column(
              children:
              [

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
