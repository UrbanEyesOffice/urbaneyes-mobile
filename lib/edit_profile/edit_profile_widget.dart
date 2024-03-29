import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EditProfile'});
    _model.displayNameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.displayNameFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController(text: currentUserEmail);
    _model.emailFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            buttonSize: 40.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 40.0,
            ),
            onPressed: () async {
              logFirebaseEvent('EDIT_PROFILE_chevron_left_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'ss8ftfo0' /* Настройки */,
              ),
              maxLines: 2,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          actions: [
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('EDIT_PROFILE_PAGE_РУС_BTN_ON_TAP');
                logFirebaseEvent('Button_action_block');
                await action_blocks.changeLanguage(context);
              },
              text: FFLocalizations.of(context).getText(
                'e4oz02uo' /* Рус */,
              ),
              icon: Icon(
                Icons.language_sharp,
                size: 15.0,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                      useGoogleFonts: false,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: FaIcon(
                FontAwesomeIcons.trash,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 20.0,
              ),
              onPressed: () async {
                logFirebaseEvent('EDIT_PROFILE_PAGE_trash_ICN_ON_TAP');
                logFirebaseEvent('IconButton_alert_dialog');
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          content:
                              Text(FFLocalizations.of(context).getVariableText(
                            ruText:
                                'Вы уверены, что хотите удалить свой профиль?',
                            enText:
                                'Are you sure you want to delete your profile?',
                            kyText: 'Профилиңизди чын эле жок кылгыңыз келеби?',
                          )),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: Text(
                                  FFLocalizations.of(context).getVariableText(
                                ruText: 'Нет',
                                enText: 'No',
                                kyText: 'Жок',
                              )),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: Text(
                                  FFLocalizations.of(context).getVariableText(
                                ruText: 'Да',
                                enText: 'Yes',
                                kyText: 'Ооба',
                              )),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  logFirebaseEvent('IconButton_auth');
                  await authManager.deleteUser(context);
                } else {
                  return;
                }

                context.goNamedAuth('HomePageCopy', context.mounted);
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'r54ydkcj' /* Имя */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Golos',
                            color: Color(0xFF06112E),
                            fontSize: 16.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => TextFormField(
                        controller: _model.displayNameController,
                        focusNode: _model.displayNameFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Golos',
                              color: Color(0xFF06112E),
                              fontSize: 16.0,
                              useGoogleFonts: false,
                            ),
                        validator: _model.displayNameControllerValidator
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
                          '2x0tc9ee' /* Email */,
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
                    child: TextFormField(
                      controller: _model.emailController,
                      focusNode: _model.emailFocusNode,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Golos',
                            color: Color(0xFF06112E),
                            fontSize: 16.0,
                            useGoogleFonts: false,
                          ),
                      validator:
                          _model.emailControllerValidator.asValidator(context),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'zjhhppo5' /* Пол */,
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
                            '36ze9hen' /* Другой */,
                          ),
                          FFLocalizations.of(context).getText(
                            'sqcr0r76' /* Мужской */,
                          ),
                          FFLocalizations.of(context).getText(
                            '81llvzrd' /* Женский */,
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
                          'hacoa4kz' /* Выбрать пол */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor: Colors.white,
                        elevation: 2.0,
                        borderColor: Color(0xFFA9ABAF),
                        borderWidth: 1.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
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
                          'vvjvh66o' /* Дата рождения */,
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
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                          logFirebaseEvent(
                              'EDIT_PROFILE_PAGE_Row_5wbnatre_ON_TAP');
                          logFirebaseEvent('Row_date_time_picker');
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
                                    16.0, 0.0, 0.0, 0.0),
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
                                            enText: 'Choose date',
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
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'EDIT_PROFILE_СОХРАНИТЬ_ИЗМЕНЕНИЯ_BTN_ON_');
                          if ((_model.displayNameController.text != null &&
                                  _model.displayNameController.text != '') &&
                              (_model.displayNameController.text !=
                                  currentUserDisplayName)) {
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              displayName: _model.displayNameController.text,
                            ));
                          }
                          if ((_model.emailController.text !=
                                  currentUserEmail) &&
                              (_model.emailController.text != null &&
                                  _model.emailController.text != '')) {
                            logFirebaseEvent('Button_auth');
                            if (_model.emailController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Email required!',
                                  ),
                                ),
                              );
                              return;
                            }

                            await authManager.updateEmail(
                              email: _model.emailController.text,
                              context: context,
                            );
                            setState(() {});

                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              email: _model.emailController.text,
                            ));
                            logFirebaseEvent('Button_auth');
                            await authManager.sendEmailVerification();
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Было отправлено письмо со ссылкой для верификации email адреса ',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFF0AC706),
                              ),
                            );
                          }
                          if ((_model.datePicked != null) &&
                              (_model.datePicked !=
                                  currentUserDocument?.dateOfBirth)) {
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              dateOfBirth: _model.datePicked,
                            ));
                          }
                          if ((_model.dropDownValue != null) &&
                              (_model.dropDownValue !=
                                  valueOrDefault(
                                      currentUserDocument?.gender, 0))) {
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              gender: _model.dropDownValue,
                            ));
                          }
                          logFirebaseEvent('Button_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Изменения сохранены',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 1500),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('HomePageCopy');
                        },
                        text: FFLocalizations.of(context).getText(
                          'qdr5c66g' /* Сохранить изменения */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 48.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF53B153),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'EDIT_PROFILE_PAGE_ВЫЙТИ_BTN_ON_TAP');
                          logFirebaseEvent('Button_alert_dialog');
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      ruText: 'Вы уверены, что хотите выйти?',
                                      enText:
                                          'Are you sure you want to logout?',
                                      kyText: 'Чын эле чыгасызбы?',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text(FFLocalizations.of(context)
                                            .getVariableText(
                                          ruText: 'Остаться в приложении',
                                          enText: ' Stay in the app',
                                          kyText: 'Колдонмодо калыңыз',
                                        )),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text(FFLocalizations.of(context)
                                            .getVariableText(
                                          ruText: 'Да',
                                          enText: 'Yes',
                                          kyText: 'Ооба',
                                        )),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            logFirebaseEvent('Button_auth');
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();
                          } else {
                            return;
                          }

                          context.goNamedAuth('MainAuth', context.mounted);
                        },
                        text: FFLocalizations.of(context).getText(
                          'crlfku7o' /* Выйти */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 48.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFCEEFCD),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Golos',
                                    color: Color(0xFF0A8D09),
                                    useGoogleFonts: false,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ].addToStart(SizedBox(height: 32.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
