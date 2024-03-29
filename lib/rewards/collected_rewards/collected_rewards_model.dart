import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_collected_rewards_list/empty_collected_rewards_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'collected_rewards_widget.dart' show CollectedRewardsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CollectedRewardsModel extends FlutterFlowModel<CollectedRewardsWidget> {
  ///  Local state fields for this page.

  List<RewardsRecord> pageRewards = [];
  void addToPageRewards(RewardsRecord item) => pageRewards.add(item);
  void removeFromPageRewards(RewardsRecord item) => pageRewards.remove(item);
  void removeAtIndexFromPageRewards(int index) => pageRewards.removeAt(index);
  void insertAtIndexInPageRewards(int index, RewardsRecord item) =>
      pageRewards.insert(index, item);
  void updatePageRewardsAtIndex(int index, Function(RewardsRecord) updateFn) =>
      pageRewards[index] = updateFn(pageRewards[index]);

  List<PromocodesRecord> pagePromocodes = [];
  void addToPagePromocodes(PromocodesRecord item) => pagePromocodes.add(item);
  void removeFromPagePromocodes(PromocodesRecord item) =>
      pagePromocodes.remove(item);
  void removeAtIndexFromPagePromocodes(int index) =>
      pagePromocodes.removeAt(index);
  void insertAtIndexInPagePromocodes(int index, PromocodesRecord item) =>
      pagePromocodes.insert(index, item);
  void updatePagePromocodesAtIndex(
          int index, Function(PromocodesRecord) updateFn) =>
      pagePromocodes[index] = updateFn(pagePromocodes[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in CollectedRewards widget.
  List<PromocodesRecord>? loadedPromocodes;
  // Stores action output result for [Firestore Query - Query a collection] action in CollectedRewards widget.
  List<RewardsRecord>? loadedRewards;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
