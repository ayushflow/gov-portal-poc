import 'package:flutter/material.dart';
import 'package:gov_client_app/core/analytics/log.dart';
import 'package:gov_driving_license_portal/component/appbar/driving_learning_app_bar/driving_learning_app_bar_widget.dart';
import 'package:gov_driving_license_portal/components/form_apply_license_widget.dart';
import 'package:gov_portal_core_u_i_nav_cvlv4t/components/generic_footer_componenet_widget.dart';

class DrivingLicenseHomeScreen extends StatefulWidget {
  const DrivingLicenseHomeScreen({
    super.key,
  });

  @override
  State<DrivingLicenseHomeScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<DrivingLicenseHomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    logAnalytics('initState', {'page': 'Driving Licence Home Screen'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          DrivingLearningAppBarWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormApplyLicenseWidget(),
            ),
          ),
          GenericFooterComponenetWidget()
        ],
      ),
    );
  }
}
