class Car {
  int id;
  int inStock; //sqlite doesnt have booleans
  int isLastSold;
  int listID;
  String name;
  String model;
  double price;
  int year;
  String brand;
  int km;
  int isNew;
  int isAuto;
  int color;
  String image;

  Car(
      {this.id,
      this.inStock,
      this.isLastSold,
      this.listID,
      this.name,
      this.model,
      this.price,
      this.year,
      this.brand,
      this.km,
      this.isNew,
      this.isAuto,
      this.color,
      this.image,
      });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "inStock": inStock,
      "isLastSold": isLastSold,
      "listID": listID,
      "name": name,
      "model": model,
      "price": price,
      "year": year,
      "brand": brand,
      "km": km,
      "isNew": isNew,
      "isAuto": isAuto,
      "color": color,
      "image": image,
    };
  }
}
