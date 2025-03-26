// ignore_for_file: constant_identifier_names

class AppConstants {
  AppConstants._();

  /// google api key
  static const google_api_key = "AIzaSyCok8zhOlhS1sjVQxCLg8-pyfHtltXo7fU";
  static const google_map_Url = "https://places.googleapis.com/v1/";

  /// api url
  static const base_url = 'https://api-uat.yliqo.com/api/v1/ApiGateway';
  static const register_endPoint = '/register';
  static const send_otp_endPoint = '/sendsmsavemob';
  static const verifiy_otp_endPoint = '/verifysmsandmob';
  static const onboarding_customer_endPoint = '/onboardingcustomer';
  static const onboarding_signature_endPoint = '/onboardingsignature';
  static const save_user_face_video_endPoint = '/saveuserfacevideo';

  /// Storage keys
  static const storage_accesToken_key = "access_token";
  static const storage_customer_id_key = "customer_id";

  /// app views String
  static const business_name = "Business Name";
  static const enter_business_name = "Enter business name";
  static const business_description = "Business Description";

  /// fields names
  static const first_name_field = "First Name";
  static const last_name_field = "Last Name";
  static const gender_field = "Gender";
  static const birth_date_field = "Select DOB";
  static const address_field = "Address";
  static const city_field = "City";
  static const postal_code_field = "Postal Code";
  static const id_doc_type_field = "id_doc_type";

  static const residentail_country_field = "Residential Country";
  static const origin_country_field = "Origin Country";
}
