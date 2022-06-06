
abstract class SocialRegisterStates {}

class SocialRegisterInitial extends SocialRegisterStates {}
class SocialRegisterLoading extends SocialRegisterStates {}
class SocialRegisterSuccess extends SocialRegisterStates {}
class SocialRegisterError extends SocialRegisterStates
{
  final String error;

  SocialRegisterError(this.error);
}
class SocialCreatUserSuccess extends SocialRegisterStates {}
class SocialCreatUserError extends SocialRegisterStates
{
  final String error;

  SocialCreatUserError(this.error);
}
class SocialChangeRegisterPasswordVisibilityState extends SocialRegisterStates {}