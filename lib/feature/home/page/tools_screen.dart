import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/feature/home/models/list_model.dart';
import 'package:dentbuy_flutter_app/feature/home/widgets/product_list_section.dart';
import 'package:flutter/material.dart';

class ToolsScreen extends StatefulWidget {
  const ToolsScreen({super.key});

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  late final List<bool> _favoritesNew;
  late final List<bool> _favoritesUsed;

  @override
  void initState() {
    super.initState();
    _favoritesNew = List.generate(toolProducts.length, (_) => false);
    _favoritesUsed = List.generate(toolProducts.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'All Tools',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search in Tools...', 
                  hintStyle: const TextStyle(color: AppColors.graycolor, fontSize: 13),
                  prefixIcon: const Icon(Icons.search, color: AppColors.graycolor, size: 18),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.graycolor.withOpacity(0.4)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.graycolor.withOpacity(0.4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductListSection(
                sectionTitle: 'New Tools',
                onSeeAll: () {},
                products: toolProducts,
                favoritesState: _favoritesNew,
                onFavoriteToggle: (index) => setState(() => _favoritesNew[index] = !_favoritesNew[index]),
              ),
              const SizedBox(height: 20),
              ProductListSection(
                sectionTitle: 'Used Tools',
                onSeeAll: () {},
                products: toolProducts.reversed.toList(),
                favoritesState: _favoritesUsed,
                onFavoriteToggle: (index) => setState(() => _favoritesUsed[index] = !_favoritesUsed[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
