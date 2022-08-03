abstract class SocialLoginStates {}

class SocialLoginInitial extends SocialLoginStates {}
class SocialLoginLoading extends SocialLoginStates {}
class SocialLoginSuccess extends SocialLoginStates {
  final String? uId;

  SocialLoginSuccess(this.uId);
}
class SocialLoginError extends SocialLoginStates
{
  final String error;

  SocialLoginError(this.error);
}
class SocialChangePasswordVisibilityState extends SocialLoginStates {}