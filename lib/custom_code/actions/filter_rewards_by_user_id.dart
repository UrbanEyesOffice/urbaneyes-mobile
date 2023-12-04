// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

Future<List<RewardsRecord>> filterRewardsByUserId(
  List<RewardsRecord> rewards,
  DocumentReference userId,
) async {
  // Add your function code here!
  var completer = new Completer<List<RewardsRecord>>();
  final filteredRewards =
      rewards.where((element) => !element.usedBy.contains(userId)).toList();
  completer.complete(filteredRewards);
  return completer.future;
}
