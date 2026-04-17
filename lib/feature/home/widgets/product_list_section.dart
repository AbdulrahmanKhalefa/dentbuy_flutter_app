import 'package:dentbuy_flutter_app/feature/home/widgets/section_header.dart';
import 'package:dentbuy_flutter_app/feature/home/widgets/list_view_card.dart';
import 'package:dentbuy_flutter_app/feature/home/models/list_model.dart';
import 'package:flutter/material.dart';

class ProductListSection extends StatelessWidget {
  final String sectionTitle;
  final VoidCallback onSeeAll;
  final List<ProductModel> products;
  final List<bool> favoritesState;
  final void Function(int) onFavoriteToggle;

  const ProductListSection({
    super.key,
    required this.sectionTitle,
    required this.onSeeAll,
    required this.products,
    required this.favoritesState,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: sectionTitle,
          onSeeAll: onSeeAll,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: favoritesState.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return ListViewCard(
                isFavorite: favoritesState[index],
                onFavoriteTap: () => onFavoriteToggle(index),
                product: products[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
