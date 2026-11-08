import '../services/api_service.dart';
import '../repositories/user_repository.dart';
import '../repositories/user_repository_impl.dart';
import '../repositories/post_repository.dart';
import '../repositories/post_repository_impl.dart';

class DependencyInjector {
  // Singleton instance
  static final DependencyInjector _instance = DependencyInjector._internal();
  factory DependencyInjector() => _instance;
  DependencyInjector._internal();

  // Instances
  late final ApiService apiService = ApiService();
  late final UserRepository userRepository = UserRepositoryImpl(
    apiService: apiService,
  );
  late final PostRepository postRepository = PostRepositoryImpl(
    apiService: apiService,
  );
}
