// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudentDao? _studentDaoInstance;

  DepartmentDao? _departmentDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `StudentX` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `full_name` TEXT, `phone_no` TEXT, `email` TEXT, `active` INTEGER, `departmentId` INTEGER, FOREIGN KEY (`departmentId`) REFERENCES `Department` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Department` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE INDEX `index_StudentX_phone_no_email` ON `StudentX` (`phone_no`, `email`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudentDao get studentDao {
    return _studentDaoInstance ??= _$StudentDao(database, changeListener);
  }

  @override
  DepartmentDao get departmentDao {
    return _departmentDaoInstance ??= _$DepartmentDao(database, changeListener);
  }
}

class _$StudentDao extends StudentDao {
  _$StudentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _studentInsertionAdapter = InsertionAdapter(
            database,
            'StudentX',
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'full_name': item.name,
                  'phone_no': item.phoneNo,
                  'email': item.email,
                  'active': item.active == null ? null : (item.active! ? 1 : 0),
                  'departmentId': item.departmentId
                }),
        _studentUpdateAdapter = UpdateAdapter(
            database,
            'StudentX',
            ['id'],
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'full_name': item.name,
                  'phone_no': item.phoneNo,
                  'email': item.email,
                  'active': item.active == null ? null : (item.active! ? 1 : 0),
                  'departmentId': item.departmentId
                }),
        _studentDeletionAdapter = DeletionAdapter(
            database,
            'StudentX',
            ['id'],
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'full_name': item.name,
                  'phone_no': item.phoneNo,
                  'email': item.email,
                  'active': item.active == null ? null : (item.active! ? 1 : 0),
                  'departmentId': item.departmentId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Student> _studentInsertionAdapter;

  final UpdateAdapter<Student> _studentUpdateAdapter;

  final DeletionAdapter<Student> _studentDeletionAdapter;

  @override
  Future<List<Student>> getAllStudents() async {
    return _queryAdapter.queryList('SELECT * FROM StudentX',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            name: row['full_name'] as String?,
            phoneNo: row['phone_no'] as String?,
            departmentId: row['departmentId'] as int?,
            email: row['email'] as String?,
            active:
                row['active'] == null ? null : (row['active'] as int) != 0));
  }

  @override
  Future<Student?> getOneStudent(int id) async {
    return _queryAdapter.query('SELECT * FROM StudentX WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            name: row['full_name'] as String?,
            phoneNo: row['phone_no'] as String?,
            departmentId: row['departmentId'] as int?,
            email: row['email'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<int?> deleteStudent(int id) async {
    return _queryAdapter.query('DELETE FROM StudentX WHERE id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deletAllStudent() async {
    return _queryAdapter.query('DELETE FROM StudentX',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Student>> searchByName(String word) async {
    return _queryAdapter.queryList(
        'SELECT * FROM StudentX WHERE full_name LIKE ?1',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            name: row['full_name'] as String?,
            phoneNo: row['phone_no'] as String?,
            departmentId: row['departmentId'] as int?,
            email: row['email'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0),
        arguments: [word]);
  }

  @override
  Future<int> AddStudent(Student s) {
    return _studentInsertionAdapter.insertAndReturnId(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> AddStudentList(List<Student> s) {
    return _studentInsertionAdapter.insertListAndReturnIds(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateStudent(Student s) {
    return _studentUpdateAdapter.updateAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateStudentList(List<Student> s) {
    return _studentUpdateAdapter.updateListAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteStudent2(Student s) {
    return _studentDeletionAdapter.deleteAndReturnChangedRows(s);
  }

  @override
  Future<int> deleteStudentList(List<Student> s) {
    return _studentDeletionAdapter.deleteListAndReturnChangedRows(s);
  }
}

class _$DepartmentDao extends DepartmentDao {
  _$DepartmentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _departmentInsertionAdapter = InsertionAdapter(
            database,
            'Department',
            (Department item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _departmentUpdateAdapter = UpdateAdapter(
            database,
            'Department',
            ['id'],
            (Department item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _departmentDeletionAdapter = DeletionAdapter(
            database,
            'Department',
            ['id'],
            (Department item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Department> _departmentInsertionAdapter;

  final UpdateAdapter<Department> _departmentUpdateAdapter;

  final DeletionAdapter<Department> _departmentDeletionAdapter;

  @override
  Future<List<Department>> getAllDepartments() async {
    return _queryAdapter.queryList('SELECT * FORM Department',
        mapper: (Map<String, Object?> row) =>
            Department(id: row['id'] as int?, name: row['name'] as String?));
  }

  @override
  Future<Department?> getOneDepartment(int id) async {
    return _queryAdapter.query('SELECT * FORM Department WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Department(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [id]);
  }

  @override
  Future<int?> deleteDepartment(int id) async {
    return _queryAdapter.query('DELETE FROM Department WHERE id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deletAllDepartment() async {
    return _queryAdapter.query('DELETE FROM Department',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Department>> searchByName(String word) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Department WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) =>
            Department(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [word]);
  }

  @override
  Future<int> AddDepartment(Department s) {
    return _departmentInsertionAdapter.insertAndReturnId(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> AddDepartmentList(List<Department> s) {
    return _departmentInsertionAdapter.insertListAndReturnIds(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateDepartment(Department s) {
    return _departmentUpdateAdapter.updateAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateDepartmentList(List<Department> s) {
    return _departmentUpdateAdapter.updateListAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteDepartment2(Department s) {
    return _departmentDeletionAdapter.deleteAndReturnChangedRows(s);
  }

  @override
  Future<int> deleteDepartmentList(List<Department> s) {
    return _departmentDeletionAdapter.deleteListAndReturnChangedRows(s);
  }
}
