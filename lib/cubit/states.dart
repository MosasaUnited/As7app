abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates
{
  final String error;

  SocialGetUserErrorState(this.error);
}

// to Get Posts to Feed Screen

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsLoadingState extends SocialStates {}

class SocialGetPostsErrorState extends SocialStates
{
  final String error;

  SocialGetPostsErrorState(this.error);
}

// to get Like button

class SocialLikePostsSuccessState extends SocialStates {}

class SocialLikePostsErrorState extends SocialStates
{
  final String error;

  SocialLikePostsErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialStates {}

class SocialNewPostState extends SocialStates {}

// States for Profile Pick

class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedErrorState extends SocialStates {}

// States for Cover Pick

class SocialCoverPickedSuccessState extends SocialStates {}

class SocialCoverPickedErrorState extends SocialStates {}

// States for Upload Profile Photo

class SocialUploadProfileSuccessState extends SocialStates {}

class SocialUploadProfileErrorState extends SocialStates {}

// States for Upload Cover

class SocialUploadCoverSuccessState extends SocialStates {}

class SocialUploadCoverErrorState extends SocialStates {}

// States for User Update Changes

class SocialUserUpdateLoadingState extends SocialStates {}

class SocialUserUpdateErrorState extends SocialStates {}

// States for Creat Post

class SocialCreatPostLoadingState extends SocialStates{}

class SocialCreatPostSuccessState extends SocialStates{}

class SocialCreatPostErrorState extends SocialStates{}

//States for Post Images

class SocialPostImagePickedSuccessState extends SocialStates{}

class SocialPostImagePickedErrorState extends SocialStates{}

class SocialRemovePostImageState extends SocialStates{}