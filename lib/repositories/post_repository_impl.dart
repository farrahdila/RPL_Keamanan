import '../models/post.dart';
import '../services/api_service.dart';
import 'post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final ApiService apiService;

  PostRepositoryImpl({required this.apiService});

  @override
  Future<List<Post>> getPosts() async {
    final data = await apiService.get('/posts');
    return (data as List).map((json) => Post.fromJson(json)).toList();
  }
}
