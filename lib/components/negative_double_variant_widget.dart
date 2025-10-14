import '/components/building_selector/building_selector_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'negative_double_variant_model.dart';
export 'negative_double_variant_model.dart';

class NegativeDoubleVariantWidget extends StatefulWidget {
  const NegativeDoubleVariantWidget({
    super.key,
    required this.isSelectedLeft,
    required this.isSelectedRight,
    required this.onSelectLeft,
    required this.onSelectRight,
    required this.titleLeft,
    required this.titleRight,
    required this.question,
  });

  final bool? isSelectedLeft;
  final bool? isSelectedRight;
  final Future Function()? onSelectLeft;
  final Future Function()? onSelectRight;
  final String? titleLeft;
  final String? titleRight;
  final String? question;

  @override
  State<NegativeDoubleVariantWidget> createState() =>
      _NegativeDoubleVariantWidgetState();
}

class _NegativeDoubleVariantWidgetState
    extends State<NegativeDoubleVariantWidget> {
  late NegativeDoubleVariantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NegativeDoubleVariantModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Color(0xFFA7A7A7),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              valueOrDefault<String>(
                widget!.question,
                'Default question?',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: wrapWithModel(
                    model: _model.buildingSelectorModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: BuildingSelectorWidget(
                      isSelected: widget!.isSelectedLeft!,
                      title: widget!.titleLeft!,
                      onTapAction: () async {
                        logFirebaseEvent(
                            'NEGATIVE_DOUBLE_VARIANT_Container_21yrxf');
                        logFirebaseEvent('BuildingSelector_execute_callback');
                        await widget.onSelectLeft?.call();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.buildingSelectorModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: BuildingSelectorWidget(
                      isSelected: widget!.isSelectedRight!,
                      title: widget!.titleRight!,
                      onTapAction: () async {
                        logFirebaseEvent(
                            'NEGATIVE_DOUBLE_VARIANT_Container_9vvuip');
                        logFirebaseEvent('BuildingSelector_execute_callback');
                        await widget.onSelectRight?.call();
                      },
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 24.0)),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
