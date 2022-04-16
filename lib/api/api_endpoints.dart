import '../configs/global.dart';

class ApiEndpoints {
  static const String saveContactUrl = Global.baseApi + 'save-contact/';
  static const String updateClientUrl = Global.baseApi + 'update-client/';
  static const String getClientUrl = Global.baseApi + 'get-client/';
  static const String addPatientUrl = Global.baseApi + 'add-patient/';
  static const String requestAccessTokenUrl =
      'https://developer.globelabs.com.ph/oauth/access_token?';
  static const String requestOtpUrl =
      'https://devapi.globelabs.com.ph/smsmessaging/v1/outbound/21663796/requests?access_token={access_token}';

  static const String getPatientsUrl = Global.baseApi + 'get-patients/';
  static const String getPatientUrl = Global.baseApi + 'get-patient/';

  // Medical Endpoints
  // Adding
  static const String addChiefComplaintUrl =
      Global.baseApi + 'add-chief-complaint/';
  static const String addPresentIllnessImage =
      Global.baseApi + 'add-present-illness-image/';
  static const String addPresentIllnessUrl =
      Global.baseApi + 'add-present-illness/';
  static const String addChildhoodIllnessUrl =
      Global.baseApi + 'add-childhood-illness/';
  static const String addAdultIllnessUrl =
      Global.baseApi + 'add-adult-illness/';
  static const String addHistoryOfImmunizationUrl =
      Global.baseApi + 'add-history-of-immunization/';
  static const String addFamilyHistoryUrl =
      Global.baseApi + 'add-family-history/';
  static const String addPersonalAndSocialHistoryUrl =
      Global.baseApi + 'add-personal-and-social-history/';
  static const String addFunctionalHistoryUrl =
      Global.baseApi + 'add-functional-history/';
  static const String addGeneralSystemUrl =
      Global.baseApi + 'add-general-system/';
  static const String addSkinProblemUrl = Global.baseApi + 'add-skin-problem/';
  static const String addHeentUrl = Global.baseApi + 'add-heent/';
  static const String addBreastUrl = Global.baseApi + 'add-breast/';
  static const String addPulmonaryUrl = Global.baseApi + 'add-pulmonary/';
  static const String addCardiovascularUrl =
      Global.baseApi + 'add-cardiovascular/';
  static const String addGastrointestinalUrl =
      Global.baseApi + 'add-gastronintestinal/';
  static const String addGenitourinaryUrl =
      Global.baseApi + 'add-genitourinary/';
  static const String addGynecologicUrl = Global.baseApi + 'add-gynecologic/';
  static const String addEndocrineUrl = Global.baseApi + 'add-endocrine/';
  static const String addMusculoskeletalUrl =
      Global.baseApi + 'add-musculoskeletal/';
  static const String addNeurologicUrl = Global.baseApi + 'add-neurologic/';

  // Medical Endpoints
  // Retrieving
  static const String getChiefComplaintUrl =
      Global.baseApi + 'get-chief-complaint/';
  static const String getPresentIllnessImageUrl =
      Global.baseApi + 'get-present-illness-image/';
  static const String getPresentIllnessUrl =
      Global.baseApi + 'get-present-illness/';
  static const String getChildhoodIllnessUrl =
      Global.baseApi + 'get-childhood-illness/';
  static const String getAdultIllnessUrl =
      Global.baseApi + 'get-adult-illness/';
  static const String getHistoryOfImmunizationUrl =
      Global.baseApi + 'get-history-of-immunization/';
  static const String getFamilyHistoryUrl =
      Global.baseApi + 'get-family-history/';
  static const String getPersonalAndSocialHistoryUrl =
      Global.baseApi + 'get-personal-and-social-history/';
  static const String getFunctionalHistoryUrl =
      Global.baseApi + 'get-functional-history/';
  static const String getGeneralSystemUrl =
      Global.baseApi + 'get-general-system/';
  static const String getSkinProblemUrl = Global.baseApi + 'get-skin-problem/';
  static const String getHeentUrl = Global.baseApi + 'get-heent/';
  static const String getBreastUrl = Global.baseApi + 'get-breast/';
  static const String getPulmonaryUrl = Global.baseApi + 'get-pulmonary/';
  static const String getCardiovascularUrl =
      Global.baseApi + 'get-cardiovascular/';
  static const String getGastrointestinalUrl =
      Global.baseApi + 'get-gastronintestinal/';
  static const String getGenitourinaryUrl =
      Global.baseApi + 'get-genitourinary/';
  static const String getGynecologicUrl = Global.baseApi + 'get-gynecologic/';
  static const String getEndocrineUrl = Global.baseApi + 'get-endocrine/';
  static const String getMusculoskeletalUrl =
      Global.baseApi + 'get-musculoskeletal/';
  static const String getNeurologicUrl = Global.baseApi + 'get-neurologic/';
  static const String getPatientData = Global.baseApi + 'get-patient-data/';

  static const String getDoctorsUrl = Global.baseApi + 'get-doctors/';
  static const String getDoctorUrl = Global.baseApi + 'get-doctor/';
  static const String getScheduleUrl = Global.baseApi + 'get-schedule/';
  static const String getSlotUrl = Global.baseApi + 'get-slot/';
  static const String getAppointmentsUrl = Global.baseApi + 'get-appointments/';
  static const String createAppointmentUrl =
      Global.baseApi + 'create-appointment/';
  static const String addPatientData = Global.baseApi + 'add-patient-data/';
  static const String cancelPatientData =
      Global.baseApi + 'cancel-patient-data/';
  static const String deleteMedicalData =
      Global.baseApi + 'delete-medical-data/';
}
