class CalEvent {
  String title = '';
  DateTime selectedDay = DateTime.now();

  CalEvent({
    required this.title,
    required this.selectedDay,
  });

  @override
  String toString() => title;

  Map<String, dynamic> toJson() {
    return {
      "day": selectedDay.toString(),
      "eventTitle": title,
    };
  }

  CalEvent.fromJson(Map<String, dynamic> data) {
    selectedDay = DateTime.tryParse(data["day"])??DateTime.now();
    title = data["eventTitle"] ?? "Nothing was fetched";
  }
}
