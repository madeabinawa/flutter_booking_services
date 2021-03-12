// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    this.meta,
    this.data,
  });

  final Meta? meta;
  final Data? data;

  Customer copyWith({
    Meta? meta,
    Data? data,
  }) =>
      Customer(
        meta: meta ?? this.meta,
        data: data ?? this.data,
      );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.token,
    this.tokenType,
    this.user,
  });

  final String? token;
  final String? tokenType;
  final User? user;

  Data copyWith({
    User? user,
  }) =>
      Data(
        user: user ?? this.user,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        tokenType: json["token_type"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "user": user?.toJson(),
      };
}

class User {
  final int? id;
  final String? email;
  final String? profileType;
  final int? profileId;
  final Profile? profile;

  User({
    this.id,
    this.email,
    this.profileType,
    this.profileId,
    this.profile,
  });

  User copyWith({
    int? id,
    String? email,
    String? profileType,
    int? profileId,
    Profile? profile,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        profileType: profileType ?? this.profileType,
        profileId: profileId ?? this.profileId,
        profile: profile ?? this.profile,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        profileType: json["profile_type"],
        profileId: json["profile_id"],
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "profile_type": profileType,
        "profile_id": profileId,
        "profile": profile?.toJson(),
      };
}

class Profile {
  final int? id;
  final String? phone;
  final String? address;
  final String? city;
  final String? priority;
  final int? assistantId;
  final String? name;
  final Assistant? assistant;

  Profile({
    this.id,
    this.phone,
    this.address,
    this.city,
    this.priority,
    this.assistantId,
    this.name,
    this.assistant,
  });

  Profile copyWith({
    int? id,
    String? phone,
    String? address,
    String? city,
    String? priority,
    int? assistantId,
    String? name,
    Assistant? assistant,
  }) =>
      Profile(
        id: id ?? this.id,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        city: city ?? this.city,
        priority: priority ?? this.priority,
        assistantId: assistantId ?? this.assistantId,
        name: name ?? this.name,
        assistant: assistant ?? this.assistant,
      );

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        phone: json["phone"],
        address: json["address"],
        city: json["city"],
        priority: json["priority"],
        assistantId: json["assistant_id"],
        name: json["name"],
        assistant: Assistant.fromJson(json["assistant"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "address": address,
        "city": city,
        "priority": priority,
        "assistant_id": assistantId,
        "name": name,
        "assistant": assistant?.toJson(),
      };
}

class Assistant {
  final int? id;
  final String? phone;
  final String? address;
  final String? city;
  final String? name;

  Assistant({
    this.id,
    this.phone,
    this.address,
    this.city,
    this.name,
  });

  factory Assistant.fromJson(Map<String, dynamic> json) => Assistant(
        id: json["id"],
        phone: json["phone"],
        address: json["address"],
        city: json["city"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "address": address,
        "city": city,
        "name": name,
      };
}

class Meta {
  Meta({
    this.code,
    this.status,
    this.message,
  });

  final int? code;
  final String? status;
  final String? message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
