class TaskModles{
  //propertey
  String? title;
  String? subtitle;
  int? teskId;
  //constrctor
  TaskModles({this.subtitle,this.title});
  //fanction to json $ from json
  TaskModles.fromjson(Map<String,dynamic>json){
    title=json['title'];
    subtitle=json['subtitle'];
    teskId=json['id'];
  }
  

}