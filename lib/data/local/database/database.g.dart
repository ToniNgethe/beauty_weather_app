// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorWeatherAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WeatherAppDatabaseBuilder databaseBuilder(String name) =>
      _$WeatherAppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WeatherAppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$WeatherAppDatabaseBuilder(null);
}

class _$WeatherAppDatabaseBuilder {
  _$WeatherAppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$WeatherAppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$WeatherAppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<WeatherAppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$WeatherAppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$WeatherAppDatabase extends WeatherAppDatabase {
  _$WeatherAppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WeatherDao? _weatherDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WeatherModel` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `weather` INTEGER, `temp` REAL, `min` REAL, `max` REAL, `day` TEXT, `savedDate` TEXT, `tag` TEXT, `locationName` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WeatherDao get weatherDao {
    return _weatherDaoInstance ??= _$WeatherDao(database, changeListener);
  }
}

class _$WeatherDao extends WeatherDao {
  _$WeatherDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _weatherModelInsertionAdapter = InsertionAdapter(
            database,
            'WeatherModel',
            (WeatherModel item) => <String, Object?>{
                  'id': item.id,
                  'weather': item.weather,
                  'temp': item.temp,
                  'min': item.min,
                  'max': item.max,
                  'day': item.day,
                  'savedDate': item.savedDate,
                  'tag': item.tag,
                  'locationName': item.locationName
                }),
        _weatherModelUpdateAdapter = UpdateAdapter(
            database,
            'WeatherModel',
            ['id'],
            (WeatherModel item) => <String, Object?>{
                  'id': item.id,
                  'weather': item.weather,
                  'temp': item.temp,
                  'min': item.min,
                  'max': item.max,
                  'day': item.day,
                  'savedDate': item.savedDate,
                  'tag': item.tag,
                  'locationName': item.locationName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WeatherModel> _weatherModelInsertionAdapter;

  final UpdateAdapter<WeatherModel> _weatherModelUpdateAdapter;

  @override
  Future<void> deleteAllRecords(String tag1, String tag2) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM WeatherModel where tag = ?1 OR tag = ?2',
        arguments: [tag1, tag2]);
  }

  @override
  Future<WeatherModel?> getWeatherModelByTag(String tag) async {
    return _queryAdapter.query('SELECT * FROM WeatherModel WHERE tag = ?1',
        mapper: (Map<String, Object?> row) => WeatherModel(
            row['id'] as int?,
            row['max'] as double?,
            row['min'] as double?,
            row['temp'] as double?,
            row['weather'] as int?,
            row['tag'] as String?,
            row['locationName'] as String?,
            row['savedDate'] as String?,
            day: row['day'] as String?),
        arguments: [tag]);
  }

  @override
  Future<WeatherModel?> getWeatherByLocationName(
      String locationName, String tag) async {
    return _queryAdapter.query(
        'SELECT * FROM WeatherModel WHERE locationName = ?1 AND tag = ?2',
        mapper: (Map<String, Object?> row) => WeatherModel(
            row['id'] as int?,
            row['max'] as double?,
            row['min'] as double?,
            row['temp'] as double?,
            row['weather'] as int?,
            row['tag'] as String?,
            row['locationName'] as String?,
            row['savedDate'] as String?,
            day: row['day'] as String?),
        arguments: [locationName, tag]);
  }

  @override
  Future<List<WeatherModel>?> getWeatherModels(String tag) async {
    return _queryAdapter.queryList('SELECT * FROM WeatherModel WHERE tag = ?1',
        mapper: (Map<String, Object?> row) => WeatherModel(
            row['id'] as int?,
            row['max'] as double?,
            row['min'] as double?,
            row['temp'] as double?,
            row['weather'] as int?,
            row['tag'] as String?,
            row['locationName'] as String?,
            row['savedDate'] as String?,
            day: row['day'] as String?),
        arguments: [tag]);
  }

  @override
  Future<void> insertWeatherModel(WeatherModel weatherModel) async {
    await _weatherModelInsertionAdapter.insert(
        weatherModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertWeatherModels(List<WeatherModel> weatherModel) async {
    await _weatherModelInsertionAdapter.insertList(
        weatherModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateWeatherModel(WeatherModel weatherModel) async {
    await _weatherModelUpdateAdapter.update(
        weatherModel, OnConflictStrategy.abort);
  }
}
