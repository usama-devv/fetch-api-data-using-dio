import 'package:flutter/material.dart';
import '../model/cart_model.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Cart? cart;
  final ApiService apiService = ApiService();

  Future<void> getData() async {
    Cart? getData = await apiService.getData();
    if (getData != null) {
      setState(() {
        cart = getData;
      });
    }
  }
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: const Text(
            "Fetch API Data using Dio",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body:
          cart == null
              ? Center(child: const CircularProgressIndicator())
              : GridView.builder(
                padding: EdgeInsets.all(5),
                itemCount: cart!.carts!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          cart!.carts![index].products![1].thumbnail ?? "",
                          height: 120,
                          width: 200,
                        ),
                        Expanded(
                          child: Text(
                            cart!.carts![index].products![1].title ?? "",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
