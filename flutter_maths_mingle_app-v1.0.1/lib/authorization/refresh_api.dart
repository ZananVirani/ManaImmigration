class Refresh {
  String? accessToken;
  String? tokenType;
  String? scope;
  int? expiresIn;
  String? refreshToken;

  Refresh({
    this.accessToken,
    this.tokenType,
    this.scope,
    this.expiresIn,
    this.refreshToken,
  });

  Refresh copyWith({
    String? accessToken,
    String? tokenType,
    String? scope,
    int? expiresIn,
    String? refreshToken,
  }) =>
      Refresh(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        scope: scope ?? this.scope,
        expiresIn: expiresIn ?? this.expiresIn,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory Refresh.fromJson(Map<String, dynamic> json) => Refresh(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        scope: json["scope"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "scope": scope,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
      };
}
