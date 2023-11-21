// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorApp_db {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$App_dbBuilder databaseBuilder(String name) => _$App_dbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$App_dbBuilder inMemoryDatabaseBuilder() => _$App_dbBuilder(null);
}

class _$App_dbBuilder {
  _$App_dbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$App_dbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$App_dbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<App_db> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$App_db();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$App_db extends App_db {
  _$App_db([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudentDAO? _studentDAOInstance;

  DepartmentDAO? _departmentDAOInstance;

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
            'CREATE TABLE IF NOT EXISTS `StudentX` (`id` INTEGER, `full_name` TEXT NOT NULL, `phone_no` TEXT, `email` TEXT, `active` INTEGER, `deptID` INTEGER, FOREIGN KEY (`deptID`) REFERENCES `Department` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
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
  StudentDAO get studentDAO {
    return _studentDAOInstance ??= _$StudentDAO(database, changeListener);
  }

  @override
  DepartmentDAO get departmentDAO {
    return _departmentDAOInstance ??= _$DepartmentDAO(database, changeListener);
  }
}

class _$StudentDAO extends StudentDAO {
  _$StudentDAO(
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
                  'deptID': item.deptID
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
                  'deptID': item.deptID
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
                  'deptID': item.deptID
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Student> _studentInsertionAdapter;

  final UpdateAdapter<Student> _studentUpdateAdapter;

  final DeletionAdapter<Student> _studentDeletionAdapter;

  @override
  Future<List<Student>> getAllStu() async {
    return _queryAdapter.queryList('SELECT * FROM StudentX',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            name: row['full_name'] as String,
            phoneNo: row['phone_no'] as String?,
            email: row['email'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0,
            deptID: row['deptID'] as int?));
  }

  @override
  Future<Student?> getOneStu(int student_id) async {
    return _queryAdapter.query('SELECT * FROM StudentX WHERE id?1',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            name: row['full_name'] as String,
            phoneNo: row['phone_no'] as String?,
            email: row['email'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0,
            deptID: row['deptID'] as int?),
        arguments: [student_id]);
  }

  @override
  Future<int?> deleteStu(int id) async {
    return _queryAdapter.query('DELETE FROM StudentX WHERE id?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deleteAllStu() async {
    return _queryAdapter.query('DELETE FROM StudentX',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Student>> searchByName(String word) async {
    return _queryAdapter.queryList(
        'SELECT * FROM StudentX WHERE full_name LIKE ?1',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            name: row['full_name'] as String,
            phoneNo: row['phone_no'] as String?,
            email: row['email'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0,
            deptID: row['deptID'] as int?),
        arguments: [word]);
  }

  @override
  Future<int> addStu(Student s) {
    return _studentInsertionAdapter.insertAndReturnId(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> addStuList(List<Student> s) {
    return _studentInsertionAdapter.insertListAndReturnIds(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateStu(Student s) {
    return _studentUpdateAdapter.updateAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateStuList(List<Student> s) {
    return _studentUpdateAdapter.updateListAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteStu2(Student s) {
    return _studentDeletionAdapter.deleteAndReturnChangedRows(s);
  }

  @override
  Future<int> deleteStuList(List<Student> s) {
    return _studentDeletionAdapter.deleteListAndReturnChangedRows(s);
  }
}

class _$DepartmentDAO extends DepartmentDAO {
  _$DepartmentDAO(
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
  Future<List<Department>> getAllDept() async {
    return _queryAdapter.queryList('SELECT * FROM Department',
        mapper: (Map<String, Object?> row) =>
            Department(id: row['id'] as int?, name: row['name'] as String?));
  }

  @override
  Future<Department?> getOneDept(int dept_id) async {
    return _queryAdapter.query('SELECT * FROM Department WHERE id ?1',
        mapper: (Map<String, Object?> row) =>
            Department(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [dept_id]);
  }

  @override
  Future<int?> deleteDept(int id) async {
    return _queryAdapter.query('DELETE FROM Department WHERE id ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deleteAllDept() async {
    return _queryAdapter.query('DELETE FROM Department',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Department>> searchByName(String word) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Department WHERE full_name LIKE ?1',
        mapper: (Map<String, Object?> row) =>
            Department(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [word]);
  }

  @override
  Future<int> addDept(Department s) {
    return _departmentInsertionAdapter.insertAndReturnId(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> addDeptList(List<Department> s) {
    return _departmentInsertionAdapter.insertListAndReturnIds(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateDept(Department s) {
    return _departmentUpdateAdapter.updateAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateDeptList(List<Department> s) {
    return _departmentUpdateAdapter.updateListAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteDept2(Department s) {
    return _departmentDeletionAdapter.deleteAndReturnChangedRows(s);
  }

  @override
  Future<int> deleteDeptList(List<Department> s) {
    return _departmentDeletionAdapter.deleteListAndReturnChangedRows(s);
  }
}
