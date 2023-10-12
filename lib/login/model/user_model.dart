sealed class UserModelBase{}

class UserModelLoading extends UserModelBase{}

class UserModelError extends UserModelBase{
  final String message;
  UserModelError({required this.message});
}

class UserModel extends UserModelBase{

}

