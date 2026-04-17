import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/feature/home/models/list_model.dart';
import 'package:dentbuy_flutter_app/feature/home/models/product_model.dart';
import 'package:dentbuy_flutter_app/feature/home/page/product_details_screen.dart';
import 'package:flutter/material.dart';

class ListViewCard extends StatelessWidget {
  final ProductModel product;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const ListViewCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(
              product: Product(
                id: DateTime.now().toString(),
                title: product.name,
                description: 'Detailed description for ${product.name} located in ${product.location}',
                price: double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0,
                imageUrl: product.image,
                sellerId: 'Seller_001',
              ),
            ),
          ),
        );
      },
      child: Container(
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.graycolor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔝 الصورة (تاخد نص الكارد أو أكتر)
          Expanded(
            flex: 6, // 👈 تتحكم في النسبة هنا
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                product.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔽 البيانات
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: AppColors.graycolor,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          product.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.graycolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.price,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: onFavoriteTap,
                        child: Icon(
                          isFavorite ? Icons.bookmark : Icons.bookmark_border,
                          color: isFavorite
                              ? AppColors.primary
                              : AppColors.graycolor,
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
