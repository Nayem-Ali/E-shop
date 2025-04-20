import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_com_task/src/features/explore_products/data/model/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_com_task/src/features/explore_products/presentation/component/info_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product = Get.arguments as Product;

  ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(product.images);
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: Get.height * 0.4,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
              ),
              items:
                  product.images.map((imageUrl) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        width: Get.width,
                        placeholder:
                            (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                                width: double.infinity,
                                height: 200,
                              ),
                            ),

                        errorWidget:
                            (context, url, error) => Center(child: Icon(Icons.image, size: 200)),
                      ),
                    );
                  }).toList(),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(product.title, style: Theme.of(context).textTheme.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(product.description),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    "Overall Rating: ",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  StarRating(
                    rating: product.rating,
                    mainAxisAlignment: MainAxisAlignment.start,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ],
              ),
            ),
            const Divider(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  InfoChip(label: "Stock", value: product.stock.toString()),
                  InfoChip(label: "Brand", value: product.brand),
                  InfoChip(label: "Category", value: product.category.capitalizeFirst!),
                  InfoChip(label: "SKU", value: product.sku),
                  InfoChip(label: "Warranty", value: product.warrantyInformation),
                  InfoChip(label: "Return", value: product.returnPolicy),
                ],
              ),
            ),

            const Divider(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Reviews", style: Theme.of(context).textTheme.titleMedium),
            ),
            ...product.reviews.map(
              (review) => ListTile(
                title: Text(review.reviewerName, style: Theme.of(context).textTheme.titleMedium),
                subtitle: Text(review.comment),
                trailing: SizedBox(
                  width: 80,
                  child: StarRating(
                    rating: review.rating.toDouble(),
                    size: 15,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
