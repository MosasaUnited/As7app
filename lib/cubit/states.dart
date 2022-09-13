abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates
{
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialStates {}

class SocialNewPostState extends SocialStates {}

class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedErrorState extends SocialStates {}

class SocialProfileCoverPickedSuccessState extends SocialStates {}

class SocialProfileCoverPickedErrorState extends SocialStates {}

class SocialUploadProfileSuccessState extends SocialStates {}

class SocialUploadProfileErrorState extends SocialStates {}

class SocialUploadCoverSuccessState extends SocialStates {}

class SocialUploadCoverErrorState extends SocialStates {}

class SocialUserUpdateLoadingState extends SocialStates {}

class SocialUserUpdateErrorState extends SocialStates {}