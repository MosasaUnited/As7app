abstract class SocialLoginStates {}

class SocialLoginInitial extends SocialLoginStates {}
class SocialLoginLoading extends SocialLoginStates {}
class SocialLoginSuccess extends SocialLoginStates {}
class SocialLoginError extends SocialLoginStates
{
  final String error;

  SocialLoginError(this.error);
}
class SocialChangePasswordVisibilityState extends SocialLoginStates {}