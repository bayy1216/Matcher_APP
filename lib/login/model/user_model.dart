sealed class UserModelBase{}

class UserModelError extends UserModelBase{
  final String message;
  UserModelError({required this.message});
}

class UserModel extends UserModelBase{

}

