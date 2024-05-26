import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'cart_view_model.dart';
import 'dish.dart';
import 'menu_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Dish> dishes = [];
  var message = "Loading…";

  Future<void> _initDishes() async {
    try {
      var response = await Dish.fetchDishes();
      setState(() {
        if (response.isEmpty) message = "No films found";
        dishes.addAll(response);
      });
    } catch (error) {
      setState(() => message = error.toString());
    }
  }


  @override
  void initState() {
    super.initState();
    _initDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: ()=> context.go("/cart"),
              ),
              Positioned(
                right: 3,
                bottom: 3,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child:  Consumer<CartViewModel>(
                    builder: (context, viewModel, _) => Text(
                      '${viewModel.total}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: dishes.isNotEmpty
            ? MenuWidget(menu: dishes)
            :  Column(
              children: [
                CircularProgressIndicator(),
                Text(message)
              ],
            ),
      ),
    );
  }
}
