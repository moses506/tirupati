import 'package:dio/dio.dart';

/*class BodyLogin {
  BodyLogin({

    String? mobile,
    String? password,
    String? deviceId,
    String? deviceInfo
  }) {
    _email = email;
    _mobile = email;
    _password = password;
    _deviceId = deviceId;
    _deviceInfo = deviceInfo;
  }

  BodyLogin.fromJson(dynamic json) {
    _email = json['email'];
    _mobile = json['mobile'];
    _password = json['password'];
    _deviceId = json['device_id'];
    _deviceInfo = json['device_info'];
  }

  String? _email;
  String? _mobile;
  String? _password;
  String? _deviceId;
  String? _deviceInfo;

  String? get email => _email;

  String? get password => _password;

  String? get deviceId => _deviceId;

  String? get deviceInfo => _deviceInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['password'] = _password;
    map['device_id'] = _deviceId;
    map['device_info'] = _deviceInfo;
    return map;
  }
}*/

class BodyLogin {
  BodyLogin({
    String? request,
    String? header,
    String? mobile,
    String? password,
    String? deviceId,
    String? deviceInfo,
  }) {
    _request = request;
    _header = header;
    _mobile = mobile;
    _password = password;
    _deviceId = deviceId;
    _deviceInfo = deviceInfo;
  }

  BodyLogin.fromJson(dynamic json) {
    _request = json['request'];
    _header = json['header'];
    _mobile = json['data']['mobile'];
    _password = json['data']['password'];
    _deviceId = json['data']['device_id'];
    _deviceInfo = json['data']['device_info'];
  }

  String? _request;
  String? _header;
  String? _mobile;
  String? _password;
  String? _deviceId;
  String? _deviceInfo;

  String? get request => _request;
  String? get header => _header;
  String? get mobile => _mobile;
  String? get password => _password;
  String? get deviceId => _deviceId;
  String? get deviceInfo => _deviceInfo;

  Map<String, dynamic> toJson() {
    return {
      "request": _request,
      "header": _header,
      "data": {
        "mobile": _mobile,
        "password": _password,
        if (_deviceId != null) "device_id": _deviceId,
        if (_deviceInfo != null) "device_info": _deviceInfo,
      }
    };
  }
}



class BodyVerificationCode {
  BodyVerificationCode({
    String? email,
  }) {
    _email = email;
  }

  BodyVerificationCode.fromJson(dynamic json) {
    _email = json['email'];
  }

  String? _email;

  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }
}
class BodyChangePassword {
  BodyChangePassword({
    String? email,
    String? code,
    String? password,
    String? passwordConfirmation,
  }) {
    _email = email;
    _code = code;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
  }

  BodyChangePassword.fromJson(dynamic json) {
    _email = json['email'];
    _code = json['code'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }

  String? _email;
  String? _code;
  String? _password;
  String? _passwordConfirmation;

  String? get email => _email;

  String? get code => _code;

  String? get password => _password;

  String? get passwordConfirmation => _passwordConfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['code'] = _code;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }
}

class BodyUserId {
  BodyUserId({
    int? userId,
  }) {
    _userId = userId;
  }

  BodyUserId.fromJson(dynamic json) {
    _userId = json['user_id'];
  }

  int? _userId;

  int? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    return map;
  }
}

class BodyChangePasswordProfile {
  BodyChangePasswordProfile({
    int? userId,
    String? currentPassword,
    String? password,
    String? passwordConfirmation,
  }) {
    _userId = userId;
    _currentPassword = currentPassword;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
  }

  BodyChangePasswordProfile.fromJson(dynamic json) {
    _userId = json['user_id'];
    _currentPassword = json['current_password'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }

  int? _userId;
  String? _currentPassword;
  String? _password;
  String? _passwordConfirmation;

  int? get userId => _userId;

  String? get currentPassword => _currentPassword;

  String? get password => _password;

  String? get passwordConfirmation => _passwordConfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['current_password'] = _currentPassword;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }
}


class BodyEditOfficialInfo {
  int? _userId;
  String? _name;
  String? _email;
  int? _departmentId;
  int? _designationId;
  int? _managerId;
  String? _joiningDateDb;
  String? _employeeType;
  String? _employeeId;
  String? _grade;

