import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'building_selector_model.dart';
export 'building_selector_model.dart';

class BuildingSelectorWidget extends StatefulWidget {
  const BuildingSelectorWidget({
    super.key,
    required this.isSelected,
    this.emoji,
    required this.title,
    required this.onTapAction,
  });

  final bool? isSelected;
  final String? emoji;
  final String? title;
  final Future Function()? onTapAction;

  @override
  State<BuildingSelectorWidget> createState() => _BuildingSelectorWidgetState();
}

class _BuildingSelectorWidgetState extends State<BuildingSelectorWidget> {
  late BuildingSelectorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuildingSelectorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('BUILDING_SELECTOR_Container_4h8ylw00_ON_');
        logFirebaseEvent('Container_execute_callback');
        await widget.onTapAction?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget!.isSelected! ? Color(0xFFE0F4E8) : Color(0x00000000),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: widget!.isSelected! ? Color(0xFF16A34A) : Color(0xFFA7A7A7),
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget!.emoji != null && widget!.emoji != '')
              Text(
                valueOrDefault<String>(
                  widget!.emoji,
                  '🏠',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget!.title,
                  'Default Title',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: Color(0xFF545454),
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ].addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
