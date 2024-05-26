import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/cart_view_model.dart';


import 'dish.dart';

class CartItemWidget extends StatelessWidget {

  final Dish dish;
  final int count;
  final void Function(Dish) increase;
  final void Function(Dish) decrease;


  CartItemWidget({
    super.key,
    required this.dish,
    required this.count,
    required this.increase,
    required this.decrease,
  });

   @override
   Widget build(BuildContext context) {
     return Container(
       padding: EdgeInsets.all(16.0),
       decoration: BoxDecoration(
         color: Colors.grey[200],
         borderRadius: BorderRadius.circular(8.0),
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 dish.name,
                 style: TextStyle(
                   fontSize: 16.0,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               SizedBox(height: 8.0),
               Text(
                 'Unit price: ${dish.price} €',
                 style: TextStyle(
                   fontSize: 14.0,
                   color: Colors.grey[600],
                 ),
               ),
               SizedBox(height: 4.0),
               Text(
                 'Quantity: ${count}',
                 style: TextStyle(
                   fontSize: 14.0,
                   color: Colors.grey[600],
                 ),
               ),
               SizedBox(height: 4.0),
               Text(
                 'Total price: ${count*dish.price} €',
                 style: TextStyle(
                   fontSize: 14.0,
                   color: Colors.grey[600],
                 ),
               ),
             ],
           ),
           Column(
             children: [
               IconButton(
                 icon: Icon(Icons.add),
                 onPressed: ()=> increase(dish),
               ),
               IconButton(
                 icon: Icon(Icons.remove),
                 onPressed: ()=> decrease(dish),
               ),
             ],
           ),
         ],
       ),
     );
   }
}
