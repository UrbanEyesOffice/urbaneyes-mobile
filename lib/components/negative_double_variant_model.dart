import '/components/building_selector/building_selector_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'negative_double_variant_widget.dart' show NegativeDoubleVariantWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NegativeDoubleVariantModel
    extends FlutterFlowModel<NegativeDoubleVariantWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel1;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel2;

  @override
  void initState(BuildContext context) {
    buildingSelectorModel1 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel2 =
        createModel(context, () => BuildingSelectorModel());
  }

  @override
  void dispose() {
    buildingSelectorModel1.dispose();
    buildingSelectorModel2.dispose();
  }
}
