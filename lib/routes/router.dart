import 'package:flutter/material.dart';

import './routing_constants.dart';

import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/number_registration_screen.dart';
// import '../screens/main_menu_screen.dart';
import '../screens/splashcontent_screen.dart';
import '../screens/preferences_screen.dart';
import '../screens/demographic_screen.dart';
import '../screens/chief_complaint_screen.dart';
import '../screens/present_illness_painter_screen.dart';
import '../screens/present_illness_screen.dart';
import '../screens/childhood_illness_screen.dart';
import '../screens/adult_illness_screen.dart';
import '../screens/history_of_immunization_screen.dart';
import '../screens/family_history_screen.dart';
import '../screens/personal_social_history.dart';
import '../screens/functional_history_screen.dart';
import '../screens/review_systems_one_screen.dart';
import '../screens/review_systems_two_screen.dart';
import '../screens/review_systems_three_screen.dart';
// import '../screens/select_patient_screen.dart';
import '../screens/summary_screen.dart';
import '../screens/present_illness_summary_screen.dart';
import '../screens/submission_screen.dart';
// import '../screens/recent_data_screen.dart';
// import '../screens/review_screen.dart';
import '../screens/appointment_list_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashContentScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const SplashContentScreen());
    case loginScreenRoute:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case registrationScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const RegistrationScreen());
    case numberRegistrationScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const NumberRegistrationScreen());
    // case mainMenuScreenRoute:
    //   return MaterialPageRoute(builder: (context) => const MainMenuScreen());
    case preferencesScreenRoute:
      return MaterialPageRoute(builder: (context) => const PreferencesScreen());
    case demographicScreenRoute:
      return MaterialPageRoute(builder: (context) => const DemographicScreen());
    case chiefComplaintScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const ChiefComplaintScreen());
    case presentIllnessPainterScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const PresentIllnessPainterScreen());
    case presentIllnessScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const PresentIllnessScreen());
    case childhoodIllnessScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const ChildIllnessScreen());
    case adultIllnessScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const AdultIllnessScreen());
    case historyOfImmunizationScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const HistoryOfImmunizationScreen());
    case familyHistoryScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const FamilyHistoryScreen());
    case personalSocialHistoryScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const PersonalSocialHistoryScreen());
    case functionalHistoryScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const FunctionalHistoryScreen());
    case reviewSystemsOneScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const ReviewSystemsOneScreen());
    case reviewSystemsTwoScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const ReviewSystemsTwoScreen());
    case reviewSystemsThreeScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const ReviewSystemsThreeScreen());
    // case selectPatientScreenRoute:
    //   return MaterialPageRoute(
    //       builder: (contenxt) => const SelectPatientScreen());
    case summaryScreenRoute:
      return MaterialPageRoute(builder: (context) => const SummaryScreen());
    case presentIllnessImageSummaryScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const PresentIllnessImageSummaryScreen());
    case loadingSubmissionScreenRoute:
      return MaterialPageRoute(builder: (context) => const SubmissionScreen());
    // case recentDataScreenRoute:
    //   return MaterialPageRoute(builder: (context) => const RecentDataScreen());
    // case reviewScreenRoute:
    //   return MaterialPageRoute(builder: (context) => const ReviewScreen());
    case appointmentListScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const AppointmentListScreen());
    default:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
  }
}
