class Product {
  String? name;
  String? stockPrice;
  String? salePrice;
  String? guarantee;
  bool? isOutOfStock;
  String? unit;
  int? sold;
  String? material;
  String? type;
  List<String>? images;

  Product(
      {this.name,
      this.stockPrice,
      this.salePrice,
      this.guarantee,
      this.isOutOfStock,
      this.unit,
      this.sold,
      this.material,
      this.type,
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    stockPrice = json['stock_price'];
    salePrice = json['sale_price'];
    guarantee = json['guarantee'];
    isOutOfStock = json['is_out_of_stock'];
    unit = json['unit'];
    sold = json['sold'];
    material = json['material'];
    type = json['type'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['stock_price'] = this.stockPrice;
    data['sale_price'] = this.salePrice;
    data['guarantee'] = this.guarantee;
    data['is_out_of_stock'] = this.isOutOfStock;
    data['unit'] = this.unit;
    data['sold'] = this.sold;
    data['material'] = this.material;
    data['type'] = this.type;
    data['images'] = this.images;
    return data;
  }
}
