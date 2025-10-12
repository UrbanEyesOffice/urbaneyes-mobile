import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'building_type_selector_widget.dart' show BuildingTypeSelectorWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuildingTypeSelectorModel
    extends FlutterFlowModel<BuildingTypeSelectorWidget> {
  ///  Local state fields for this component.

  List<BuildingTypeStruct> selectedTypes = [];
  void addToSelectedTypes(BuildingTypeStruct item) => selectedTypes.add(item);
  void removeFromSelectedTypes(BuildingTypeStruct item) =>
      selectedTypes.remove(item);
  void removeAtIndexFromSelectedTypes(int index) =>
      selectedTypes.removeAt(index);
  void insertAtIndexInSelectedTypes(int index, BuildingTypeStruct item) =>
      selectedTypes.insert(index, item);
  void updateSelectedTypesAtIndex(
          int index, Function(BuildingTypeStruct) updateFn) =>
      selectedTypes[index] = updateFn(selectedTypes[index]);

  List<BuildingTypeStruct> buildingTypesArrayMain = [];
  void addToBuildingTypesArrayMain(BuildingTypeStruct item) =>
      buildingTypesArrayMain.add(item);
  void removeFromBuildingTypesArrayMain(BuildingTypeStruct item) =>
      buildingTypesArrayMain.remove(item);
  void removeAtIndexFromBuildingTypesArrayMain(int index) =>
      buildingTypesArrayMain.removeAt(index);
  void insertAtIndexInBuildingTypesArrayMain(
          int index, BuildingTypeStruct item) =>
      buildingTypesArrayMain.insert(index, item);
  void updateBuildingTypesArrayMainAtIndex(
          int index, Function(BuildingTypeStruct) updateFn) =>
      buildingTypesArrayMain[index] = updateFn(buildingTypesArrayMain[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
