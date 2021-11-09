class MealUploadModel {
  String? mealType="";
  String? mealName="";
  String? mealCalories="";
  String? imgUrl="";

  MealUploadModel({
    required this.mealType,
    required this.mealName,
    required this.mealCalories,
  });


  MealUploadModel.fromJson (Map<String, dynamic> data){
    mealType = data["Name"]??"Meal Type not defined";
    mealCalories = data["Email"]??"Calories Not defined";
    mealName = data["Email"]??"Meal Name not defined";
  }

  Map<String, dynamic> toJson () {
    return {
      "mealType": mealType,
      "mealCalories": mealCalories,
      "mealName": mealName,


    };
  }
}