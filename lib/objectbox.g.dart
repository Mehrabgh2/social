// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'db/SettingsModel.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 8051495359970159375),
      name: 'SettingModel',
      lastPropertyId: const IdUid(5, 344524984015519570),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1863932885513300954),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4582795183219371902),
            name: 'theme',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6079010369238324451),
            name: 'locale',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5613770626521167000),
            name: 'token',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 344524984015519570),
            name: 'tokenExpire',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 8051495359970159375),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [4586220626221249436],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        7417010942682434840,
        749593661551011736,
        2804231332805087704
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    SettingModel: EntityDefinition<SettingModel>(
        model: _entities[0],
        toOneRelations: (SettingModel object) => [],
        toManyRelations: (SettingModel object) => {},
        getId: (SettingModel object) => object.id,
        setId: (SettingModel object, int id) {
          object.id = id;
        },
        objectToFB: (SettingModel object, fb.Builder fbb) {
          final themeOffset = fbb.writeString(object.theme);
          final localeOffset = fbb.writeString(object.locale);
          final tokenOffset = fbb.writeString(object.token);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, themeOffset);
          fbb.addOffset(2, localeOffset);
          fbb.addOffset(3, tokenOffset);
          fbb.addInt64(4, object.tokenExpire);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = SettingModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              theme: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              locale: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              token: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              tokenExpire:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [SettingModel] entity fields to define ObjectBox queries.
class SettingModel_ {
  /// see [SettingModel.id]
  static final id =
      QueryIntegerProperty<SettingModel>(_entities[0].properties[0]);

  /// see [SettingModel.theme]
  static final theme =
      QueryStringProperty<SettingModel>(_entities[0].properties[1]);

  /// see [SettingModel.locale]
  static final locale =
      QueryStringProperty<SettingModel>(_entities[0].properties[2]);

  /// see [SettingModel.token]
  static final token =
      QueryStringProperty<SettingModel>(_entities[0].properties[3]);

  /// see [SettingModel.tokenExpire]
  static final tokenExpire =
      QueryIntegerProperty<SettingModel>(_entities[0].properties[4]);
}