  int? get userId => _userId;

  String? get name => _name;

  String? get email => _email;

  int? get departmentId => _departmentId;

  int? get designationId => _designationId;

  int? get managerId => _managerId;

  String? get joiningDateDb => _joiningDateDb;

  String? get employeeType => _employeeType;

  String? get employeeId => _employeeId;

  String? get grade => _grade;

  BodyEditOfficialInfo(
      {int? userId,
      String? name,
      String? email,
      int? departmentId,
      int? designationId,
      int? managerId,
      String? joiningDateDb,
      String? employeeType,
      String? employeeId,
      String? grade}) {
    _userId = userId;
    _name = name;
    _email = email;
    _departmentId = departmentId;
    _designationId = designationId;
    _managerId = managerId;
    _joiningDateDb = joiningDateDb;
    _employeeType = employeeType;
    _employeeId = employeeId;
    _grade = grade;
  }

  BodyEditOfficialInfo.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
    _departmentId = json['department_id'];
    _designationId = json['designation_id'];
    _managerId = json['manager_id'];
    _joiningDateDb = json['joining_date_db'];
    _employeeType = json['employee_type'];
    _employeeId = json['employee_id'];
    _grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['department_id'] = _departmentId;
    map['designation_id'] = _designationId;
    map['manager_id'] = _managerId;
    map['joining_date'] = _joiningDateDb;
    map['employee_type'] = _employeeType;
    map['employee_id'] = _employeeId;
    map['grade'] = _grade;
    return map;
  }
}

/// user_id : 4
/// avatar : "File"

class BodyUploadImage {
  BodyUploadImage({
    int? userId,
    MultipartFile? avatar,
  }) {
    _userId = userId;
    _avatar = avatar;
  }

  BodyUploadImage.fromJson(dynamic json) {
    _userId = json['user_id'];
    _avatar = json['avatar'];
  }

  int? _userId;
  MultipartFile? _avatar;

  int? get userId => _userId;

  MultipartFile? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['avatar'] = _avatar;
    return map;
  }
}


class BodyEditPersonalInfo {
  int? _userId;
  String? _gender;
  String? _phone;
  String? _birthDate;
  String? _address;
  String? _nationality;
  String? _nidCardNumber;
  String? _passportNumber;
  String? _facebookLink;
  String? _linkedinLink;
  String? _instagramLink;
  String? _bloodGroup;
  MultipartFile? _nidFile;
  MultipartFile? _passportFile;

  int? get userId => _userId;

  String? get gender => _gender;

  String? get phone => _phone;

  String? get birthDate => _birthDate;

  String? get address => _address;

  String? get nationality => _nationality;

  String? get nidCardNumber => _nidCardNumber;

  String? get passportNumber => _passportNumber;

  String? get facebookLink => _facebookLink;

  String? get linkedinLink => _linkedinLink;

  String? get instagramLink => _instagramLink;

  String? get bloodGroup => _bloodGroup;

  MultipartFile? get nidFile => _nidFile;

  MultipartFile? get passportFile => _passportFile;

  BodyEditPersonalInfo(
      {int? userId,
      String? gender,
      String? phone,
      String? birthDate,
      String? address,
      String? nationality,
      String? nidCardNumber,
      String? passportNumber,
      String? maritalStatus,
      String? facebookLink,
      String? linkedinLink,
      String? instagramLink,
      String? bloodGroup,
      MultipartFile? nidFile,
      MultipartFile? passportFile}) {
    _userId = userId;
    _gender = gender;
    _phone = phone;
    _birthDate = birthDate;
    _address = address;
    _nationality = nationality;
    _nidCardNumber = nidCardNumber;
    _passportNumber = passportNumber;
    _facebookLink = facebookLink;
    _linkedinLink = linkedinLink;
    _instagramLink = instagramLink;
    _bloodGroup = bloodGroup;
    _nidFile = nidFile;
    _passportFile = passportFile;
  }

