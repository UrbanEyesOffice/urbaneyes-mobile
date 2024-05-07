import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'leaderboard_user_model.dart';
export 'leaderboard_user_model.dart';

class LeaderboardUserWidget extends StatefulWidget {
  const LeaderboardUserWidget({
    super.key,
    required this.userName,
    required this.userPoints,
    required this.position,
  });

  final String? userName;
  final int? userPoints;
  final int? position;

  @override
  State<LeaderboardUserWidget> createState() => _LeaderboardUserWidgetState();
}

class _LeaderboardUserWidgetState extends State<LeaderboardUserWidget> {
  late LeaderboardUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaderboardUserModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.position == 0)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/gold.png',
              width: 30.0,
              height: 30.0,
              fit: BoxFit.cover,
            ),
          ),
        if (widget.position == 1)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/silver.png',
              width: 30.0,
              height: 30.0,
              fit: BoxFit.cover,
            ),
          ),
        if (widget.position == 2)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/bronze.png',
              width: 30.0,
              height: 30.0,
              fit: BoxFit.cover,
            ),
          ),
        if (widget.position! > 2)
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(),
            child: Visibility(
              visible: widget.position! > 2,
              child: Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    ((widget.position!) + 1).toString(),
                    '-',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ),
          ),
        Expanded(
          child: Text(
            valueOrDefault<String>(
              widget.userName,
              '-',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: false,
                ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              valueOrDefault<String>(
                widget.userPoints?.toString(),
                '-',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'uorthmv0' /* xp */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ],
        ),
      ]
          .divide(SizedBox(width: 4.0))
          .addToStart(SizedBox(width: 16.0))
          .addToEnd(SizedBox(width: 16.0)),
    );
  }
}
