import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../../data/datasources/home_remote_data_source.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/get_home_data_usecase.dart';
import '../viewmodels/home_view_model.dart';

/// Home 기능 의존성 주입 설정

/// Dio 프로바이더
final dioProvider = Provider<Dio>((ref) {
  return DioClient.instance;
});

/// HomeRemoteDataSource 프로바이더
final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeRemoteDataSource(dio);
});

/// HomeRepository 프로바이더
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final remoteDataSource = ref.watch(homeRemoteDataSourceProvider);
  return HomeRepositoryImpl(remoteDataSource);
});

/// GetHomeDataUseCase 프로바이더
final getHomeDataUseCaseProvider = Provider<GetHomeDataUseCase>((ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return GetHomeDataUseCase(repository);
});

/// HomeViewModel 프로바이더
final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  final useCase = ref.watch(getHomeDataUseCaseProvider);
  return HomeViewModel(useCase);
});