  BodyEditPersonalInfo.fromJson(dynamic json) {
    _userId = json['user_id'];
    _gender = json['gender'];
    _phone = json['phone'];
    _birthDate = json['birth_date'];
    _address = json['address'];
    _nationality = json['nationality'];
    _nidCardNumber = json['nid_card_number'];
    _passportNumber = json['passport_number'];
    _facebookLink = json['facebook_link'];
    _linkedinLink = json['linkedin_link'];
    _instagramLink = json['instagram_link'];
    _bloodGroup = json['blood_group'];
    _nidFile = json['nid_file'];
    _passportFile = json['passport_file'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['gender'] = _gender;
    map['phone'] = _phone;
    map['birth_date'] = _birthDate;
    map['address'] = _address;
    map['nationality'] = _nationality;
    map['nid_card_number'] = _nidCardNumber;
    map['passport_number'] = _passportNumber;
    map['facebook_link'] = _facebookLink;
    map['linkedin_link'] = _linkedinLink;
    map['instagram_link'] = _instagramLink;
    map['blood_group'] = _bloodGroup;
    map['nid_file'] = _nidFile;
    map['passport_file'] = _passportFile;
    return map;
  }
}


class BodyEmergencyInfo {
  String? _emergencyName;
  String? _emergencyMobileNumber;
  String? _emergencyMobileRelationship;

  String? get emergencyName => _emergencyName;

  String? get emergencyMobileNumber => _emergencyMobileNumber;

  String? get emergencyMobileRelationship => _emergencyMobileRelationship;

  BodyEmergencyInfo(
      {String? emergencyName,
      String? emergencyMobileNumber,
      String? emergencyMobileRelationship}) {
    _emergencyName = emergencyName;
    _emergencyMobileNumber = emergencyMobileNumber;
    _emergencyMobileRelationship = emergencyMobileRelationship;
  }

  BodyEmergencyInfo.fromJson(dynamic json) {
    _emergencyName = json['emergency_name'];
    _emergencyMobileNumber = json['emergency_mobile_number'];
    _emergencyMobileRelationship = json['emergency_mobile_relationship'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['emergency_name'] = _emergencyName;
    map['emergency_mobile_number'] = _emergencyMobileNumber;
    map['emergency_mobile_relationship'] = _emergencyMobileRelationship;
    return map;
  }
}


class BodyEditEmergencyInfo {
  BodyEditEmergencyInfo({
    int? userId,
    String? emergencyName,
    String? emergencyMobileNumber,
    String? emergencyMobileRelationship,
  }) {
    _userId = userId;
    _emergencyName = emergencyName;
    _emergencyMobileNumber = emergencyMobileNumber;
    _emergencyMobileRelationship = emergencyMobileRelationship;
  }

  BodyEditEmergencyInfo.fromJson(dynamic json) {
    _userId = json['user_id'];
    _emergencyName = json['emergency_name'];
    _emergencyMobileNumber = json['emergency_mobile_number'];
    _emergencyMobileRelationship = json['emergency_mobile_relationship'];
  }

  int? _userId;
  String? _emergencyName;
  String? _emergencyMobileNumber;
  String? _emergencyMobileRelationship;

  int? get userId => _userId;

  String? get emergencyName => _emergencyName;

  String? get emergencyMobileNumber => _emergencyMobileNumber;

  String? get emergencyMobileRelationship => _emergencyMobileRelationship;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['emergency_name'] = _emergencyName;
    map['emergency_mobile_number'] = _emergencyMobileNumber;
    map['emergency_mobile_relationship'] = _emergencyMobileRelationship;
    return map;
  }
}


class BodyEditFinancialInfo {
  BodyEditFinancialInfo({
    int? userId,
    String? tin,
    String? bankName,
    String? bankAccount,
  }) {
    _userId = userId;
    _tin = tin;
    _bankName = bankName;
    _bankAccount = bankAccount;
  }

  BodyEditFinancialInfo.fromJson(dynamic json) {
    _userId = json['user_id'];
    _tin = json['tin'];
    _bankName = json['bank_name'];
    _bankAccount = json['bank_account'];
  }

  int? _userId;
  String? _tin;
  String? _bankName;
  String? _bankAccount;

  int? get userId => _userId;

  String? get tin => _tin;

  String? get bankName => _bankName;

  String? get bankAccount => _bankAccount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['tin'] = _tin;
    map['bank_name'] = _bankName;
    map['bank_account'] = _bankAccount;
    return map;
  }
}

