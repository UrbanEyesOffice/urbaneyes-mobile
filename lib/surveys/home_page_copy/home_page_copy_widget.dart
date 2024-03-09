import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_copy_model.dart';
export 'home_page_copy_model.dart';

class HomePageCopyWidget extends StatefulWidget {
  const HomePageCopyWidget({
    super.key,
    this.firstLogin,
  });

  final bool? firstLogin;

  @override
  State<HomePageCopyWidget> createState() => _HomePageCopyWidgetState();
}

class _HomePageCopyWidgetState extends State<HomePageCopyWidget> {
  late HomePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HomePageCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_COPY_HomePageCopy_ON_INIT_STATE');
      await authManager.refreshUser();
      if (!currentUserEmailVerified) {
        logFirebaseEvent('HomePageCopy_navigate_to');

        context.goNamed('Verification');
      }
      if (valueOrDefault<bool>(currentUserDocument?.isNotFirstLogin, false) !=
          true) {
        logFirebaseEvent('HomePageCopy_navigate_to');

        context.goNamed('CualificatedSurvey');
      }
      logFirebaseEvent('HomePageCopy_firestore_query');
      _model.loadedSurveys = await querySurveysRecordOnce(
        queryBuilder: (surveysRecord) => surveysRecord.where(
          'enabled',
          isEqualTo: true,
        ),
        limit: 10,
      );
      logFirebaseEvent('HomePageCopy_custom_action');
      _model.tempSurveys = await actions.shuffleSurveys(
        _model.loadedSurveys?.toList(),
      );
      logFirebaseEvent('HomePageCopy_update_page_state');
      setState(() {
        _model.shuffledSurveys =
            _model.tempSurveys!.toList().cast<SurveysRecord>();
      });
    });

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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/Asset_3.png',
                          width: 31.0,
                          height: 24.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'f70g83zr' /* UrbanEyes */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Gerbera',
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'HOME_PAGE_COPY_PAGE_Icon_5zudb6wu_ON_TAP');
                              logFirebaseEvent('Icon_navigate_to');

                              context.pushNamed('Feedback');
                            },
                            child: Icon(
                              Icons.question_answer_outlined,
                              color: Color(0xFF06112E),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'HOME_PAGE_COPY_PAGE_Icon_maxvlwkk_ON_TAP');
                          logFirebaseEvent('Icon_navigate_to');

                          context.pushNamed('EditProfile');
                        },
                        child: Icon(
                          Icons.settings_outlined,
                          color: Color(0xFF06112E),
                          size: 24.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'HOME_COPY_Container_cd8oox3e_ON_TAP');
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed('RewardsCopy');
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 24.0,
                            maxHeight: 24.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 2.0, 2.0, 2.0),
                            child: Image.asset(
                              'assets/images/free-icon-gift-box-1039714.png',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment(0.0, 0.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final listItems = _model.shuffledSurveys.toList();
                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        32.0,
                        0,
                        32.0,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: listItems.length,
                      separatorBuilder: (_, __) => SizedBox(height: 16.0),
                      itemBuilder: (context, listItemsIndex) {
                        final listItemsItem = listItems[listItemsIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            constraints: BoxConstraints(
                              minHeight: 250.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: Color(0xFFE5F5E4),
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              ruText: listItemsItem.name,
                                              enText: listItemsItem.nameEn,
                                              kyText: listItemsItem.nameKg,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 3,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Gerbera',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: Color(0xFF53B153),
                                                size: 24.0,
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1qnika23' /* в этой локации */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Golos',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_COPY_PAGE_ПРОЙТИ_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed(
                                            'questionCopyCopy',
                                            queryParameters: {
                                              'survey': serializeParam(
                                                listItemsItem,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'survey': listItemsItem,
                                            },
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'gohqvhe4' /* Пройти */,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 48.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFCEEFCD),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Golos',
                                                    color: Color(0xFF0A8D09),
                                                    useGoogleFonts: false,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 60.0)),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ].addToStart(SizedBox(height: 32.0)),
          ),
        ),
      ),
    );
  }
}
