import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_collected_rewards_list/empty_collected_rewards_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'collected_rewards_model.dart';
export 'collected_rewards_model.dart';

class CollectedRewardsWidget extends StatefulWidget {
  const CollectedRewardsWidget({Key? key}) : super(key: key);

  @override
  _CollectedRewardsWidgetState createState() => _CollectedRewardsWidgetState();
}

class _CollectedRewardsWidgetState extends State<CollectedRewardsWidget> {
  late CollectedRewardsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CollectedRewardsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CollectedRewards'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('COLLECTED_REWARDS_CollectedRewards_ON_IN');
      // Load Promocodes
      logFirebaseEvent('CollectedRewards_LoadPromocodes');
      _model.loadedPromocodes = await queryPromocodesRecordOnce(
        queryBuilder: (promocodesRecord) => promocodesRecord
            .where(
              'used_by',
              isEqualTo: currentUserReference,
            )
            .orderBy('used_date'),
        limit: 100,
      );
      // Update page promocodes
      logFirebaseEvent('CollectedRewards_Updatepagepromocodes');
      setState(() {
        _model.pagePromocodes =
            _model.loadedPromocodes!.toList().cast<PromocodesRecord>();
      });
      // Load rewards
      logFirebaseEvent('CollectedRewards_Loadrewards');
      _model.loadedRewards = await queryRewardsRecordOnce(
        queryBuilder: (rewardsRecord) => rewardsRecord.where(
          'used_by',
          arrayContains: currentUserReference,
        ),
        limit: 100,
      );
      logFirebaseEvent('CollectedRewards_update_page_state');
      setState(() {
        _model.pageRewards =
            _model.loadedRewards!.toList().cast<RewardsRecord>();
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
        appBar: AppBar(
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
              logFirebaseEvent('COLLECTED_REWARDS_chevron_left_ICN_ON_TA');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'je6fqy4w' /* Полученные промокоды */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Builder(
              builder: (context) {
                final rewards = _model.pageRewards.toList();
                if (rewards.isEmpty) {
                  return Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    child: EmptyCollectedRewardsListWidget(),
                  );
                }
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: rewards.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16.0),
                  itemBuilder: (context, rewardsIndex) {
                    final rewardsItem = rewards[rewardsIndex];
                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Stack(
                                children: [
                                  if (_model.loadedPromocodes
                                          ?.where((e) =>
                                              e.reward == rewardsItem.reference)
                                          .toList()
                                          ?.first
                                          ?.isExpired ??
                                      true)
                                    FaIcon(
                                      FontAwesomeIcons.timesCircle,
                                      color: Color(0xFFD81D1D),
                                      size: 50.0,
                                    ),
                                  if (!_model.loadedPromocodes!
                                      .where((e) =>
                                          e.reward == rewardsItem.reference)
                                      .toList()
                                      .first
                                      .isExpired)
                                    FaIcon(
                                      FontAwesomeIcons.checkCircle,
                                      color: Color(0xFF13BE13),
                                      size: 50.0,
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getVariableText(
                                    ruText: rewardsItem.rewardName,
                                    enText: rewardsItem.rewardNameEn,
                                    kyText: rewardsItem.rewardNameKg,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Golos',
                                        color: Color(0xFFA9ABAF),
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getVariableText(
                                    ruText: rewardsItem.rewardDescription,
                                    enText: rewardsItem.rewardDescription,
                                    kyText: rewardsItem.rewardDescription,
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
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'COLLECTED_REWARDS_Text_orm4pmul_ON_TAP');
                                    logFirebaseEvent('Text_navigate_to');

                                    context.pushNamed(
                                      'ViewReward',
                                      queryParameters: {
                                        'reward': serializeParam(
                                          rewardsItem,
                                          ParamType.Document,
                                        ),
                                        'promocode': serializeParam(
                                          _model.loadedPromocodes
                                              ?.where((e) =>
                                                  e.reward ==
                                                  rewardsItem.reference)
                                              .toList()
                                              ?.first,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'reward': rewardsItem,
                                        'promocode': _model.loadedPromocodes
                                            ?.where((e) =>
                                                e.reward ==
                                                rewardsItem.reference)
                                            .toList()
                                            ?.first,
                                      },
                                    );
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getVariableText(
                                      ruText: 'Посмотреть промокод',
                                      enText: 'View promo code',
                                      kyText: 'Промокодду көрүү',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Golos',
                                          color: Color(0xFF13BE13),
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Text(
                                  () {
                                    if (_model.loadedPromocodes!
                                        .where((e) =>
                                            e.reward == rewardsItem.reference)
                                        .toList()
                                        .first
                                        .isActivated) {
                                      return FFLocalizations.of(context)
                                          .getVariableText(
                                        ruText: 'Активирован',
                                        enText: 'Activated',
                                        kyText: 'Жандырылды',
                                      );
                                    } else if (_model.loadedPromocodes!
                                        .where((e) =>
                                            e.reward == rewardsItem.reference)
                                        .toList()
                                        .first
                                        .isExpired) {
                                      return FFLocalizations.of(context)
                                          .getVariableText(
                                        ruText: 'Истек',
                                        enText: 'Expired',
                                        kyText: 'Мөөнөтү бүттү',
                                      );
                                    } else {
                                      return '';
                                    }
                                  }(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (_model.loadedPromocodes!
                                                .where((e) =>
                                                    e.reward ==
                                                    rewardsItem.reference)
                                                .toList()
                                                .first
                                                .isActivated) {
                                              return Color(0xFF13BE13);
                                            } else if (_model.loadedPromocodes!
                                                .where((e) =>
                                                    e.reward ==
                                                    rewardsItem.reference)
                                                .toList()
                                                .first
                                                .isExpired) {
                                              return Color(0xFFD81D1D);
                                            } else {
                                              return Color(0x00000000);
                                            }
                                          }(),
                                          Colors.transparent,
                                        ),
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
