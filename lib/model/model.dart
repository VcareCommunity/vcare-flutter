import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

import '../tools/helper.dart';
import 'view.list.dart';

part 'model.g.dart';

part 'model.g.view.dart';

///配置表
const SqfEntityTable tableSetting = SqfEntityTable(
    tableName: "setting",
    primaryKeyName: "id",
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    fields: [
      SqfEntityField("baseUrl", DbType.text, isNotNull: true, isUnique: true),
      SqfEntityField("name", DbType.text, isNotNull: true),
      SqfEntityField("version", DbType.text, isNotNull: true),
      SqfEntityField("isDark", DbType.bool,
          isNotNull: true, defaultValue: false),
      SqfEntityFieldRelationship(
          parentTable: tableTheme,
          relationType: RelationType.ONE_TO_MANY,
          deleteRule: DeleteRule.CASCADE),
    ]);

///主题表
const SqfEntityTable tableTheme = SqfEntityTable(
    tableName: "theme",
    primaryKeyName: "id",
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    fields: [
      SqfEntityField("name", DbType.text, isNotNull: true),
      SqfEntityField("themeColor", DbType.integer, isNotNull: true),
    ]);

///Token表
const SqfEntityTable tableToken = SqfEntityTable(
    tableName: "token",
    primaryKeyName: "id",
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    fields: [
      SqfEntityField("token", DbType.text, isNotNull: true),
      SqfEntityField("refreshToken", DbType.text),
      SqfEntityFieldRelationship(
          parentTable: tableSetting,
          relationType: RelationType.ONE_TO_ONE,
          deleteRule: DeleteRule.CASCADE)
    ]);

@SqfEntityBuilder(vcareDbModel)
const SqfEntityModel vcareDbModel = SqfEntityModel(
  modelName: "vcareDbModel",
  databaseName: 'vcare.sqlite',
  password: null,
  databaseTables: [tableSetting, tableTheme, tableToken],
  formTables: [tableSetting, tableTheme, tableToken],
);
