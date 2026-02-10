// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, email, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final String id;
  final String name;
  final String email;
  final String createdAt;
  const UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      createdAt: Value(createdAt),
    );
  }

  factory UserData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  UserData copyWith({
    String? id,
    String? name,
    String? email,
    String? createdAt,
  }) => UserData(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    createdAt: createdAt ?? this.createdAt,
  );
  UserData copyWithCompanion(UserCompanion data) {
    return UserData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.createdAt == this.createdAt);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> createdAt;
  final Value<int> rowid;
  const UserCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserCompanion.insert({
    required String id,
    required String name,
    required String email,
    required String createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       email = Value(email),
       createdAt = Value(createdAt);
  static Insertable<UserData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? email,
    Value<String>? createdAt,
    Value<int>? rowid,
  }) {
    return UserCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuthSessionTable extends AuthSession
    with TableInfo<$AuthSessionTable, AuthSessionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthSessionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accessTokenMeta = const VerificationMeta(
    'accessToken',
  );
  @override
  late final GeneratedColumn<String> accessToken = GeneratedColumn<String>(
    'access_token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isLoggedInMeta = const VerificationMeta(
    'isLoggedIn',
  );
  @override
  late final GeneratedColumn<bool> isLoggedIn = GeneratedColumn<bool>(
    'is_logged_in',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_logged_in" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _lastLoginMeta = const VerificationMeta(
    'lastLogin',
  );
  @override
  late final GeneratedColumn<DateTime> lastLogin = GeneratedColumn<DateTime>(
    'last_login',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    accessToken,
    isLoggedIn,
    lastLogin,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auth_session';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuthSessionData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('access_token')) {
      context.handle(
        _accessTokenMeta,
        accessToken.isAcceptableOrUnknown(
          data['access_token']!,
          _accessTokenMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accessTokenMeta);
    }
    if (data.containsKey('is_logged_in')) {
      context.handle(
        _isLoggedInMeta,
        isLoggedIn.isAcceptableOrUnknown(
          data['is_logged_in']!,
          _isLoggedInMeta,
        ),
      );
    }
    if (data.containsKey('last_login')) {
      context.handle(
        _lastLoginMeta,
        lastLogin.isAcceptableOrUnknown(data['last_login']!, _lastLoginMeta),
      );
    } else if (isInserting) {
      context.missing(_lastLoginMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthSessionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthSessionData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      accessToken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}access_token'],
      )!,
      isLoggedIn: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_logged_in'],
      )!,
      lastLogin: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_login'],
      )!,
    );
  }

  @override
  $AuthSessionTable createAlias(String alias) {
    return $AuthSessionTable(attachedDatabase, alias);
  }
}

