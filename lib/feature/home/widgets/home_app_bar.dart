import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/core/constants/app_assets.dart';
import 'package:dentbuy_flutter_app/feature/home/page/clinics_screen.dart';
import 'package:dentbuy_flutter_app/feature/home/page/tools_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String selectedCity;
  final List<String> cities;
  final ValueChanged<String?> onCityChanged;

  const HomeAppBar({
    super.key,
    required this.selectedCity,
    required this.cities,
    required this.onCityChanged,
  });

  @override
  Size get preferredSize => const Size.fromHeight(130.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      shadowColor: Colors.black12,
      automaticallyImplyLeading: false,
      toolbarHeight: 130,
      titleSpacing: 12,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.logoSvg,
                width: 36,
                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ClinicsScreen()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                       width: 40,
                       height: 40,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: AppColors.primary.withOpacity(0.1),
                       ),
                       child: const Icon(Icons.maps_home_work, size: 14, color: AppColors.primary),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                       'Clinics',
                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              GestureDetector(
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (_) => const ToolsScreen()),
                   );
                 },
                 child: Row(
                   children: [
                     Container(
                       width: 40,
                       height: 40,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: AppColors.primary.withOpacity(0.1),
                       ),
                       child: const Icon(Icons.handyman, size: 14, color: AppColors.primary),
                     ),
                     const SizedBox(width: 4),
                     const Text(
                       'Tools',
                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary),
                     ),
                   ],
                 ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_on, color: AppColors.redcolor, size: 16),
              const SizedBox(width: 2),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCity,
                  isDense: true,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.primary, size: 16),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkcolor,
                  ),
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  onChanged: onCityChanged,
                  items: cities.map((city) {
                    final bool isSelected = selectedCity == city;
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Row(
                        children: [
                          const SizedBox(width: 6),
                          Text(
                            city,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                              color: isSelected ? AppColors.darkcolor : AppColors.darkcolor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for service...',
                hintStyle: const TextStyle(color: AppColors.graycolor, fontSize: 13),
                prefixIcon: const Icon(Icons.search, color: AppColors.graycolor, size: 18),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
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
        ],
      ),
    );
  }
}
