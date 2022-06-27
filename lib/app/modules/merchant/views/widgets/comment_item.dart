import 'package:flutter/material.dart';

import '../../models/comment_item_model.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key, this.item}) : super(key: key);
  final CommentItemModel? item;
  @override
  Widget build(BuildContext context) {
    double numOfStar = double.parse(item!.rate!);
    int star = numOfStar.toInt();
    return Container(
        padding: EdgeInsets.only(left: 10, top: 10),
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Color(0xFFe8e8e8)),
            ),
            color: Colors.white
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage(item!.urlImage!),
                      fit: BoxFit.fill,
                    )
                )
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                child: Text(item!.name!, style: TextStyle(fontSize: 18),)
                            ),
                            Container(
                                height: 30,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    for (var i = 0; i < star; i++) Icon(Icons.star, color: Colors.yellow, size: 20),
                                  ],
                                )
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(item!.comment!, style: TextStyle(fontSize: 16),)
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(item!.date! + " " + item!.time!),
                      )
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}
