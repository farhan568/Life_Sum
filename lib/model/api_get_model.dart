class ApiGetModel {
  int? id = 0;
  int? userId = 0;
  String? body = "";
  String? title = "";

  ApiGetModel({
    required this.id,
    required this.userId,
    required this.body,
    required this.title,
  });

  ApiGetModel.fromJson(Map<String, dynamic> data) {
    id = data["id"] ?? 0;
    body = data["body"] ?? "Nothing was fetched";
    title = data["title"] ?? "Nothing was fetched";
    userId = data["userId"] ?? 0;
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "mealType": id,
  //     "mealCalories": body,
  //     "mealName": userId,
  //     "imgUrl": imgUrl,
  //   };
  // }
}



