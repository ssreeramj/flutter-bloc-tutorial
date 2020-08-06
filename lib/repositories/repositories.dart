import 'package:bloc_tutorial/networking/api_client.dart';
import 'package:bloc_tutorial/models/barrel.dart';

class UserRepository {
  final UserApiClient apiClient;

  UserRepository(this.apiClient);

  Future<List<User>> getUsers() async {
    return await apiClient.getUsers();
  }
}
