import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/dish.dart';
import '../view_models/cart_view_model.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;

  const DishWidget({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, value, child) => Card(
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                dish.imagePath, // substitute with your image URL
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dish.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "${dish.price}€",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(width: 25),
                        Text(dish.category),
                        const SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            final dishesToCart = context.read<CartViewModel>();
                            dishesToCart.addToCart(dish);
                          },
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
