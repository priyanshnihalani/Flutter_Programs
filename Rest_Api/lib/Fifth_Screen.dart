import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/Models/product_modedl.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  Future<ProductModedl> getData() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/e014a7cd-33cf-46bc-ad9c-67bf3d334ff8'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModedl.fromJson(data);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Handling Very Complex Data'),
          centerTitle: true,
        ),
        body: Expanded(
            child: FutureBuilder(
                future: getData(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: MediaQuery.of(context).size.height * .3,
                            width: MediaQuery.of(context).size.height * .1,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    snapshot.data!.data![index].images!.length,
                                itemBuilder: (context, position) {
                                  return Padding(
                                      padding: EdgeInsets.only(right: 10, bottom: 10),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .25,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(snapshot
                                                  .data!
                                                  .data![index]
                                                  .images![position]
                                                  .url
                                                  .toString()),
                                            ),
                                          )));
                                }),
                          );
                        });
                  }
                }))));
  }
}
