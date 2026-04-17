import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/feature/home/models/list_model.dart';
import 'package:dentbuy_flutter_app/feature/home/widgets/product_list_section.dart';
import 'package:flutter/material.dart';

class ClinicsScreen extends StatefulWidget {
  const ClinicsScreen({super.key});

  @override
  State<ClinicsScreen> createState() => _ClinicsScreenState();
}

class _ClinicsScreenState extends State<ClinicsScreen> {
  late final List<bool> _favoritesSale;
  late final List<bool> _favoritesRent;

  @override
  void initState() {
    super.initState();
    _favoritesSale = List.generate(clinicProducts.length, (_) => false);
    _favoritesRent = List.generate(clinicProducts.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'All Clinics',
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
                  hintText: 'Search in Clinics...',
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
                sectionTitle: 'Clinics for sale',
                onSeeAll: () {},
                products: clinicProducts,
                favoritesState: _favoritesSale,
                onFavoriteToggle: (index) => setState(() => _favoritesSale[index] = !_favoritesSale[index]),
              ),
              const SizedBox(height: 20),
              ProductListSection(
                sectionTitle: 'Clinics for rent',
                onSeeAll: () {},
                products: clinicProducts.reversed.toList(),
                favoritesState: _favoritesRent,
                onFavoriteToggle: (index) => setState(() => _favoritesRent[index] = !_favoritesRent[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
