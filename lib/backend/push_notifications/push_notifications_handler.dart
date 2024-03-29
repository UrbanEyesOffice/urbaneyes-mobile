import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Profile': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'AdmiPannel': ParameterData.none(),
  'AllSurveysStat': ParameterData.none(),
  'EditQuestion': (data) async => ParameterData(
        allParams: {
          'question': getParameter<DocumentReference>(data, 'question'),
        },
      ),
  'CualificatedSurvey': ParameterData.none(),
  'resetPassword': ParameterData.none(),
  'AskGeo': ParameterData.none(),
  'Feedback': ParameterData.none(),
  'HomePageCopy': (data) async => ParameterData(
        allParams: {
          'firstLogin': getParameter<bool>(data, 'firstLogin'),
        },
      ),
  'CompleteRegistration': ParameterData.none(),
  'questionCopy': (data) async => ParameterData(
        allParams: {
          'survey': await getDocumentParameter<SurveysRecord>(
              data, 'survey', SurveysRecord.fromSnapshot),
          'questionRef': getParameter<DocumentReference>(data, 'questionRef'),
          'question': getParameter<String>(data, 'question'),
          'ord': getParameter<int>(data, 'ord'),
          'location': getParameter<LatLng>(data, 'location'),
          'answers': getParameter<DocumentReference>(data, 'answers'),
          'address': getParameter<String>(data, 'address'),
        },
      ),
  'complete': (data) async => ParameterData(
        allParams: {
          'survey': await getDocumentParameter<SurveysRecord>(
              data, 'survey', SurveysRecord.fromSnapshot),
        },
      ),
  'MainAuth': ParameterData.none(),
  'CreateAccount': ParameterData.none(),
  'Verification': ParameterData.none(),
  'Login': ParameterData.none(),
  'SelectLocation': (data) async => ParameterData(
        allParams: {
          'survey': await getDocumentParameter<SurveysRecord>(
              data, 'survey', SurveysRecord.fromSnapshot),
          'questionRef': getParameter<DocumentReference>(data, 'questionRef'),
          'ord': getParameter<int>(data, 'ord'),
          'location': getParameter<LatLng>(data, 'location'),
          'optionId': getParameter<int>(data, 'optionId'),
          'titleRu': getParameter<String>(data, 'titleRu'),
          'titleKg': getParameter<String>(data, 'titleKg'),
          'titleEn': getParameter<String>(data, 'titleEn'),
          'comment': getParameter<String>(data, 'comment'),
          'questionCount': getParameter<int>(data, 'questionCount'),
          'onlyLocation': getParameter<bool>(data, 'onlyLocation'),
        },
      ),
  'ViewReward': (data) async => ParameterData(
        allParams: {
          'reward': await getDocumentParameter<RewardsRecord>(
              data, 'reward', RewardsRecord.fromSnapshot),
          'promocode': await getDocumentParameter<PromocodesRecord>(
              data, 'promocode', PromocodesRecord.fromSnapshot),
        },
      ),
  'AskPushNotifications': ParameterData.none(),
  'RewardsPage': ParameterData.none(),
  'CollectedRewards': ParameterData.none(),
  'RewardsCopy': ParameterData.none(),
  'question': (data) async => ParameterData(
        allParams: {
          'survey': await getDocumentParameter<SurveysRecord>(
              data, 'survey', SurveysRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
