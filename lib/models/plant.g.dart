// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlantCollection on Isar {
  IsarCollection<Plant> get plants => this.collection();
}

const PlantSchema = CollectionSchema(
  name: r'Plant',
  id: 3202799289401311532,
  properties: {
    r'currentPhase': PropertySchema(
      id: 0,
      name: r'currentPhase',
      type: IsarType.byte,
      enumMap: _PlantcurrentPhaseEnumValueMap,
    ),
    r'germinationStarted': PropertySchema(
      id: 1,
      name: r'germinationStarted',
      type: IsarType.bool,
    ),
    r'lampType': PropertySchema(
      id: 2,
      name: r'lampType',
      type: IsarType.string,
    ),
    r'lampWattage': PropertySchema(
      id: 3,
      name: r'lampWattage',
      type: IsarType.long,
    ),
    r'lastGerminationCheck': PropertySchema(
      id: 4,
      name: r'lastGerminationCheck',
      type: IsarType.dateTime,
    ),
    r'measurementHistory': PropertySchema(
      id: 5,
      name: r'measurementHistory',
      type: IsarType.objectList,
      target: r'LogEntry',
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'nutrientBrand': PropertySchema(
      id: 7,
      name: r'nutrientBrand',
      type: IsarType.byte,
      enumMap: _PlantnutrientBrandEnumValueMap,
    ),
    r'phaseStartDate': PropertySchema(
      id: 8,
      name: r'phaseStartDate',
      type: IsarType.dateTime,
    ),
    r'plantsUnderLamp': PropertySchema(
      id: 9,
      name: r'plantsUnderLamp',
      type: IsarType.long,
    ),
    r'rootsReachedWater': PropertySchema(
      id: 10,
      name: r'rootsReachedWater',
      type: IsarType.bool,
    ),
    r'type': PropertySchema(
      id: 11,
      name: r'type',
      type: IsarType.byte,
      enumMap: _PlanttypeEnumValueMap,
    ),
    r'waterVolumeLiters': PropertySchema(
      id: 12,
      name: r'waterVolumeLiters',
      type: IsarType.double,
    )
  },
  estimateSize: _plantEstimateSize,
  serialize: _plantSerialize,
  deserialize: _plantDeserialize,
  deserializeProp: _plantDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'LogEntry': LogEntrySchema},
  getId: _plantGetId,
  getLinks: _plantGetLinks,
  attach: _plantAttach,
  version: '3.1.0+1',
);

