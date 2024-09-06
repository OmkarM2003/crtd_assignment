import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user_model.dart';
import '../services/service.dart'; // Assuming this is where fetchUsers is defined

final userProvider = FutureProvider<List<User>>((ref) async {
  return UserService().fetchUsers();
});
