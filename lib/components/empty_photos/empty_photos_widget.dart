import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_photos_model.dart';
export 'empty_photos_model.dart';

class EmptyPhotosWidget extends StatefulWidget {
  const EmptyPhotosWidget({super.key});

  @override
  State<EmptyPhotosWidget> createState() => _EmptyPhotosWidgetState();
}

class _EmptyPhotosWidgetState extends State<EmptyPhotosWidget> {
  late EmptyPhotosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPhotosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Icon(
        Icons.photo_outlined,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 56.0,
      ),
    );
  }
}