int _plantEstimateSize(
  Plant object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lampType.length * 3;
  bytesCount += 3 + object.measurementHistory.length * 3;
  {
    final offsets = allOffsets[LogEntry]!;
    for (var i = 0; i < object.measurementHistory.length; i++) {
      final value = object.measurementHistory[i];
      bytesCount += LogEntrySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _plantSerialize(
  Plant object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.currentPhase.index);
  writer.writeBool(offsets[1], object.germinationStarted);
  writer.writeString(offsets[2], object.lampType);
  writer.writeLong(offsets[3], object.lampWattage);
  writer.writeDateTime(offsets[4], object.lastGerminationCheck);
  writer.writeObjectList<LogEntry>(
    offsets[5],
    allOffsets,
    LogEntrySchema.serialize,
    object.measurementHistory,
  );
  writer.writeString(offsets[6], object.name);
  writer.writeByte(offsets[7], object.nutrientBrand.index);
  writer.writeDateTime(offsets[8], object.phaseStartDate);
  writer.writeLong(offsets[9], object.plantsUnderLamp);
  writer.writeBool(offsets[10], object.rootsReachedWater);
  writer.writeByte(offsets[11], object.type.index);
  writer.writeDouble(offsets[12], object.waterVolumeLiters);
}

Plant _plantDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Plant();
  object.currentPhase =
      _PlantcurrentPhaseValueEnumMap[reader.readByteOrNull(offsets[0])] ??
          PlantPhase.onboarding;
  object.germinationStarted = reader.readBool(offsets[1]);
  object.id = id;
  object.lampType = reader.readString(offsets[2]);
  object.lampWattage = reader.readLong(offsets[3]);
  object.lastGerminationCheck = reader.readDateTimeOrNull(offsets[4]);
  object.measurementHistory = reader.readObjectList<LogEntry>(
        offsets[5],
        LogEntrySchema.deserialize,
        allOffsets,
        LogEntry(),
      ) ??
      [];
  object.name = reader.readString(offsets[6]);
  object.nutrientBrand =
      _PlantnutrientBrandValueEnumMap[reader.readByteOrNull(offsets[7])] ??
          NutrientBrand.cannaAqua;
  object.phaseStartDate = reader.readDateTimeOrNull(offsets[8]);
  object.plantsUnderLamp = reader.readLong(offsets[9]);
  object.rootsReachedWater = reader.readBool(offsets[10]);
  object.type = _PlanttypeValueEnumMap[reader.readByteOrNull(offsets[11])] ??
      PlantType.photo;
  object.waterVolumeLiters = reader.readDouble(offsets[12]);
  return object;
}

P _plantDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_PlantcurrentPhaseValueEnumMap[reader.readByteOrNull(offset)] ??
          PlantPhase.onboarding) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<LogEntry>(
            offset,
            LogEntrySchema.deserialize,
            allOffsets,
            LogEntry(),
          ) ??
          []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_PlantnutrientBrandValueEnumMap[reader.readByteOrNull(offset)] ??
          NutrientBrand.cannaAqua) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (_PlanttypeValueEnumMap[reader.readByteOrNull(offset)] ??
          PlantType.photo) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PlantcurrentPhaseEnumValueMap = {
  'onboarding': 0,
  'germination': 1,
  'veg': 2,
  'flower': 3,
  'drying': 4,
  'curing': 5,
  'archived': 6,
};
const _PlantcurrentPhaseValueEnumMap = {
  0: PlantPhase.onboarding,
  1: PlantPhase.germination,
  2: PlantPhase.veg,
  3: PlantPhase.flower,
  4: PlantPhase.drying,
  5: PlantPhase.curing,
  6: PlantPhase.archived,
};
const _PlantnutrientBrandEnumValueMap = {
  'cannaAqua': 0,
  'ta': 1,
  'advancedNutrients': 2,
  'plagron': 3,
};
const _PlantnutrientBrandValueEnumMap = {
  0: NutrientBrand.cannaAqua,
  1: NutrientBrand.ta,
  2: NutrientBrand.advancedNutrients,
  3: NutrientBrand.plagron,
};
const _PlanttypeEnumValueMap = {
  'photo': 0,
  'auto': 1,
};
const _PlanttypeValueEnumMap = {
  0: PlantType.photo,
  1: PlantType.auto,
};

