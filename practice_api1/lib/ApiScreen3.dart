import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice_api1/Model/Products.dart';
import 'package:http/http.dart' as http;
class ApiScreen3 extends StatefulWidget {
  const ApiScreen3({super.key});

  @override
  State<ApiScreen3> createState() => _ApiScreen3State();
}

class _ApiScreen3State extends State<ApiScreen3> {
  List<Products> product = [];
  Future<List<Products>> getData() async{
    final response = await http.get(Uri.parse("https://fakestoreapi.com/products/category/jewelery"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200)
      {
        for(Map i in data)
          {
            product.add(Products.fromJson(i));
          }
        return product;
      }
    else
      return product;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jewellery Products"),
      ),
      body: Expanded(
        child: FutureBuilder(future: getData(), builder: (context, snapshot){
          return ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
              return Container(
                width: 500,
                height: 400,
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(product[index].image!.toString()),
                              fit: BoxFit.cover
                            )
                          )),
                           SizedBox(height: 50),
                           Text(product[index].price!.toString(), style: TextStyle(fontSize: 40),)
                    ],
                  ),
                ),
              );
          });
        }),
      )
    );
  }
}
