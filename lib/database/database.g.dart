// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PlantsTable extends Plants with TableInfo<$PlantsTable, Plant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentPhaseMeta =
      const VerificationMeta('currentPhase');
  @override
  late final GeneratedColumnWithTypeConverter<PlantPhase, int> currentPhase =
      GeneratedColumn<int>('current_phase', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<PlantPhase>($PlantsTable.$convertercurrentPhase);
  static const VerificationMeta _phaseStartDateMeta =
      const VerificationMeta('phaseStartDate');
  @override
  late final GeneratedColumn<DateTime> phaseStartDate =
      GeneratedColumn<DateTime>('phase_start_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _waterVolumeLitersMeta =
      const VerificationMeta('waterVolumeLiters');
  @override
  late final GeneratedColumn<double> waterVolumeLiters =
      GeneratedColumn<double>('water_volume_liters', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _nutrientBrandMeta =
      const VerificationMeta('nutrientBrand');
  @override
  late final GeneratedColumnWithTypeConverter<NutrientBrand, int>
      nutrientBrand = GeneratedColumn<int>('nutrient_brand', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<NutrientBrand>($PlantsTable.$converternutrientBrand);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<PlantType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<PlantType>($PlantsTable.$convertertype);
  static const VerificationMeta _lampWattageMeta =
      const VerificationMeta('lampWattage');
  @override
  late final GeneratedColumn<int> lampWattage = GeneratedColumn<int>(
      'lamp_wattage', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lampTypeMeta =
      const VerificationMeta('lampType');
  @override
  late final GeneratedColumn<String> lampType = GeneratedColumn<String>(
      'lamp_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _plantsUnderLampMeta =
      const VerificationMeta('plantsUnderLamp');
  @override
  late final GeneratedColumn<int> plantsUnderLamp = GeneratedColumn<int>(
      'plants_under_lamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rootsReachedWaterMeta =
      const VerificationMeta('rootsReachedWater');
  @override
  late final GeneratedColumn<bool> rootsReachedWater = GeneratedColumn<bool>(
      'roots_reached_water', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("roots_reached_water" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _germinationStartedMeta =
      const VerificationMeta('germinationStarted');
  @override
  late final GeneratedColumn<bool> germinationStarted = GeneratedColumn<bool>(
      'germination_started', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("germination_started" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lastGerminationCheckMeta =
      const VerificationMeta('lastGerminationCheck');
  @override
  late final GeneratedColumn<DateTime> lastGerminationCheck =
      GeneratedColumn<DateTime>('last_germination_check', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        currentPhase,
        phaseStartDate,
        waterVolumeLiters,
        nutrientBrand,
        type,
        lampWattage,
        lampType,
        plantsUnderLamp,
        rootsReachedWater,
        germinationStarted,
        lastGerminationCheck
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plants';
  @override
  VerificationContext validateIntegrity(Insertable<Plant> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_currentPhaseMeta, const VerificationResult.success());
    if (data.containsKey('phase_start_date')) {
      context.handle(
          _phaseStartDateMeta,
          phaseStartDate.isAcceptableOrUnknown(
              data['phase_start_date']!, _phaseStartDateMeta));
    }
    if (data.containsKey('water_volume_liters')) {
      context.handle(
          _waterVolumeLitersMeta,
          waterVolumeLiters.isAcceptableOrUnknown(
              data['water_volume_liters']!, _waterVolumeLitersMeta));
    } else if (isInserting) {
      context.missing(_waterVolumeLitersMeta);
    }
    context.handle(_nutrientBrandMeta, const VerificationResult.success());
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('lamp_wattage')) {
      context.handle(
          _lampWattageMeta,
          lampWattage.isAcceptableOrUnknown(
              data['lamp_wattage']!, _lampWattageMeta));
    } else if (isInserting) {
      context.missing(_lampWattageMeta);
    }
    if (data.containsKey('lamp_type')) {
      context.handle(_lampTypeMeta,
          lampType.isAcceptableOrUnknown(data['lamp_type']!, _lampTypeMeta));
    } else if (isInserting) {
      context.missing(_lampTypeMeta);
    }
    if (data.containsKey('plants_under_lamp')) {
      context.handle(
          _plantsUnderLampMeta,
          plantsUnderLamp.isAcceptableOrUnknown(
              data['plants_under_lamp']!, _plantsUnderLampMeta));
    } else if (isInserting) {
      context.missing(_plantsUnderLampMeta);
    }
    if (data.containsKey('roots_reached_water')) {
      context.handle(
          _rootsReachedWaterMeta,
          rootsReachedWater.isAcceptableOrUnknown(
              data['roots_reached_water']!, _rootsReachedWaterMeta));
    }
    if (data.containsKey('germination_started')) {
      context.handle(
          _germinationStartedMeta,
          germinationStarted.isAcceptableOrUnknown(
              data['germination_started']!, _germinationStartedMeta));
    }
    if (data.containsKey('last_germination_check')) {
      context.handle(
          _lastGerminationCheckMeta,
          lastGerminationCheck.isAcceptableOrUnknown(
              data['last_germination_check']!, _lastGerminationCheckMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Plant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plant(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      currentPhase: $PlantsTable.$convertercurrentPhase.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_phase'])!),
      phaseStartDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}phase_start_date']),
      waterVolumeLiters: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}water_volume_liters'])!,
      nutrientBrand: $PlantsTable.$converternutrientBrand.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}nutrient_brand'])!),
      type: $PlantsTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      lampWattage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lamp_wattage'])!,
      lampType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lamp_type'])!,
      plantsUnderLamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plants_under_lamp'])!,
      rootsReachedWater: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}roots_reached_water'])!,
      germinationStarted: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}germination_started'])!,
      lastGerminationCheck: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_germination_check']),
    );
  }

  @override
  $PlantsTable createAlias(String alias) {
    return $PlantsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PlantPhase, int, int> $convertercurrentPhase =
      const EnumIndexConverter<PlantPhase>(PlantPhase.values);
  static JsonTypeConverter2<NutrientBrand, int, int> $converternutrientBrand =
      const EnumIndexConverter<NutrientBrand>(NutrientBrand.values);
  static JsonTypeConverter2<PlantType, int, int> $convertertype =
      const EnumIndexConverter<PlantType>(PlantType.values);
}

class Plant extends DataClass implements Insertable<Plant> {
  final int id;
  final String name;
  final PlantPhase currentPhase;
  final DateTime? phaseStartDate;
  final double waterVolumeLiters;
  final NutrientBrand nutrientBrand;
  final PlantType type;
  final int lampWattage;
  final String lampType;
  final int plantsUnderLamp;
  final bool rootsReachedWater;
  final bool germinationStarted;
  final DateTime? lastGerminationCheck;
  const Plant(
      {required this.id,
      required this.name,
      required this.currentPhase,
      this.phaseStartDate,
      required this.waterVolumeLiters,
      required this.nutrientBrand,
      required this.type,
      required this.lampWattage,
      required this.lampType,
      required this.plantsUnderLamp,
      required this.rootsReachedWater,
      required this.germinationStarted,
      this.lastGerminationCheck});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['current_phase'] = Variable<int>(
          $PlantsTable.$convertercurrentPhase.toSql(currentPhase));
    }
    if (!nullToAbsent || phaseStartDate != null) {
      map['phase_start_date'] = Variable<DateTime>(phaseStartDate);
    }
    map['water_volume_liters'] = Variable<double>(waterVolumeLiters);
    {
      map['nutrient_brand'] = Variable<int>(
          $PlantsTable.$converternutrientBrand.toSql(nutrientBrand));
    }
    {
      map['type'] = Variable<int>($PlantsTable.$convertertype.toSql(type));
    }
    map['lamp_wattage'] = Variable<int>(lampWattage);
    map['lamp_type'] = Variable<String>(lampType);
    map['plants_under_lamp'] = Variable<int>(plantsUnderLamp);
    map['roots_reached_water'] = Variable<bool>(rootsReachedWater);
    map['germination_started'] = Variable<bool>(germinationStarted);
    if (!nullToAbsent || lastGerminationCheck != null) {
      map['last_germination_check'] = Variable<DateTime>(lastGerminationCheck);
    }
    return map;
  }

  PlantsCompanion toCompanion(bool nullToAbsent) {
    return PlantsCompanion(
      id: Value(id),
      name: Value(name),
      currentPhase: Value(currentPhase),
      phaseStartDate: phaseStartDate == null && nullToAbsent
          ? const Value.absent()
          : Value(phaseStartDate),
      waterVolumeLiters: Value(waterVolumeLiters),
      nutrientBrand: Value(nutrientBrand),
      type: Value(type),
      lampWattage: Value(lampWattage),
      lampType: Value(lampType),
      plantsUnderLamp: Value(plantsUnderLamp),
      rootsReachedWater: Value(rootsReachedWater),
      germinationStarted: Value(germinationStarted),
      lastGerminationCheck: lastGerminationCheck == null && nullToAbsent
          ? const Value.absent()
          : Value(lastGerminationCheck),
    );
  }

  factory Plant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plant(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      currentPhase: $PlantsTable.$convertercurrentPhase
          .fromJson(serializer.fromJson<int>(json['currentPhase'])),
      phaseStartDate: serializer.fromJson<DateTime?>(json['phaseStartDate']),
      waterVolumeLiters: serializer.fromJson<double>(json['waterVolumeLiters']),
      nutrientBrand: $PlantsTable.$converternutrientBrand
          .fromJson(serializer.fromJson<int>(json['nutrientBrand'])),
      type: $PlantsTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      lampWattage: serializer.fromJson<int>(json['lampWattage']),
      lampType: serializer.fromJson<String>(json['lampType']),
      plantsUnderLamp: serializer.fromJson<int>(json['plantsUnderLamp']),
      rootsReachedWater: serializer.fromJson<bool>(json['rootsReachedWater']),
      germinationStarted: serializer.fromJson<bool>(json['germinationStarted']),
      lastGerminationCheck:
          serializer.fromJson<DateTime?>(json['lastGerminationCheck']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'currentPhase': serializer.toJson<int>(
          $PlantsTable.$convertercurrentPhase.toJson(currentPhase)),
      'phaseStartDate': serializer.toJson<DateTime?>(phaseStartDate),
      'waterVolumeLiters': serializer.toJson<double>(waterVolumeLiters),
      'nutrientBrand': serializer.toJson<int>(
          $PlantsTable.$converternutrientBrand.toJson(nutrientBrand)),
      'type': serializer.toJson<int>($PlantsTable.$convertertype.toJson(type)),
      'lampWattage': serializer.toJson<int>(lampWattage),
      'lampType': serializer.toJson<String>(lampType),
      'plantsUnderLamp': serializer.toJson<int>(plantsUnderLamp),
      'rootsReachedWater': serializer.toJson<bool>(rootsReachedWater),
      'germinationStarted': serializer.toJson<bool>(germinationStarted),
      'lastGerminationCheck':
          serializer.toJson<DateTime?>(lastGerminationCheck),
    };
  }

  Plant copyWith(
          {int? id,
          String? name,
          PlantPhase? currentPhase,
          Value<DateTime?> phaseStartDate = const Value.absent(),
          double? waterVolumeLiters,
          NutrientBrand? nutrientBrand,
          PlantType? type,
          int? lampWattage,
          String? lampType,
          int? plantsUnderLamp,
          bool? rootsReachedWater,
          bool? germinationStarted,
          Value<DateTime?> lastGerminationCheck = const Value.absent()}) =>
      Plant(
        id: id ?? this.id,
        name: name ?? this.name,
        currentPhase: currentPhase ?? this.currentPhase,
        phaseStartDate:
            phaseStartDate.present ? phaseStartDate.value : this.phaseStartDate,
        waterVolumeLiters: waterVolumeLiters ?? this.waterVolumeLiters,
        nutrientBrand: nutrientBrand ?? this.nutrientBrand,
        type: type ?? this.type,
        lampWattage: lampWattage ?? this.lampWattage,
        lampType: lampType ?? this.lampType,
        plantsUnderLamp: plantsUnderLamp ?? this.plantsUnderLamp,
        rootsReachedWater: rootsReachedWater ?? this.rootsReachedWater,
        germinationStarted: germinationStarted ?? this.germinationStarted,
        lastGerminationCheck: lastGerminationCheck.present
            ? lastGerminationCheck.value
            : this.lastGerminationCheck,
      );
  Plant copyWithCompanion(PlantsCompanion data) {
    return Plant(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      currentPhase: data.currentPhase.present
          ? data.currentPhase.value
          : this.currentPhase,
      phaseStartDate: data.phaseStartDate.present
          ? data.phaseStartDate.value
          : this.phaseStartDate,
      waterVolumeLiters: data.waterVolumeLiters.present
          ? data.waterVolumeLiters.value
          : this.waterVolumeLiters,
      nutrientBrand: data.nutrientBrand.present
          ? data.nutrientBrand.value
          : this.nutrientBrand,
      type: data.type.present ? data.type.value : this.type,
      lampWattage:
          data.lampWattage.present ? data.lampWattage.value : this.lampWattage,
      lampType: data.lampType.present ? data.lampType.value : this.lampType,
      plantsUnderLamp: data.plantsUnderLamp.present
          ? data.plantsUnderLamp.value
          : this.plantsUnderLamp,
      rootsReachedWater: data.rootsReachedWater.present
          ? data.rootsReachedWater.value
          : this.rootsReachedWater,
      germinationStarted: data.germinationStarted.present
          ? data.germinationStarted.value
          : this.germinationStarted,
      lastGerminationCheck: data.lastGerminationCheck.present
          ? data.lastGerminationCheck.value
          : this.lastGerminationCheck,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Plant(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currentPhase: $currentPhase, ')
          ..write('phaseStartDate: $phaseStartDate, ')
          ..write('waterVolumeLiters: $waterVolumeLiters, ')
          ..write('nutrientBrand: $nutrientBrand, ')
          ..write('type: $type, ')
          ..write('lampWattage: $lampWattage, ')
          ..write('lampType: $lampType, ')
          ..write('plantsUnderLamp: $plantsUnderLamp, ')
          ..write('rootsReachedWater: $rootsReachedWater, ')
          ..write('germinationStarted: $germinationStarted, ')
          ..write('lastGerminationCheck: $lastGerminationCheck')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      currentPhase,
      phaseStartDate,
      waterVolumeLiters,
      nutrientBrand,
      type,
      lampWattage,
      lampType,
      plantsUnderLamp,
      rootsReachedWater,
      germinationStarted,
      lastGerminationCheck);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plant &&
          other.id == this.id &&
          other.name == this.name &&
          other.currentPhase == this.currentPhase &&
          other.phaseStartDate == this.phaseStartDate &&
          other.waterVolumeLiters == this.waterVolumeLiters &&
          other.nutrientBrand == this.nutrientBrand &&
          other.type == this.type &&
          other.lampWattage == this.lampWattage &&
          other.lampType == this.lampType &&
          other.plantsUnderLamp == this.plantsUnderLamp &&
          other.rootsReachedWater == this.rootsReachedWater &&
          other.germinationStarted == this.germinationStarted &&
          other.lastGerminationCheck == this.lastGerminationCheck);
}

class PlantsCompanion extends UpdateCompanion<Plant> {
  final Value<int> id;
  final Value<String> name;
  final Value<PlantPhase> currentPhase;
  final Value<DateTime?> phaseStartDate;
  final Value<double> waterVolumeLiters;
  final Value<NutrientBrand> nutrientBrand;
  final Value<PlantType> type;
  final Value<int> lampWattage;
  final Value<String> lampType;
  final Value<int> plantsUnderLamp;
  final Value<bool> rootsReachedWater;
  final Value<bool> germinationStarted;
  final Value<DateTime?> lastGerminationCheck;
  const PlantsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.currentPhase = const Value.absent(),
    this.phaseStartDate = const Value.absent(),
    this.waterVolumeLiters = const Value.absent(),
    this.nutrientBrand = const Value.absent(),
    this.type = const Value.absent(),
    this.lampWattage = const Value.absent(),
    this.lampType = const Value.absent(),
    this.plantsUnderLamp = const Value.absent(),
    this.rootsReachedWater = const Value.absent(),
    this.germinationStarted = const Value.absent(),
    this.lastGerminationCheck = const Value.absent(),
  });
  PlantsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required PlantPhase currentPhase,
    this.phaseStartDate = const Value.absent(),
    required double waterVolumeLiters,
    required NutrientBrand nutrientBrand,
    required PlantType type,
    required int lampWattage,
    required String lampType,
    required int plantsUnderLamp,
    this.rootsReachedWater = const Value.absent(),
    this.germinationStarted = const Value.absent(),
    this.lastGerminationCheck = const Value.absent(),
  })  : name = Value(name),
        currentPhase = Value(currentPhase),
        waterVolumeLiters = Value(waterVolumeLiters),
        nutrientBrand = Value(nutrientBrand),
        type = Value(type),
        lampWattage = Value(lampWattage),
        lampType = Value(lampType),
        plantsUnderLamp = Value(plantsUnderLamp);
  static Insertable<Plant> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? currentPhase,
    Expression<DateTime>? phaseStartDate,
    Expression<double>? waterVolumeLiters,
    Expression<int>? nutrientBrand,
    Expression<int>? type,
    Expression<int>? lampWattage,
    Expression<String>? lampType,
    Expression<int>? plantsUnderLamp,
    Expression<bool>? rootsReachedWater,
    Expression<bool>? germinationStarted,
    Expression<DateTime>? lastGerminationCheck,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (currentPhase != null) 'current_phase': currentPhase,
      if (phaseStartDate != null) 'phase_start_date': phaseStartDate,
      if (waterVolumeLiters != null) 'water_volume_liters': waterVolumeLiters,
      if (nutrientBrand != null) 'nutrient_brand': nutrientBrand,
      if (type != null) 'type': type,
      if (lampWattage != null) 'lamp_wattage': lampWattage,
      if (lampType != null) 'lamp_type': lampType,
      if (plantsUnderLamp != null) 'plants_under_lamp': plantsUnderLamp,
      if (rootsReachedWater != null) 'roots_reached_water': rootsReachedWater,
      if (germinationStarted != null) 'germination_started': germinationStarted,
      if (lastGerminationCheck != null)
        'last_germination_check': lastGerminationCheck,
    });
  }

  PlantsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<PlantPhase>? currentPhase,
      Value<DateTime?>? phaseStartDate,
      Value<double>? waterVolumeLiters,
      Value<NutrientBrand>? nutrientBrand,
      Value<PlantType>? type,
      Value<int>? lampWattage,
      Value<String>? lampType,
      Value<int>? plantsUnderLamp,
      Value<bool>? rootsReachedWater,
      Value<bool>? germinationStarted,
      Value<DateTime?>? lastGerminationCheck}) {
    return PlantsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      currentPhase: currentPhase ?? this.currentPhase,
      phaseStartDate: phaseStartDate ?? this.phaseStartDate,
      waterVolumeLiters: waterVolumeLiters ?? this.waterVolumeLiters,
      nutrientBrand: nutrientBrand ?? this.nutrientBrand,
      type: type ?? this.type,
      lampWattage: lampWattage ?? this.lampWattage,
      lampType: lampType ?? this.lampType,
      plantsUnderLamp: plantsUnderLamp ?? this.plantsUnderLamp,
      rootsReachedWater: rootsReachedWater ?? this.rootsReachedWater,
      germinationStarted: germinationStarted ?? this.germinationStarted,
      lastGerminationCheck: lastGerminationCheck ?? this.lastGerminationCheck,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (currentPhase.present) {
      map['current_phase'] = Variable<int>(
          $PlantsTable.$convertercurrentPhase.toSql(currentPhase.value));
    }
    if (phaseStartDate.present) {
      map['phase_start_date'] = Variable<DateTime>(phaseStartDate.value);
    }
    if (waterVolumeLiters.present) {
      map['water_volume_liters'] = Variable<double>(waterVolumeLiters.value);
    }
    if (nutrientBrand.present) {
      map['nutrient_brand'] = Variable<int>(
          $PlantsTable.$converternutrientBrand.toSql(nutrientBrand.value));
    }
    if (type.present) {
      map['type'] =
          Variable<int>($PlantsTable.$convertertype.toSql(type.value));
    }
    if (lampWattage.present) {
      map['lamp_wattage'] = Variable<int>(lampWattage.value);
    }
    if (lampType.present) {
      map['lamp_type'] = Variable<String>(lampType.value);
    }
    if (plantsUnderLamp.present) {
      map['plants_under_lamp'] = Variable<int>(plantsUnderLamp.value);
    }
    if (rootsReachedWater.present) {
      map['roots_reached_water'] = Variable<bool>(rootsReachedWater.value);
    }
    if (germinationStarted.present) {
      map['germination_started'] = Variable<bool>(germinationStarted.value);
    }
    if (lastGerminationCheck.present) {
      map['last_germination_check'] =
          Variable<DateTime>(lastGerminationCheck.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlantsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currentPhase: $currentPhase, ')
          ..write('phaseStartDate: $phaseStartDate, ')
          ..write('waterVolumeLiters: $waterVolumeLiters, ')
          ..write('nutrientBrand: $nutrientBrand, ')
          ..write('type: $type, ')
          ..write('lampWattage: $lampWattage, ')
          ..write('lampType: $lampType, ')
          ..write('plantsUnderLamp: $plantsUnderLamp, ')
          ..write('rootsReachedWater: $rootsReachedWater, ')
          ..write('germinationStarted: $germinationStarted, ')
          ..write('lastGerminationCheck: $lastGerminationCheck')
          ..write(')'))
        .toString();
  }
}