class BodyCheckIn {
  BodyCheckIn({
    int? userId,
    int? remoteModeIn,
    String? date,
    String? checkIn,
    String? checkInLocation,
    String? checkInLatitude,
    String? checkInLongitude,
    String? city,
    String? countryCode,
    String? country,
    int? shiftId,
    String? reason,
    String? qrCode,
  }) {
    _userId = userId;
    _remoteModeIn = remoteModeIn;
    _date = date;
    _checkIn = checkIn;
    _checkInLocation = checkInLocation;
    _checkInLatitude = checkInLatitude;
    _checkInLongitude = checkInLongitude;
    _city = city;
    _countryCode = countryCode;
    _country = country;
    _shiftId = shiftId;
    _reason = reason;
    _qrCode = qrCode;
  }

  BodyCheckIn.fromJson(dynamic json) {
    _userId = json['user_id'];
    _remoteModeIn = json['remote_mode_in'];
    _date = json['date'];
    _checkIn = json['check_in'];
    _checkInLocation = json['check_in_location'];
    _checkInLatitude = json['check_in_latitude'];
    _checkInLongitude = json['check_in_longitude'];
    _city = json['city'];
    _countryCode = json['country_code'];
    _country = json['country'];
    _shiftId = json['shift_id'];
    _reason = json['reason'];
    _qrCode = json['qr_scan'];
  }

  int? _userId;
  int? _remoteModeIn;
  String? _date;
  String? _checkIn;
  String? _checkInLocation;
  String? _checkInLatitude;
  String? _checkInLongitude;
  String? _city;
  String? _countryCode;
  String? _country;
  int? _shiftId;
  String? _reason;
  String? _qrCode;

  int? get userId => _userId;

  int? get remoteModeIn => _remoteModeIn;

  String? get date => _date;

  String? get checkIn => _checkIn;

  String? get checkInLocation => _checkInLocation;

  String? get checkInLatitude => _checkInLatitude;

  String? get checkInLongitude => _checkInLongitude;

  String? get city => _city;

  String? get countryCode => _countryCode;

  int? get shiftId => _shiftId;

  String? get country => _country;

  String? get reason => _reason;

  String? get qrCode => _qrCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['remote_mode_in'] = _remoteModeIn;
    map['date'] = _date;
    map['check_in'] = _checkIn;
    map['check_in_location'] = _checkInLocation;
    map['check_in_latitude'] = _checkInLatitude;
    map['check_in_longitude'] = _checkInLongitude;
    map['city'] = _city;
    map['country_code'] = _countryCode;
    map['country'] = _country;
    map['shift_id'] = _shiftId;
    map['reason'] = _reason;
    map['qr_scan'] = _qrCode;
    return map;
  }
}


class BodyLateReason {
  BodyLateReason({
    String? type,
    String? reason,
  }) {
    _type = type;
    _reason = reason;
  }

  BodyLateReason.fromJson(dynamic json) {
    _type = json['type'];
    _reason = json['reason'];
  }

  String? _type;
  String? _reason;

  String? get type => _type;

  String? get reason => _reason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['reason'] = _reason;
    return map;
  }
}


class BodyCheckOut {
  BodyCheckOut({
    int? userId,
    int? remoteModeOut,
    String? date,
    String? checkOut,
    String? checkOutLocation,
    String? checkOutLatitude,
    String? checkOutLongitude,
    String? city,
    String? countryCode,
    String? country,
    int? shiftId,
    String? reason
  }) {
    _userId = userId;
    _remoteModeOut = remoteModeOut;
    _date = date;
    _checkOut = checkOut;
    _checkOutLocation = checkOutLocation;
    _checkOutLatitude = checkOutLatitude;
    _checkOutLongitude = checkOutLongitude;
    _city = city;
    _countryCode = countryCode;
    _shiftId = shiftId;
    _country = country;
    _reason = reason;
  }

  BodyCheckOut.fromJson(dynamic json) {
    _userId = json['user_id'];
    _remoteModeOut = json['remote_mode_out'];
    _date = json['date'];
    _checkOut = json['check_out'];
    _checkOutLocation = json['check_out_location'];
    _checkOutLatitude = json['check_out_latitude'];
    _checkOutLongitude = json['check_out_longitude'];
    _city = json['city'];
    _countryCode = json['country_code'];
    _shiftId = json['shift_id'];
    _country = json['country'];
    _reason = json['reason'];
  }

