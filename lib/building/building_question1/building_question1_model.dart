import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/building_selector/building_selector_widget.dart';
import '/components/building_type_selector/building_type_selector_widget.dart';
import '/components/osm/osm_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'building_question1_widget.dart' show BuildingQuestion1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuildingQuestion1Model extends FlutterFlowModel<BuildingQuestion1Widget> {
  ///  Local state fields for this page.

  LatLng? selectedLocation;

  String selectedLocationTitle = '-';

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

  MainBuildingType? buildingMainType;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getAddressFromLatLngGoogleMaps] action in BuildingQuestion1 widget.
  String? locationTitleOnLoad;
  // Model for Public.
  late BuildingSelectorModel publicModel;
  // Model for Living.
  late BuildingSelectorModel livingModel;

  @override
  void initState(BuildContext context) {
    publicModel = createModel(context, () => BuildingSelectorModel());
    livingModel = createModel(context, () => BuildingSelectorModel());
  }

  @override
  void dispose() {
    publicModel.dispose();
    livingModel.dispose();
  }
}