Id _plantGetId(Plant object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _plantGetLinks(Plant object) {
  return [];
}

void _plantAttach(IsarCollection<dynamic> col, Id id, Plant object) {
  object.id = id;
}

extension PlantQueryWhereSort on QueryBuilder<Plant, Plant, QWhere> {
  QueryBuilder<Plant, Plant, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlantQueryWhere on QueryBuilder<Plant, Plant, QWhereClause> {
  QueryBuilder<Plant, Plant, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PlantQueryFilter on QueryBuilder<Plant, Plant, QFilterCondition> {
  QueryBuilder<Plant, Plant, QAfterFilterCondition> currentPhaseEqualTo(
      PlantPhase value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPhase',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> currentPhaseGreaterThan(
    PlantPhase value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentPhase',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> currentPhaseLessThan(
    PlantPhase value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentPhase',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> currentPhaseBetween(
    PlantPhase lower,
    PlantPhase upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentPhase',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> germinationStartedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'germinationStarted',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lampType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lampType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lampType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lampType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lampType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lampType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lampType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lampType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lampType',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lampType',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampWattageEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lampWattage',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampWattageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lampWattage',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampWattageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lampWattage',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lampWattageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lampWattage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      lastGerminationCheckIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastGerminationCheck',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      lastGerminationCheckIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastGerminationCheck',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lastGerminationCheckEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastGerminationCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      lastGerminationCheckGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastGerminationCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      lastGerminationCheckLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastGerminationCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> lastGerminationCheckBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastGerminationCheck',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      measurementHistoryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'measurementHistory',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      measurementHistoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'measurementHistory',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      measurementHistoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'measurementHistory',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      measurementHistoryLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'measurementHistory',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      measurementHistoryLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'measurementHistory',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      measurementHistoryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'measurementHistory',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nutrientBrandEqualTo(
      NutrientBrand value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nutrientBrand',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nutrientBrandGreaterThan(
    NutrientBrand value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nutrientBrand',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nutrientBrandLessThan(
    NutrientBrand value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nutrientBrand',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nutrientBrandBetween(
    NutrientBrand lower,
    NutrientBrand upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nutrientBrand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> phaseStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phaseStartDate',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> phaseStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phaseStartDate',
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> phaseStartDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phaseStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> phaseStartDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phaseStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> phaseStartDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phaseStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> phaseStartDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phaseStartDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantsUnderLampEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plantsUnderLamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantsUnderLampGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plantsUnderLamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantsUnderLampLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plantsUnderLamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> plantsUnderLampBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plantsUnderLamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> rootsReachedWaterEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rootsReachedWater',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> typeEqualTo(
      PlantType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> typeGreaterThan(
    PlantType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> typeLessThan(
    PlantType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> typeBetween(
    PlantType lower,
    PlantType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> waterVolumeLitersEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterVolumeLiters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition>
      waterVolumeLitersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterVolumeLiters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> waterVolumeLitersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterVolumeLiters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> waterVolumeLitersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterVolumeLiters',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PlantQueryObject on QueryBuilder<Plant, Plant, QFilterCondition> {
  QueryBuilder<Plant, Plant, QAfterFilterCondition> measurementHistoryElement(
      FilterQuery<LogEntry> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'measurementHistory');
    });
  }
}

extension PlantQueryLinks on QueryBuilder<Plant, Plant, QFilterCondition> {}

extension PlantQuerySortBy on QueryBuilder<Plant, Plant, QSortBy> {
  QueryBuilder<Plant, Plant, QAfterSortBy> sortByCurrentPhase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPhase', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByCurrentPhaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPhase', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByGerminationStarted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'germinationStarted', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByGerminationStartedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'germinationStarted', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByLampType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lampType', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByLampTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lampType', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByLampWattage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lampWattage', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByLampWattageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lampWattage', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByLastGerminationCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastGerminationCheck', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByLastGerminationCheckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastGerminationCheck', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByNutrientBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutrientBrand', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByNutrientBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutrientBrand', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPhaseStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phaseStartDate', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPhaseStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phaseStartDate', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPlantsUnderLamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantsUnderLamp', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByPlantsUnderLampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantsUnderLamp', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByRootsReachedWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rootsReachedWater', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByRootsReachedWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rootsReachedWater', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByWaterVolumeLiters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterVolumeLiters', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByWaterVolumeLitersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterVolumeLiters', Sort.desc);
    });
  }
}

extension PlantQuerySortThenBy on QueryBuilder<Plant, Plant, QSortThenBy> {
  QueryBuilder<Plant, Plant, QAfterSortBy> thenByCurrentPhase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPhase', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByCurrentPhaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPhase', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByGerminationStarted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'germinationStarted', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByGerminationStartedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'germinationStarted', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByLampType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lampType', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByLampTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lampType', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByLampWattage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lampWattage', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByLampWattageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lampWattage', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByLastGerminationCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastGerminationCheck', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByLastGerminationCheckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastGerminationCheck', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByNutrientBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutrientBrand', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByNutrientBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutrientBrand', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPhaseStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phaseStartDate', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPhaseStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phaseStartDate', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPlantsUnderLamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantsUnderLamp', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByPlantsUnderLampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantsUnderLamp', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByRootsReachedWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rootsReachedWater', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByRootsReachedWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rootsReachedWater', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByWaterVolumeLiters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterVolumeLiters', Sort.asc);
    });
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByWaterVolumeLitersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterVolumeLiters', Sort.desc);
    });
  }
}