  int? _userId;
  int? _remoteModeOut;
  String? _date;
  String? _checkOut;
  String? _checkOutLocation;
  String? _checkOutLatitude;
  String? _checkOutLongitude;
  String? _city;
  String? _countryCode;
  int? _shiftId;
  String? _country;
  String? _reason;

  int? get userId => _userId;

  int? get remoteModeOut => _remoteModeOut;

  String? get date => _date;

  String? get checkOut => _checkOut;

  String? get checkOutLocation => _checkOutLocation;

  String? get checkOutLatitude => _checkOutLatitude;

  String? get checkOutLongitude => _checkOutLongitude;

  String? get city => _city;

  String? get countryCode => _countryCode;

  int? get shiftId => _shiftId;

  String? get country => _country;

  String? get reason => _reason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['remote_mode_out'] = _remoteModeOut;
    map['date'] = _date;
    map['check_out'] = _checkOut;
    map['check_out_location'] = _checkOutLocation;
    map['check_out_latitude'] = _checkOutLatitude;
    map['check_out_longitude'] = _checkOutLongitude;
    map['city'] = _city;
    map['country_code'] = _countryCode;
    map['country'] = _country;
    map['shift_id'] = shiftId;
    map['reason'] = _reason;
    return map;
  }
}



class BodyLeaveRequest {
  BodyLeaveRequest({
    int? userId,
    String? month,}){
    _userId = userId;
    _month = month;
  }

  BodyLeaveRequest.fromJson(dynamic json) {
    _userId = json['user_id'];
    _month = json['month'];
  }
  int? _userId;
  String? _month;

  int? get userId => _userId;
  String? get month => _month;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['month'] = _month;
    return map;
  }

}

class BodyAttendanceReport {
  BodyAttendanceReport({
    String? month,
  }) {
    _month = month;
  }

  BodyAttendanceReport.fromJson(dynamic json) {
    _month = json['month'];
  }

  String? _month;

  String? get month => _month;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = _month;
    return map;
  }
}


class BodyCreateVisit {
  BodyCreateVisit({
    String? date,
    String? title,
    String? description,
    int? userId,
  }) {
    _date = date;
    _title = title;
    _description = description;
    _userId = userId;
  }

  BodyCreateVisit.fromJson(dynamic json) {
    _date = json['date'];
    _title = json['title'];
    _description = json['description'];
    _userId = json['user_id'];
  }

  String? _date;
  String? _title;
  String? _description;
  int? _userId;

  String? get date => _date;

  String? get title => _title;

  String? get description => _description;

  int? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['title'] = _title;
    map['description'] = _description;
    map['user_id'] = _userId;
    return map;
  }
}

class BodyUpdateVisit {
  BodyUpdateVisit({
    String? title,
    String? description,
    int? id,
  }) {
    _title = title;
    _description = description;
    _id = id;
  }

  BodyUpdateVisit.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    _id = json['id'];
  }

  String? _title;
  String? _description;
  int? _id;

  String? get title => _title;

  String? get description => _description;

  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['id'] = _id;
    return map;
  }
}

class BodyCreateNote {
  BodyCreateNote({
    int? visitId,
    String? note,}){
    _visitId = visitId;
    _note = note;
  }

  BodyCreateNote.fromJson(dynamic json) {
    _visitId = json['visit_id'];
    _note = json['note'];
  }
  int? _visitId;
  String? _note;

  int? get visitId => _visitId;
  String? get note => _note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['visit_id'] = _visitId;
    map['note'] = _note;
    return map;
  }

}


class BodyRescheduleVisit {
  BodyRescheduleVisit({
    int? visitId,
    String? date,
    String? latitude,
    String? longitude,
    String? note,}){
    _visitId = visitId;
    _date = date;
    _latitude = latitude;
    _longitude = longitude;
    _note = note;
  }

  BodyRescheduleVisit.fromJson(dynamic json) {
    _visitId = json['visit_id'];
    _date = json['date'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _note = json['note'];
  }
  int? _visitId;
  String? _date;
  String? _latitude;
  String? _longitude;
  String? _note;

  int? get visitId => _visitId;
  String? get date => _date;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get note => _note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['visit_id'] = _visitId;
    map['date'] = _date;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['note'] = _note;
    return map;
  }

}