class AuthSessionData extends DataClass implements Insertable<AuthSessionData> {
  final String id;
  final String userId;
  final String accessToken;
  final bool isLoggedIn;
  final DateTime lastLogin;
  const AuthSessionData({
    required this.id,
    required this.userId,
    required this.accessToken,
    required this.isLoggedIn,
    required this.lastLogin,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['access_token'] = Variable<String>(accessToken);
    map['is_logged_in'] = Variable<bool>(isLoggedIn);
    map['last_login'] = Variable<DateTime>(lastLogin);
    return map;
  }

  AuthSessionCompanion toCompanion(bool nullToAbsent) {
    return AuthSessionCompanion(
      id: Value(id),
      userId: Value(userId),
      accessToken: Value(accessToken),
      isLoggedIn: Value(isLoggedIn),
      lastLogin: Value(lastLogin),
    );
  }

  factory AuthSessionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthSessionData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      accessToken: serializer.fromJson<String>(json['accessToken']),
      isLoggedIn: serializer.fromJson<bool>(json['isLoggedIn']),
      lastLogin: serializer.fromJson<DateTime>(json['lastLogin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'accessToken': serializer.toJson<String>(accessToken),
      'isLoggedIn': serializer.toJson<bool>(isLoggedIn),
      'lastLogin': serializer.toJson<DateTime>(lastLogin),
    };
  }

  AuthSessionData copyWith({
    String? id,
    String? userId,
    String? accessToken,
    bool? isLoggedIn,
    DateTime? lastLogin,
  }) => AuthSessionData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    accessToken: accessToken ?? this.accessToken,
    isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    lastLogin: lastLogin ?? this.lastLogin,
  );
  AuthSessionData copyWithCompanion(AuthSessionCompanion data) {
    return AuthSessionData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      accessToken: data.accessToken.present
          ? data.accessToken.value
          : this.accessToken,
      isLoggedIn: data.isLoggedIn.present
          ? data.isLoggedIn.value
          : this.isLoggedIn,
      lastLogin: data.lastLogin.present ? data.lastLogin.value : this.lastLogin,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthSessionData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('accessToken: $accessToken, ')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('lastLogin: $lastLogin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, accessToken, isLoggedIn, lastLogin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthSessionData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.accessToken == this.accessToken &&
          other.isLoggedIn == this.isLoggedIn &&
          other.lastLogin == this.lastLogin);
}

class AuthSessionCompanion extends UpdateCompanion<AuthSessionData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> accessToken;
  final Value<bool> isLoggedIn;
  final Value<DateTime> lastLogin;
  final Value<int> rowid;
  const AuthSessionCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.accessToken = const Value.absent(),
    this.isLoggedIn = const Value.absent(),
    this.lastLogin = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuthSessionCompanion.insert({
    required String id,
    required String userId,
    required String accessToken,
    this.isLoggedIn = const Value.absent(),
    required DateTime lastLogin,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       accessToken = Value(accessToken),
       lastLogin = Value(lastLogin);
  static Insertable<AuthSessionData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? accessToken,
    Expression<bool>? isLoggedIn,
    Expression<DateTime>? lastLogin,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (accessToken != null) 'access_token': accessToken,
      if (isLoggedIn != null) 'is_logged_in': isLoggedIn,
      if (lastLogin != null) 'last_login': lastLogin,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuthSessionCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? accessToken,
    Value<bool>? isLoggedIn,
    Value<DateTime>? lastLogin,
    Value<int>? rowid,
  }) {
    return AuthSessionCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      accessToken: accessToken ?? this.accessToken,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      lastLogin: lastLogin ?? this.lastLogin,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (accessToken.present) {
      map['access_token'] = Variable<String>(accessToken.value);
    }
    if (isLoggedIn.present) {
      map['is_logged_in'] = Variable<bool>(isLoggedIn.value);
    }
    if (lastLogin.present) {
      map['last_login'] = Variable<DateTime>(lastLogin.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthSessionCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('accessToken: $accessToken, ')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('lastLogin: $lastLogin, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserTable user = $UserTable(this);
  late final $AuthSessionTable authSession = $AuthSessionTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final AuthDao authDao = AuthDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user, authSession];
}

typedef $$UserTableCreateCompanionBuilder =
    UserCompanion Function({
      required String id,
      required String name,
      required String email,
      required String createdAt,
      Value<int> rowid,
    });
typedef $$UserTableUpdateCompanionBuilder =
    UserCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> email,
      Value<String> createdAt,
      Value<int> rowid,
    });

class $$UserTableFilterComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserTableOrderingComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$UserTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserTable,
          UserData,
          $$UserTableFilterComposer,
          $$UserTableOrderingComposer,
          $$UserTableAnnotationComposer,
          $$UserTableCreateCompanionBuilder,
          $$UserTableUpdateCompanionBuilder,
          (UserData, BaseReferences<_$AppDatabase, $UserTable, UserData>),
          UserData,
          PrefetchHooks Function()
        > {
  $$UserTableTableManager(_$AppDatabase db, $UserTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion(
                id: id,
                name: name,
                email: email,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String email,
                required String createdAt,
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion.insert(
                id: id,
                name: name,
                email: email,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserTable,
      UserData,
      $$UserTableFilterComposer,
      $$UserTableOrderingComposer,
      $$UserTableAnnotationComposer,
      $$UserTableCreateCompanionBuilder,
      $$UserTableUpdateCompanionBuilder,
      (UserData, BaseReferences<_$AppDatabase, $UserTable, UserData>),
      UserData,
      PrefetchHooks Function()
    >;
typedef $$AuthSessionTableCreateCompanionBuilder =
    AuthSessionCompanion Function({
      required String id,
      required String userId,
      required String accessToken,
      Value<bool> isLoggedIn,
      required DateTime lastLogin,
      Value<int> rowid,
    });
typedef $$AuthSessionTableUpdateCompanionBuilder =
    AuthSessionCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> accessToken,
      Value<bool> isLoggedIn,
      Value<DateTime> lastLogin,
      Value<int> rowid,
    });

class $$AuthSessionTableFilterComposer
    extends Composer<_$AppDatabase, $AuthSessionTable> {
  $$AuthSessionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastLogin => $composableBuilder(
    column: $table.lastLogin,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuthSessionTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthSessionTable> {
  $$AuthSessionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastLogin => $composableBuilder(
    column: $table.lastLogin,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuthSessionTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthSessionTable> {
  $$AuthSessionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastLogin =>
      $composableBuilder(column: $table.lastLogin, builder: (column) => column);
}

class $$AuthSessionTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuthSessionTable,
          AuthSessionData,
          $$AuthSessionTableFilterComposer,
          $$AuthSessionTableOrderingComposer,
          $$AuthSessionTableAnnotationComposer,
          $$AuthSessionTableCreateCompanionBuilder,
          $$AuthSessionTableUpdateCompanionBuilder,
          (
            AuthSessionData,
            BaseReferences<_$AppDatabase, $AuthSessionTable, AuthSessionData>,
          ),
          AuthSessionData,
          PrefetchHooks Function()
        > {
  $$AuthSessionTableTableManager(_$AppDatabase db, $AuthSessionTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthSessionTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthSessionTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthSessionTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> accessToken = const Value.absent(),
                Value<bool> isLoggedIn = const Value.absent(),
                Value<DateTime> lastLogin = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AuthSessionCompanion(
                id: id,
                userId: userId,
                accessToken: accessToken,
                isLoggedIn: isLoggedIn,
                lastLogin: lastLogin,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String accessToken,
                Value<bool> isLoggedIn = const Value.absent(),
                required DateTime lastLogin,
                Value<int> rowid = const Value.absent(),
              }) => AuthSessionCompanion.insert(
                id: id,
                userId: userId,
                accessToken: accessToken,
                isLoggedIn: isLoggedIn,
                lastLogin: lastLogin,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuthSessionTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuthSessionTable,
      AuthSessionData,
      $$AuthSessionTableFilterComposer,
      $$AuthSessionTableOrderingComposer,
      $$AuthSessionTableAnnotationComposer,
      $$AuthSessionTableCreateCompanionBuilder,
      $$AuthSessionTableUpdateCompanionBuilder,
      (
        AuthSessionData,
        BaseReferences<_$AppDatabase, $AuthSessionTable, AuthSessionData>,
      ),
      AuthSessionData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserTableTableManager get user => $$UserTableTableManager(_db, _db.user);
  $$AuthSessionTableTableManager get authSession =>
      $$AuthSessionTableTableManager(_db, _db.authSession);
}