extension PlantQueryWhereDistinct on QueryBuilder<Plant, Plant, QDistinct> {
  QueryBuilder<Plant, Plant, QDistinct> distinctByCurrentPhase() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentPhase');
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByGerminationStarted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'germinationStarted');
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByLampType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lampType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByLampWattage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lampWattage');
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByLastGerminationCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastGerminationCheck');
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByNutrientBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nutrientBrand');
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByPhaseStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phaseStartDate');
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByPlantsUnderLamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plantsUnderLamp');
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByRootsReachedWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rootsReachedWater');
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByWaterVolumeLiters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waterVolumeLiters');
    });
  }
}

extension PlantQueryProperty on QueryBuilder<Plant, Plant, QQueryProperty> {
  QueryBuilder<Plant, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Plant, PlantPhase, QQueryOperations> currentPhaseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentPhase');
    });
  }

  QueryBuilder<Plant, bool, QQueryOperations> germinationStartedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'germinationStarted');
    });
  }

  QueryBuilder<Plant, String, QQueryOperations> lampTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lampType');
    });
  }

  QueryBuilder<Plant, int, QQueryOperations> lampWattageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lampWattage');
    });
  }

  QueryBuilder<Plant, DateTime?, QQueryOperations>
      lastGerminationCheckProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastGerminationCheck');
    });
  }

  QueryBuilder<Plant, List<LogEntry>, QQueryOperations>
      measurementHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measurementHistory');
    });
  }

  QueryBuilder<Plant, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Plant, NutrientBrand, QQueryOperations> nutrientBrandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nutrientBrand');
    });
  }

  QueryBuilder<Plant, DateTime?, QQueryOperations> phaseStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phaseStartDate');
    });
  }

  QueryBuilder<Plant, int, QQueryOperations> plantsUnderLampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plantsUnderLamp');
    });
  }

  QueryBuilder<Plant, bool, QQueryOperations> rootsReachedWaterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rootsReachedWater');
    });
  }

  QueryBuilder<Plant, PlantType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<Plant, double, QQueryOperations> waterVolumeLitersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waterVolumeLiters');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LogEntrySchema = Schema(
  name: r'LogEntry',
  id: -8268688274231935295,
  properties: {
    r'ec': PropertySchema(
      id: 0,
      name: r'ec',
      type: IsarType.double,
    ),
    r'ph': PropertySchema(
      id: 1,
      name: r'ph',
      type: IsarType.double,
    ),
    r'ppfd': PropertySchema(
      id: 2,
      name: r'ppfd',
      type: IsarType.double,
    ),
    r'timestamp': PropertySchema(
      id: 3,
      name: r'timestamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _logEntryEstimateSize,
  serialize: _logEntrySerialize,
  deserialize: _logEntryDeserialize,
  deserializeProp: _logEntryDeserializeProp,
);

int _logEntryEstimateSize(
  LogEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _logEntrySerialize(
  LogEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.ec);
  writer.writeDouble(offsets[1], object.ph);
  writer.writeDouble(offsets[2], object.ppfd);
  writer.writeDateTime(offsets[3], object.timestamp);
}

LogEntry _logEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LogEntry();
  object.ec = reader.readDouble(offsets[0]);
  object.ph = reader.readDouble(offsets[1]);
  object.ppfd = reader.readDoubleOrNull(offsets[2]);
  object.timestamp = reader.readDateTime(offsets[3]);
  return object;
}

P _logEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LogEntryQueryFilter
    on QueryBuilder<LogEntry, LogEntry, QFilterCondition> {
  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> ecEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ec',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> ecGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ec',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> ecLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ec',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> ecBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ec',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> phEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ph',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> phGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ph',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> phLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ph',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> phBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ph',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> ppfdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppfd',
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> ppfdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppfd',
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> ppfdEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppfd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> ppfdGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ppfd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> ppfdLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ppfd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> ppfdBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ppfd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LogEntryQueryObject
    on QueryBuilder<LogEntry, LogEntry, QFilterCondition> {}