class BodyCancelVisit {
  BodyCancelVisit({
    int? visitId,
    String? status,
    String? latitude,
    String? longitude,
    String? cancelNote,}){
    _visitId = visitId;
    _status = status;
    _latitude = latitude;
    _longitude = longitude;
    _cancelNote = cancelNote;
  }

  BodyCancelVisit.fromJson(dynamic json) {
    _visitId = json['visit_id'];
    _status = json['status'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _cancelNote = json['cancel_note'];
  }
  int? _visitId;
  String? _status;
  String? _latitude;
  String? _longitude;
  String? _cancelNote;

  int? get visitId => _visitId;
  String? get status => _status;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get cancelNote => _cancelNote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['visit_id'] = _visitId;
    map['status'] = _status;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['cancel_note'] = _cancelNote;
    return map;
  }

}



class BodySupportCreate {
  BodySupportCreate({
    String? subject,
    String? description,
    int? priorityId,}){
    _subject = subject;
    _description = description;
    _priorityId = priorityId;
  }

  BodySupportCreate.fromJson(dynamic json) {
    _subject = json['subject'];
    _description = json['description'];
    _priorityId = json['priority_id'];
  }
  String? _subject;
  String? _description;
  int? _priorityId;

  String? get subject => _subject;
  String? get description => _description;
  int? get priorityId => _priorityId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subject'] = _subject;
    map['description'] = _description;
    map['priority_id'] = _priorityId;
    return map;
  }

}


class BodySupportTicket {
  BodySupportTicket({
    String? type,
    String? month,}){
    _type = type;
    _month = month;
  }

  BodySupportTicket.fromJson(dynamic json) {
    _type = json['type'];
    _month = json['month'];
  }
  String? _type;
  String? _month;

  String? get type => _type;
  String? get month => _month;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['month'] = _month;
    return map;
  }

}



class BodyBreakTime {
  BodyBreakTime({
    String? time,}){
    _time = time;
  }

  BodyBreakTime.fromJson(dynamic json) {
    _time = json['time'];
  }
  String? _time;

  String? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    return map;
  }

}

class BodyChangeStatus {
  BodyChangeStatus({
    int? visitId,
    String? status,
    String? latitude,
    String? longitude,
    String? cancelNote,}){
    _visitId = visitId;
    _status = status;
    _latitude = latitude;
    _longitude = longitude;
    _cancelNote = cancelNote;
  }

  BodyChangeStatus.fromJson(dynamic json) {
    _visitId = json['visit_id'];
    _status = json['status'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _cancelNote = json['cancel_note'];
  }
  int? _visitId;
  String? _status;
  String? _latitude;
  String? _longitude;
  String? _cancelNote;

  int? get visitId => _visitId;
  String? get status => _status;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get cancelNote => _cancelNote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['visit_id'] = _visitId;
    map['status'] = _status;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['cancel_note'] = _cancelNote;
    return map;
  }

}


class BodyCreateAppreciate {
  BodyCreateAppreciate({
    int? appreciateTo,
    String? message,}){
    _appreciateTo = appreciateTo;
    _message = message;
  }

  BodyCreateAppreciate.fromJson(dynamic json) {
    _appreciateTo = json['appreciate_to'];
    _message = json['message'];
  }
  int? _appreciateTo;
  String? _message;
  BodyCreateAppreciate copyWith({  int? appreciateTo,
    String? message,
  }) => BodyCreateAppreciate(  appreciateTo: appreciateTo ?? _appreciateTo,
    message: message ?? _message,
  );
  int? get appreciateTo => _appreciateTo;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appreciate_to'] = _appreciateTo;
    map['message'] = _message;
    return map;
  }

}



class BodyBreakReport {
  BodyBreakReport({
    String? date,
    int? userId,}){
    _date = date;
    _userId = userId;
  }

  BodyBreakReport.fromJson(dynamic json) {
    _date = json['date'];
    _userId = json['user_id'];
  }
  String? _date;
  int? _userId;

  String? get date => _date;
  int? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['user_id'] = _userId;
    return map;
  }

}

class BodyToken {
  BodyToken({
    String? token,}){
    _token = token;
  }

  BodyToken.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}