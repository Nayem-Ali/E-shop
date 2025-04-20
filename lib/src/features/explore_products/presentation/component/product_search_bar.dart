import 'package:e_com_task/src/core/dependency_injection/dl.dart';
import 'package:e_com_task/src/features/explore_products/presentation/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSearchBar extends StatefulWidget {
  const ProductSearchBar({
    super.key,
    required this.isSearching,
    required this.controller,
    required this.onPressed,
  });

  final bool isSearching;
  final TextEditingController controller;
  final void Function()? onPressed;

  @override
  State<ProductSearchBar> createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: widget.isSearching ? 200 : 0,
      child:
          widget.isSearching
              ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    filled: true,
                    suffixIcon: IconButton(onPressed: widget.onPressed, icon: Icon(Icons.send)),
                  ),
                ),
              )
              : null,
    );
  }
}
