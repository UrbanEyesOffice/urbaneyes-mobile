import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_collected_rewards_list/empty_collected_rewards_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'rewards_copy_model.dart';
export 'rewards_copy_model.dart';

class RewardsCopyWidget extends StatefulWidget {
  const RewardsCopyWidget({Key? key}) : super(key: key);

  @override
  _RewardsCopyWidgetState createState() => _RewardsCopyWidgetState();
}

class _RewardsCopyWidgetState extends State<RewardsCopyWidget> {
  late RewardsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RewardsCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loadedRewards = await queryRewardsRecordOnce(
        queryBuilder: (rewardsRecord) => rewardsRecord
            .where(
              'has_codes',
              isEqualTo: true,
            )
            .orderBy('points_needed'),
      );
      _model.filteredRewards = await actions.filterRewardsByUserId(
        _model.loadedRewards!.toList(),
        currentUserReference!,
      );
      setState(() {
        _model.pageRewards =
            _model.filteredRewards!.toList().cast<RewardsRecord>();
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
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: true,
              leading: FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 40.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'v0w111ix' /* Награды */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              actions: [
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.history_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('CollectedRewards');
                  },
                ),
                FlutterFlowIconButton(
                  borderWidth: 0.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.info_outline,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    await launchURL('http://urbaneyes.tilda.ws/promopolicy');
                  },
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: Color(0xFFE5F5E4),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
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
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          '${valueOrDefault(currentUserDocument?.score, 0).toString()} ${FFLocalizations.of(context).getVariableText(
                                            ruText: 'баллов',
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
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '2u9jp27b' /* накоплено */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final rewards = _model.pageRewards.toList();
                            if (rewards.isEmpty) {
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                child: EmptyCollectedRewardsListWidget(),
                              );
                            }
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(rewards.length,
                                    (rewardsIndex) {
                                  final rewardsItem = rewards[rewardsIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (rewardsItem.pointsNeeded <=
                                          valueOrDefault(
                                              currentUserDocument?.score, 0)) {
                                        if (rewardsItem.hasCodes == true) {
                                          var promocodesRecordReference =
                                              PromocodesRecord.collection.doc();
                                          await promocodesRecordReference
                                              .set(createPromocodesRecordData(
                                            code: rewardsItem.unusedCodes.first,
                                            usedBy: currentUserReference,
                                            usedDate: getCurrentTimestamp,
                                            reward: rewardsItem.reference,
                                          ));
                                          _model.usedPromocode = PromocodesRecord
                                              .getDocumentFromData(
                                                  createPromocodesRecordData(
                                                    code: rewardsItem
                                                        .unusedCodes.first,
                                                    usedBy:
                                                        currentUserReference,
                                                    usedDate:
                                                        getCurrentTimestamp,
                                                    reward:
                                                        rewardsItem.reference,
                                                  ),
                                                  promocodesRecordReference);

                                          await rewardsItem.reference.update({
                                            ...createRewardsRecordData(
                                              hasCodes: rewardsItem
                                                      .unusedCodes.length >
                                                  1,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'unused_codes':
                                                    FieldValue.arrayRemove([
                                                  _model.usedPromocode?.code
                                                ]),
                                                'used_by':
                                                    FieldValue.arrayUnion(
                                                        [currentUserReference]),
                                              },
                                            ),
                                          });

                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'collected_rewards':
                                                    FieldValue.arrayUnion([
                                                  rewardsItem.reference
                                                ]),
                                              },
                                            ),
                                          });

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            score: valueOrDefault(
                                                    currentUserDocument?.score,
                                                    0) -
                                                rewardsItem.pointsNeeded,
                                          ));
                                          setState(() {
                                            _model.removeFromPageRewards(
                                                rewardsItem);
                                          });

                                          context.pushNamed(
                                            'ViewReward',
                                            queryParameters: {
                                              'reward': serializeParam(
                                                rewardsItem,
                                                ParamType.Document,
                                              ),
                                              'promocode': serializeParam(
                                                _model.usedPromocode,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'reward': rewardsItem,
                                              'promocode': _model.usedPromocode,
                                            },
                                          );
                                        }
                                      }

                                      setState(() {});
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  CircularPercentIndicator(
                                                percent: () {
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.score,
                                                          0) <=
                                                      rewardsItem
                                                          .pointsNeeded) {
                                                    return (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.score,
                                                                0)
                                                            .toDouble() /
                                                        rewardsItem.pointsNeeded
                                                            .toDouble());
                                                  } else if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.score,
                                                          0) >
                                                      rewardsItem
                                                          .pointsNeeded) {
                                                    return 1.0;
                                                  } else {
                                                    return 0.0;
                                                  }
                                                }(),
                                                radius: 25.0,
                                                lineWidth: 4.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    Color(0xFF53B153),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                center: Text(
                                                  rewardsItem.pointsNeeded
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 6.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      ruText: rewardsItem
                                                          .rewardName,
                                                      enText: rewardsItem
                                                          .rewardNameEn,
                                                      kyText: rewardsItem
                                                          .rewardNameKg,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Golos',
                                                          color:
                                                              Color(0xFFA9ABAF),
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 6.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      ruText: rewardsItem
                                                          .rewardDescription,
                                                      enText: rewardsItem
                                                          .rewardDescriptionEn,
                                                      kyText: rewardsItem
                                                          .rewardDescriptionKg,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Gerbera',
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  )),
                                                ),
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    rewardsItem.pointsNeeded >
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.score,
                                                                0)
                                                        ? FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                            ruText:
                                                                'Осталось ${(rewardsItem.pointsNeeded - valueOrDefault(currentUserDocument?.score, 0)).toString()} очков',
                                                            enText:
                                                                '${(rewardsItem.pointsNeeded - valueOrDefault(currentUserDocument?.score, 0)).toString()} points left to collect',
                                                            kyText:
                                                                'Топтоого ${(rewardsItem.pointsNeeded - valueOrDefault(currentUserDocument?.score, 0)).toString()} упай калды',
                                                          )
                                                        : FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                            ruText:
                                                                'Получить награду',
                                                            enText:
                                                                'Receive an award',
                                                            kyText:
                                                                'Сыйлык алуу',
                                                          ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Golos',
                                                          color: rewardsItem
                                                                      .pointsNeeded >
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.score,
                                                                      0)
                                                              ? Color(
                                                                  0xFF06112E)
                                                              : Color(
                                                                  0xFF53B153),
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  );
                                }).divide(SizedBox(height: 16.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 24.0))
                        .addToStart(SizedBox(height: 32.0)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
