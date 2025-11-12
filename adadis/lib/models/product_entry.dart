// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String model;
    String pk;
    Fields fields;

    ProductEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    int stock;
    int price;
    String size;
    String description;
    String thumbnail;
    String category;
    int totalSold;
    bool isFeatured;
    int? user;

    Fields({
        required this.name,
        required this.stock,
        required this.price,
        required this.size,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.totalSold,
        required this.isFeatured,
        required this.user,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        stock: json["stock"],
        price: json["price"],
        size: json["size"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        totalSold: json["total_sold"],
        isFeatured: json["is_featured"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "stock": stock,
        "price": price,
        "size": size,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "total_sold": totalSold,
        "is_featured": isFeatured,
        "user": user,
    };
}
