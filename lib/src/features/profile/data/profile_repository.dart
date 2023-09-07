import '../domain/user_model.dart';

class UserRepository {
  User _user = User(
    id: '1',
    name: 'Imtiaz Ahmad',
    email: 'user@example.com',
    profilePicture:
        "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg",
  );

  User get user => _user;

  Future<void> updateUserProfile(User updatedUser) async {
    await Future.delayed(Duration(seconds: 2));
    _user = updatedUser;
  }
}
