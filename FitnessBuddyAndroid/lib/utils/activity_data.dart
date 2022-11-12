Activity? activity;

class Activity {
  String activityName;
  String activityDescription;
  num activitySets;
  String activityImage;
  String activityVideo;

  Activity({
    required this.activityName,
    required this.activityDescription,
    required this.activitySets,
    required this.activityImage,
    required this.activityVideo
  });

  static Activity fromJson(Map<String, dynamic> data) => Activity(
      activityName: data['name'],
      activityDescription: data['description'],
      activitySets: data['sets'],
      activityImage: data['image'],
      activityVideo: data['video']
  );
}