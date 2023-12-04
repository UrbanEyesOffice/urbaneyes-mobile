import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_collected_rewards_list_model.dart';
export 'empty_collected_rewards_list_model.dart';

class EmptyCollectedRewardsListWidget extends StatefulWidget {
  const EmptyCollectedRewardsListWidget({Key? key}) : super(key: key);

  @override
  _EmptyCollectedRewardsListWidgetState createState() =>
      _EmptyCollectedRewardsListWidgetState();
}

class _EmptyCollectedRewardsListWidgetState
    extends State<EmptyCollectedRewardsListWidget> {
  late EmptyCollectedRewardsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyCollectedRewardsListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.card_giftcard_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 72.0,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'p4bsixoc' /* Пока нет наград.  */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'xzhuem4j' /* Проходи опросы и получай баллы... */,
            ),
            style: FlutterFlowTheme.of(context).labelMedium,
          ),
        ),
      ],
    );
  }
}
