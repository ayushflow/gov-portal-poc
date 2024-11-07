import 'package:flutter/material.dart';
import 'package:gov_client_app/core/analytics/log.dart';
import 'package:gov_client_app/core/widget/deferred_widget.dart';
import 'package:gov_driving_license_portal/component/appbar/driving_learning_app_bar/driving_learning_app_bar_widget.dart'
    deferred as appbar;
import 'package:gov_driving_license_portal/component/widgets/continue_journey_cta/continue_journey_cta_widget.dart';
import 'package:gov_driving_license_portal/components/form_apply_license_widget.dart'
    deferred as form;
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
          DeferredWidgetBuilder(
              widgetBuilder: (_) => appbar.DrivingLearningAppBarWidget(),
              loadFunction: appbar.loadLibrary),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContinueJourneyCtaWidget(
                      onSuccess: (userJourneyId) async {
                        Navigator.of(context).pushNamed('/continue-journey');
                      },
                      onFailure: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('No journey found')));
                      },
                      journeyId: 'new-driving-license'),
                  const Divider(),
                  DeferredWidgetBuilder(
                      widgetBuilder: (_) => form.FormApplyLicenseWidget(),
                      loadFunction: form.loadLibrary)
                ],
              ),
            ),
          ),
          const GenericFooterComponenetWidget()
        ],
      ),
    );
  }
}
