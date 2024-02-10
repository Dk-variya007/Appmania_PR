import 'package:flutter/material.dart';
import '../../route_utills.dart';

Widget productCard({
  required Size size,
  required Map<String, dynamic> product,
  required BuildContext context,
}) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      //ProductCard
      GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            MyRoutes.detailPage,
            arguments: product,
          );
        },
        child: Container(
          height: size.height * 0.25,
          width: size.width * 0.3,
          margin: const EdgeInsets.only(
            right: 5,
            bottom: 10,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.teal.shade100,
            boxShadow: const [
              BoxShadow(
                color: Colors.brown,
                blurRadius: 7,
                offset: Offset(3, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade200,
                  image: DecorationImage(
                    image: NetworkImage(
                      product['thumbnail'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                product['title'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                product['category'],
              ),
              Row(
                children: [
                  Text(
                    "${product['price']}/",
                    style: const TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 1.5,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                      "\$${((product['price'] - (product['price'] * product['discountPercentage'] / 100)).toString().split('.')[0])}"),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      //Label
      Positioned(
        right: 5,
        child: Container(
          height: size.height * 0.02,
          width: size.width * 0.09,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
            ),
          ),
          alignment: const Alignment(1, 0),
          child: Text(
            "-${product['discountPercentage']}%",
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}
