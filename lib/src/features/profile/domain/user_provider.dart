import 'package:riverpod/riverpod.dart';

import '../data/profile_repository.dart';
import 'user_model.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepository());

final userProfileProvider = Provider<User>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.user;
});

final isEditingProvider = StateProvider<bool>((ref) => false);

class UserState {
  final User user;
  final bool isEditing;

  UserState({
    required this.user,
    required this.isEditing,
  });
}
