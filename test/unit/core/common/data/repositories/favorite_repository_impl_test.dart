import 'package:animal_task/core/common/data/datasources/common_api_service.dart';
import 'package:animal_task/core/common/data/model/favorites_model.dart';
import 'package:animal_task/features/home/data/models/add_to_favourite_body.dart';
import 'package:animal_task/core/common/data/repositories/favorite_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCommonApiService extends Mock implements CommonApiService {}
class FakeAddToFavoriteModel extends Fake implements AddToFavoriteModel {}

void main() {
  late FavoriteRepositoryImpl repository;
  late MockCommonApiService mockApiService;

  setUp(() {
    mockApiService = MockCommonApiService();
    repository = FavoriteRepositoryImpl(apiService: mockApiService);
  });
  setUpAll(() {
 registerFallbackValue(FakeAddToFavoriteModel());
  });

  group('FavoriteRepositoryImpl Tests', () {
    final tFavorites = [
      FavoritesModel(
        id: 1,
        userId: 'user1',
        imageId: 'img1',
        subId: 'sub1',
        createdAt: '2025-10-17',
        image: ImageModel(id: 'img1', url: 'https://image.url'),
      ),
    ];

    final tAddBody = AddToFavoriteModel(id: '1', imageId: 'img1');

    test(
      
      'should return List<FavoritesModel> when getFavorites succeeds',
      () async {
        // Arrange
        when(
          () => mockApiService.getFavorites(),
        ).thenAnswer((_) async => tFavorites);

        // Act
        final result = await repository.getFavorites();

        // Assert
        expect(result, Right(tFavorites));
        verify(() => mockApiService.getFavorites()).called(1);
      },
    );

    test(
      'should return AppException when getFavorites throws error',
      () async {
        // Arrange
        when(() => mockApiService.getFavorites()).thenThrow(Exception('Error'));

        // Act
        final result = await repository.getFavorites();

        // Assert
        expect(result.isLeft(), true);
        verify(() => mockApiService.getFavorites()).called(1);
      },
    );

    test('should return Right(null) when addFavorite succeeds', () async {
      // Arrange
      when(
        () => mockApiService.addFavorite(body: any(named: 'body')),
      ).thenAnswer((_) async {});

      // Act
      final result = await repository.addFavorite(body: tAddBody);

      // Assert
      expect(result, const Right(null));
      verify(() => mockApiService.addFavorite(body: tAddBody)).called(1);
    });

    test('should return AppException when addFavorite fails', () async {
      // Arrange
      when(
        () => mockApiService.addFavorite(body: any(named: 'body')),
      ).thenThrow(Exception('Error'));

      // Act
      final result = await repository.addFavorite(body: tAddBody);

      // Assert
      expect(result.isLeft(), true);
      verify(() => mockApiService.addFavorite(body: tAddBody)).called(1);
    });

    test('should return Right(null) when removeFavorite succeeds', () async {
      // Arrange
      when(
        () => mockApiService.removeFavorite(id: any(named: 'id')),
      ).thenAnswer((_) async {});

      // Act
      final result = await repository.removeFavorite(id: 1);

      // Assert
      expect(result, const Right(null));
      verify(() => mockApiService.removeFavorite(id: 1)).called(1);
    });

    test('should return AppException when removeFavorite fails', () async {
      // Arrange
      when(
        () => mockApiService.removeFavorite(id: any(named: 'id')),
      ).thenThrow(Exception('Error'));

      // Act
      final result = await repository.removeFavorite(id: 1);

      // Assert
      expect(result.isLeft(), true);
      verify(() => mockApiService.removeFavorite(id: 1)).called(1);
    });
  });
}
