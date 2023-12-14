import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cualificated_survey_model.dart';
export 'cualificated_survey_model.dart';

class CualificatedSurveyWidget extends StatefulWidget {
  const CualificatedSurveyWidget({Key? key}) : super(key: key);

  @override
  _CualificatedSurveyWidgetState createState() =>
      _CualificatedSurveyWidgetState();
}

class _CualificatedSurveyWidgetState extends State<CualificatedSurveyWidget> {
  late CualificatedSurveyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CualificatedSurveyModel());

    _model.nameCreateController ??= TextEditingController(
        text: currentUserDisplayName != null && currentUserDisplayName != ''
            ? currentUserDisplayName
            : '');
    _model.nameCreateFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 50.0, 30.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        's5kbsmyt' /* Расскажи немного о себе */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Gerbera',
                                color: Color(0xFF06112E),
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '4r235815' /* Имя */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Golos',
                              color: Color(0xFF06112E),
                              fontSize: 16.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => TextFormField(
                        controller: _model.nameCreateController,
                        focusNode: _model.nameCreateFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'oea51z69' /*  */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Golos',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                useGoogleFonts: false,
                              ),
                          hintText: FFLocalizations.of(context).getText(
                            'g3bahn6a' /* Имя */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Golos',
                                    color: Color(0xFFA9ABAF),
                                    fontSize: 16.0,
                                    useGoogleFonts: false,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA9ABAF),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA9ABAF),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 20.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Golos',
                              color: Color(0xFF06112E),
                              fontSize: 16.0,
                              useGoogleFonts: false,
                            ),
                        validator: _model.nameCreateControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ss0ux0un' /* Пол */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Golos',
                              color: Color(0xFF06112E),
                              fontSize: 16.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FlutterFlowDropDown<int>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<int>(
                          _model.dropDownValue ??=
                              valueOrDefault(currentUserDocument?.gender, 0),
                        ),
                        options: List<int>.from([0, 1, 2]),
                        optionLabels: [
                          FFLocalizations.of(context).getText(
                            '5nu4wtxj' /* Другой */,
                          ),
                          FFLocalizations.of(context).getText(
                            'm366ycev' /* Мужской */,
                          ),
                          FFLocalizations.of(context).getText(
                            'cpoyi6n6' /* Женский */,
                          )
                        ],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue = val),
                        width: double.infinity,
                        height: 55.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Golos',
                                  color: Color(0xFF06112E),
                                  fontSize: 16.0,
                                  useGoogleFonts: false,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'p5u8fuji' /* Выбрать пол */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF06112E),
                          size: 24.0,
                        ),
                        elevation: 2.0,
                        borderColor: Color(0xFFA9ABAF),
                        borderWidth: 1.0,
                        borderRadius: 8.0,
                        margin:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'mpnhy26o' /* Дата рождения */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Golos',
                              color: Color(0xFF06112E),
                              fontSize: 16.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 55.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Color(0xFFA9ABAF),
                        ),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          final _datePickedDate = await showDatePicker(
                            context: context,
                            initialDate: getCurrentTimestamp,
                            firstDate: DateTime(1900),
                            lastDate: getCurrentTimestamp,
                          );

                          if (_datePickedDate != null) {
                            safeSetState(() {
                              _model.datePicked = DateTime(
                                _datePickedDate.year,
                                _datePickedDate.month,
                                _datePickedDate.day,
                              );
                            });
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    valueOrDefault<String>(
                                      () {
                                        if (_model.datePicked != null) {
                                          return functions
                                              .returnDate(_model.datePicked!);
                                        } else if (currentUserDocument
                                                ?.dateOfBirth !=
                                            null) {
                                          return functions.returnDate(
                                              currentUserDocument!
                                                  .dateOfBirth!);
                                        } else {
                                          return FFLocalizations.of(context)
                                              .getVariableText(
                                            ruText: 'Выберите дату',
                                            enText: 'Select date',
                                            kyText: 'Туулган күндү тандаңыз',
                                          );
                                        }
                                      }(),
                                      'Выберите дату',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Golos',
                                          color: Color(0xFF06112E),
                                          fontSize: 16.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: Icon(
                                    Icons.calendar_month_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if ((_model.nameCreateController.text != null &&
                          _model.nameCreateController.text != '') &&
                      (_model.dropDownValue != null) &&
                      (_model.datePicked != null))
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              gender: _model.dropDownValue,
                              dateOfBirth: _model.datePicked,
                              displayName: _model.nameCreateController.text,
                              isNotFirstLogin: true,
                            ));
                            if (valueOrDefault(currentUserDocument?.score, 0) ==
                                null) {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                score: 0,
                              ));
                            }

                            context.goNamed('CompleteRegistration');
                          },
                          text: FFLocalizations.of(context).getText(
                            '9784jlvv' /* Продолжить */,
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 48.0,
                            padding: EdgeInsets.all(0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF53B153),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Golos',
                                  color: Colors.white,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
