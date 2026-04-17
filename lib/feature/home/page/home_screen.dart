import 'package:dentbuy_flutter_app/feature/home/models/list_model.dart';
import 'package:dentbuy_flutter_app/feature/home/page/clinics_screen.dart';
import 'package:dentbuy_flutter_app/feature/home/page/tools_screen.dart';
import 'package:dentbuy_flutter_app/feature/home/widgets/home_app_bar.dart';
import 'package:dentbuy_flutter_app/feature/home/widgets/product_list_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> _favoritesRent = List.generate(4, (_) => false);
  final List<bool> _favoritesSale = List.generate(4, (_) => false);
  final List<bool> _favoritesTools = List.generate(4, (_) => false);

  String _selectedCity = 'Mansoura';

  final List<String> _cities = [
    'Cairo', 'Giza', 'Alexandria', 'Mansoura',
    'Tanta', 'Aswan', 'Luxor', 'Suez', 'Zagazig', 'Ismailia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        selectedCity: _selectedCity,
        cities: _cities,
        onCityChanged: (String? newCity) {
          if (newCity != null) setState(() => _selectedCity = newCity);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductListSection(
                sectionTitle: 'Clinics for Rent',
                onSeeAll: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ClinicsScreen()));
                },
                products: clinicProducts,
                favoritesState: _favoritesRent,
                onFavoriteToggle: (index) => setState(() => _favoritesRent[index] = !_favoritesRent[index]),
              ),
              const SizedBox(height: 10),
              ProductListSection(
                sectionTitle: 'Clinics for Sale',
                onSeeAll: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ClinicsScreen()));
                },
                products: clinicProducts.reversed.toList(),
                favoritesState: _favoritesSale,
                onFavoriteToggle: (index) => setState(() => _favoritesSale[index] = !_favoritesSale[index]),
              ),
              const SizedBox(height: 10),
              ProductListSection(
                sectionTitle: 'Tools',
                onSeeAll: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ToolsScreen()));
                },
                products: toolProducts,
                favoritesState: _favoritesTools,
                onFavoriteToggle: (index) => setState(() => _favoritesTools[index] = !_favoritesTools[index]),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
