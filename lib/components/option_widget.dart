import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'option_model.dart';
export 'option_model.dart';

class OptionWidget extends StatefulWidget {
  const OptionWidget({
    Key? key,
    this.index,
    required this.stringOption,
    required this.questionID,
    required this.llist,
  }) : super(key: key);

  final int? index;
  final String? stringOption;
  final DocumentReference? questionID;
  final List<String>? llist;

  @override
  _OptionWidgetState createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  late OptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.questionID!.update({
        'option': widget.llist,
      });
    });

    _model.optionEditController ??=
        TextEditingController(text: widget.stringOption);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: TextFormField(
        controller: _model.optionEditController,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.optionEditController',
          Duration(milliseconds: 2000),
          () async {
            await actions.updateOptionInList(
              widget.questionID!,
              _model.optionEditController.text,
              widget.index!,
            );
          },
        ),
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Ответ ${widget.index?.toString()}',
          labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 14.0,
              ),
          hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Readex Pro',
                color: Color(0xFF57636C),
                fontSize: 14.0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primaryText,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primaryText,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
        validator: _model.optionEditControllerValidator.asValidator(context),
      ),
    );
  }
}
