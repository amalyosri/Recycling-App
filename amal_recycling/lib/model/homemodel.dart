

class Homemodel{
  late bool status;
 late HomeDatamodel data;
Homemodel.fromjson(Map <String, dynamic>json){
   status = json["status"];
   data= HomeDatamodel.fromjson(json["data"]);
  }
  
}

class HomeDatamodel{
  List <Banner>banner=[];
  List <Product>products=[];
   HomeDatamodel .fromjson(Map<String,dynamic>json){
    json["banners"].forEach((element){
     banner.add(Banner.fromjson(element) );
    });

    json["products"].forEach((element){
     products.add(Product.fromjson(element));
    });

   }

}

class Banner{
 late int id;
 late String image;
  Banner.fromjson(Map<String,dynamic>json){
    id=json["id"];
    image=json["image"];

  }

}
class Product{
late int id;
late dynamic price;
late dynamic oldprice;
late dynamic discount;
late String image;
late String name;
late bool infavorint;
late bool incart;
Product.fromjson(Map<String,dynamic>json){
  id=json["id"];
   price=json["price"];
    oldprice=json["old_price"];
     discount=json["discount"];
      image=json["image"];
       name=json["name"];
        infavorint=json["in_favorites"];
         incart=json["in_cart"];
  

}



}