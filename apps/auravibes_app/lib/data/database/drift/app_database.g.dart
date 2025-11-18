// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WorkspacesTable extends Workspaces
    with TableInfo<$WorkspacesTable, WorkspacesTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkspacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const UuidV7().generate(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
  @override
  late final GeneratedColumnWithTypeConverter<WorkspaceType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<WorkspaceType>($WorkspacesTable.$convertertype);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    name,
    type,
    url,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workspaces';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkspacesTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  WorkspacesTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkspacesTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: $WorkspacesTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
    );
  }

  @override
  $WorkspacesTable createAlias(String alias) {
    return $WorkspacesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<WorkspaceType, String, String> $convertertype =
      const EnumNameConverter<WorkspaceType>(WorkspaceType.values);
}

class WorkspacesTable extends DataClass implements Insertable<WorkspacesTable> {
  ///Primary key column as string
  final String id;

  /// when was created timestamp
  final DateTime createdAt;

  /// when was last updated timestamp
  final DateTime updatedAt;

  /// Human-readable name of the workspace
  final String name;

  /// Type of workspace (local or remote)
  /// Stored as string to handle enum conversion
  final WorkspaceType type;

  /// URL for remote workspaces, null for local workspaces
  final String? url;
  const WorkspacesTable({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.type,
    this.url,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<String>(
        $WorkspacesTable.$convertertype.toSql(type),
      );
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    return map;
  }

  WorkspacesCompanion toCompanion(bool nullToAbsent) {
    return WorkspacesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      name: Value(name),
      type: Value(type),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  factory WorkspacesTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkspacesTable(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      type: $WorkspacesTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      url: serializer.fromJson<String?>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(
        $WorkspacesTable.$convertertype.toJson(type),
      ),
      'url': serializer.toJson<String?>(url),
    };
  }

  WorkspacesTable copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    WorkspaceType? type,
    Value<String?> url = const Value.absent(),
  }) => WorkspacesTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    name: name ?? this.name,
    type: type ?? this.type,
    url: url.present ? url.value : this.url,
  );
  WorkspacesTable copyWithCompanion(WorkspacesCompanion data) {
    return WorkspacesTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkspacesTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, name, type, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkspacesTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.type == this.type &&
          other.url == this.url);
}

