import '/backend/backend.dart';
import '/components/leaderboard_user/leaderboard_user_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'leaderboard_model.dart';
export 'leaderboard_model.dart';

class LeaderboardWidget extends StatefulWidget {
  const LeaderboardWidget({super.key});

  @override
  State<LeaderboardWidget> createState() => _LeaderboardWidgetState();
}

class _LeaderboardWidgetState extends State<LeaderboardWidget> {
  late LeaderboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaderboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Leaderboard'});
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).mainGreen),
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              'akm9ibkg' /* Таблица лидеров */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child:
              PagedListView<DocumentSnapshot<Object?>?, UsersRecord>.separated(
            pagingController: _model.setListViewController(
              UsersRecord.collection
                  .where(
                    'isTester',
                    isNotEqualTo: true,
                  )
                  .orderBy('isTester', descending: true)
                  .orderBy('score', descending: true),
            ),
            padding: EdgeInsets.zero,
            reverse: false,
            scrollDirection: Axis.vertical,
            separatorBuilder: (_, __) => SizedBox(height: 16.0),
            builderDelegate: PagedChildBuilderDelegate<UsersRecord>(
              // Customize what your widget looks like when it's loading the first page.
              firstPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).mainGreen,
                    ),
                  ),
                ),
              ),
              // Customize what your widget looks like when it's loading another page.
              newPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).mainGreen,
                    ),
                  ),
                ),
              ),

              itemBuilder: (context, _, listViewIndex) {
                final listViewUsersRecord =
                    _model.listViewPagingController!.itemList![listViewIndex];
                return Container(
                  decoration: BoxDecoration(),
                  child: LeaderboardUserWidget(
                    key: Key(
                        'Keydem_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                    userName: listViewUsersRecord.displayName,
                    userPoints: listViewUsersRecord.score,
                    position: listViewIndex,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
