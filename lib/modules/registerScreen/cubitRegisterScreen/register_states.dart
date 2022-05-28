
abstract class SocialRegisterStates {}

class SocialRegisterInitial extends SocialRegisterStates {}
class SocialRegisterLoading extends SocialRegisterStates {}
class SocialRegisterSuccess extends SocialRegisterStates {}
class SocialRegisterError extends SocialRegisterStates
{
  final String error;

  SocialRegisterError(this.error);
}
class SocialChangeRegisterPasswordVisibilityState extends SocialRegisterStates {}