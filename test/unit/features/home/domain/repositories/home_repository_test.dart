import 'package:animal_task/core/error/app_exception.dart';
import 'package:animal_task/features/home/data/datasources/home_remote_data_source.dart';
import 'package:animal_task/features/home/data/models/cat_model.dart';
import 'package:animal_task/features/home/data/repositories/home_repository_impl.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeApiService extends Mock implements HomeApiService {}

void main() {
  late HomeRepositoryImpl repository;
  late MockHomeApiService mockService;

  setUp(() {
    mockService = MockHomeApiService();
    repository = HomeRepositoryImpl(remoteDataSource: mockService);
  });

  group('HomeRepositoryImpl.getCats', () {
    test(
      'should return Right(List<Cat>) when api call is successful',
      () async {
        // Arrange
        final mockCatModels = [
          CatModel(
            breeds: [
              Breed(
                id: '1',
                name: 'Abyssinian',
                temperament: 'Active, Energetic',
                origin: 'Egypt',
                description: 'A playful cat.',
                lifeSpan: '14 - 15',
                indoor: 0,
                lap: 1,
                adaptability: 5,
                affectionLevel: 5,
                childFriendly: 4,
                dogFriendly: 4,
                energyLevel: 5,
                grooming: 2,
                healthIssues: 2,
                intelligence: 5,
                sheddingLevel: 3,
                socialNeeds: 4,
                strangerFriendly: 4,
                vocalisation: 3,
                experimental: 0,
                hairless: 0,
                natural: 1,
                rare: 0,
                rex: 0,
                suppressedTail: 0,
                shortLegs: 0,
                hypoallergenic: 0,
                weight: Weight(imperial: '7', metric: '3'),
              ),
            ],
            id: 'abc123',
            url: 'https://test.com/image.jpg',
            width: 500,
            height: 400,
          ),
        ];

        when(
          () => mockService.getCats(),
        ).thenAnswer((_) async => mockCatModels);

        // Act
        final result = await repository.getCats();

        // Assert
        expect(result.isRight(), true);
        final cats = result.fold((l) => null, (r) => r);
        expect(cats, isA<List<Cat>>());
        expect(cats!.first.name, 'Abyssinian');

        verify(() => mockService.getCats()).called(1);
      },
    );

    test(
      'should return Left(AppException) when api call throws error',
      () async {
        // Arrange
        when(() => mockService.getCats()).thenThrow(Exception('Server error'));

        // Act
        final result = await repository.getCats();

        // Assert
        expect(result.isLeft(), true);
        final exception = result.fold((l) => l, (r) => null);
        expect(exception, isA<AppException>());

        verify(() => mockService.getCats()).called(1);
      },
    );
  });
}