class $LogEntriesTable extends LogEntries
    with TableInfo<$LogEntriesTable, LogEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _plantIdMeta =
      const VerificationMeta('plantId');
  @override
  late final GeneratedColumn<int> plantId = GeneratedColumn<int>(
      'plant_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES plants (id)'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _phMeta = const VerificationMeta('ph');
  @override
  late final GeneratedColumn<double> ph = GeneratedColumn<double>(
      'ph', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _ecMeta = const VerificationMeta('ec');
  @override
  late final GeneratedColumn<double> ec = GeneratedColumn<double>(
      'ec', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _ppfdMeta = const VerificationMeta('ppfd');
  @override
  late final GeneratedColumn<double> ppfd = GeneratedColumn<double>(
      'ppfd', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _waterAddedMeta =
      const VerificationMeta('waterAdded');
  @override
  late final GeneratedColumn<double> waterAdded = GeneratedColumn<double>(
      'water_added', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isWaterChangeMeta =
      const VerificationMeta('isWaterChange');
  @override
  late final GeneratedColumn<bool> isWaterChange = GeneratedColumn<bool>(
      'is_water_change', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_water_change" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, plantId, timestamp, ph, ec, ppfd, waterAdded, isWaterChange];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'log_entries';
  @override
  VerificationContext validateIntegrity(Insertable<LogEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('plant_id')) {
      context.handle(_plantIdMeta,
          plantId.isAcceptableOrUnknown(data['plant_id']!, _plantIdMeta));
    } else if (isInserting) {
      context.missing(_plantIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('ph')) {
      context.handle(_phMeta, ph.isAcceptableOrUnknown(data['ph']!, _phMeta));
    }
    if (data.containsKey('ec')) {
      context.handle(_ecMeta, ec.isAcceptableOrUnknown(data['ec']!, _ecMeta));
    }
    if (data.containsKey('ppfd')) {
      context.handle(
          _ppfdMeta, ppfd.isAcceptableOrUnknown(data['ppfd']!, _ppfdMeta));
    }
    if (data.containsKey('water_added')) {
      context.handle(
          _waterAddedMeta,
          waterAdded.isAcceptableOrUnknown(
              data['water_added']!, _waterAddedMeta));
    }
    if (data.containsKey('is_water_change')) {
      context.handle(
          _isWaterChangeMeta,
          isWaterChange.isAcceptableOrUnknown(
              data['is_water_change']!, _isWaterChangeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LogEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      plantId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plant_id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      ph: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ph']),
      ec: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ec']),
      ppfd: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ppfd']),
      waterAdded: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}water_added']),
      isWaterChange: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_water_change'])!,
    );
  }

  @override
  $LogEntriesTable createAlias(String alias) {
    return $LogEntriesTable(attachedDatabase, alias);
  }
}

class LogEntry extends DataClass implements Insertable<LogEntry> {
  final int id;
  final int plantId;
  final DateTime timestamp;
  final double? ph;
  final double? ec;
  final double? ppfd;
  final double? waterAdded;
  final bool isWaterChange;
  const LogEntry(
      {required this.id,
      required this.plantId,
      required this.timestamp,
      this.ph,
      this.ec,
      this.ppfd,
      this.waterAdded,
      required this.isWaterChange});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['plant_id'] = Variable<int>(plantId);
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || ph != null) {
      map['ph'] = Variable<double>(ph);
    }
    if (!nullToAbsent || ec != null) {
      map['ec'] = Variable<double>(ec);
    }
    if (!nullToAbsent || ppfd != null) {
      map['ppfd'] = Variable<double>(ppfd);
    }
    if (!nullToAbsent || waterAdded != null) {
      map['water_added'] = Variable<double>(waterAdded);
    }
    map['is_water_change'] = Variable<bool>(isWaterChange);
    return map;
  }

  LogEntriesCompanion toCompanion(bool nullToAbsent) {
    return LogEntriesCompanion(
      id: Value(id),
      plantId: Value(plantId),
      timestamp: Value(timestamp),
      ph: ph == null && nullToAbsent ? const Value.absent() : Value(ph),
      ec: ec == null && nullToAbsent ? const Value.absent() : Value(ec),
      ppfd: ppfd == null && nullToAbsent ? const Value.absent() : Value(ppfd),
      waterAdded: waterAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(waterAdded),
      isWaterChange: Value(isWaterChange),
    );
  }

  factory LogEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LogEntry(
      id: serializer.fromJson<int>(json['id']),
      plantId: serializer.fromJson<int>(json['plantId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      ph: serializer.fromJson<double?>(json['ph']),
      ec: serializer.fromJson<double?>(json['ec']),
      ppfd: serializer.fromJson<double?>(json['ppfd']),
      waterAdded: serializer.fromJson<double?>(json['waterAdded']),
      isWaterChange: serializer.fromJson<bool>(json['isWaterChange']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'plantId': serializer.toJson<int>(plantId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'ph': serializer.toJson<double?>(ph),
      'ec': serializer.toJson<double?>(ec),
      'ppfd': serializer.toJson<double?>(ppfd),
      'waterAdded': serializer.toJson<double?>(waterAdded),
      'isWaterChange': serializer.toJson<bool>(isWaterChange),
    };
  }

  LogEntry copyWith(
          {int? id,
          int? plantId,
          DateTime? timestamp,
          Value<double?> ph = const Value.absent(),
          Value<double?> ec = const Value.absent(),
          Value<double?> ppfd = const Value.absent(),
          Value<double?> waterAdded = const Value.absent(),
          bool? isWaterChange}) =>
      LogEntry(
        id: id ?? this.id,
        plantId: plantId ?? this.plantId,
        timestamp: timestamp ?? this.timestamp,
        ph: ph.present ? ph.value : this.ph,
        ec: ec.present ? ec.value : this.ec,
        ppfd: ppfd.present ? ppfd.value : this.ppfd,
        waterAdded: waterAdded.present ? waterAdded.value : this.waterAdded,
        isWaterChange: isWaterChange ?? this.isWaterChange,
      );
  LogEntry copyWithCompanion(LogEntriesCompanion data) {
    return LogEntry(
      id: data.id.present ? data.id.value : this.id,
      plantId: data.plantId.present ? data.plantId.value : this.plantId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      ph: data.ph.present ? data.ph.value : this.ph,
      ec: data.ec.present ? data.ec.value : this.ec,
      ppfd: data.ppfd.present ? data.ppfd.value : this.ppfd,
      waterAdded:
          data.waterAdded.present ? data.waterAdded.value : this.waterAdded,
      isWaterChange: data.isWaterChange.present
          ? data.isWaterChange.value
          : this.isWaterChange,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LogEntry(')
          ..write('id: $id, ')
          ..write('plantId: $plantId, ')
          ..write('timestamp: $timestamp, ')
          ..write('ph: $ph, ')
          ..write('ec: $ec, ')
          ..write('ppfd: $ppfd, ')
          ..write('waterAdded: $waterAdded, ')
          ..write('isWaterChange: $isWaterChange')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, plantId, timestamp, ph, ec, ppfd, waterAdded, isWaterChange);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogEntry &&
          other.id == this.id &&
          other.plantId == this.plantId &&
          other.timestamp == this.timestamp &&
          other.ph == this.ph &&
          other.ec == this.ec &&
          other.ppfd == this.ppfd &&
          other.waterAdded == this.waterAdded &&
          other.isWaterChange == this.isWaterChange);
}

class LogEntriesCompanion extends UpdateCompanion<LogEntry> {
  final Value<int> id;
  final Value<int> plantId;
  final Value<DateTime> timestamp;
  final Value<double?> ph;
  final Value<double?> ec;
  final Value<double?> ppfd;
  final Value<double?> waterAdded;
  final Value<bool> isWaterChange;
  const LogEntriesCompanion({
    this.id = const Value.absent(),
    this.plantId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.ph = const Value.absent(),
    this.ec = const Value.absent(),
    this.ppfd = const Value.absent(),
    this.waterAdded = const Value.absent(),
    this.isWaterChange = const Value.absent(),
  });
  LogEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int plantId,
    required DateTime timestamp,
    this.ph = const Value.absent(),
    this.ec = const Value.absent(),
    this.ppfd = const Value.absent(),
    this.waterAdded = const Value.absent(),
    this.isWaterChange = const Value.absent(),
  })  : plantId = Value(plantId),
        timestamp = Value(timestamp);
  static Insertable<LogEntry> custom({
    Expression<int>? id,
    Expression<int>? plantId,
    Expression<DateTime>? timestamp,
    Expression<double>? ph,
    Expression<double>? ec,
    Expression<double>? ppfd,
    Expression<double>? waterAdded,
    Expression<bool>? isWaterChange,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (plantId != null) 'plant_id': plantId,
      if (timestamp != null) 'timestamp': timestamp,
      if (ph != null) 'ph': ph,
      if (ec != null) 'ec': ec,
      if (ppfd != null) 'ppfd': ppfd,
      if (waterAdded != null) 'water_added': waterAdded,
      if (isWaterChange != null) 'is_water_change': isWaterChange,
    });
  }

  LogEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? plantId,
      Value<DateTime>? timestamp,
      Value<double?>? ph,
      Value<double?>? ec,
      Value<double?>? ppfd,
      Value<double?>? waterAdded,
      Value<bool>? isWaterChange}) {
    return LogEntriesCompanion(
      id: id ?? this.id,
      plantId: plantId ?? this.plantId,
      timestamp: timestamp ?? this.timestamp,
      ph: ph ?? this.ph,
      ec: ec ?? this.ec,
      ppfd: ppfd ?? this.ppfd,
      waterAdded: waterAdded ?? this.waterAdded,
      isWaterChange: isWaterChange ?? this.isWaterChange,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (plantId.present) {
      map['plant_id'] = Variable<int>(plantId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (ph.present) {
      map['ph'] = Variable<double>(ph.value);
    }
    if (ec.present) {
      map['ec'] = Variable<double>(ec.value);
    }
    if (ppfd.present) {
      map['ppfd'] = Variable<double>(ppfd.value);
    }
    if (waterAdded.present) {
      map['water_added'] = Variable<double>(waterAdded.value);
    }
    if (isWaterChange.present) {
      map['is_water_change'] = Variable<bool>(isWaterChange.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogEntriesCompanion(')
          ..write('id: $id, ')
          ..write('plantId: $plantId, ')
          ..write('timestamp: $timestamp, ')
          ..write('ph: $ph, ')
          ..write('ec: $ec, ')
          ..write('ppfd: $ppfd, ')
          ..write('waterAdded: $waterAdded, ')
          ..write('isWaterChange: $isWaterChange')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTableTable extends AppSettingsTable
    with TableInfo<$AppSettingsTableTable, AppSettings> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _hasCompletedOnboardingMeta =
      const VerificationMeta('hasCompletedOnboarding');
  @override
  late final GeneratedColumn<bool> hasCompletedOnboarding =
      GeneratedColumn<bool>('has_completed_onboarding', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("has_completed_onboarding" IN (0, 1))'),
          defaultValue: const Constant(false));
  static const VerificationMeta _hasCompletedTentSetupMeta =
      const VerificationMeta('hasCompletedTentSetup');
  @override
  late final GeneratedColumn<bool> hasCompletedTentSetup =
      GeneratedColumn<bool>('has_completed_tent_setup', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("has_completed_tent_setup" IN (0, 1))'),
          defaultValue: const Constant(false));
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
      'theme', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('system'));
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _volumeUnitMeta =
      const VerificationMeta('volumeUnit');
  @override
  late final GeneratedColumn<String> volumeUnit = GeneratedColumn<String>(
      'volume_unit', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('l'));
  static const VerificationMeta _temperatureUnitMeta =
      const VerificationMeta('temperatureUnit');
  @override
  late final GeneratedColumn<String> temperatureUnit = GeneratedColumn<String>(
      'temperature_unit', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('c'));
  static const VerificationMeta _conductivityUnitMeta =
      const VerificationMeta('conductivityUnit');
  @override
  late final GeneratedColumn<String> conductivityUnit = GeneratedColumn<String>(
      'conductivity_unit', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('ec'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        hasCompletedOnboarding,
        hasCompletedTentSetup,
        theme,
        language,
        volumeUnit,
        temperatureUnit,
        conductivityUnit
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings_table';
  @override
  VerificationContext validateIntegrity(Insertable<AppSettings> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('has_completed_onboarding')) {
      context.handle(
          _hasCompletedOnboardingMeta,
          hasCompletedOnboarding.isAcceptableOrUnknown(
              data['has_completed_onboarding']!, _hasCompletedOnboardingMeta));
    }
    if (data.containsKey('has_completed_tent_setup')) {
      context.handle(
          _hasCompletedTentSetupMeta,
          hasCompletedTentSetup.isAcceptableOrUnknown(
              data['has_completed_tent_setup']!, _hasCompletedTentSetupMeta));
    }
    if (data.containsKey('theme')) {
      context.handle(
          _themeMeta, theme.isAcceptableOrUnknown(data['theme']!, _themeMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('volume_unit')) {
      context.handle(
          _volumeUnitMeta,
          volumeUnit.isAcceptableOrUnknown(
              data['volume_unit']!, _volumeUnitMeta));
    }
    if (data.containsKey('temperature_unit')) {
      context.handle(
          _temperatureUnitMeta,
          temperatureUnit.isAcceptableOrUnknown(
              data['temperature_unit']!, _temperatureUnitMeta));
    }
    if (data.containsKey('conductivity_unit')) {
      context.handle(
          _conductivityUnitMeta,
          conductivityUnit.isAcceptableOrUnknown(
              data['conductivity_unit']!, _conductivityUnitMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSettings map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettings(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hasCompletedOnboarding: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}has_completed_onboarding'])!,
      hasCompletedTentSetup: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}has_completed_tent_setup'])!,
      theme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      volumeUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}volume_unit'])!,
      temperatureUnit: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}temperature_unit'])!,
      conductivityUnit: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}conductivity_unit'])!,
    );
  }

  @override
  $AppSettingsTableTable createAlias(String alias) {
    return $AppSettingsTableTable(attachedDatabase, alias);
  }
}

class AppSettings extends DataClass implements Insertable<AppSettings> {
  final int id;
  final bool hasCompletedOnboarding;
  final bool hasCompletedTentSetup;
  final String theme;
  final String? language;
  final String volumeUnit;
  final String temperatureUnit;
  final String conductivityUnit;
  const AppSettings(
      {required this.id,
      required this.hasCompletedOnboarding,
      required this.hasCompletedTentSetup,
      required this.theme,
      this.language,
      required this.volumeUnit,
      required this.temperatureUnit,
      required this.conductivityUnit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['has_completed_onboarding'] = Variable<bool>(hasCompletedOnboarding);
    map['has_completed_tent_setup'] = Variable<bool>(hasCompletedTentSetup);
    map['theme'] = Variable<String>(theme);
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    map['volume_unit'] = Variable<String>(volumeUnit);
    map['temperature_unit'] = Variable<String>(temperatureUnit);
    map['conductivity_unit'] = Variable<String>(conductivityUnit);
    return map;
  }

  AppSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsTableCompanion(
      id: Value(id),
      hasCompletedOnboarding: Value(hasCompletedOnboarding),
      hasCompletedTentSetup: Value(hasCompletedTentSetup),
      theme: Value(theme),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      volumeUnit: Value(volumeUnit),
      temperatureUnit: Value(temperatureUnit),
      conductivityUnit: Value(conductivityUnit),
    );
  }

  factory AppSettings.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettings(
      id: serializer.fromJson<int>(json['id']),
      hasCompletedOnboarding:
          serializer.fromJson<bool>(json['hasCompletedOnboarding']),
      hasCompletedTentSetup:
          serializer.fromJson<bool>(json['hasCompletedTentSetup']),
      theme: serializer.fromJson<String>(json['theme']),
      language: serializer.fromJson<String?>(json['language']),
      volumeUnit: serializer.fromJson<String>(json['volumeUnit']),
      temperatureUnit: serializer.fromJson<String>(json['temperatureUnit']),
      conductivityUnit: serializer.fromJson<String>(json['conductivityUnit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hasCompletedOnboarding': serializer.toJson<bool>(hasCompletedOnboarding),
      'hasCompletedTentSetup': serializer.toJson<bool>(hasCompletedTentSetup),
      'theme': serializer.toJson<String>(theme),
      'language': serializer.toJson<String?>(language),
      'volumeUnit': serializer.toJson<String>(volumeUnit),
      'temperatureUnit': serializer.toJson<String>(temperatureUnit),
      'conductivityUnit': serializer.toJson<String>(conductivityUnit),
    };
  }

  AppSettings copyWith(
          {int? id,
          bool? hasCompletedOnboarding,
          bool? hasCompletedTentSetup,
          String? theme,
          Value<String?> language = const Value.absent(),
          String? volumeUnit,
          String? temperatureUnit,
          String? conductivityUnit}) =>
      AppSettings(
        id: id ?? this.id,
        hasCompletedOnboarding:
            hasCompletedOnboarding ?? this.hasCompletedOnboarding,
        hasCompletedTentSetup:
            hasCompletedTentSetup ?? this.hasCompletedTentSetup,
        theme: theme ?? this.theme,
        language: language.present ? language.value : this.language,
        volumeUnit: volumeUnit ?? this.volumeUnit,
        temperatureUnit: temperatureUnit ?? this.temperatureUnit,
        conductivityUnit: conductivityUnit ?? this.conductivityUnit,
      );
  AppSettings copyWithCompanion(AppSettingsTableCompanion data) {
    return AppSettings(
      id: data.id.present ? data.id.value : this.id,
      hasCompletedOnboarding: data.hasCompletedOnboarding.present
          ? data.hasCompletedOnboarding.value
          : this.hasCompletedOnboarding,
      hasCompletedTentSetup: data.hasCompletedTentSetup.present
          ? data.hasCompletedTentSetup.value
          : this.hasCompletedTentSetup,
      theme: data.theme.present ? data.theme.value : this.theme,
      language: data.language.present ? data.language.value : this.language,
      volumeUnit:
          data.volumeUnit.present ? data.volumeUnit.value : this.volumeUnit,
      temperatureUnit: data.temperatureUnit.present
          ? data.temperatureUnit.value
          : this.temperatureUnit,
      conductivityUnit: data.conductivityUnit.present
          ? data.conductivityUnit.value
          : this.conductivityUnit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettings(')
          ..write('id: $id, ')
          ..write('hasCompletedOnboarding: $hasCompletedOnboarding, ')
          ..write('hasCompletedTentSetup: $hasCompletedTentSetup, ')
          ..write('theme: $theme, ')
          ..write('language: $language, ')
          ..write('volumeUnit: $volumeUnit, ')
          ..write('temperatureUnit: $temperatureUnit, ')
          ..write('conductivityUnit: $conductivityUnit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      hasCompletedOnboarding,
      hasCompletedTentSetup,
      theme,
      language,
      volumeUnit,
      temperatureUnit,
      conductivityUnit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettings &&
          other.id == this.id &&
          other.hasCompletedOnboarding == this.hasCompletedOnboarding &&
          other.hasCompletedTentSetup == this.hasCompletedTentSetup &&
          other.theme == this.theme &&
          other.language == this.language &&
          other.volumeUnit == this.volumeUnit &&
          other.temperatureUnit == this.temperatureUnit &&
          other.conductivityUnit == this.conductivityUnit);
}

class AppSettingsTableCompanion extends UpdateCompanion<AppSettings> {
  final Value<int> id;
  final Value<bool> hasCompletedOnboarding;
  final Value<bool> hasCompletedTentSetup;
  final Value<String> theme;
  final Value<String?> language;
  final Value<String> volumeUnit;
  final Value<String> temperatureUnit;
  final Value<String> conductivityUnit;
  const AppSettingsTableCompanion({
    this.id = const Value.absent(),
    this.hasCompletedOnboarding = const Value.absent(),
    this.hasCompletedTentSetup = const Value.absent(),
    this.theme = const Value.absent(),
    this.language = const Value.absent(),
    this.volumeUnit = const Value.absent(),
    this.temperatureUnit = const Value.absent(),
    this.conductivityUnit = const Value.absent(),
  });
  AppSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.hasCompletedOnboarding = const Value.absent(),
    this.hasCompletedTentSetup = const Value.absent(),
    this.theme = const Value.absent(),
    this.language = const Value.absent(),
    this.volumeUnit = const Value.absent(),
    this.temperatureUnit = const Value.absent(),
    this.conductivityUnit = const Value.absent(),
  });
  static Insertable<AppSettings> custom({
    Expression<int>? id,
    Expression<bool>? hasCompletedOnboarding,
    Expression<bool>? hasCompletedTentSetup,
    Expression<String>? theme,
    Expression<String>? language,
    Expression<String>? volumeUnit,
    Expression<String>? temperatureUnit,
    Expression<String>? conductivityUnit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hasCompletedOnboarding != null)
        'has_completed_onboarding': hasCompletedOnboarding,
      if (hasCompletedTentSetup != null)
        'has_completed_tent_setup': hasCompletedTentSetup,
      if (theme != null) 'theme': theme,
      if (language != null) 'language': language,
      if (volumeUnit != null) 'volume_unit': volumeUnit,
      if (temperatureUnit != null) 'temperature_unit': temperatureUnit,
      if (conductivityUnit != null) 'conductivity_unit': conductivityUnit,
    });
  }

  AppSettingsTableCompanion copyWith(
      {Value<int>? id,
      Value<bool>? hasCompletedOnboarding,
      Value<bool>? hasCompletedTentSetup,
      Value<String>? theme,
      Value<String?>? language,
      Value<String>? volumeUnit,
      Value<String>? temperatureUnit,
      Value<String>? conductivityUnit}) {
    return AppSettingsTableCompanion(
      id: id ?? this.id,
      hasCompletedOnboarding:
          hasCompletedOnboarding ?? this.hasCompletedOnboarding,
      hasCompletedTentSetup:
          hasCompletedTentSetup ?? this.hasCompletedTentSetup,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      volumeUnit: volumeUnit ?? this.volumeUnit,
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
      conductivityUnit: conductivityUnit ?? this.conductivityUnit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hasCompletedOnboarding.present) {
      map['has_completed_onboarding'] =
          Variable<bool>(hasCompletedOnboarding.value);
    }
    if (hasCompletedTentSetup.present) {
      map['has_completed_tent_setup'] =
          Variable<bool>(hasCompletedTentSetup.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (volumeUnit.present) {
      map['volume_unit'] = Variable<String>(volumeUnit.value);
    }
    if (temperatureUnit.present) {
      map['temperature_unit'] = Variable<String>(temperatureUnit.value);
    }
    if (conductivityUnit.present) {
      map['conductivity_unit'] = Variable<String>(conductivityUnit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('hasCompletedOnboarding: $hasCompletedOnboarding, ')
          ..write('hasCompletedTentSetup: $hasCompletedTentSetup, ')
          ..write('theme: $theme, ')
          ..write('language: $language, ')
          ..write('volumeUnit: $volumeUnit, ')
          ..write('temperatureUnit: $temperatureUnit, ')
          ..write('conductivityUnit: $conductivityUnit')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlantsTable plants = $PlantsTable(this);
  late final $LogEntriesTable logEntries = $LogEntriesTable(this);
  late final $AppSettingsTableTable appSettingsTable =
      $AppSettingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [plants, logEntries, appSettingsTable];
}

typedef $$PlantsTableCreateCompanionBuilder = PlantsCompanion Function({
  Value<int> id,
  required String name,
  required PlantPhase currentPhase,
  Value<DateTime?> phaseStartDate,
  required double waterVolumeLiters,
  required NutrientBrand nutrientBrand,
  required PlantType type,
  required int lampWattage,
  required String lampType,
  required int plantsUnderLamp,
  Value<bool> rootsReachedWater,
  Value<bool> germinationStarted,
  Value<DateTime?> lastGerminationCheck,
});
typedef $$PlantsTableUpdateCompanionBuilder = PlantsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<PlantPhase> currentPhase,
  Value<DateTime?> phaseStartDate,
  Value<double> waterVolumeLiters,
  Value<NutrientBrand> nutrientBrand,
  Value<PlantType> type,
  Value<int> lampWattage,
  Value<String> lampType,
  Value<int> plantsUnderLamp,
  Value<bool> rootsReachedWater,
  Value<bool> germinationStarted,
  Value<DateTime?> lastGerminationCheck,
});

class $$PlantsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlantsTable,
    Plant,
    $$PlantsTableFilterComposer,
    $$PlantsTableOrderingComposer,
    $$PlantsTableCreateCompanionBuilder,
    $$PlantsTableUpdateCompanionBuilder> {
  $$PlantsTableTableManager(_$AppDatabase db, $PlantsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PlantsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PlantsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<PlantPhase> currentPhase = const Value.absent(),
            Value<DateTime?> phaseStartDate = const Value.absent(),
            Value<double> waterVolumeLiters = const Value.absent(),
            Value<NutrientBrand> nutrientBrand = const Value.absent(),
            Value<PlantType> type = const Value.absent(),
            Value<int> lampWattage = const Value.absent(),
            Value<String> lampType = const Value.absent(),
            Value<int> plantsUnderLamp = const Value.absent(),
            Value<bool> rootsReachedWater = const Value.absent(),
            Value<bool> germinationStarted = const Value.absent(),
            Value<DateTime?> lastGerminationCheck = const Value.absent(),
          }) =>
              PlantsCompanion(
            id: id,
            name: name,
            currentPhase: currentPhase,
            phaseStartDate: phaseStartDate,
            waterVolumeLiters: waterVolumeLiters,
            nutrientBrand: nutrientBrand,
            type: type,
            lampWattage: lampWattage,
            lampType: lampType,
            plantsUnderLamp: plantsUnderLamp,
            rootsReachedWater: rootsReachedWater,
            germinationStarted: germinationStarted,
            lastGerminationCheck: lastGerminationCheck,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required PlantPhase currentPhase,
            Value<DateTime?> phaseStartDate = const Value.absent(),
            required double waterVolumeLiters,
            required NutrientBrand nutrientBrand,
            required PlantType type,
            required int lampWattage,
            required String lampType,
            required int plantsUnderLamp,
            Value<bool> rootsReachedWater = const Value.absent(),
            Value<bool> germinationStarted = const Value.absent(),
            Value<DateTime?> lastGerminationCheck = const Value.absent(),
          }) =>
              PlantsCompanion.insert(
            id: id,
            name: name,
            currentPhase: currentPhase,
            phaseStartDate: phaseStartDate,
            waterVolumeLiters: waterVolumeLiters,
            nutrientBrand: nutrientBrand,
            type: type,
            lampWattage: lampWattage,
            lampType: lampType,
            plantsUnderLamp: plantsUnderLamp,
            rootsReachedWater: rootsReachedWater,
            germinationStarted: germinationStarted,
            lastGerminationCheck: lastGerminationCheck,
          ),
        ));
}

class $$PlantsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PlantsTable> {
  $$PlantsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<PlantPhase, PlantPhase, int>
      get currentPhase => $state.composableBuilder(
          column: $state.table.currentPhase,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get phaseStartDate => $state.composableBuilder(
      column: $state.table.phaseStartDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get waterVolumeLiters => $state.composableBuilder(
      column: $state.table.waterVolumeLiters,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<NutrientBrand, NutrientBrand, int>
      get nutrientBrand => $state.composableBuilder(
          column: $state.table.nutrientBrand,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<PlantType, PlantType, int> get type =>
      $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<int> get lampWattage => $state.composableBuilder(
      column: $state.table.lampWattage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lampType => $state.composableBuilder(
      column: $state.table.lampType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get plantsUnderLamp => $state.composableBuilder(
      column: $state.table.plantsUnderLamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get rootsReachedWater => $state.composableBuilder(
      column: $state.table.rootsReachedWater,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get germinationStarted => $state.composableBuilder(
      column: $state.table.germinationStarted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastGerminationCheck => $state.composableBuilder(
      column: $state.table.lastGerminationCheck,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter logEntriesRefs(
      ComposableFilter Function($$LogEntriesTableFilterComposer f) f) {
    final $$LogEntriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.logEntries,
        getReferencedColumn: (t) => t.plantId,
        builder: (joinBuilder, parentComposers) =>
            $$LogEntriesTableFilterComposer(ComposerState($state.db,
                $state.db.logEntries, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$PlantsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PlantsTable> {
  $$PlantsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get currentPhase => $state.composableBuilder(
      column: $state.table.currentPhase,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get phaseStartDate => $state.composableBuilder(
      column: $state.table.phaseStartDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get waterVolumeLiters => $state.composableBuilder(
      column: $state.table.waterVolumeLiters,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get nutrientBrand => $state.composableBuilder(
      column: $state.table.nutrientBrand,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lampWattage => $state.composableBuilder(
      column: $state.table.lampWattage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lampType => $state.composableBuilder(
      column: $state.table.lampType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get plantsUnderLamp => $state.composableBuilder(
      column: $state.table.plantsUnderLamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get rootsReachedWater => $state.composableBuilder(
      column: $state.table.rootsReachedWater,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get germinationStarted => $state.composableBuilder(
      column: $state.table.germinationStarted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastGerminationCheck =>
      $state.composableBuilder(
          column: $state.table.lastGerminationCheck,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$LogEntriesTableCreateCompanionBuilder = LogEntriesCompanion Function({
  Value<int> id,
  required int plantId,
  required DateTime timestamp,
  Value<double?> ph,
  Value<double?> ec,
  Value<double?> ppfd,
  Value<double?> waterAdded,
  Value<bool> isWaterChange,
});
typedef $$LogEntriesTableUpdateCompanionBuilder = LogEntriesCompanion Function({
  Value<int> id,
  Value<int> plantId,
  Value<DateTime> timestamp,
  Value<double?> ph,
  Value<double?> ec,
  Value<double?> ppfd,
  Value<double?> waterAdded,
  Value<bool> isWaterChange,
});

class $$LogEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LogEntriesTable,
    LogEntry,
    $$LogEntriesTableFilterComposer,
    $$LogEntriesTableOrderingComposer,
    $$LogEntriesTableCreateCompanionBuilder,
    $$LogEntriesTableUpdateCompanionBuilder> {
  $$LogEntriesTableTableManager(_$AppDatabase db, $LogEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$LogEntriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$LogEntriesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> plantId = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<double?> ph = const Value.absent(),
            Value<double?> ec = const Value.absent(),
            Value<double?> ppfd = const Value.absent(),
            Value<double?> waterAdded = const Value.absent(),
            Value<bool> isWaterChange = const Value.absent(),
          }) =>
              LogEntriesCompanion(
            id: id,
            plantId: plantId,
            timestamp: timestamp,
            ph: ph,
            ec: ec,
            ppfd: ppfd,
            waterAdded: waterAdded,
            isWaterChange: isWaterChange,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int plantId,
            required DateTime timestamp,
            Value<double?> ph = const Value.absent(),
            Value<double?> ec = const Value.absent(),
            Value<double?> ppfd = const Value.absent(),
            Value<double?> waterAdded = const Value.absent(),
            Value<bool> isWaterChange = const Value.absent(),
          }) =>
              LogEntriesCompanion.insert(
            id: id,
            plantId: plantId,
            timestamp: timestamp,
            ph: ph,
            ec: ec,
            ppfd: ppfd,
            waterAdded: waterAdded,
            isWaterChange: isWaterChange,
          ),
        ));
}

class $$LogEntriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $LogEntriesTable> {
  $$LogEntriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get ph => $state.composableBuilder(
      column: $state.table.ph,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get ec => $state.composableBuilder(
      column: $state.table.ec,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get ppfd => $state.composableBuilder(
      column: $state.table.ppfd,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get waterAdded => $state.composableBuilder(
      column: $state.table.waterAdded,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isWaterChange => $state.composableBuilder(
      column: $state.table.isWaterChange,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$PlantsTableFilterComposer get plantId {
    final $$PlantsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plantId,
        referencedTable: $state.db.plants,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$PlantsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.plants, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$LogEntriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $LogEntriesTable> {
  $$LogEntriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get ph => $state.composableBuilder(
      column: $state.table.ph,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get ec => $state.composableBuilder(
      column: $state.table.ec,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get ppfd => $state.composableBuilder(
      column: $state.table.ppfd,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get waterAdded => $state.composableBuilder(
      column: $state.table.waterAdded,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isWaterChange => $state.composableBuilder(
      column: $state.table.isWaterChange,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$PlantsTableOrderingComposer get plantId {
    final $$PlantsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plantId,
        referencedTable: $state.db.plants,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PlantsTableOrderingComposer(ComposerState(
                $state.db, $state.db.plants, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$AppSettingsTableTableCreateCompanionBuilder
    = AppSettingsTableCompanion Function({
  Value<int> id,
  Value<bool> hasCompletedOnboarding,
  Value<bool> hasCompletedTentSetup,
  Value<String> theme,
  Value<String?> language,
  Value<String> volumeUnit,
  Value<String> temperatureUnit,
  Value<String> conductivityUnit,
});
typedef $$AppSettingsTableTableUpdateCompanionBuilder
    = AppSettingsTableCompanion Function({
  Value<int> id,
  Value<bool> hasCompletedOnboarding,
  Value<bool> hasCompletedTentSetup,
  Value<String> theme,
  Value<String?> language,
  Value<String> volumeUnit,
  Value<String> temperatureUnit,
  Value<String> conductivityUnit,
});

class $$AppSettingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTableTable,
    AppSettings,
    $$AppSettingsTableTableFilterComposer,
    $$AppSettingsTableTableOrderingComposer,
    $$AppSettingsTableTableCreateCompanionBuilder,
    $$AppSettingsTableTableUpdateCompanionBuilder> {
  $$AppSettingsTableTableTableManager(
      _$AppDatabase db, $AppSettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AppSettingsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AppSettingsTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> hasCompletedOnboarding = const Value.absent(),
            Value<bool> hasCompletedTentSetup = const Value.absent(),
            Value<String> theme = const Value.absent(),
            Value<String?> language = const Value.absent(),
            Value<String> volumeUnit = const Value.absent(),
            Value<String> temperatureUnit = const Value.absent(),
            Value<String> conductivityUnit = const Value.absent(),
          }) =>
              AppSettingsTableCompanion(
            id: id,
            hasCompletedOnboarding: hasCompletedOnboarding,
            hasCompletedTentSetup: hasCompletedTentSetup,
            theme: theme,
            language: language,
            volumeUnit: volumeUnit,
            temperatureUnit: temperatureUnit,
            conductivityUnit: conductivityUnit,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> hasCompletedOnboarding = const Value.absent(),
            Value<bool> hasCompletedTentSetup = const Value.absent(),
            Value<String> theme = const Value.absent(),
            Value<String?> language = const Value.absent(),
            Value<String> volumeUnit = const Value.absent(),
            Value<String> temperatureUnit = const Value.absent(),
            Value<String> conductivityUnit = const Value.absent(),
          }) =>
              AppSettingsTableCompanion.insert(
            id: id,
            hasCompletedOnboarding: hasCompletedOnboarding,
            hasCompletedTentSetup: hasCompletedTentSetup,
            theme: theme,
            language: language,
            volumeUnit: volumeUnit,
            temperatureUnit: temperatureUnit,
            conductivityUnit: conductivityUnit,
          ),
        ));
}

class $$AppSettingsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasCompletedOnboarding => $state.composableBuilder(
      column: $state.table.hasCompletedOnboarding,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasCompletedTentSetup => $state.composableBuilder(
      column: $state.table.hasCompletedTentSetup,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get theme => $state.composableBuilder(
      column: $state.table.theme,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get language => $state.composableBuilder(
      column: $state.table.language,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get volumeUnit => $state.composableBuilder(
      column: $state.table.volumeUnit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get temperatureUnit => $state.composableBuilder(
      column: $state.table.temperatureUnit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get conductivityUnit => $state.composableBuilder(
      column: $state.table.conductivityUnit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AppSettingsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasCompletedOnboarding => $state.composableBuilder(
      column: $state.table.hasCompletedOnboarding,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasCompletedTentSetup => $state.composableBuilder(
      column: $state.table.hasCompletedTentSetup,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get theme => $state.composableBuilder(
      column: $state.table.theme,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get language => $state.composableBuilder(
      column: $state.table.language,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get volumeUnit => $state.composableBuilder(
      column: $state.table.volumeUnit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get temperatureUnit => $state.composableBuilder(
      column: $state.table.temperatureUnit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get conductivityUnit => $state.composableBuilder(
      column: $state.table.conductivityUnit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlantsTableTableManager get plants =>
      $$PlantsTableTableManager(_db, _db.plants);
  $$LogEntriesTableTableManager get logEntries =>
      $$LogEntriesTableTableManager(_db, _db.logEntries);
  $$AppSettingsTableTableTableManager get appSettingsTable =>
      $$AppSettingsTableTableTableManager(_db, _db.appSettingsTable);
}
