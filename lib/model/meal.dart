class MealUploadModel {
  String? mealType="";
  String? mealName="";
  String? mealCalories="";
  String? imgUrl="";

  MealUploadModel({
    required this.mealType,
    required this.mealName,
    required this.mealCalories,
    this.imgUrl,
  });


  MealUploadModel.fromJson (Map<String, dynamic> data){
    mealType = data["Name"]??"Meal Type not defined";
    mealCalories = data["Email"]??"Calories Not defined";
    mealName = data["Email"]??"Meal Name not defined";
    imgUrl = data["imgUrl"];
  }

  Map<String, dynamic> toJson () {
    return {
      "mealType": mealType,
      "mealCalories": mealCalories,
      "mealName": mealName,
      "imgUrl" : imgUrl,


    };
  }
}