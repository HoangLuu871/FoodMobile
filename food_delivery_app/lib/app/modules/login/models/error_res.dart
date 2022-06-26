import 'dart:convert';

ErrorResp errorRespFromJson(String str) => ErrorResp.fromJson(json.decode(str));

String errorRespToJson(ErrorResp data) => json.encode(data.toJson());

class ErrorResp {
  ErrorResp({
    required this.error,
  });

  Error error;

  factory ErrorResp.fromJson(Map<String, dynamic> json) => ErrorResp(
    error: Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error.toJson(),
  };
}

class Error {
  Error({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
