// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Student extends DataClass implements Insertable<Student> {
  final int id;
  final String name;
  final String address;
  final DateTime dob;
  final String phone;
  Student(
      {@required this.id,
      @required this.name,
      @required this.address,
      this.dob,
      @required this.phone});
  factory Student.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Student(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      dob: dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}dob']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
    );
  }
  factory Student.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      dob: serializer.fromJson<DateTime>(json['dob']),
      phone: serializer.fromJson<String>(json['phone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'dob': serializer.toJson<DateTime>(dob),
      'phone': serializer.toJson<String>(phone),
    };
  }

  @override
  StudentsCompanion createCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
    );
  }

  Student copyWith(
          {int id, String name, String address, DateTime dob, String phone}) =>
      Student(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        dob: dob ?? this.dob,
        phone: phone ?? this.phone,
      );
  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('dob: $dob, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(address.hashCode, $mrjc(dob.hashCode, phone.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.dob == this.dob &&
          other.phone == this.phone);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<DateTime> dob;
  final Value<String> phone;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.dob = const Value.absent(),
    this.phone = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String address,
    this.dob = const Value.absent(),
    @required String phone,
  })  : name = Value(name),
        address = Value(address),
        phone = Value(phone);
  StudentsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> address,
      Value<DateTime> dob,
      Value<String> phone}) {
    return StudentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      dob: dob ?? this.dob,
      phone: phone ?? this.phone,
    );
  }
}

class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  final GeneratedDatabase _db;
  final String _alias;
  $StudentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn('address', $tableName, false,
        minTextLength: 4, maxTextLength: 255);
  }

  final VerificationMeta _dobMeta = const VerificationMeta('dob');
  GeneratedDateTimeColumn _dob;
  @override
  GeneratedDateTimeColumn get dob => _dob ??= _constructDob();
  GeneratedDateTimeColumn _constructDob() {
    return GeneratedDateTimeColumn(
      'dob',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn('phone', $tableName, false,
        minTextLength: 5, maxTextLength: 12);
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, address, dob, phone];
  @override
  $StudentsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'students';
  @override
  final String actualTableName = 'students';
  @override
  VerificationContext validateIntegrity(StudentsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.address.present) {
      context.handle(_addressMeta,
          address.isAcceptableValue(d.address.value, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (d.dob.present) {
      context.handle(_dobMeta, dob.isAcceptableValue(d.dob.value, _dobMeta));
    }
    if (d.phone.present) {
      context.handle(
          _phoneMeta, phone.isAcceptableValue(d.phone.value, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Student.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(StudentsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.address.present) {
      map['address'] = Variable<String, StringType>(d.address.value);
    }
    if (d.dob.present) {
      map['dob'] = Variable<DateTime, DateTimeType>(d.dob.value);
    }
    if (d.phone.present) {
      map['phone'] = Variable<String, StringType>(d.phone.value);
    }
    return map;
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $StudentsTable _students;
  $StudentsTable get students => _students ??= $StudentsTable(this);
  StudentDao _studentDao;
  StudentDao get studentDao => _studentDao ??= StudentDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [students];
}
