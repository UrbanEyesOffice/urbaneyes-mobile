import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'rewards_model.dart';
export 'rewards_model.dart';

class RewardsWidget extends StatefulWidget {
  const RewardsWidget({Key? key}) : super(key: key);

  @override
  _RewardsWidgetState createState() => _RewardsWidgetState();
}

class _RewardsWidgetState extends State<RewardsWidget> {
  late RewardsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RewardsModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '280sxx3f' /* Награды */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(1.00, 0.00),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('CollectedRewards');
                          },
                          child: Icon(
                            Icons.history_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: Color(0xFFE5F5E4),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.bolt,
                            color: Color(0xFF53B153),
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    '${valueOrDefault(currentUserDocument?.score, 0).toString()}${FFLocalizations.of(context).getVariableText(
                                      ruText: ' очков',
                                      enText: ' points',
                                      kyText: ' упай',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gerbera',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '8afwj9n3' /* очков до слудующей награды */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 0.0),
                child: StreamBuilder<List<RewardsRecord>>(
                  stream: queryRewardsRecord(
                    queryBuilder: (rewardsRecord) => rewardsRecord.where(
                      'used',
                      isEqualTo: false,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<RewardsRecord> columnRewardsRecordList =
                        snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(columnRewardsRecordList.length,
                            (columnIndex) {
                          final columnRewardsRecord =
                              columnRewardsRecordList[columnIndex];
                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        CircularPercentIndicator(
                                      percent: () {
                                        if (valueOrDefault(
                                                currentUserDocument?.score,
                                                0) <=
                                            columnRewardsRecord.pointsNeeded) {
                                          return (valueOrDefault(
                                                      currentUserDocument
                                                          ?.score,
                                                      0)
                                                  .toDouble() /
                                              columnRewardsRecord.pointsNeeded
                                                  .toDouble());
                                        } else if (valueOrDefault(
                                                currentUserDocument?.score, 0) >
                                            columnRewardsRecord.pointsNeeded) {
                                          return 1.0;
                                        } else {
                                          return 0.0;
                                        }
                                      }(),
                                      radius: 25.0,
                                      lineWidth: 4.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor: Color(0xFF53B153),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      center: Text(
                                        columnRewardsRecord.pointsNeeded
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Golos',
                                              fontSize: 14.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: Text(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            ruText:
                                                columnRewardsRecord.rewardName,
                                            enText: columnRewardsRecord
                                                .rewardNameEn,
                                            kyText: columnRewardsRecord
                                                .rewardNameKg,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Golos',
                                                color: Color(0xFFA9ABAF),
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: Text(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            ruText: columnRewardsRecord
                                                .rewardDescription,
                                            enText: columnRewardsRecord
                                                .rewardDescriptionEn,
                                            kyText: columnRewardsRecord
                                                .rewardDescriptionKg,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Gerbera',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (columnRewardsRecord
                                                    .pointsNeeded <=
                                                valueOrDefault(
                                                    currentUserDocument?.score,
                                                    0)) {
                                              FFAppState().reward =
                                                  columnRewardsRecord.reference;
                                              unawaited(
                                                () async {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'collected_rewards':
                                                            FieldValue
                                                                .arrayUnion([
                                                          FFAppState().reward
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                }(),
                                              );
                                              unawaited(
                                                () async {
                                                  await FFAppState()
                                                      .reward!
                                                      .update(
                                                          createRewardsRecordData(
                                                        used: true,
                                                        usedDate:
                                                            getCurrentTimestamp,
                                                        usedBy:
                                                            currentUserReference,
                                                      ));
                                                }(),
                                              );

                                              context.pushNamed(
                                                'ViewReward',
                                                queryParameters: {
                                                  'reward': serializeParam(
                                                    FFAppState().reward,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          },
                                          child: Text(
                                            columnRewardsRecord.pointsNeeded >
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.score,
                                                        0)
                                                ? FFLocalizations.of(context)
                                                    .getVariableText(
                                                    ruText:
                                                        'Осталось ${(columnRewardsRecord.pointsNeeded - valueOrDefault(currentUserDocument?.score, 0)).toString()} очков',
                                                    enText:
                                                        '${(columnRewardsRecord.pointsNeeded - valueOrDefault(currentUserDocument?.score, 0)).toString()} points left to collect',
                                                    kyText:
                                                        'Топтоого ${(columnRewardsRecord.pointsNeeded - valueOrDefault(currentUserDocument?.score, 0)).toString()} упай калды',
                                                  )
                                                : FFLocalizations.of(context)
                                                    .getVariableText(
                                                    ruText: 'Получить награду',
                                                    enText: 'Receive an award',
                                                    kyText: 'Сыйлык алуу',
                                                  ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Golos',
                                                  color: columnRewardsRecord
                                                              .pointsNeeded >
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.score,
                                                              0)
                                                      ? Color(0xFF06112E)
                                                      : Color(0xFF53B153),
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