class WorkspacesCompanion extends UpdateCompanion<WorkspacesTable> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> name;
  final Value<WorkspaceType> type;
  final Value<String?> url;
  final Value<int> rowid;
  const WorkspacesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkspacesCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    required WorkspaceType type,
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<WorkspacesTable> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? url,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (url != null) 'url': url,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkspacesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? name,
    Value<WorkspaceType>? type,
    Value<String?>? url,
    Value<int>? rowid,
  }) {
    return WorkspacesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      type: type ?? this.type,
      url: url ?? this.url,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $WorkspacesTable.$convertertype.toSql(type.value),
      );
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkspacesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('url: $url, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ApiModelProvidersTable extends ApiModelProviders
    with TableInfo<$ApiModelProvidersTable, ApiModelProvidersTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ApiModelProvidersTable(this.attachedDatabase, [this._alias]);
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
  @override
  late final GeneratedColumnWithTypeConverter<ModelProvidersTableType?, String>
  type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<ModelProvidersTableType?>(
        $ApiModelProvidersTable.$convertertypen,
      );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _docMeta = const VerificationMeta('doc');
  @override
  late final GeneratedColumn<String> doc = GeneratedColumn<String>(
    'doc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, type, url, doc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'api_model_providers';
  @override
  VerificationContext validateIntegrity(
    Insertable<ApiModelProvidersTable> instance, {
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
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('doc')) {
      context.handle(
        _docMeta,
        doc.isAcceptableOrUnknown(data['doc']!, _docMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ApiModelProvidersTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ApiModelProvidersTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: $ApiModelProvidersTable.$convertertypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        ),
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      doc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doc'],
      ),
    );
  }

  @override
  $ApiModelProvidersTable createAlias(String alias) {
    return $ApiModelProvidersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ModelProvidersTableType, String, String>
  $convertertype = const EnumNameConverter<ModelProvidersTableType>(
    ModelProvidersTableType.values,
  );
  static JsonTypeConverter2<ModelProvidersTableType?, String?, String?>
  $convertertypen = JsonTypeConverter2.asNullable($convertertype);
}

class ApiModelProvidersTable extends DataClass
    implements Insertable<ApiModelProvidersTable> {
  final String id;

  /// Human-readable name of the model
  final String name;

  /// Type of chat model (local or remote)
  /// Stored as string to handle enum conversion
  final ModelProvidersTableType? type;
  final String? url;
  final String? doc;
  const ApiModelProvidersTable({
    required this.id,
    required this.name,
    this.type,
    this.url,
    this.doc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(
        $ApiModelProvidersTable.$convertertypen.toSql(type),
      );
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || doc != null) {
      map['doc'] = Variable<String>(doc);
    }
    return map;
  }

  ApiModelProvidersCompanion toCompanion(bool nullToAbsent) {
    return ApiModelProvidersCompanion(
      id: Value(id),
      name: Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      doc: doc == null && nullToAbsent ? const Value.absent() : Value(doc),
    );
  }

  factory ApiModelProvidersTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ApiModelProvidersTable(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: $ApiModelProvidersTable.$convertertypen.fromJson(
        serializer.fromJson<String?>(json['type']),
      ),
      url: serializer.fromJson<String?>(json['url']),
      doc: serializer.fromJson<String?>(json['doc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String?>(
        $ApiModelProvidersTable.$convertertypen.toJson(type),
      ),
      'url': serializer.toJson<String?>(url),
      'doc': serializer.toJson<String?>(doc),
    };
  }

  ApiModelProvidersTable copyWith({
    String? id,
    String? name,
    Value<ModelProvidersTableType?> type = const Value.absent(),
    Value<String?> url = const Value.absent(),
    Value<String?> doc = const Value.absent(),
  }) => ApiModelProvidersTable(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type.present ? type.value : this.type,
    url: url.present ? url.value : this.url,
    doc: doc.present ? doc.value : this.doc,
  );
  ApiModelProvidersTable copyWithCompanion(ApiModelProvidersCompanion data) {
    return ApiModelProvidersTable(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      url: data.url.present ? data.url.value : this.url,
      doc: data.doc.present ? data.doc.value : this.doc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ApiModelProvidersTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('url: $url, ')
          ..write('doc: $doc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, url, doc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ApiModelProvidersTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.url == this.url &&
          other.doc == this.doc);
}

class ApiModelProvidersCompanion
    extends UpdateCompanion<ApiModelProvidersTable> {
  final Value<String> id;
  final Value<String> name;
  final Value<ModelProvidersTableType?> type;
  final Value<String?> url;
  final Value<String?> doc;
  final Value<int> rowid;
  const ApiModelProvidersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.url = const Value.absent(),
    this.doc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ApiModelProvidersCompanion.insert({
    required String id,
    required String name,
    this.type = const Value.absent(),
    this.url = const Value.absent(),
    this.doc = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<ApiModelProvidersTable> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? url,
    Expression<String>? doc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (url != null) 'url': url,
      if (doc != null) 'doc': doc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ApiModelProvidersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<ModelProvidersTableType?>? type,
    Value<String?>? url,
    Value<String?>? doc,
    Value<int>? rowid,
  }) {
    return ApiModelProvidersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      url: url ?? this.url,
      doc: doc ?? this.doc,
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
    if (type.present) {
      map['type'] = Variable<String>(
        $ApiModelProvidersTable.$convertertypen.toSql(type.value),
      );
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (doc.present) {
      map['doc'] = Variable<String>(doc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ApiModelProvidersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('url: $url, ')
          ..write('doc: $doc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ApiModelsTable extends ApiModels
    with TableInfo<$ApiModelsTable, ApiModelsTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ApiModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _modelProviderMeta = const VerificationMeta(
    'modelProvider',
  );
  @override
  late final GeneratedColumn<String> modelProvider = GeneratedColumn<String>(
    'model_provider',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES api_model_providers (id)',
    ),
  );
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
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  modalitiesInput = GeneratedColumn<String>(
    'modalities_input',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<String>?>($ApiModelsTable.$convertermodalitiesInputn);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  modalitiesOuput = GeneratedColumn<String>(
    'modalities_ouput',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<String>?>($ApiModelsTable.$convertermodalitiesOuputn);
  static const VerificationMeta _openWeightsMeta = const VerificationMeta(
    'openWeights',
  );
  @override
  late final GeneratedColumn<bool> openWeights = GeneratedColumn<bool>(
    'open_weights',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("open_weights" IN (0, 1))',
    ),
  );
  static const VerificationMeta _costInputMeta = const VerificationMeta(
    'costInput',
  );
  @override
  late final GeneratedColumn<double> costInput = GeneratedColumn<double>(
    'cost_input',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _costOutputMeta = const VerificationMeta(
    'costOutput',
  );
  @override
  late final GeneratedColumn<double> costOutput = GeneratedColumn<double>(
    'cost_output',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _costCacheReadMeta = const VerificationMeta(
    'costCacheRead',
  );
  @override
  late final GeneratedColumn<double> costCacheRead = GeneratedColumn<double>(
    'cost_cache_read',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _limitContextMeta = const VerificationMeta(
    'limitContext',
  );
  @override
  late final GeneratedColumn<int> limitContext = GeneratedColumn<int>(
    'limit_context',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _limitOutputMeta = const VerificationMeta(
    'limitOutput',
  );
  @override
  late final GeneratedColumn<int> limitOutput = GeneratedColumn<int>(
    'limit_output',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    modelProvider,
    id,
    name,
    modalitiesInput,
    modalitiesOuput,
    openWeights,
    costInput,
    costOutput,
    costCacheRead,
    limitContext,
    limitOutput,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'api_models';
  @override
  VerificationContext validateIntegrity(
    Insertable<ApiModelsTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('model_provider')) {
      context.handle(
        _modelProviderMeta,
        modelProvider.isAcceptableOrUnknown(
          data['model_provider']!,
          _modelProviderMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_modelProviderMeta);
    }
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
    if (data.containsKey('open_weights')) {
      context.handle(
        _openWeightsMeta,
        openWeights.isAcceptableOrUnknown(
          data['open_weights']!,
          _openWeightsMeta,
        ),
      );
    }
    if (data.containsKey('cost_input')) {
      context.handle(
        _costInputMeta,
        costInput.isAcceptableOrUnknown(data['cost_input']!, _costInputMeta),
      );
    }
    if (data.containsKey('cost_output')) {
      context.handle(
        _costOutputMeta,
        costOutput.isAcceptableOrUnknown(data['cost_output']!, _costOutputMeta),
      );
    }
    if (data.containsKey('cost_cache_read')) {
      context.handle(
        _costCacheReadMeta,
        costCacheRead.isAcceptableOrUnknown(
          data['cost_cache_read']!,
          _costCacheReadMeta,
        ),
      );
    }
    if (data.containsKey('limit_context')) {
      context.handle(
        _limitContextMeta,
        limitContext.isAcceptableOrUnknown(
          data['limit_context']!,
          _limitContextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_limitContextMeta);
    }
    if (data.containsKey('limit_output')) {
      context.handle(
        _limitOutputMeta,
        limitOutput.isAcceptableOrUnknown(
          data['limit_output']!,
          _limitOutputMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_limitOutputMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, modelProvider};
  @override
  ApiModelsTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ApiModelsTable(
      modelProvider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_provider'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      modalitiesInput: $ApiModelsTable.$convertermodalitiesInputn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}modalities_input'],
        ),
      ),
      modalitiesOuput: $ApiModelsTable.$convertermodalitiesOuputn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}modalities_ouput'],
        ),
      ),
      openWeights: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}open_weights'],
      ),
      costInput: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_input'],
      ),
      costOutput: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_output'],
      ),
      costCacheRead: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_cache_read'],
      ),
      limitContext: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}limit_context'],
      )!,
      limitOutput: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}limit_output'],
      )!,
    );
  }

  @override
  $ApiModelsTable createAlias(String alias) {
    return $ApiModelsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<List<String>, String, Object?>
  $convertermodalitiesInput = stringListConverter;
  static JsonTypeConverter2<List<String>?, String?, Object?>
  $convertermodalitiesInputn = JsonTypeConverter2.asNullable(
    $convertermodalitiesInput,
  );
  static JsonTypeConverter2<List<String>, String, Object?>
  $convertermodalitiesOuput = stringListConverter;
  static JsonTypeConverter2<List<String>?, String?, Object?>
  $convertermodalitiesOuputn = JsonTypeConverter2.asNullable(
    $convertermodalitiesOuput,
  );
}

class ApiModelsTable extends DataClass implements Insertable<ApiModelsTable> {
  final String modelProvider;
  final String id;

  /// Human-readable name of the model
  final String name;

  /// Type of chat model (local or remote)
  /// Stored as string to handle enum conversion
  final List<String>? modalitiesInput;
  final List<String>? modalitiesOuput;
  final bool? openWeights;
  final double? costInput;
  final double? costOutput;
  final double? costCacheRead;
  final int limitContext;
  final int limitOutput;
  const ApiModelsTable({
    required this.modelProvider,
    required this.id,
    required this.name,
    this.modalitiesInput,
    this.modalitiesOuput,
    this.openWeights,
    this.costInput,
    this.costOutput,
    this.costCacheRead,
    required this.limitContext,
    required this.limitOutput,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['model_provider'] = Variable<String>(modelProvider);
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || modalitiesInput != null) {
      map['modalities_input'] = Variable<String>(
        $ApiModelsTable.$convertermodalitiesInputn.toSql(modalitiesInput),
      );
    }
    if (!nullToAbsent || modalitiesOuput != null) {
      map['modalities_ouput'] = Variable<String>(
        $ApiModelsTable.$convertermodalitiesOuputn.toSql(modalitiesOuput),
      );
    }
    if (!nullToAbsent || openWeights != null) {
      map['open_weights'] = Variable<bool>(openWeights);
    }
    if (!nullToAbsent || costInput != null) {
      map['cost_input'] = Variable<double>(costInput);
    }
    if (!nullToAbsent || costOutput != null) {
      map['cost_output'] = Variable<double>(costOutput);
    }
    if (!nullToAbsent || costCacheRead != null) {
      map['cost_cache_read'] = Variable<double>(costCacheRead);
    }
    map['limit_context'] = Variable<int>(limitContext);
    map['limit_output'] = Variable<int>(limitOutput);
    return map;
  }

  ApiModelsCompanion toCompanion(bool nullToAbsent) {
    return ApiModelsCompanion(
      modelProvider: Value(modelProvider),
      id: Value(id),
      name: Value(name),
      modalitiesInput: modalitiesInput == null && nullToAbsent
          ? const Value.absent()
          : Value(modalitiesInput),
      modalitiesOuput: modalitiesOuput == null && nullToAbsent
          ? const Value.absent()
          : Value(modalitiesOuput),
      openWeights: openWeights == null && nullToAbsent
          ? const Value.absent()
          : Value(openWeights),
      costInput: costInput == null && nullToAbsent
          ? const Value.absent()
          : Value(costInput),
      costOutput: costOutput == null && nullToAbsent
          ? const Value.absent()
          : Value(costOutput),
      costCacheRead: costCacheRead == null && nullToAbsent
          ? const Value.absent()
          : Value(costCacheRead),
      limitContext: Value(limitContext),
      limitOutput: Value(limitOutput),
    );
  }

  factory ApiModelsTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ApiModelsTable(
      modelProvider: serializer.fromJson<String>(json['modelProvider']),
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      modalitiesInput: $ApiModelsTable.$convertermodalitiesInputn.fromJson(
        serializer.fromJson<Object?>(json['modalitiesInput']),
      ),
      modalitiesOuput: $ApiModelsTable.$convertermodalitiesOuputn.fromJson(
        serializer.fromJson<Object?>(json['modalitiesOuput']),
      ),
      openWeights: serializer.fromJson<bool?>(json['openWeights']),
      costInput: serializer.fromJson<double?>(json['costInput']),
      costOutput: serializer.fromJson<double?>(json['costOutput']),
      costCacheRead: serializer.fromJson<double?>(json['costCacheRead']),
      limitContext: serializer.fromJson<int>(json['limitContext']),
      limitOutput: serializer.fromJson<int>(json['limitOutput']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'modelProvider': serializer.toJson<String>(modelProvider),
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'modalitiesInput': serializer.toJson<Object?>(
        $ApiModelsTable.$convertermodalitiesInputn.toJson(modalitiesInput),
      ),
      'modalitiesOuput': serializer.toJson<Object?>(
        $ApiModelsTable.$convertermodalitiesOuputn.toJson(modalitiesOuput),
      ),
      'openWeights': serializer.toJson<bool?>(openWeights),
      'costInput': serializer.toJson<double?>(costInput),
      'costOutput': serializer.toJson<double?>(costOutput),
      'costCacheRead': serializer.toJson<double?>(costCacheRead),
      'limitContext': serializer.toJson<int>(limitContext),
      'limitOutput': serializer.toJson<int>(limitOutput),
    };
  }

  ApiModelsTable copyWith({
    String? modelProvider,
    String? id,
    String? name,
    Value<List<String>?> modalitiesInput = const Value.absent(),
    Value<List<String>?> modalitiesOuput = const Value.absent(),
    Value<bool?> openWeights = const Value.absent(),
    Value<double?> costInput = const Value.absent(),
    Value<double?> costOutput = const Value.absent(),
    Value<double?> costCacheRead = const Value.absent(),
    int? limitContext,
    int? limitOutput,
  }) => ApiModelsTable(
    modelProvider: modelProvider ?? this.modelProvider,
    id: id ?? this.id,
    name: name ?? this.name,
    modalitiesInput: modalitiesInput.present
        ? modalitiesInput.value
        : this.modalitiesInput,
    modalitiesOuput: modalitiesOuput.present
        ? modalitiesOuput.value
        : this.modalitiesOuput,
    openWeights: openWeights.present ? openWeights.value : this.openWeights,
    costInput: costInput.present ? costInput.value : this.costInput,
    costOutput: costOutput.present ? costOutput.value : this.costOutput,
    costCacheRead: costCacheRead.present
        ? costCacheRead.value
        : this.costCacheRead,
    limitContext: limitContext ?? this.limitContext,
    limitOutput: limitOutput ?? this.limitOutput,
  );
  ApiModelsTable copyWithCompanion(ApiModelsCompanion data) {
    return ApiModelsTable(
      modelProvider: data.modelProvider.present
          ? data.modelProvider.value
          : this.modelProvider,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      modalitiesInput: data.modalitiesInput.present
          ? data.modalitiesInput.value
          : this.modalitiesInput,
      modalitiesOuput: data.modalitiesOuput.present
          ? data.modalitiesOuput.value
          : this.modalitiesOuput,
      openWeights: data.openWeights.present
          ? data.openWeights.value
          : this.openWeights,
      costInput: data.costInput.present ? data.costInput.value : this.costInput,
      costOutput: data.costOutput.present
          ? data.costOutput.value
          : this.costOutput,
      costCacheRead: data.costCacheRead.present
          ? data.costCacheRead.value
          : this.costCacheRead,
      limitContext: data.limitContext.present
          ? data.limitContext.value
          : this.limitContext,
      limitOutput: data.limitOutput.present
          ? data.limitOutput.value
          : this.limitOutput,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ApiModelsTable(')
          ..write('modelProvider: $modelProvider, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('modalitiesInput: $modalitiesInput, ')
          ..write('modalitiesOuput: $modalitiesOuput, ')
          ..write('openWeights: $openWeights, ')
          ..write('costInput: $costInput, ')
          ..write('costOutput: $costOutput, ')
          ..write('costCacheRead: $costCacheRead, ')
          ..write('limitContext: $limitContext, ')
          ..write('limitOutput: $limitOutput')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    modelProvider,
    id,
    name,
    modalitiesInput,
    modalitiesOuput,
    openWeights,
    costInput,
    costOutput,
    costCacheRead,
    limitContext,
    limitOutput,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ApiModelsTable &&
          other.modelProvider == this.modelProvider &&
          other.id == this.id &&
          other.name == this.name &&
          other.modalitiesInput == this.modalitiesInput &&
          other.modalitiesOuput == this.modalitiesOuput &&
          other.openWeights == this.openWeights &&
          other.costInput == this.costInput &&
          other.costOutput == this.costOutput &&
          other.costCacheRead == this.costCacheRead &&
          other.limitContext == this.limitContext &&
          other.limitOutput == this.limitOutput);
}

class ApiModelsCompanion extends UpdateCompanion<ApiModelsTable> {
  final Value<String> modelProvider;
  final Value<String> id;
  final Value<String> name;
  final Value<List<String>?> modalitiesInput;
  final Value<List<String>?> modalitiesOuput;
  final Value<bool?> openWeights;
  final Value<double?> costInput;
  final Value<double?> costOutput;
  final Value<double?> costCacheRead;
  final Value<int> limitContext;
  final Value<int> limitOutput;
  final Value<int> rowid;
  const ApiModelsCompanion({
    this.modelProvider = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.modalitiesInput = const Value.absent(),
    this.modalitiesOuput = const Value.absent(),
    this.openWeights = const Value.absent(),
    this.costInput = const Value.absent(),
    this.costOutput = const Value.absent(),
    this.costCacheRead = const Value.absent(),
    this.limitContext = const Value.absent(),
    this.limitOutput = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ApiModelsCompanion.insert({
    required String modelProvider,
    required String id,
    required String name,
    this.modalitiesInput = const Value.absent(),
    this.modalitiesOuput = const Value.absent(),
    this.openWeights = const Value.absent(),
    this.costInput = const Value.absent(),
    this.costOutput = const Value.absent(),
    this.costCacheRead = const Value.absent(),
    required int limitContext,
    required int limitOutput,
    this.rowid = const Value.absent(),
  }) : modelProvider = Value(modelProvider),
       id = Value(id),
       name = Value(name),
       limitContext = Value(limitContext),
       limitOutput = Value(limitOutput);
  static Insertable<ApiModelsTable> custom({
    Expression<String>? modelProvider,
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? modalitiesInput,
    Expression<String>? modalitiesOuput,
    Expression<bool>? openWeights,
    Expression<double>? costInput,
    Expression<double>? costOutput,
    Expression<double>? costCacheRead,
    Expression<int>? limitContext,
    Expression<int>? limitOutput,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (modelProvider != null) 'model_provider': modelProvider,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (modalitiesInput != null) 'modalities_input': modalitiesInput,
      if (modalitiesOuput != null) 'modalities_ouput': modalitiesOuput,
      if (openWeights != null) 'open_weights': openWeights,
      if (costInput != null) 'cost_input': costInput,
      if (costOutput != null) 'cost_output': costOutput,
      if (costCacheRead != null) 'cost_cache_read': costCacheRead,
      if (limitContext != null) 'limit_context': limitContext,
      if (limitOutput != null) 'limit_output': limitOutput,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ApiModelsCompanion copyWith({
    Value<String>? modelProvider,
    Value<String>? id,
    Value<String>? name,
    Value<List<String>?>? modalitiesInput,
    Value<List<String>?>? modalitiesOuput,
    Value<bool?>? openWeights,
    Value<double?>? costInput,
    Value<double?>? costOutput,
    Value<double?>? costCacheRead,
    Value<int>? limitContext,
    Value<int>? limitOutput,
    Value<int>? rowid,
  }) {
    return ApiModelsCompanion(
      modelProvider: modelProvider ?? this.modelProvider,
      id: id ?? this.id,
      name: name ?? this.name,
      modalitiesInput: modalitiesInput ?? this.modalitiesInput,
      modalitiesOuput: modalitiesOuput ?? this.modalitiesOuput,
      openWeights: openWeights ?? this.openWeights,
      costInput: costInput ?? this.costInput,
      costOutput: costOutput ?? this.costOutput,
      costCacheRead: costCacheRead ?? this.costCacheRead,
      limitContext: limitContext ?? this.limitContext,
      limitOutput: limitOutput ?? this.limitOutput,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (modelProvider.present) {
      map['model_provider'] = Variable<String>(modelProvider.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (modalitiesInput.present) {
      map['modalities_input'] = Variable<String>(
        $ApiModelsTable.$convertermodalitiesInputn.toSql(modalitiesInput.value),
      );
    }
    if (modalitiesOuput.present) {
      map['modalities_ouput'] = Variable<String>(
        $ApiModelsTable.$convertermodalitiesOuputn.toSql(modalitiesOuput.value),
      );
    }
    if (openWeights.present) {
      map['open_weights'] = Variable<bool>(openWeights.value);
    }
    if (costInput.present) {
      map['cost_input'] = Variable<double>(costInput.value);
    }
    if (costOutput.present) {
      map['cost_output'] = Variable<double>(costOutput.value);
    }
    if (costCacheRead.present) {
      map['cost_cache_read'] = Variable<double>(costCacheRead.value);
    }
    if (limitContext.present) {
      map['limit_context'] = Variable<int>(limitContext.value);
    }
    if (limitOutput.present) {
      map['limit_output'] = Variable<int>(limitOutput.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ApiModelsCompanion(')
          ..write('modelProvider: $modelProvider, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('modalitiesInput: $modalitiesInput, ')
          ..write('modalitiesOuput: $modalitiesOuput, ')
          ..write('openWeights: $openWeights, ')
          ..write('costInput: $costInput, ')
          ..write('costOutput: $costOutput, ')
          ..write('costCacheRead: $costCacheRead, ')
          ..write('limitContext: $limitContext, ')
          ..write('limitOutput: $limitOutput, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CredentialsTable extends Credentials
    with TableInfo<$CredentialsTable, CredentialsTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CredentialsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const UuidV7().generate(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
  static const VerificationMeta _modelIdMeta = const VerificationMeta(
    'modelId',
  );
  @override
  late final GeneratedColumn<String> modelId = GeneratedColumn<String>(
    'model_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES api_models (id)',
    ),
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _keyValueMeta = const VerificationMeta(
    'keyValue',
  );
  @override
  late final GeneratedColumn<String> keyValue = GeneratedColumn<String>(
    'key_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _workspaceIdMeta = const VerificationMeta(
    'workspaceId',
  );
  @override
  late final GeneratedColumn<String> workspaceId = GeneratedColumn<String>(
    'workspace_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workspaces (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    name,
    modelId,
    url,
    keyValue,
    workspaceId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'credentials';
  @override
  VerificationContext validateIntegrity(
    Insertable<CredentialsTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('model_id')) {
      context.handle(
        _modelIdMeta,
        modelId.isAcceptableOrUnknown(data['model_id']!, _modelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_modelIdMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('key_value')) {
      context.handle(
        _keyValueMeta,
        keyValue.isAcceptableOrUnknown(data['key_value']!, _keyValueMeta),
      );
    } else if (isInserting) {
      context.missing(_keyValueMeta);
    }
    if (data.containsKey('workspace_id')) {
      context.handle(
        _workspaceIdMeta,
        workspaceId.isAcceptableOrUnknown(
          data['workspace_id']!,
          _workspaceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workspaceIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CredentialsTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CredentialsTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      modelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_id'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      keyValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key_value'],
      )!,
      workspaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workspace_id'],
      )!,
    );
  }

  @override
  $CredentialsTable createAlias(String alias) {
    return $CredentialsTable(attachedDatabase, alias);
  }
}

class CredentialsTable extends DataClass
    implements Insertable<CredentialsTable> {
  ///Primary key column as string
  final String id;

  /// when was created timestamp
  final DateTime createdAt;

  /// when was last updated timestamp
  final DateTime updatedAt;

  /// Human-readable name of the chat model
  final String name;
  final String modelId;

  /// URL for remote chat models, null for default urls
  final String? url;

  /// URL for remote chat models, null for default urls
  final String keyValue;
  final String workspaceId;
  const CredentialsTable({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.modelId,
    this.url,
    required this.keyValue,
    required this.workspaceId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['name'] = Variable<String>(name);
    map['model_id'] = Variable<String>(modelId);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    map['key_value'] = Variable<String>(keyValue);
    map['workspace_id'] = Variable<String>(workspaceId);
    return map;
  }

  CredentialsCompanion toCompanion(bool nullToAbsent) {
    return CredentialsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      name: Value(name),
      modelId: Value(modelId),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      keyValue: Value(keyValue),
      workspaceId: Value(workspaceId),
    );
  }

  factory CredentialsTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CredentialsTable(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      modelId: serializer.fromJson<String>(json['modelId']),
      url: serializer.fromJson<String?>(json['url']),
      keyValue: serializer.fromJson<String>(json['keyValue']),
      workspaceId: serializer.fromJson<String>(json['workspaceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'name': serializer.toJson<String>(name),
      'modelId': serializer.toJson<String>(modelId),
      'url': serializer.toJson<String?>(url),
      'keyValue': serializer.toJson<String>(keyValue),
      'workspaceId': serializer.toJson<String>(workspaceId),
    };
  }

  CredentialsTable copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? modelId,
    Value<String?> url = const Value.absent(),
    String? keyValue,
    String? workspaceId,
  }) => CredentialsTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    name: name ?? this.name,
    modelId: modelId ?? this.modelId,
    url: url.present ? url.value : this.url,
    keyValue: keyValue ?? this.keyValue,
    workspaceId: workspaceId ?? this.workspaceId,
  );
  CredentialsTable copyWithCompanion(CredentialsCompanion data) {
    return CredentialsTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      name: data.name.present ? data.name.value : this.name,
      modelId: data.modelId.present ? data.modelId.value : this.modelId,
      url: data.url.present ? data.url.value : this.url,
      keyValue: data.keyValue.present ? data.keyValue.value : this.keyValue,
      workspaceId: data.workspaceId.present
          ? data.workspaceId.value
          : this.workspaceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CredentialsTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('modelId: $modelId, ')
          ..write('url: $url, ')
          ..write('keyValue: $keyValue, ')
          ..write('workspaceId: $workspaceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    name,
    modelId,
    url,
    keyValue,
    workspaceId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CredentialsTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.modelId == this.modelId &&
          other.url == this.url &&
          other.keyValue == this.keyValue &&
          other.workspaceId == this.workspaceId);
}

class CredentialsCompanion extends UpdateCompanion<CredentialsTable> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> name;
  final Value<String> modelId;
  final Value<String?> url;
  final Value<String> keyValue;
  final Value<String> workspaceId;
  final Value<int> rowid;
  const CredentialsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.modelId = const Value.absent(),
    this.url = const Value.absent(),
    this.keyValue = const Value.absent(),
    this.workspaceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CredentialsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    required String modelId,
    this.url = const Value.absent(),
    required String keyValue,
    required String workspaceId,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       modelId = Value(modelId),
       keyValue = Value(keyValue),
       workspaceId = Value(workspaceId);
  static Insertable<CredentialsTable> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<String>? modelId,
    Expression<String>? url,
    Expression<String>? keyValue,
    Expression<String>? workspaceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (modelId != null) 'model_id': modelId,
      if (url != null) 'url': url,
      if (keyValue != null) 'key_value': keyValue,
      if (workspaceId != null) 'workspace_id': workspaceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CredentialsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? name,
    Value<String>? modelId,
    Value<String?>? url,
    Value<String>? keyValue,
    Value<String>? workspaceId,
    Value<int>? rowid,
  }) {
    return CredentialsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      modelId: modelId ?? this.modelId,
      url: url ?? this.url,
      keyValue: keyValue ?? this.keyValue,
      workspaceId: workspaceId ?? this.workspaceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (modelId.present) {
      map['model_id'] = Variable<String>(modelId.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (keyValue.present) {
      map['key_value'] = Variable<String>(keyValue.value);
    }
    if (workspaceId.present) {
      map['workspace_id'] = Variable<String>(workspaceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CredentialsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('modelId: $modelId, ')
          ..write('url: $url, ')
          ..write('keyValue: $keyValue, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CredentialModelsTable extends CredentialModels
    with TableInfo<$CredentialModelsTable, CredentialModelsTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CredentialModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const UuidV7().generate(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _modelIdMeta = const VerificationMeta(
    'modelId',
  );
  @override
  late final GeneratedColumn<String> modelId = GeneratedColumn<String>(
    'model_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES api_model_providers (id)',
    ),
  );
  static const VerificationMeta _credentialsIdMeta = const VerificationMeta(
    'credentialsId',
  );
  @override
  late final GeneratedColumn<String> credentialsId = GeneratedColumn<String>(
    'credentials_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES credentials (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    modelId,
    credentialsId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'credential_models';
  @override
  VerificationContext validateIntegrity(
    Insertable<CredentialModelsTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('model_id')) {
      context.handle(
        _modelIdMeta,
        modelId.isAcceptableOrUnknown(data['model_id']!, _modelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_modelIdMeta);
    }
    if (data.containsKey('credentials_id')) {
      context.handle(
        _credentialsIdMeta,
        credentialsId.isAcceptableOrUnknown(
          data['credentials_id']!,
          _credentialsIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_credentialsIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CredentialModelsTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CredentialModelsTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      modelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_id'],
      )!,
      credentialsId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}credentials_id'],
      )!,
    );
  }

  @override
  $CredentialModelsTable createAlias(String alias) {
    return $CredentialModelsTable(attachedDatabase, alias);
  }
}

class CredentialModelsTable extends DataClass
    implements Insertable<CredentialModelsTable> {
  ///Primary key column as string
  final String id;

  /// when was created timestamp
  final DateTime createdAt;

  /// when was last updated timestamp
  final DateTime updatedAt;

  /// model unique identifier
  final String modelId;
  final String credentialsId;
  const CredentialModelsTable({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.modelId,
    required this.credentialsId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['model_id'] = Variable<String>(modelId);
    map['credentials_id'] = Variable<String>(credentialsId);
    return map;
  }

  CredentialModelsCompanion toCompanion(bool nullToAbsent) {
    return CredentialModelsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      modelId: Value(modelId),
      credentialsId: Value(credentialsId),
    );
  }

  factory CredentialModelsTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CredentialModelsTable(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      modelId: serializer.fromJson<String>(json['modelId']),
      credentialsId: serializer.fromJson<String>(json['credentialsId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'modelId': serializer.toJson<String>(modelId),
      'credentialsId': serializer.toJson<String>(credentialsId),
    };
  }

  CredentialModelsTable copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? modelId,
    String? credentialsId,
  }) => CredentialModelsTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    modelId: modelId ?? this.modelId,
    credentialsId: credentialsId ?? this.credentialsId,
  );
  CredentialModelsTable copyWithCompanion(CredentialModelsCompanion data) {
    return CredentialModelsTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      modelId: data.modelId.present ? data.modelId.value : this.modelId,
      credentialsId: data.credentialsId.present
          ? data.credentialsId.value
          : this.credentialsId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CredentialModelsTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('modelId: $modelId, ')
          ..write('credentialsId: $credentialsId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, modelId, credentialsId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CredentialModelsTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.modelId == this.modelId &&
          other.credentialsId == this.credentialsId);
}

class CredentialModelsCompanion extends UpdateCompanion<CredentialModelsTable> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> modelId;
  final Value<String> credentialsId;
  final Value<int> rowid;
  const CredentialModelsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.modelId = const Value.absent(),
    this.credentialsId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CredentialModelsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String modelId,
    required String credentialsId,
    this.rowid = const Value.absent(),
  }) : modelId = Value(modelId),
       credentialsId = Value(credentialsId);
  static Insertable<CredentialModelsTable> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? modelId,
    Expression<String>? credentialsId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (modelId != null) 'model_id': modelId,
      if (credentialsId != null) 'credentials_id': credentialsId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CredentialModelsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? modelId,
    Value<String>? credentialsId,
    Value<int>? rowid,
  }) {
    return CredentialModelsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      modelId: modelId ?? this.modelId,
      credentialsId: credentialsId ?? this.credentialsId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (modelId.present) {
      map['model_id'] = Variable<String>(modelId.value);
    }
    if (credentialsId.present) {
      map['credentials_id'] = Variable<String>(credentialsId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CredentialModelsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('modelId: $modelId, ')
          ..write('credentialsId: $credentialsId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConversationsTable extends Conversations
    with TableInfo<$ConversationsTable, ConversationsTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConversationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const UuidV7().generate(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _workspaceIdMeta = const VerificationMeta(
    'workspaceId',
  );
  @override
  late final GeneratedColumn<String> workspaceId = GeneratedColumn<String>(
    'workspace_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workspaces (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelIdMeta = const VerificationMeta(
    'modelId',
  );
  @override
  late final GeneratedColumn<String> modelId = GeneratedColumn<String>(
    'model_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES credential_models (id)',
    ),
  );
  static const VerificationMeta _isPinnedMeta = const VerificationMeta(
    'isPinned',
  );
  @override
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
    'is_pinned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pinned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    workspaceId,
    title,
    modelId,
    isPinned,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conversations';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConversationsTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('workspace_id')) {
      context.handle(
        _workspaceIdMeta,
        workspaceId.isAcceptableOrUnknown(
          data['workspace_id']!,
          _workspaceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workspaceIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('model_id')) {
      context.handle(
        _modelIdMeta,
        modelId.isAcceptableOrUnknown(data['model_id']!, _modelIdMeta),
      );
    }
    if (data.containsKey('is_pinned')) {
      context.handle(
        _isPinnedMeta,
        isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ConversationsTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConversationsTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      workspaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workspace_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      modelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_id'],
      ),
      isPinned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pinned'],
      )!,
    );
  }

  @override
  $ConversationsTable createAlias(String alias) {
    return $ConversationsTable(attachedDatabase, alias);
  }
}

class ConversationsTable extends DataClass
    implements Insertable<ConversationsTable> {
  ///Primary key column as string
  final String id;

  /// when was created timestamp
  final DateTime createdAt;

  /// when was last updated timestamp
  final DateTime updatedAt;
  final String workspaceId;
  final String title;
  final String? modelId;
  final bool isPinned;
  const ConversationsTable({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.workspaceId,
    required this.title,
    this.modelId,
    required this.isPinned,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['workspace_id'] = Variable<String>(workspaceId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || modelId != null) {
      map['model_id'] = Variable<String>(modelId);
    }
    map['is_pinned'] = Variable<bool>(isPinned);
    return map;
  }

  ConversationsCompanion toCompanion(bool nullToAbsent) {
    return ConversationsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      workspaceId: Value(workspaceId),
      title: Value(title),
      modelId: modelId == null && nullToAbsent
          ? const Value.absent()
          : Value(modelId),
      isPinned: Value(isPinned),
    );
  }

  factory ConversationsTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConversationsTable(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      workspaceId: serializer.fromJson<String>(json['workspaceId']),
      title: serializer.fromJson<String>(json['title']),
      modelId: serializer.fromJson<String?>(json['modelId']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'workspaceId': serializer.toJson<String>(workspaceId),
      'title': serializer.toJson<String>(title),
      'modelId': serializer.toJson<String?>(modelId),
      'isPinned': serializer.toJson<bool>(isPinned),
    };
  }

  ConversationsTable copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? workspaceId,
    String? title,
    Value<String?> modelId = const Value.absent(),
    bool? isPinned,
  }) => ConversationsTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    workspaceId: workspaceId ?? this.workspaceId,
    title: title ?? this.title,
    modelId: modelId.present ? modelId.value : this.modelId,
    isPinned: isPinned ?? this.isPinned,
  );
  ConversationsTable copyWithCompanion(ConversationsCompanion data) {
    return ConversationsTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      workspaceId: data.workspaceId.present
          ? data.workspaceId.value
          : this.workspaceId,
      title: data.title.present ? data.title.value : this.title,
      modelId: data.modelId.present ? data.modelId.value : this.modelId,
      isPinned: data.isPinned.present ? data.isPinned.value : this.isPinned,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConversationsTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('title: $title, ')
          ..write('modelId: $modelId, ')
          ..write('isPinned: $isPinned')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    workspaceId,
    title,
    modelId,
    isPinned,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConversationsTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.workspaceId == this.workspaceId &&
          other.title == this.title &&
          other.modelId == this.modelId &&
          other.isPinned == this.isPinned);
}

class ConversationsCompanion extends UpdateCompanion<ConversationsTable> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> workspaceId;
  final Value<String> title;
  final Value<String?> modelId;
  final Value<bool> isPinned;
  final Value<int> rowid;
  const ConversationsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.workspaceId = const Value.absent(),
    this.title = const Value.absent(),
    this.modelId = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConversationsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String workspaceId,
    required String title,
    this.modelId = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : workspaceId = Value(workspaceId),
       title = Value(title);
  static Insertable<ConversationsTable> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? workspaceId,
    Expression<String>? title,
    Expression<String>? modelId,
    Expression<bool>? isPinned,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (workspaceId != null) 'workspace_id': workspaceId,
      if (title != null) 'title': title,
      if (modelId != null) 'model_id': modelId,
      if (isPinned != null) 'is_pinned': isPinned,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConversationsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? workspaceId,
    Value<String>? title,
    Value<String?>? modelId,
    Value<bool>? isPinned,
    Value<int>? rowid,
  }) {
    return ConversationsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      workspaceId: workspaceId ?? this.workspaceId,
      title: title ?? this.title,
      modelId: modelId ?? this.modelId,
      isPinned: isPinned ?? this.isPinned,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (workspaceId.present) {
      map['workspace_id'] = Variable<String>(workspaceId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (modelId.present) {
      map['model_id'] = Variable<String>(modelId.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversationsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('title: $title, ')
          ..write('modelId: $modelId, ')
          ..write('isPinned: $isPinned, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages
    with TableInfo<$MessagesTable, MessagesTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const UuidV7().generate(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _conversationIdMeta = const VerificationMeta(
    'conversationId',
  );
  @override
  late final GeneratedColumn<String> conversationId = GeneratedColumn<String>(
    'conversation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES conversations (id)',
    ),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MessagesTableType, String>
  messageType = GeneratedColumn<String>(
    'message_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<MessagesTableType>($MessagesTable.$convertermessageType);
  static const VerificationMeta _isUserMeta = const VerificationMeta('isUser');
  @override
  late final GeneratedColumn<bool> isUser = GeneratedColumn<bool>(
    'is_user',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_user" IN (0, 1))',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<MessageTableStatus, String>
  status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<MessageTableStatus>($MessagesTable.$converterstatus);
  static const VerificationMeta _metadataMeta = const VerificationMeta(
    'metadata',
  );
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    conversationId,
    content,
    messageType,
    isUser,
    status,
    metadata,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<MessagesTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('conversation_id')) {
      context.handle(
        _conversationIdMeta,
        conversationId.isAcceptableOrUnknown(
          data['conversation_id']!,
          _conversationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conversationIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('is_user')) {
      context.handle(
        _isUserMeta,
        isUser.isAcceptableOrUnknown(data['is_user']!, _isUserMeta),
      );
    } else if (isInserting) {
      context.missing(_isUserMeta);
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _metadataMeta,
        metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MessagesTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessagesTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      conversationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conversation_id'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      messageType: $MessagesTable.$convertermessageType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}message_type'],
        )!,
      ),
      isUser: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_user'],
      )!,
      status: $MessagesTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      metadata: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MessagesTableType, String, String>
  $convertermessageType = const EnumNameConverter<MessagesTableType>(
    MessagesTableType.values,
  );
  static JsonTypeConverter2<MessageTableStatus, String, String>
  $converterstatus = const EnumNameConverter<MessageTableStatus>(
    MessageTableStatus.values,
  );
}

class MessagesTable extends DataClass implements Insertable<MessagesTable> {
  ///Primary key column as string
  final String id;

  /// when was created timestamp
  final DateTime createdAt;

  /// when was last updated timestamp
  final DateTime updatedAt;
  final String conversationId;
  final String content;
  final MessagesTableType messageType;
  final bool isUser;
  final MessageTableStatus status;
  final String? metadata;
  const MessagesTable({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.conversationId,
    required this.content,
    required this.messageType,
    required this.isUser,
    required this.status,
    this.metadata,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['conversation_id'] = Variable<String>(conversationId);
    map['content'] = Variable<String>(content);
    {
      map['message_type'] = Variable<String>(
        $MessagesTable.$convertermessageType.toSql(messageType),
      );
    }
    map['is_user'] = Variable<bool>(isUser);
    {
      map['status'] = Variable<String>(
        $MessagesTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(metadata);
    }
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      conversationId: Value(conversationId),
      content: Value(content),
      messageType: Value(messageType),
      isUser: Value(isUser),
      status: Value(status),
      metadata: metadata == null && nullToAbsent
          ? const Value.absent()
          : Value(metadata),
    );
  }

  factory MessagesTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessagesTable(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      conversationId: serializer.fromJson<String>(json['conversationId']),
      content: serializer.fromJson<String>(json['content']),
      messageType: $MessagesTable.$convertermessageType.fromJson(
        serializer.fromJson<String>(json['messageType']),
      ),
      isUser: serializer.fromJson<bool>(json['isUser']),
      status: $MessagesTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      metadata: serializer.fromJson<String?>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'conversationId': serializer.toJson<String>(conversationId),
      'content': serializer.toJson<String>(content),
      'messageType': serializer.toJson<String>(
        $MessagesTable.$convertermessageType.toJson(messageType),
      ),
      'isUser': serializer.toJson<bool>(isUser),
      'status': serializer.toJson<String>(
        $MessagesTable.$converterstatus.toJson(status),
      ),
      'metadata': serializer.toJson<String?>(metadata),
    };
  }

  MessagesTable copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? conversationId,
    String? content,
    MessagesTableType? messageType,
    bool? isUser,
    MessageTableStatus? status,
    Value<String?> metadata = const Value.absent(),
  }) => MessagesTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    conversationId: conversationId ?? this.conversationId,
    content: content ?? this.content,
    messageType: messageType ?? this.messageType,
    isUser: isUser ?? this.isUser,
    status: status ?? this.status,
    metadata: metadata.present ? metadata.value : this.metadata,
  );
  MessagesTable copyWithCompanion(MessagesCompanion data) {
    return MessagesTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      conversationId: data.conversationId.present
          ? data.conversationId.value
          : this.conversationId,
      content: data.content.present ? data.content.value : this.content,
      messageType: data.messageType.present
          ? data.messageType.value
          : this.messageType,
      isUser: data.isUser.present ? data.isUser.value : this.isUser,
      status: data.status.present ? data.status.value : this.status,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MessagesTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('conversationId: $conversationId, ')
          ..write('content: $content, ')
          ..write('messageType: $messageType, ')
          ..write('isUser: $isUser, ')
          ..write('status: $status, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    conversationId,
    content,
    messageType,
    isUser,
    status,
    metadata,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessagesTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.conversationId == this.conversationId &&
          other.content == this.content &&
          other.messageType == this.messageType &&
          other.isUser == this.isUser &&
          other.status == this.status &&
          other.metadata == this.metadata);
}

class MessagesCompanion extends UpdateCompanion<MessagesTable> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> conversationId;
  final Value<String> content;
  final Value<MessagesTableType> messageType;
  final Value<bool> isUser;
  final Value<MessageTableStatus> status;
  final Value<String?> metadata;
  final Value<int> rowid;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.conversationId = const Value.absent(),
    this.content = const Value.absent(),
    this.messageType = const Value.absent(),
    this.isUser = const Value.absent(),
    this.status = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String conversationId,
    required String content,
    required MessagesTableType messageType,
    required bool isUser,
    required MessageTableStatus status,
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : conversationId = Value(conversationId),
       content = Value(content),
       messageType = Value(messageType),
       isUser = Value(isUser),
       status = Value(status);
  static Insertable<MessagesTable> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? conversationId,
    Expression<String>? content,
    Expression<String>? messageType,
    Expression<bool>? isUser,
    Expression<String>? status,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (conversationId != null) 'conversation_id': conversationId,
      if (content != null) 'content': content,
      if (messageType != null) 'message_type': messageType,
      if (isUser != null) 'is_user': isUser,
      if (status != null) 'status': status,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MessagesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? conversationId,
    Value<String>? content,
    Value<MessagesTableType>? messageType,
    Value<bool>? isUser,
    Value<MessageTableStatus>? status,
    Value<String?>? metadata,
    Value<int>? rowid,
  }) {
    return MessagesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      conversationId: conversationId ?? this.conversationId,
      content: content ?? this.content,
      messageType: messageType ?? this.messageType,
      isUser: isUser ?? this.isUser,
      status: status ?? this.status,
      metadata: metadata ?? this.metadata,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (conversationId.present) {
      map['conversation_id'] = Variable<String>(conversationId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (messageType.present) {
      map['message_type'] = Variable<String>(
        $MessagesTable.$convertermessageType.toSql(messageType.value),
      );
    }
    if (isUser.present) {
      map['is_user'] = Variable<bool>(isUser.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $MessagesTable.$converterstatus.toSql(status.value),
      );
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('conversationId: $conversationId, ')
          ..write('content: $content, ')
          ..write('messageType: $messageType, ')
          ..write('isUser: $isUser, ')
          ..write('status: $status, ')
          ..write('metadata: $metadata, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkspaceToolsTable extends WorkspaceTools
    with TableInfo<$WorkspaceToolsTable, WorkspaceToolsTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkspaceToolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const UuidV7().generate(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _workspaceIdMeta = const VerificationMeta(
    'workspaceId',
  );
  @override
  late final GeneratedColumn<String> workspaceId = GeneratedColumn<String>(
    'workspace_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workspaces (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _configMeta = const VerificationMeta('config');
  @override
  late final GeneratedColumn<String> config = GeneratedColumn<String>(
    'config',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    workspaceId,
    type,
    config,
    isEnabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workspace_tools';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkspaceToolsTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('workspace_id')) {
      context.handle(
        _workspaceIdMeta,
        workspaceId.isAcceptableOrUnknown(
          data['workspace_id']!,
          _workspaceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workspaceIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('config')) {
      context.handle(
        _configMeta,
        config.isAcceptableOrUnknown(data['config']!, _configMeta),
      );
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workspaceId, type};
  @override
  WorkspaceToolsTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkspaceToolsTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      workspaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workspace_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      config: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}config'],
      ),
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
    );
  }

  @override
  $WorkspaceToolsTable createAlias(String alias) {
    return $WorkspaceToolsTable(attachedDatabase, alias);
  }
}

class WorkspaceToolsTable extends DataClass
    implements Insertable<WorkspaceToolsTable> {
  ///Primary key column as string
  final String id;

  /// when was created timestamp
  final DateTime createdAt;

  /// when was last updated timestamp
  final DateTime updatedAt;

  /// Reference to the workspace this tool setting belongs to
  final String workspaceId;

  /// Type of tool (e.g., 'web_search', 'calculator', etc.)
  final String type;

  /// Tool configuration as JSON (optional)
  final String? config;

  /// Whether the tool is enabled for this workspace
  final bool isEnabled;
  const WorkspaceToolsTable({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.workspaceId,
    required this.type,
    this.config,
    required this.isEnabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['workspace_id'] = Variable<String>(workspaceId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || config != null) {
      map['config'] = Variable<String>(config);
    }
    map['is_enabled'] = Variable<bool>(isEnabled);
    return map;
  }

  WorkspaceToolsCompanion toCompanion(bool nullToAbsent) {
    return WorkspaceToolsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      workspaceId: Value(workspaceId),
      type: Value(type),
      config: config == null && nullToAbsent
          ? const Value.absent()
          : Value(config),
      isEnabled: Value(isEnabled),
    );
  }

  factory WorkspaceToolsTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkspaceToolsTable(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      workspaceId: serializer.fromJson<String>(json['workspaceId']),
      type: serializer.fromJson<String>(json['type']),
      config: serializer.fromJson<String?>(json['config']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'workspaceId': serializer.toJson<String>(workspaceId),
      'type': serializer.toJson<String>(type),
      'config': serializer.toJson<String?>(config),
      'isEnabled': serializer.toJson<bool>(isEnabled),
    };
  }

  WorkspaceToolsTable copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? workspaceId,
    String? type,
    Value<String?> config = const Value.absent(),
    bool? isEnabled,
  }) => WorkspaceToolsTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    workspaceId: workspaceId ?? this.workspaceId,
    type: type ?? this.type,
    config: config.present ? config.value : this.config,
    isEnabled: isEnabled ?? this.isEnabled,
  );
  WorkspaceToolsTable copyWithCompanion(WorkspaceToolsCompanion data) {
    return WorkspaceToolsTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      workspaceId: data.workspaceId.present
          ? data.workspaceId.value
          : this.workspaceId,
      type: data.type.present ? data.type.value : this.type,
      config: data.config.present ? data.config.value : this.config,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkspaceToolsTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('type: $type, ')
          ..write('config: $config, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    workspaceId,
    type,
    config,
    isEnabled,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkspaceToolsTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.workspaceId == this.workspaceId &&
          other.type == this.type &&
          other.config == this.config &&
          other.isEnabled == this.isEnabled);
}

class WorkspaceToolsCompanion extends UpdateCompanion<WorkspaceToolsTable> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> workspaceId;
  final Value<String> type;
  final Value<String?> config;
  final Value<bool> isEnabled;
  final Value<int> rowid;
  const WorkspaceToolsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.workspaceId = const Value.absent(),
    this.type = const Value.absent(),
    this.config = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkspaceToolsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String workspaceId,
    required String type,
    this.config = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : workspaceId = Value(workspaceId),
       type = Value(type);
  static Insertable<WorkspaceToolsTable> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? workspaceId,
    Expression<String>? type,
    Expression<String>? config,
    Expression<bool>? isEnabled,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (workspaceId != null) 'workspace_id': workspaceId,
      if (type != null) 'type': type,
      if (config != null) 'config': config,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkspaceToolsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? workspaceId,
    Value<String>? type,
    Value<String?>? config,
    Value<bool>? isEnabled,
    Value<int>? rowid,
  }) {
    return WorkspaceToolsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      workspaceId: workspaceId ?? this.workspaceId,
      type: type ?? this.type,
      config: config ?? this.config,
      isEnabled: isEnabled ?? this.isEnabled,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (workspaceId.present) {
      map['workspace_id'] = Variable<String>(workspaceId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (config.present) {
      map['config'] = Variable<String>(config.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkspaceToolsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('type: $type, ')
          ..write('config: $config, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConversationDisabledToolsTable extends ConversationDisabledTools
    with
        TableInfo<
          $ConversationDisabledToolsTable,
          ConversationDisabledToolsTable
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConversationDisabledToolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const UuidV7().generate(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _conversationIdMeta = const VerificationMeta(
    'conversationId',
  );
  @override
  late final GeneratedColumn<String> conversationId = GeneratedColumn<String>(
    'conversation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES conversations (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    conversationId,
    type,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conversation_disabled_tools';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConversationDisabledToolsTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('conversation_id')) {
      context.handle(
        _conversationIdMeta,
        conversationId.isAcceptableOrUnknown(
          data['conversation_id']!,
          _conversationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conversationIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {conversationId, type};
  @override
  ConversationDisabledToolsTable map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConversationDisabledToolsTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      conversationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conversation_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
    );
  }

  @override
  $ConversationDisabledToolsTable createAlias(String alias) {
    return $ConversationDisabledToolsTable(attachedDatabase, alias);
  }
}

class ConversationDisabledToolsTable extends DataClass
    implements Insertable<ConversationDisabledToolsTable> {
  ///Primary key column as string
  final String id;

  /// when was created timestamp
  final DateTime createdAt;

  /// when was last updated timestamp
  final DateTime updatedAt;

  /// Reference to the conversation this tool setting belongs to
  final String conversationId;

  /// Type of tool (e.g., 'web_search', 'calculator', etc.)
  final String type;
  const ConversationDisabledToolsTable({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.conversationId,
    required this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['conversation_id'] = Variable<String>(conversationId);
    map['type'] = Variable<String>(type);
    return map;
  }

  ConversationDisabledToolsCompanion toCompanion(bool nullToAbsent) {
    return ConversationDisabledToolsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      conversationId: Value(conversationId),
      type: Value(type),
    );
  }

  factory ConversationDisabledToolsTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConversationDisabledToolsTable(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      conversationId: serializer.fromJson<String>(json['conversationId']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'conversationId': serializer.toJson<String>(conversationId),
      'type': serializer.toJson<String>(type),
    };
  }

  ConversationDisabledToolsTable copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? conversationId,
    String? type,
  }) => ConversationDisabledToolsTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    conversationId: conversationId ?? this.conversationId,
    type: type ?? this.type,
  );
  ConversationDisabledToolsTable copyWithCompanion(
    ConversationDisabledToolsCompanion data,
  ) {
    return ConversationDisabledToolsTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      conversationId: data.conversationId.present
          ? data.conversationId.value
          : this.conversationId,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConversationDisabledToolsTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('conversationId: $conversationId, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, conversationId, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConversationDisabledToolsTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.conversationId == this.conversationId &&
          other.type == this.type);
}

class ConversationDisabledToolsCompanion
    extends UpdateCompanion<ConversationDisabledToolsTable> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> conversationId;
  final Value<String> type;
  final Value<int> rowid;
  const ConversationDisabledToolsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.conversationId = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConversationDisabledToolsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String conversationId,
    required String type,
    this.rowid = const Value.absent(),
  }) : conversationId = Value(conversationId),
       type = Value(type);
  static Insertable<ConversationDisabledToolsTable> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? conversationId,
    Expression<String>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (conversationId != null) 'conversation_id': conversationId,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConversationDisabledToolsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? conversationId,
    Value<String>? type,
    Value<int>? rowid,
  }) {
    return ConversationDisabledToolsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      conversationId: conversationId ?? this.conversationId,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (conversationId.present) {
      map['conversation_id'] = Variable<String>(conversationId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversationDisabledToolsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('conversationId: $conversationId, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WorkspacesTable workspaces = $WorkspacesTable(this);
  late final $ApiModelProvidersTable apiModelProviders =
      $ApiModelProvidersTable(this);
  late final $ApiModelsTable apiModels = $ApiModelsTable(this);
  late final $CredentialsTable credentials = $CredentialsTable(this);
  late final $CredentialModelsTable credentialModels = $CredentialModelsTable(
    this,
  );
  late final $ConversationsTable conversations = $ConversationsTable(this);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $WorkspaceToolsTable workspaceTools = $WorkspaceToolsTable(this);
  late final $ConversationDisabledToolsTable conversationDisabledTools =
      $ConversationDisabledToolsTable(this);
  late final WorkspaceDao workspaceDao = WorkspaceDao(this as AppDatabase);
  late final CredentialsDao credentialsDao = CredentialsDao(
    this as AppDatabase,
  );
  late final CredentialModelsDao credentialModelsDao = CredentialModelsDao(
    this as AppDatabase,
  );
  late final ApiModelProvidersDao apiModelProvidersDao = ApiModelProvidersDao(
    this as AppDatabase,
  );
  late final ApiModelsDao apiModelsDao = ApiModelsDao(this as AppDatabase);
  late final ConversationDao conversationDao = ConversationDao(
    this as AppDatabase,
  );
  late final MessageDao messageDao = MessageDao(this as AppDatabase);
  late final WorkspaceToolsDao workspaceToolsDao = WorkspaceToolsDao(
    this as AppDatabase,
  );
  late final ConversationToolsDao conversationToolsDao = ConversationToolsDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    workspaces,
    apiModelProviders,
    apiModels,
    credentials,
    credentialModels,
    conversations,
    messages,
    workspaceTools,
    conversationDisabledTools,
  ];
}

typedef $$WorkspacesTableCreateCompanionBuilder =
    WorkspacesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String name,
      required WorkspaceType type,
      Value<String?> url,
      Value<int> rowid,
    });
typedef $$WorkspacesTableUpdateCompanionBuilder =
    WorkspacesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> name,
      Value<WorkspaceType> type,
      Value<String?> url,
      Value<int> rowid,
    });

final class $$WorkspacesTableReferences
    extends BaseReferences<_$AppDatabase, $WorkspacesTable, WorkspacesTable> {
  $$WorkspacesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CredentialsTable, List<CredentialsTable>>
  _credentialsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.credentials,
    aliasName: $_aliasNameGenerator(
      db.workspaces.id,
      db.credentials.workspaceId,
    ),
  );

  $$CredentialsTableProcessedTableManager get credentialsRefs {
    final manager = $$CredentialsTableTableManager(
      $_db,
      $_db.credentials,
    ).filter((f) => f.workspaceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_credentialsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ConversationsTable, List<ConversationsTable>>
  _conversationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.conversations,
    aliasName: $_aliasNameGenerator(
      db.workspaces.id,
      db.conversations.workspaceId,
    ),
  );

  $$ConversationsTableProcessedTableManager get conversationsRefs {
    final manager = $$ConversationsTableTableManager(
      $_db,
      $_db.conversations,
    ).filter((f) => f.workspaceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_conversationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkspaceToolsTable, List<WorkspaceToolsTable>>
  _workspaceToolsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workspaceTools,
    aliasName: $_aliasNameGenerator(
      db.workspaces.id,
      db.workspaceTools.workspaceId,
    ),
  );

  $$WorkspaceToolsTableProcessedTableManager get workspaceToolsRefs {
    final manager = $$WorkspaceToolsTableTableManager(
      $_db,
      $_db.workspaceTools,
    ).filter((f) => f.workspaceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_workspaceToolsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkspacesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkspacesTable> {
  $$WorkspacesTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<WorkspaceType, WorkspaceType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> credentialsRefs(
    Expression<bool> Function($$CredentialsTableFilterComposer f) f,
  ) {
    final $$CredentialsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.credentials,
      getReferencedColumn: (t) => t.workspaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialsTableFilterComposer(
            $db: $db,
            $table: $db.credentials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> conversationsRefs(
    Expression<bool> Function($$ConversationsTableFilterComposer f) f,
  ) {
    final $$ConversationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.workspaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableFilterComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workspaceToolsRefs(
    Expression<bool> Function($$WorkspaceToolsTableFilterComposer f) f,
  ) {
    final $$WorkspaceToolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workspaceTools,
      getReferencedColumn: (t) => t.workspaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkspaceToolsTableFilterComposer(
            $db: $db,
            $table: $db.workspaceTools,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkspacesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkspacesTable> {
  $$WorkspacesTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkspacesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkspacesTable> {
  $$WorkspacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WorkspaceType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  Expression<T> credentialsRefs<T extends Object>(
    Expression<T> Function($$CredentialsTableAnnotationComposer a) f,
  ) {
    final $$CredentialsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.credentials,
      getReferencedColumn: (t) => t.workspaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialsTableAnnotationComposer(
            $db: $db,
            $table: $db.credentials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> conversationsRefs<T extends Object>(
    Expression<T> Function($$ConversationsTableAnnotationComposer a) f,
  ) {
    final $$ConversationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.workspaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableAnnotationComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workspaceToolsRefs<T extends Object>(
    Expression<T> Function($$WorkspaceToolsTableAnnotationComposer a) f,
  ) {
    final $$WorkspaceToolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workspaceTools,
      getReferencedColumn: (t) => t.workspaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkspaceToolsTableAnnotationComposer(
            $db: $db,
            $table: $db.workspaceTools,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkspacesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkspacesTable,
          WorkspacesTable,
          $$WorkspacesTableFilterComposer,
          $$WorkspacesTableOrderingComposer,
          $$WorkspacesTableAnnotationComposer,
          $$WorkspacesTableCreateCompanionBuilder,
          $$WorkspacesTableUpdateCompanionBuilder,
          (WorkspacesTable, $$WorkspacesTableReferences),
          WorkspacesTable,
          PrefetchHooks Function({
            bool credentialsRefs,
            bool conversationsRefs,
            bool workspaceToolsRefs,
          })
        > {
  $$WorkspacesTableTableManager(_$AppDatabase db, $WorkspacesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkspacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkspacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkspacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<WorkspaceType> type = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkspacesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                type: type,
                url: url,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String name,
                required WorkspaceType type,
                Value<String?> url = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkspacesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                type: type,
                url: url,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkspacesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                credentialsRefs = false,
                conversationsRefs = false,
                workspaceToolsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (credentialsRefs) db.credentials,
                    if (conversationsRefs) db.conversations,
                    if (workspaceToolsRefs) db.workspaceTools,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (credentialsRefs)
                        await $_getPrefetchedData<
                          WorkspacesTable,
                          $WorkspacesTable,
                          CredentialsTable
                        >(
                          currentTable: table,
                          referencedTable: $$WorkspacesTableReferences
                              ._credentialsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkspacesTableReferences(
                                db,
                                table,
                                p0,
                              ).credentialsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workspaceId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (conversationsRefs)
                        await $_getPrefetchedData<
                          WorkspacesTable,
                          $WorkspacesTable,
                          ConversationsTable
                        >(
                          currentTable: table,
                          referencedTable: $$WorkspacesTableReferences
                              ._conversationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkspacesTableReferences(
                                db,
                                table,
                                p0,
                              ).conversationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workspaceId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workspaceToolsRefs)
                        await $_getPrefetchedData<
                          WorkspacesTable,
                          $WorkspacesTable,
                          WorkspaceToolsTable
                        >(
                          currentTable: table,
                          referencedTable: $$WorkspacesTableReferences
                              ._workspaceToolsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkspacesTableReferences(
                                db,
                                table,
                                p0,
                              ).workspaceToolsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workspaceId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$WorkspacesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkspacesTable,
      WorkspacesTable,
      $$WorkspacesTableFilterComposer,
      $$WorkspacesTableOrderingComposer,
      $$WorkspacesTableAnnotationComposer,
      $$WorkspacesTableCreateCompanionBuilder,
      $$WorkspacesTableUpdateCompanionBuilder,
      (WorkspacesTable, $$WorkspacesTableReferences),
      WorkspacesTable,
      PrefetchHooks Function({
        bool credentialsRefs,
        bool conversationsRefs,
        bool workspaceToolsRefs,
      })
    >;
typedef $$ApiModelProvidersTableCreateCompanionBuilder =
    ApiModelProvidersCompanion Function({
      required String id,
      required String name,
      Value<ModelProvidersTableType?> type,
      Value<String?> url,
      Value<String?> doc,
      Value<int> rowid,
    });
typedef $$ApiModelProvidersTableUpdateCompanionBuilder =
    ApiModelProvidersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<ModelProvidersTableType?> type,
      Value<String?> url,
      Value<String?> doc,
      Value<int> rowid,
    });

final class $$ApiModelProvidersTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ApiModelProvidersTable,
          ApiModelProvidersTable
        > {
  $$ApiModelProvidersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ApiModelsTable, List<ApiModelsTable>>
  _apiModelsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.apiModels,
    aliasName: $_aliasNameGenerator(
      db.apiModelProviders.id,
      db.apiModels.modelProvider,
    ),
  );

  $$ApiModelsTableProcessedTableManager get apiModelsRefs {
    final manager = $$ApiModelsTableTableManager(
      $_db,
      $_db.apiModels,
    ).filter((f) => f.modelProvider.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_apiModelsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CredentialModelsTable,
    List<CredentialModelsTable>
  >
  _credentialModelsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.credentialModels,
    aliasName: $_aliasNameGenerator(
      db.apiModelProviders.id,
      db.credentialModels.modelId,
    ),
  );

  $$CredentialModelsTableProcessedTableManager get credentialModelsRefs {
    final manager = $$CredentialModelsTableTableManager(
      $_db,
      $_db.credentialModels,
    ).filter((f) => f.modelId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _credentialModelsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ApiModelProvidersTableFilterComposer
    extends Composer<_$AppDatabase, $ApiModelProvidersTable> {
  $$ApiModelProvidersTableFilterComposer({
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

  ColumnWithTypeConverterFilters<
    ModelProvidersTableType?,
    ModelProvidersTableType,
    String
  >
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doc => $composableBuilder(
    column: $table.doc,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> apiModelsRefs(
    Expression<bool> Function($$ApiModelsTableFilterComposer f) f,
  ) {
    final $$ApiModelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.apiModels,
      getReferencedColumn: (t) => t.modelProvider,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiModelsTableFilterComposer(
            $db: $db,
            $table: $db.apiModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> credentialModelsRefs(
    Expression<bool> Function($$CredentialModelsTableFilterComposer f) f,
  ) {
    final $$CredentialModelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.credentialModels,
      getReferencedColumn: (t) => t.modelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialModelsTableFilterComposer(
            $db: $db,
            $table: $db.credentialModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ApiModelProvidersTableOrderingComposer
    extends Composer<_$AppDatabase, $ApiModelProvidersTable> {
  $$ApiModelProvidersTableOrderingComposer({
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

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doc => $composableBuilder(
    column: $table.doc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ApiModelProvidersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ApiModelProvidersTable> {
  $$ApiModelProvidersTableAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<ModelProvidersTableType?, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get doc =>
      $composableBuilder(column: $table.doc, builder: (column) => column);

  Expression<T> apiModelsRefs<T extends Object>(
    Expression<T> Function($$ApiModelsTableAnnotationComposer a) f,
  ) {
    final $$ApiModelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.apiModels,
      getReferencedColumn: (t) => t.modelProvider,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiModelsTableAnnotationComposer(
            $db: $db,
            $table: $db.apiModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> credentialModelsRefs<T extends Object>(
    Expression<T> Function($$CredentialModelsTableAnnotationComposer a) f,
  ) {
    final $$CredentialModelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.credentialModels,
      getReferencedColumn: (t) => t.modelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialModelsTableAnnotationComposer(
            $db: $db,
            $table: $db.credentialModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ApiModelProvidersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ApiModelProvidersTable,
          ApiModelProvidersTable,
          $$ApiModelProvidersTableFilterComposer,
          $$ApiModelProvidersTableOrderingComposer,
          $$ApiModelProvidersTableAnnotationComposer,
          $$ApiModelProvidersTableCreateCompanionBuilder,
          $$ApiModelProvidersTableUpdateCompanionBuilder,
          (ApiModelProvidersTable, $$ApiModelProvidersTableReferences),
          ApiModelProvidersTable,
          PrefetchHooks Function({
            bool apiModelsRefs,
            bool credentialModelsRefs,
          })
        > {
  $$ApiModelProvidersTableTableManager(
    _$AppDatabase db,
    $ApiModelProvidersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ApiModelProvidersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ApiModelProvidersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ApiModelProvidersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<ModelProvidersTableType?> type = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> doc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ApiModelProvidersCompanion(
                id: id,
                name: name,
                type: type,
                url: url,
                doc: doc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<ModelProvidersTableType?> type = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> doc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ApiModelProvidersCompanion.insert(
                id: id,
                name: name,
                type: type,
                url: url,
                doc: doc,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ApiModelProvidersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({apiModelsRefs = false, credentialModelsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (apiModelsRefs) db.apiModels,
                    if (credentialModelsRefs) db.credentialModels,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (apiModelsRefs)
                        await $_getPrefetchedData<
                          ApiModelProvidersTable,
                          $ApiModelProvidersTable,
                          ApiModelsTable
                        >(
                          currentTable: table,
                          referencedTable: $$ApiModelProvidersTableReferences
                              ._apiModelsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ApiModelProvidersTableReferences(
                                db,
                                table,
                                p0,
                              ).apiModelsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.modelProvider == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (credentialModelsRefs)
                        await $_getPrefetchedData<
                          ApiModelProvidersTable,
                          $ApiModelProvidersTable,
                          CredentialModelsTable
                        >(
                          currentTable: table,
                          referencedTable: $$ApiModelProvidersTableReferences
                              ._credentialModelsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ApiModelProvidersTableReferences(
                                db,
                                table,
                                p0,
                              ).credentialModelsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.modelId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ApiModelProvidersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ApiModelProvidersTable,
      ApiModelProvidersTable,
      $$ApiModelProvidersTableFilterComposer,
      $$ApiModelProvidersTableOrderingComposer,
      $$ApiModelProvidersTableAnnotationComposer,
      $$ApiModelProvidersTableCreateCompanionBuilder,
      $$ApiModelProvidersTableUpdateCompanionBuilder,
      (ApiModelProvidersTable, $$ApiModelProvidersTableReferences),
      ApiModelProvidersTable,
      PrefetchHooks Function({bool apiModelsRefs, bool credentialModelsRefs})
    >;
typedef $$ApiModelsTableCreateCompanionBuilder =
    ApiModelsCompanion Function({
      required String modelProvider,
      required String id,
      required String name,
      Value<List<String>?> modalitiesInput,
      Value<List<String>?> modalitiesOuput,
      Value<bool?> openWeights,
      Value<double?> costInput,
      Value<double?> costOutput,
      Value<double?> costCacheRead,
      required int limitContext,
      required int limitOutput,
      Value<int> rowid,
    });
typedef $$ApiModelsTableUpdateCompanionBuilder =
    ApiModelsCompanion Function({
      Value<String> modelProvider,
      Value<String> id,
      Value<String> name,
      Value<List<String>?> modalitiesInput,
      Value<List<String>?> modalitiesOuput,
      Value<bool?> openWeights,
      Value<double?> costInput,
      Value<double?> costOutput,
      Value<double?> costCacheRead,
      Value<int> limitContext,
      Value<int> limitOutput,
      Value<int> rowid,
    });

final class $$ApiModelsTableReferences
    extends BaseReferences<_$AppDatabase, $ApiModelsTable, ApiModelsTable> {
  $$ApiModelsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ApiModelProvidersTable _modelProviderTable(_$AppDatabase db) =>
      db.apiModelProviders.createAlias(
        $_aliasNameGenerator(
          db.apiModels.modelProvider,
          db.apiModelProviders.id,
        ),
      );

  $$ApiModelProvidersTableProcessedTableManager get modelProvider {
    final $_column = $_itemColumn<String>('model_provider')!;

    final manager = $$ApiModelProvidersTableTableManager(
      $_db,
      $_db.apiModelProviders,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modelProviderTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CredentialsTable, List<CredentialsTable>>
  _credentialsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.credentials,
    aliasName: $_aliasNameGenerator(db.apiModels.id, db.credentials.modelId),
  );

  $$CredentialsTableProcessedTableManager get credentialsRefs {
    final manager = $$CredentialsTableTableManager(
      $_db,
      $_db.credentials,
    ).filter((f) => f.modelId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_credentialsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ApiModelsTableFilterComposer
    extends Composer<_$AppDatabase, $ApiModelsTable> {
  $$ApiModelsTableFilterComposer({
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

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get modalitiesInput => $composableBuilder(
    column: $table.modalitiesInput,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get modalitiesOuput => $composableBuilder(
    column: $table.modalitiesOuput,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get openWeights => $composableBuilder(
    column: $table.openWeights,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costInput => $composableBuilder(
    column: $table.costInput,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costOutput => $composableBuilder(
    column: $table.costOutput,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costCacheRead => $composableBuilder(
    column: $table.costCacheRead,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get limitContext => $composableBuilder(
    column: $table.limitContext,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get limitOutput => $composableBuilder(
    column: $table.limitOutput,
    builder: (column) => ColumnFilters(column),
  );

  $$ApiModelProvidersTableFilterComposer get modelProvider {
    final $$ApiModelProvidersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modelProvider,
      referencedTable: $db.apiModelProviders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiModelProvidersTableFilterComposer(
            $db: $db,
            $table: $db.apiModelProviders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> credentialsRefs(
    Expression<bool> Function($$CredentialsTableFilterComposer f) f,
  ) {
    final $$CredentialsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.credentials,
      getReferencedColumn: (t) => t.modelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialsTableFilterComposer(
            $db: $db,
            $table: $db.credentials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ApiModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $ApiModelsTable> {
  $$ApiModelsTableOrderingComposer({
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

  ColumnOrderings<String> get modalitiesInput => $composableBuilder(
    column: $table.modalitiesInput,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modalitiesOuput => $composableBuilder(
    column: $table.modalitiesOuput,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get openWeights => $composableBuilder(
    column: $table.openWeights,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costInput => $composableBuilder(
    column: $table.costInput,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costOutput => $composableBuilder(
    column: $table.costOutput,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costCacheRead => $composableBuilder(
    column: $table.costCacheRead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get limitContext => $composableBuilder(
    column: $table.limitContext,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get limitOutput => $composableBuilder(
    column: $table.limitOutput,
    builder: (column) => ColumnOrderings(column),
  );

  $$ApiModelProvidersTableOrderingComposer get modelProvider {
    final $$ApiModelProvidersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modelProvider,
      referencedTable: $db.apiModelProviders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiModelProvidersTableOrderingComposer(
            $db: $db,
            $table: $db.apiModelProviders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ApiModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ApiModelsTable> {
  $$ApiModelsTableAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<List<String>?, String> get modalitiesInput =>
      $composableBuilder(
        column: $table.modalitiesInput,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<String>?, String> get modalitiesOuput =>
      $composableBuilder(
        column: $table.modalitiesOuput,
        builder: (column) => column,
      );

  GeneratedColumn<bool> get openWeights => $composableBuilder(
    column: $table.openWeights,
    builder: (column) => column,
  );

  GeneratedColumn<double> get costInput =>
      $composableBuilder(column: $table.costInput, builder: (column) => column);

  GeneratedColumn<double> get costOutput => $composableBuilder(
    column: $table.costOutput,
    builder: (column) => column,
  );

  GeneratedColumn<double> get costCacheRead => $composableBuilder(
    column: $table.costCacheRead,
    builder: (column) => column,
  );

  GeneratedColumn<int> get limitContext => $composableBuilder(
    column: $table.limitContext,
    builder: (column) => column,
  );

  GeneratedColumn<int> get limitOutput => $composableBuilder(
    column: $table.limitOutput,
    builder: (column) => column,
  );

  $$ApiModelProvidersTableAnnotationComposer get modelProvider {
    final $$ApiModelProvidersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.modelProvider,
          referencedTable: $db.apiModelProviders,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ApiModelProvidersTableAnnotationComposer(
                $db: $db,
                $table: $db.apiModelProviders,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> credentialsRefs<T extends Object>(
    Expression<T> Function($$CredentialsTableAnnotationComposer a) f,
  ) {
    final $$CredentialsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.credentials,
      getReferencedColumn: (t) => t.modelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialsTableAnnotationComposer(
            $db: $db,
            $table: $db.credentials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ApiModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ApiModelsTable,
          ApiModelsTable,
          $$ApiModelsTableFilterComposer,
          $$ApiModelsTableOrderingComposer,
          $$ApiModelsTableAnnotationComposer,
          $$ApiModelsTableCreateCompanionBuilder,
          $$ApiModelsTableUpdateCompanionBuilder,
          (ApiModelsTable, $$ApiModelsTableReferences),
          ApiModelsTable,
          PrefetchHooks Function({bool modelProvider, bool credentialsRefs})
        > {
  $$ApiModelsTableTableManager(_$AppDatabase db, $ApiModelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ApiModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ApiModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ApiModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> modelProvider = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<List<String>?> modalitiesInput = const Value.absent(),
                Value<List<String>?> modalitiesOuput = const Value.absent(),
                Value<bool?> openWeights = const Value.absent(),
                Value<double?> costInput = const Value.absent(),
                Value<double?> costOutput = const Value.absent(),
                Value<double?> costCacheRead = const Value.absent(),
                Value<int> limitContext = const Value.absent(),
                Value<int> limitOutput = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ApiModelsCompanion(
                modelProvider: modelProvider,
                id: id,
                name: name,
                modalitiesInput: modalitiesInput,
                modalitiesOuput: modalitiesOuput,
                openWeights: openWeights,
                costInput: costInput,
                costOutput: costOutput,
                costCacheRead: costCacheRead,
                limitContext: limitContext,
                limitOutput: limitOutput,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String modelProvider,
                required String id,
                required String name,
                Value<List<String>?> modalitiesInput = const Value.absent(),
                Value<List<String>?> modalitiesOuput = const Value.absent(),
                Value<bool?> openWeights = const Value.absent(),
                Value<double?> costInput = const Value.absent(),
                Value<double?> costOutput = const Value.absent(),
                Value<double?> costCacheRead = const Value.absent(),
                required int limitContext,
                required int limitOutput,
                Value<int> rowid = const Value.absent(),
              }) => ApiModelsCompanion.insert(
                modelProvider: modelProvider,
                id: id,
                name: name,
                modalitiesInput: modalitiesInput,
                modalitiesOuput: modalitiesOuput,
                openWeights: openWeights,
                costInput: costInput,
                costOutput: costOutput,
                costCacheRead: costCacheRead,
                limitContext: limitContext,
                limitOutput: limitOutput,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ApiModelsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({modelProvider = false, credentialsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (credentialsRefs) db.credentials,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (modelProvider) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.modelProvider,
                                    referencedTable: $$ApiModelsTableReferences
                                        ._modelProviderTable(db),
                                    referencedColumn: $$ApiModelsTableReferences
                                        ._modelProviderTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (credentialsRefs)
                        await $_getPrefetchedData<
                          ApiModelsTable,
                          $ApiModelsTable,
                          CredentialsTable
                        >(
                          currentTable: table,
                          referencedTable: $$ApiModelsTableReferences
                              ._credentialsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ApiModelsTableReferences(
                                db,
                                table,
                                p0,
                              ).credentialsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.modelId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ApiModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ApiModelsTable,
      ApiModelsTable,
      $$ApiModelsTableFilterComposer,
      $$ApiModelsTableOrderingComposer,
      $$ApiModelsTableAnnotationComposer,
      $$ApiModelsTableCreateCompanionBuilder,
      $$ApiModelsTableUpdateCompanionBuilder,
      (ApiModelsTable, $$ApiModelsTableReferences),
      ApiModelsTable,
      PrefetchHooks Function({bool modelProvider, bool credentialsRefs})
    >;
typedef $$CredentialsTableCreateCompanionBuilder =
    CredentialsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String name,
      required String modelId,
      Value<String?> url,
      required String keyValue,
      required String workspaceId,
      Value<int> rowid,
    });
typedef $$CredentialsTableUpdateCompanionBuilder =
    CredentialsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> name,
      Value<String> modelId,
      Value<String?> url,
      Value<String> keyValue,
      Value<String> workspaceId,
      Value<int> rowid,
    });

final class $$CredentialsTableReferences
    extends BaseReferences<_$AppDatabase, $CredentialsTable, CredentialsTable> {
  $$CredentialsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ApiModelsTable _modelIdTable(_$AppDatabase db) =>
      db.apiModels.createAlias(
        $_aliasNameGenerator(db.credentials.modelId, db.apiModels.id),
      );

  $$ApiModelsTableProcessedTableManager get modelId {
    final $_column = $_itemColumn<String>('model_id')!;

    final manager = $$ApiModelsTableTableManager(
      $_db,
      $_db.apiModels,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WorkspacesTable _workspaceIdTable(_$AppDatabase db) =>
      db.workspaces.createAlias(
        $_aliasNameGenerator(db.credentials.workspaceId, db.workspaces.id),
      );

  $$WorkspacesTableProcessedTableManager get workspaceId {
    final $_column = $_itemColumn<String>('workspace_id')!;

    final manager = $$WorkspacesTableTableManager(
      $_db,
      $_db.workspaces,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workspaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $CredentialModelsTable,
    List<CredentialModelsTable>
  >
  _credentialModelsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.credentialModels,
    aliasName: $_aliasNameGenerator(
      db.credentials.id,
      db.credentialModels.credentialsId,
    ),
  );

  $$CredentialModelsTableProcessedTableManager get credentialModelsRefs {
    final manager = $$CredentialModelsTableTableManager(
      $_db,
      $_db.credentialModels,
    ).filter((f) => f.credentialsId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _credentialModelsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CredentialsTableFilterComposer
    extends Composer<_$AppDatabase, $CredentialsTable> {
  $$CredentialsTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keyValue => $composableBuilder(
    column: $table.keyValue,
    builder: (column) => ColumnFilters(column),
  );

  $$ApiModelsTableFilterComposer get modelId {
    final $$ApiModelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modelId,
      referencedTable: $db.apiModels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiModelsTableFilterComposer(
            $db: $db,
            $table: $db.apiModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkspacesTableFilterComposer get workspaceId {
    final $$WorkspacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workspaceId,
      referencedTable: $db.workspaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkspacesTableFilterComposer(
            $db: $db,
            $table: $db.workspaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> credentialModelsRefs(
    Expression<bool> Function($$CredentialModelsTableFilterComposer f) f,
  ) {
    final $$CredentialModelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.credentialModels,
      getReferencedColumn: (t) => t.credentialsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialModelsTableFilterComposer(
            $db: $db,
            $table: $db.credentialModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CredentialsTableOrderingComposer
    extends Composer<_$AppDatabase, $CredentialsTable> {
  $$CredentialsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keyValue => $composableBuilder(
    column: $table.keyValue,
    builder: (column) => ColumnOrderings(column),
  );

  $$ApiModelsTableOrderingComposer get modelId {
    final $$ApiModelsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modelId,
      referencedTable: $db.apiModels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiModelsTableOrderingComposer(
            $db: $db,
            $table: $db.apiModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkspacesTableOrderingComposer get workspaceId {
    final $$WorkspacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workspaceId,
      referencedTable: $db.workspaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkspacesTableOrderingComposer(
            $db: $db,
            $table: $db.workspaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CredentialsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CredentialsTable> {
  $$CredentialsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get keyValue =>
      $composableBuilder(column: $table.keyValue, builder: (column) => column);

  $$ApiModelsTableAnnotationComposer get modelId {
    final $$ApiModelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modelId,
      referencedTable: $db.apiModels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiModelsTableAnnotationComposer(
            $db: $db,
            $table: $db.apiModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkspacesTableAnnotationComposer get workspaceId {
    final $$WorkspacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workspaceId,
      referencedTable: $db.workspaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkspacesTableAnnotationComposer(
            $db: $db,
            $table: $db.workspaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> credentialModelsRefs<T extends Object>(
    Expression<T> Function($$CredentialModelsTableAnnotationComposer a) f,
  ) {
    final $$CredentialModelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.credentialModels,
      getReferencedColumn: (t) => t.credentialsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialModelsTableAnnotationComposer(
            $db: $db,
            $table: $db.credentialModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CredentialsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CredentialsTable,
          CredentialsTable,
          $$CredentialsTableFilterComposer,
          $$CredentialsTableOrderingComposer,
          $$CredentialsTableAnnotationComposer,
          $$CredentialsTableCreateCompanionBuilder,
          $$CredentialsTableUpdateCompanionBuilder,
          (CredentialsTable, $$CredentialsTableReferences),
          CredentialsTable,
          PrefetchHooks Function({
            bool modelId,
            bool workspaceId,
            bool credentialModelsRefs,
          })
        > {
  $$CredentialsTableTableManager(_$AppDatabase db, $CredentialsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CredentialsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CredentialsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CredentialsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> modelId = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String> keyValue = const Value.absent(),
                Value<String> workspaceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CredentialsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                modelId: modelId,
                url: url,
                keyValue: keyValue,
                workspaceId: workspaceId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String name,
                required String modelId,
                Value<String?> url = const Value.absent(),
                required String keyValue,
                required String workspaceId,
                Value<int> rowid = const Value.absent(),
              }) => CredentialsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                modelId: modelId,
                url: url,
                keyValue: keyValue,
                workspaceId: workspaceId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CredentialsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                modelId = false,
                workspaceId = false,
                credentialModelsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (credentialModelsRefs) db.credentialModels,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (modelId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.modelId,
                                    referencedTable:
                                        $$CredentialsTableReferences
                                            ._modelIdTable(db),
                                    referencedColumn:
                                        $$CredentialsTableReferences
                                            ._modelIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (workspaceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.workspaceId,
                                    referencedTable:
                                        $$CredentialsTableReferences
                                            ._workspaceIdTable(db),
                                    referencedColumn:
                                        $$CredentialsTableReferences
                                            ._workspaceIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (credentialModelsRefs)
                        await $_getPrefetchedData<
                          CredentialsTable,
                          $CredentialsTable,
                          CredentialModelsTable
                        >(
                          currentTable: table,
                          referencedTable: $$CredentialsTableReferences
                              ._credentialModelsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CredentialsTableReferences(
                                db,
                                table,
                                p0,
                              ).credentialModelsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.credentialsId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CredentialsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CredentialsTable,
      CredentialsTable,
      $$CredentialsTableFilterComposer,
      $$CredentialsTableOrderingComposer,
      $$CredentialsTableAnnotationComposer,
      $$CredentialsTableCreateCompanionBuilder,
      $$CredentialsTableUpdateCompanionBuilder,
      (CredentialsTable, $$CredentialsTableReferences),
      CredentialsTable,
      PrefetchHooks Function({
        bool modelId,
        bool workspaceId,
        bool credentialModelsRefs,
      })
    >;
typedef $$CredentialModelsTableCreateCompanionBuilder =
    CredentialModelsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String modelId,
      required String credentialsId,
      Value<int> rowid,
    });
typedef $$CredentialModelsTableUpdateCompanionBuilder =
    CredentialModelsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> modelId,
      Value<String> credentialsId,
      Value<int> rowid,
    });

final class $$CredentialModelsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CredentialModelsTable,
          CredentialModelsTable
        > {
  $$CredentialModelsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ApiModelProvidersTable _modelIdTable(_$AppDatabase db) =>
      db.apiModelProviders.createAlias(
        $_aliasNameGenerator(
          db.credentialModels.modelId,
          db.apiModelProviders.id,
        ),
      );

  $$ApiModelProvidersTableProcessedTableManager get modelId {
    final $_column = $_itemColumn<String>('model_id')!;

    final manager = $$ApiModelProvidersTableTableManager(
      $_db,
      $_db.apiModelProviders,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CredentialsTable _credentialsIdTable(_$AppDatabase db) =>
      db.credentials.createAlias(
        $_aliasNameGenerator(
          db.credentialModels.credentialsId,
          db.credentials.id,
        ),
      );

  $$CredentialsTableProcessedTableManager get credentialsId {
    final $_column = $_itemColumn<String>('credentials_id')!;

    final manager = $$CredentialsTableTableManager(
      $_db,
      $_db.credentials,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_credentialsIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ConversationsTable, List<ConversationsTable>>
  _conversationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.conversations,
    aliasName: $_aliasNameGenerator(
      db.credentialModels.id,
      db.conversations.modelId,
    ),
  );

  $$ConversationsTableProcessedTableManager get conversationsRefs {
    final manager = $$ConversationsTableTableManager(
      $_db,
      $_db.conversations,
    ).filter((f) => f.modelId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_conversationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CredentialModelsTableFilterComposer
    extends Composer<_$AppDatabase, $CredentialModelsTable> {
  $$CredentialModelsTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ApiModelProvidersTableFilterComposer get modelId {
    final $$ApiModelProvidersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modelId,
      referencedTable: $db.apiModelProviders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiModelProvidersTableFilterComposer(
            $db: $db,
            $table: $db.apiModelProviders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CredentialsTableFilterComposer get credentialsId {
    final $$CredentialsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.credentialsId,
      referencedTable: $db.credentials,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialsTableFilterComposer(
            $db: $db,
            $table: $db.credentials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> conversationsRefs(
    Expression<bool> Function($$ConversationsTableFilterComposer f) f,
  ) {
    final $$ConversationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.modelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableFilterComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CredentialModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $CredentialModelsTable> {
  $$CredentialModelsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ApiModelProvidersTableOrderingComposer get modelId {
    final $$ApiModelProvidersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modelId,
      referencedTable: $db.apiModelProviders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApiModelProvidersTableOrderingComposer(
            $db: $db,
            $table: $db.apiModelProviders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CredentialsTableOrderingComposer get credentialsId {
    final $$CredentialsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.credentialsId,
      referencedTable: $db.credentials,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialsTableOrderingComposer(
            $db: $db,
            $table: $db.credentials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CredentialModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CredentialModelsTable> {
  $$CredentialModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ApiModelProvidersTableAnnotationComposer get modelId {
    final $$ApiModelProvidersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.modelId,
          referencedTable: $db.apiModelProviders,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ApiModelProvidersTableAnnotationComposer(
                $db: $db,
                $table: $db.apiModelProviders,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$CredentialsTableAnnotationComposer get credentialsId {
    final $$CredentialsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.credentialsId,
      referencedTable: $db.credentials,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialsTableAnnotationComposer(
            $db: $db,
            $table: $db.credentials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> conversationsRefs<T extends Object>(
    Expression<T> Function($$ConversationsTableAnnotationComposer a) f,
  ) {
    final $$ConversationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.modelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableAnnotationComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CredentialModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CredentialModelsTable,
          CredentialModelsTable,
          $$CredentialModelsTableFilterComposer,
          $$CredentialModelsTableOrderingComposer,
          $$CredentialModelsTableAnnotationComposer,
          $$CredentialModelsTableCreateCompanionBuilder,
          $$CredentialModelsTableUpdateCompanionBuilder,
          (CredentialModelsTable, $$CredentialModelsTableReferences),
          CredentialModelsTable,
          PrefetchHooks Function({
            bool modelId,
            bool credentialsId,
            bool conversationsRefs,
          })
        > {
  $$CredentialModelsTableTableManager(
    _$AppDatabase db,
    $CredentialModelsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CredentialModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CredentialModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CredentialModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> modelId = const Value.absent(),
                Value<String> credentialsId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CredentialModelsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                modelId: modelId,
                credentialsId: credentialsId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String modelId,
                required String credentialsId,
                Value<int> rowid = const Value.absent(),
              }) => CredentialModelsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                modelId: modelId,
                credentialsId: credentialsId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CredentialModelsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                modelId = false,
                credentialsId = false,
                conversationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (conversationsRefs) db.conversations,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (modelId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.modelId,
                                    referencedTable:
                                        $$CredentialModelsTableReferences
                                            ._modelIdTable(db),
                                    referencedColumn:
                                        $$CredentialModelsTableReferences
                                            ._modelIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (credentialsId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.credentialsId,
                                    referencedTable:
                                        $$CredentialModelsTableReferences
                                            ._credentialsIdTable(db),
                                    referencedColumn:
                                        $$CredentialModelsTableReferences
                                            ._credentialsIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (conversationsRefs)
                        await $_getPrefetchedData<
                          CredentialModelsTable,
                          $CredentialModelsTable,
                          ConversationsTable
                        >(
                          currentTable: table,
                          referencedTable: $$CredentialModelsTableReferences
                              ._conversationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CredentialModelsTableReferences(
                                db,
                                table,
                                p0,
                              ).conversationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.modelId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CredentialModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CredentialModelsTable,
      CredentialModelsTable,
      $$CredentialModelsTableFilterComposer,
      $$CredentialModelsTableOrderingComposer,
      $$CredentialModelsTableAnnotationComposer,
      $$CredentialModelsTableCreateCompanionBuilder,
      $$CredentialModelsTableUpdateCompanionBuilder,
      (CredentialModelsTable, $$CredentialModelsTableReferences),
      CredentialModelsTable,
      PrefetchHooks Function({
        bool modelId,
        bool credentialsId,
        bool conversationsRefs,
      })
    >;
typedef $$ConversationsTableCreateCompanionBuilder =
    ConversationsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String workspaceId,
      required String title,
      Value<String?> modelId,
      Value<bool> isPinned,
      Value<int> rowid,
    });
typedef $$ConversationsTableUpdateCompanionBuilder =
    ConversationsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> workspaceId,
      Value<String> title,
      Value<String?> modelId,
      Value<bool> isPinned,
      Value<int> rowid,
    });

final class $$ConversationsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ConversationsTable, ConversationsTable> {
  $$ConversationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorkspacesTable _workspaceIdTable(_$AppDatabase db) =>
      db.workspaces.createAlias(
        $_aliasNameGenerator(db.conversations.workspaceId, db.workspaces.id),
      );

  $$WorkspacesTableProcessedTableManager get workspaceId {
    final $_column = $_itemColumn<String>('workspace_id')!;

    final manager = $$WorkspacesTableTableManager(
      $_db,
      $_db.workspaces,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workspaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CredentialModelsTable _modelIdTable(_$AppDatabase db) =>
      db.credentialModels.createAlias(
        $_aliasNameGenerator(db.conversations.modelId, db.credentialModels.id),
      );

  $$CredentialModelsTableProcessedTableManager? get modelId {
    final $_column = $_itemColumn<String>('model_id');
    if ($_column == null) return null;
    final manager = $$CredentialModelsTableTableManager(
      $_db,
      $_db.credentialModels,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MessagesTable, List<MessagesTable>>
  _messagesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.messages,
    aliasName: $_aliasNameGenerator(
      db.conversations.id,
      db.messages.conversationId,
    ),
  );

  $$MessagesTableProcessedTableManager get messagesRefs {
    final manager = $$MessagesTableTableManager(
      $_db,
      $_db.messages,
    ).filter((f) => f.conversationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_messagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ConversationDisabledToolsTable,
    List<ConversationDisabledToolsTable>
  >
  _conversationDisabledToolsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.conversationDisabledTools,
        aliasName: $_aliasNameGenerator(
          db.conversations.id,
          db.conversationDisabledTools.conversationId,
        ),
      );

  $$ConversationDisabledToolsTableProcessedTableManager
  get conversationDisabledToolsRefs {
    final manager = $$ConversationDisabledToolsTableTableManager(
      $_db,
      $_db.conversationDisabledTools,
    ).filter((f) => f.conversationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _conversationDisabledToolsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ConversationsTableFilterComposer
    extends Composer<_$AppDatabase, $ConversationsTable> {
  $$ConversationsTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkspacesTableFilterComposer get workspaceId {
    final $$WorkspacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workspaceId,
      referencedTable: $db.workspaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkspacesTableFilterComposer(
            $db: $db,
            $table: $db.workspaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CredentialModelsTableFilterComposer get modelId {
    final $$CredentialModelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modelId,
      referencedTable: $db.credentialModels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialModelsTableFilterComposer(
            $db: $db,
            $table: $db.credentialModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> messagesRefs(
    Expression<bool> Function($$MessagesTableFilterComposer f) f,
  ) {
    final $$MessagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.conversationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableFilterComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> conversationDisabledToolsRefs(
    Expression<bool> Function($$ConversationDisabledToolsTableFilterComposer f)
    f,
  ) {
    final $$ConversationDisabledToolsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.conversationDisabledTools,
          getReferencedColumn: (t) => t.conversationId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ConversationDisabledToolsTableFilterComposer(
                $db: $db,
                $table: $db.conversationDisabledTools,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ConversationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ConversationsTable> {
  $$ConversationsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkspacesTableOrderingComposer get workspaceId {
    final $$WorkspacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workspaceId,
      referencedTable: $db.workspaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkspacesTableOrderingComposer(
            $db: $db,
            $table: $db.workspaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CredentialModelsTableOrderingComposer get modelId {
    final $$CredentialModelsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modelId,
      referencedTable: $db.credentialModels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialModelsTableOrderingComposer(
            $db: $db,
            $table: $db.credentialModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConversationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConversationsTable> {
  $$ConversationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isPinned =>
      $composableBuilder(column: $table.isPinned, builder: (column) => column);

  $$WorkspacesTableAnnotationComposer get workspaceId {
    final $$WorkspacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workspaceId,
      referencedTable: $db.workspaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkspacesTableAnnotationComposer(
            $db: $db,
            $table: $db.workspaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CredentialModelsTableAnnotationComposer get modelId {
    final $$CredentialModelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modelId,
      referencedTable: $db.credentialModels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CredentialModelsTableAnnotationComposer(
            $db: $db,
            $table: $db.credentialModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> messagesRefs<T extends Object>(
    Expression<T> Function($$MessagesTableAnnotationComposer a) f,
  ) {
    final $$MessagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.conversationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableAnnotationComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> conversationDisabledToolsRefs<T extends Object>(
    Expression<T> Function($$ConversationDisabledToolsTableAnnotationComposer a)
    f,
  ) {
    final $$ConversationDisabledToolsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.conversationDisabledTools,
          getReferencedColumn: (t) => t.conversationId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ConversationDisabledToolsTableAnnotationComposer(
                $db: $db,
                $table: $db.conversationDisabledTools,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ConversationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConversationsTable,
          ConversationsTable,
          $$ConversationsTableFilterComposer,
          $$ConversationsTableOrderingComposer,
          $$ConversationsTableAnnotationComposer,
          $$ConversationsTableCreateCompanionBuilder,
          $$ConversationsTableUpdateCompanionBuilder,
          (ConversationsTable, $$ConversationsTableReferences),
          ConversationsTable,
          PrefetchHooks Function({
            bool workspaceId,
            bool modelId,
            bool messagesRefs,
            bool conversationDisabledToolsRefs,
          })
        > {
  $$ConversationsTableTableManager(_$AppDatabase db, $ConversationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConversationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConversationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConversationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> workspaceId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> modelId = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConversationsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                workspaceId: workspaceId,
                title: title,
                modelId: modelId,
                isPinned: isPinned,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String workspaceId,
                required String title,
                Value<String?> modelId = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConversationsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                workspaceId: workspaceId,
                title: title,
                modelId: modelId,
                isPinned: isPinned,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ConversationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                workspaceId = false,
                modelId = false,
                messagesRefs = false,
                conversationDisabledToolsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (messagesRefs) db.messages,
                    if (conversationDisabledToolsRefs)
                      db.conversationDisabledTools,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (workspaceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.workspaceId,
                                    referencedTable:
                                        $$ConversationsTableReferences
                                            ._workspaceIdTable(db),
                                    referencedColumn:
                                        $$ConversationsTableReferences
                                            ._workspaceIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (modelId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.modelId,
                                    referencedTable:
                                        $$ConversationsTableReferences
                                            ._modelIdTable(db),
                                    referencedColumn:
                                        $$ConversationsTableReferences
                                            ._modelIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (messagesRefs)
                        await $_getPrefetchedData<
                          ConversationsTable,
                          $ConversationsTable,
                          MessagesTable
                        >(
                          currentTable: table,
                          referencedTable: $$ConversationsTableReferences
                              ._messagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ConversationsTableReferences(
                                db,
                                table,
                                p0,
                              ).messagesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.conversationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (conversationDisabledToolsRefs)
                        await $_getPrefetchedData<
                          ConversationsTable,
                          $ConversationsTable,
                          ConversationDisabledToolsTable
                        >(
                          currentTable: table,
                          referencedTable: $$ConversationsTableReferences
                              ._conversationDisabledToolsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ConversationsTableReferences(
                                db,
                                table,
                                p0,
                              ).conversationDisabledToolsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.conversationId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ConversationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConversationsTable,
      ConversationsTable,
      $$ConversationsTableFilterComposer,
      $$ConversationsTableOrderingComposer,
      $$ConversationsTableAnnotationComposer,
      $$ConversationsTableCreateCompanionBuilder,
      $$ConversationsTableUpdateCompanionBuilder,
      (ConversationsTable, $$ConversationsTableReferences),
      ConversationsTable,
      PrefetchHooks Function({
        bool workspaceId,
        bool modelId,
        bool messagesRefs,
        bool conversationDisabledToolsRefs,
      })
    >;
typedef $$MessagesTableCreateCompanionBuilder =
    MessagesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String conversationId,
      required String content,
      required MessagesTableType messageType,
      required bool isUser,
      required MessageTableStatus status,
      Value<String?> metadata,
      Value<int> rowid,
    });
typedef $$MessagesTableUpdateCompanionBuilder =
    MessagesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> conversationId,
      Value<String> content,
      Value<MessagesTableType> messageType,
      Value<bool> isUser,
      Value<MessageTableStatus> status,
      Value<String?> metadata,
      Value<int> rowid,
    });

final class $$MessagesTableReferences
    extends BaseReferences<_$AppDatabase, $MessagesTable, MessagesTable> {
  $$MessagesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ConversationsTable _conversationIdTable(_$AppDatabase db) =>
      db.conversations.createAlias(
        $_aliasNameGenerator(db.messages.conversationId, db.conversations.id),
      );

  $$ConversationsTableProcessedTableManager get conversationId {
    final $_column = $_itemColumn<String>('conversation_id')!;

    final manager = $$ConversationsTableTableManager(
      $_db,
      $_db.conversations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_conversationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MessagesTableFilterComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MessagesTableType, MessagesTableType, String>
  get messageType => $composableBuilder(
    column: $table.messageType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isUser => $composableBuilder(
    column: $table.isUser,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MessageTableStatus, MessageTableStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );

  $$ConversationsTableFilterComposer get conversationId {
    final $$ConversationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conversationId,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableFilterComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get messageType => $composableBuilder(
    column: $table.messageType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUser => $composableBuilder(
    column: $table.isUser,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );

  $$ConversationsTableOrderingComposer get conversationId {
    final $$ConversationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conversationId,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableOrderingComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MessagesTableType, String> get messageType =>
      $composableBuilder(
        column: $table.messageType,
        builder: (column) => column,
      );

  GeneratedColumn<bool> get isUser =>
      $composableBuilder(column: $table.isUser, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MessageTableStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  $$ConversationsTableAnnotationComposer get conversationId {
    final $$ConversationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conversationId,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableAnnotationComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MessagesTable,
          MessagesTable,
          $$MessagesTableFilterComposer,
          $$MessagesTableOrderingComposer,
          $$MessagesTableAnnotationComposer,
          $$MessagesTableCreateCompanionBuilder,
          $$MessagesTableUpdateCompanionBuilder,
          (MessagesTable, $$MessagesTableReferences),
          MessagesTable,
          PrefetchHooks Function({bool conversationId})
        > {
  $$MessagesTableTableManager(_$AppDatabase db, $MessagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> conversationId = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<MessagesTableType> messageType = const Value.absent(),
                Value<bool> isUser = const Value.absent(),
                Value<MessageTableStatus> status = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MessagesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                conversationId: conversationId,
                content: content,
                messageType: messageType,
                isUser: isUser,
                status: status,
                metadata: metadata,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String conversationId,
                required String content,
                required MessagesTableType messageType,
                required bool isUser,
                required MessageTableStatus status,
                Value<String?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MessagesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                conversationId: conversationId,
                content: content,
                messageType: messageType,
                isUser: isUser,
                status: status,
                metadata: metadata,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MessagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({conversationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (conversationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.conversationId,
                                referencedTable: $$MessagesTableReferences
                                    ._conversationIdTable(db),
                                referencedColumn: $$MessagesTableReferences
                                    ._conversationIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MessagesTable,
      MessagesTable,
      $$MessagesTableFilterComposer,
      $$MessagesTableOrderingComposer,
      $$MessagesTableAnnotationComposer,
      $$MessagesTableCreateCompanionBuilder,
      $$MessagesTableUpdateCompanionBuilder,
      (MessagesTable, $$MessagesTableReferences),
      MessagesTable,
      PrefetchHooks Function({bool conversationId})
    >;
typedef $$WorkspaceToolsTableCreateCompanionBuilder =
    WorkspaceToolsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String workspaceId,
      required String type,
      Value<String?> config,
      Value<bool> isEnabled,
      Value<int> rowid,
    });
typedef $$WorkspaceToolsTableUpdateCompanionBuilder =
    WorkspaceToolsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> workspaceId,
      Value<String> type,
      Value<String?> config,
      Value<bool> isEnabled,
      Value<int> rowid,
    });

final class $$WorkspaceToolsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $WorkspaceToolsTable,
          WorkspaceToolsTable
        > {
  $$WorkspaceToolsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorkspacesTable _workspaceIdTable(_$AppDatabase db) =>
      db.workspaces.createAlias(
        $_aliasNameGenerator(db.workspaceTools.workspaceId, db.workspaces.id),
      );

  $$WorkspacesTableProcessedTableManager get workspaceId {
    final $_column = $_itemColumn<String>('workspace_id')!;

    final manager = $$WorkspacesTableTableManager(
      $_db,
      $_db.workspaces,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workspaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkspaceToolsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkspaceToolsTable> {
  $$WorkspaceToolsTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkspacesTableFilterComposer get workspaceId {
    final $$WorkspacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workspaceId,
      referencedTable: $db.workspaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkspacesTableFilterComposer(
            $db: $db,
            $table: $db.workspaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkspaceToolsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkspaceToolsTable> {
  $$WorkspaceToolsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkspacesTableOrderingComposer get workspaceId {
    final $$WorkspacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workspaceId,
      referencedTable: $db.workspaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkspacesTableOrderingComposer(
            $db: $db,
            $table: $db.workspaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkspaceToolsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkspaceToolsTable> {
  $$WorkspaceToolsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get config =>
      $composableBuilder(column: $table.config, builder: (column) => column);

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  $$WorkspacesTableAnnotationComposer get workspaceId {
    final $$WorkspacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workspaceId,
      referencedTable: $db.workspaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkspacesTableAnnotationComposer(
            $db: $db,
            $table: $db.workspaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkspaceToolsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkspaceToolsTable,
          WorkspaceToolsTable,
          $$WorkspaceToolsTableFilterComposer,
          $$WorkspaceToolsTableOrderingComposer,
          $$WorkspaceToolsTableAnnotationComposer,
          $$WorkspaceToolsTableCreateCompanionBuilder,
          $$WorkspaceToolsTableUpdateCompanionBuilder,
          (WorkspaceToolsTable, $$WorkspaceToolsTableReferences),
          WorkspaceToolsTable,
          PrefetchHooks Function({bool workspaceId})
        > {
  $$WorkspaceToolsTableTableManager(
    _$AppDatabase db,
    $WorkspaceToolsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkspaceToolsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkspaceToolsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkspaceToolsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> workspaceId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> config = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkspaceToolsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                workspaceId: workspaceId,
                type: type,
                config: config,
                isEnabled: isEnabled,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String workspaceId,
                required String type,
                Value<String?> config = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkspaceToolsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                workspaceId: workspaceId,
                type: type,
                config: config,
                isEnabled: isEnabled,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkspaceToolsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workspaceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (workspaceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.workspaceId,
                                referencedTable: $$WorkspaceToolsTableReferences
                                    ._workspaceIdTable(db),
                                referencedColumn:
                                    $$WorkspaceToolsTableReferences
                                        ._workspaceIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WorkspaceToolsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkspaceToolsTable,
      WorkspaceToolsTable,
      $$WorkspaceToolsTableFilterComposer,
      $$WorkspaceToolsTableOrderingComposer,
      $$WorkspaceToolsTableAnnotationComposer,
      $$WorkspaceToolsTableCreateCompanionBuilder,
      $$WorkspaceToolsTableUpdateCompanionBuilder,
      (WorkspaceToolsTable, $$WorkspaceToolsTableReferences),
      WorkspaceToolsTable,
      PrefetchHooks Function({bool workspaceId})
    >;
typedef $$ConversationDisabledToolsTableCreateCompanionBuilder =
    ConversationDisabledToolsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String conversationId,
      required String type,
      Value<int> rowid,
    });
typedef $$ConversationDisabledToolsTableUpdateCompanionBuilder =
    ConversationDisabledToolsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> conversationId,
      Value<String> type,
      Value<int> rowid,
    });

final class $$ConversationDisabledToolsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ConversationDisabledToolsTable,
          ConversationDisabledToolsTable
        > {
  $$ConversationDisabledToolsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ConversationsTable _conversationIdTable(_$AppDatabase db) =>
      db.conversations.createAlias(
        $_aliasNameGenerator(
          db.conversationDisabledTools.conversationId,
          db.conversations.id,
        ),
      );

  $$ConversationsTableProcessedTableManager get conversationId {
    final $_column = $_itemColumn<String>('conversation_id')!;

    final manager = $$ConversationsTableTableManager(
      $_db,
      $_db.conversations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_conversationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ConversationDisabledToolsTableFilterComposer
    extends Composer<_$AppDatabase, $ConversationDisabledToolsTable> {
  $$ConversationDisabledToolsTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  $$ConversationsTableFilterComposer get conversationId {
    final $$ConversationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conversationId,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableFilterComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConversationDisabledToolsTableOrderingComposer
    extends Composer<_$AppDatabase, $ConversationDisabledToolsTable> {
  $$ConversationDisabledToolsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  $$ConversationsTableOrderingComposer get conversationId {
    final $$ConversationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conversationId,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableOrderingComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConversationDisabledToolsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConversationDisabledToolsTable> {
  $$ConversationDisabledToolsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  $$ConversationsTableAnnotationComposer get conversationId {
    final $$ConversationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conversationId,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableAnnotationComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConversationDisabledToolsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConversationDisabledToolsTable,
          ConversationDisabledToolsTable,
          $$ConversationDisabledToolsTableFilterComposer,
          $$ConversationDisabledToolsTableOrderingComposer,
          $$ConversationDisabledToolsTableAnnotationComposer,
          $$ConversationDisabledToolsTableCreateCompanionBuilder,
          $$ConversationDisabledToolsTableUpdateCompanionBuilder,
          (
            ConversationDisabledToolsTable,
            $$ConversationDisabledToolsTableReferences,
          ),
          ConversationDisabledToolsTable,
          PrefetchHooks Function({bool conversationId})
        > {
  $$ConversationDisabledToolsTableTableManager(
    _$AppDatabase db,
    $ConversationDisabledToolsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConversationDisabledToolsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ConversationDisabledToolsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ConversationDisabledToolsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> conversationId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConversationDisabledToolsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                conversationId: conversationId,
                type: type,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String conversationId,
                required String type,
                Value<int> rowid = const Value.absent(),
              }) => ConversationDisabledToolsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                conversationId: conversationId,
                type: type,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ConversationDisabledToolsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({conversationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (conversationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.conversationId,
                                referencedTable:
                                    $$ConversationDisabledToolsTableReferences
                                        ._conversationIdTable(db),
                                referencedColumn:
                                    $$ConversationDisabledToolsTableReferences
                                        ._conversationIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ConversationDisabledToolsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConversationDisabledToolsTable,
      ConversationDisabledToolsTable,
      $$ConversationDisabledToolsTableFilterComposer,
      $$ConversationDisabledToolsTableOrderingComposer,
      $$ConversationDisabledToolsTableAnnotationComposer,
      $$ConversationDisabledToolsTableCreateCompanionBuilder,
      $$ConversationDisabledToolsTableUpdateCompanionBuilder,
      (
        ConversationDisabledToolsTable,
        $$ConversationDisabledToolsTableReferences,
      ),
      ConversationDisabledToolsTable,
      PrefetchHooks Function({bool conversationId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WorkspacesTableTableManager get workspaces =>
      $$WorkspacesTableTableManager(_db, _db.workspaces);
  $$ApiModelProvidersTableTableManager get apiModelProviders =>
      $$ApiModelProvidersTableTableManager(_db, _db.apiModelProviders);
  $$ApiModelsTableTableManager get apiModels =>
      $$ApiModelsTableTableManager(_db, _db.apiModels);
  $$CredentialsTableTableManager get credentials =>
      $$CredentialsTableTableManager(_db, _db.credentials);
  $$CredentialModelsTableTableManager get credentialModels =>
      $$CredentialModelsTableTableManager(_db, _db.credentialModels);
  $$ConversationsTableTableManager get conversations =>
      $$ConversationsTableTableManager(_db, _db.conversations);
  $$MessagesTableTableManager get messages =>
      $$MessagesTableTableManager(_db, _db.messages);
  $$WorkspaceToolsTableTableManager get workspaceTools =>
      $$WorkspaceToolsTableTableManager(_db, _db.workspaceTools);
  $$ConversationDisabledToolsTableTableManager get conversationDisabledTools =>
      $$ConversationDisabledToolsTableTableManager(
        _db,
        _db.conversationDisabledTools,
      );
}
