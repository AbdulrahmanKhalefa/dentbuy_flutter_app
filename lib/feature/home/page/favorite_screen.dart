import 'package:flutter/material.dart';
import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class FavoriteItem {
  final String id;
  final String title;
  final String description;
  final String category;
  final String icon;
  final Color color;

  FavoriteItem({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
    required this.color,
  });
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<FavoriteItem> _items = [
    FavoriteItem(
      id: '1',
      title: 'Clinic for sale',
      description: 'Looking for a clinic for sale in the city center',
      category: 'Clinics',
      icon: '👨‍⚕️',
      color: AppColors.primary,
    ),
    FavoriteItem(
      id: '2',
      title: 'Clinic for rent',
      description: 'clinic forAdvanced teeth cleaning service',
      category: 'clinic',
      icon: '✨',
      color: AppColors.primary,
    ),
    FavoriteItem(
      id: '3',
      title: 'Downtown Clinic',
      description: 'clinic for sale in downtown area with high foot traffic',
      category: 'Clinic',
      icon: '🏥',
      color: AppColors.primary,
    ),
  ];

  void _removeItem(String id) {
    setState(() {
      _items.removeWhere((e) => e.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: _items.isEmpty
          ? const Center(
              child: Text(
                "No Favorites Yet",
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      // ICON
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            item.icon,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // TEXT
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              item.description,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),

                            const SizedBox(height: 6),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                item.category,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // REMOVE
                      IconButton(
                        onPressed: () => _removeItem(item.id),
                        icon: const Icon(
                          Icons.bookmark,
                          color: Colors.blue,
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
