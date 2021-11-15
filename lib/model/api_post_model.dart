class ApiPostModel {
  int? age = 0;
  String? firstName = "";
  String? surName = "";

  ApiPostModel({
    required this.age,
    required this.firstName,
    required this.surName,
  });

  ApiPostModel.fromJson(Map<String, dynamic> data) {
    age = data["id"] ?? 0;
    firstName = data["body"] ?? "Nothing was fetched";
    surName = data["title"] ?? "Nothing was fetched";
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "surName": surName,
      "Age": age,
    };
  }
}
