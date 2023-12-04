import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'rewards_copy_widget.dart' show RewardsCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class RewardsCopyModel extends FlutterFlowModel<RewardsCopyWidget> {
  ///  Local state fields for this page.

  List<RewardsRecord> pageRewards = [];
  void addToPageRewards(RewardsRecord item) => pageRewards.add(item);
  void removeFromPageRewards(RewardsRecord item) => pageRewards.remove(item);
  void removeAtIndexFromPageRewards(int index) => pageRewards.removeAt(index);
  void insertAtIndexInPageRewards(int index, RewardsRecord item) =>
      pageRewards.insert(index, item);
  void updatePageRewardsAtIndex(int index, Function(RewardsRecord) updateFn) =>
      pageRewards[index] = updateFn(pageRewards[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in RewardsCopy widget.
  List<RewardsRecord>? loadedRewards;
  // Stores action output result for [Custom Action - filterRewardsByUserId] action in RewardsCopy widget.
  List<RewardsRecord>? filteredRewards;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  PromocodesRecord? usedPromocode;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
