class Field {
  String name;
  String type;

  Field({
    required this.name,
    required this.type,
  });

  factory Field.fromJson(Map<String,dynamic> json){
    return Field(
        name: json["name"],
        type: json["type"],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "type": type,
    };
  }

}