part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;
  const AuthCheckEmail(this.email);

  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent {
  final SignUpFormModel data;
  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent {
  final SignInFormModel data;
  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthGetCurrent extends AuthEvent {}

class AuthUpdateUser extends AuthEvent {
  final UserModel user;
  final UserEditFormModel data;
  const AuthUpdateUser(this.user, this.data);

  @override
  List<Object> get props => [data, user];
}

class AuthUpdatePin extends AuthEvent {
  final String oldPin;
  final String newPin;
  final UserModel user;

  const AuthUpdatePin(
    this.user,
    this.oldPin,
    this.newPin,
  );

  @override
  List<Object> get props => [user, oldPin, newPin];
}

class AuthLogout extends AuthEvent {}
