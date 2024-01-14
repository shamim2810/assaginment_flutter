import 'package:assaginment_flutter/productitem.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  product productlist = product();
  int Count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "My Bag",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: productlist.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Container(
                      height: 104,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        //color: Colors.red,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 140,
                            width: 119,
                            child: Image(
                              image: NetworkImage(
                                  productlist.data[index]["image"]),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 3.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productlist.data[index]["title"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: "Color :",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.0),
                                          children: [
                                            TextSpan(
                                              text:
                                              "${productlist.data[index]["color"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15.0),
                                            )
                                          ]),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "Size : ",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.0),
                                          children: [
                                            TextSpan(
                                              text:
                                              "${productlist.data[index]["size"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15.0),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (productlist.data[index]
                                          ["quantity"] !=
                                              1) {
                                            productlist.data[index]
                                            ["quantity"]--;
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(50),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(2, 2))
                                            ]),
                                        child: Icon(Icons.remove),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        productlist.data[index]['quantity']
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (productlist.data[index]
                                          ["quantity"] ==
                                              4) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    "Congratulations!",
                                                  ),
                                                  content: Text(
                                                      '''You have added 5 T-shirt on your bag!'''),
                                                  actions: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        width: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .width,
                                                        decoration:
                                                        BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              50.0),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "Okay",
                                                            style: TextStyle(
                                                                fontSize: 16.0,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                          productlist.data[index]["quantity"]++;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(50),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(2, 2))
                                            ]),
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert),
                              ),
                              Text(
                                "${productlist.data[index]["price"] * productlist.data[index]["quantity"]}\$",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total amount:",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    "${productlist.totalAmaunt}\$",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Center(
                    child: Text(
                      "CHECK OUT",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
