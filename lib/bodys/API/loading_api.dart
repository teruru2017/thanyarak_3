//@dart = 2.9
import 'dart:convert';

class loadingapi {
  String accessToken;
  String tokenType;
  int expiresIn;
  loadingapi({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  factory loadingapi.fromJson(Map<String, dynamic> json) {
    return loadingapi(
      accessToken: json["access_token"] == null ? null : json["access_token"],
      tokenType: json["token_type"] == null ? null : json["token_type"],
      expiresIn: json["expires_in"] == null ? null : json["expires_in"],
    );
  }
}
