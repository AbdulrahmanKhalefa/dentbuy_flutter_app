/// QUICK START GUIDE
/// 
/// This file demonstrates how to integrate the MainNavigationScreen
/// with your existing authentication flow.

// ─────────────────────────────────────────────────────────────────
// OPTION 1: Direct Navigation from Login Screen
// ─────────────────────────────────────────────────────────────────
// 
// In your LoginScreen or auth handler:
//
// ```dart
// import 'package:dentbuy_flutter_app/feature/home/page/main_navigation_screen.dart';
//
// // After successful login:
// if (loginSuccessful) {
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//       builder: (context) => const MainNavigationScreen(),
//     ),
//   );
// }
// ```

// ─────────────────────────────────────────────────────────────────
// OPTION 2: Using Named Routes (Recommended)
// ─────────────────────────────────────────────────────────────────
//
// In your main.dart:
//
// ```dart
// import 'package:dentbuy_flutter_app/feature/home/page/main_navigation_screen.dart';
//
// MaterialApp(
//   debugShowCheckedModeBanner: false,
//   theme: AppThemes.lighttheme,
//   home: const SplashScreen(),
//   routes: {
//     '/login': (context) => const LoginScreen(),
//     '/home': (context) => const MainNavigationScreen(),
//     '/splash': (context) => const SplashScreen(),
//   },
// )
// ```
//
// Then in your login handler:
// ```dart
// Navigator.pushReplacementNamed(context, '/home');
// ```

// ─────────────────────────────────────────────────────────────────
// OPTION 3: Using Go Router (Modern Approach)
// ─────────────────────────────────────────────────────────────────
//
// Add to pubspec.yaml:
// ```yaml
// dependencies:
//   go_router: ^latest_version
// ```
//
// Then setup routes:
// ```dart
// final GoRouter _router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const SplashScreen();
//       },
//     ),
//     GoRoute(
//       path: '/home',
//       builder: (BuildContext context, GoRouterState state) {
//         return const MainNavigationScreen();
//       },
//     ),
//   ],
// );
//
// MaterialApp.router(
//   routerConfig: _router,
//   debugShowCheckedModeBanner: false,
//   theme: AppThemes.lighttheme,
// )
// ```

// ─────────────────────────────────────────────────────────────────
// SCREEN STRUCTURE OVERVIEW
// ─────────────────────────────────────────────────────────────────
//
// MainNavigationScreen
//   ├─ Uses IndexedStack for state preservation
//   ├─ 5 Bottom Navigation Tabs:
//   │  ├─ Home (index: 0) - Dashboard view
//   │  ├─ Chat (index: 1) - Messaging with conversations list
//   │  ├─ Add (index: 2) - Create appointments/reminders
//   │  ├─ Favorite (index: 3) - Saved doctors/clinics
//   │  └─ Profile (index: 4) - User profile & settings
//   └─ Automatic tab switching with state preservation

// ─────────────────────────────────────────────────────────────────
// TESTING LOCALLY
// ─────────────────────────────────────────────────────────────────
//
// To test the navigation locally:
//
// 1. Update your LoginScreen to navigate to MainNavigationScreen
// 2. Or create a test screen that directly shows MainNavigationScreen
// 3. Run: flutter run
// 4. After login, you should see all 5 tabs at the bottom

// ─────────────────────────────────────────────────────────────────
// TAB DETAILS
// ─────────────────────────────────────────────────────────────────
//
// Home Tab:
//   - Displays welcome banner
//   - Shows featured services
//   - Displays user statistics
//   - Uses gradient backgrounds
//
// Chat Tab:
//   - Shows list of conversations
//   - Each item: Avatar, Name, Last Message, Time
//   - Tap to open chat (demo with SnackBar)
//   - 6 sample conversations included
//
// Add Tab:
//   - Form to create new items
//   - Categories: Appointment, Reminder, Service Request, Feedback
//   - Title and Description fields (validated)
//   - Success feedback on submission
//
// Favorite Tab:
//   - List of favorite doctors/clinics/services
//   - Color-coded by category
//   - Remove from favorites option
//   - Empty state handling
//
// Profile Tab:
//   - User avatar and statistics
//   - Menu items for various settings
//   - Logout functionality
//   - Confirmation dialog for logout

// ─────────────────────────────────────────────────────────────────
// CUSTOMIZATION
// ─────────────────────────────────────────────────────────────────
//
// Each screen can be customized independently. For example:
//
// To change the Home screen content:
//   - Edit: lib/feature/home/page/home_screen.dart
//
// To change navigation colors:
//   - Edit MainNavigationScreen's bottomNavigationBar properties
//   - Current primary color: Color(0xFF1E88E5) (Blue)
//   - Change selectedItemColor and unselectedItemColor as needed
//
// To add a new tab:
//   - Create a new screen file
//   - Add to _screens list in MainNavigationScreen
//   - Add BottomNavigationBarItem in bottomNavigationBar

// ─────────────────────────────────────────────────────────────────
// IMPORTANT NOTES
// ─────────────────────────────────────────────────────────────────
//
// 1. State Preservation:
//    - IndexedStack preserves state of all screens
//    - Scroll positions are maintained
//    - Form data is preserved
//
// 2. Performance:
//    - All screens are always rendered (consider memory usage)
//    - For large apps, consider using PageView instead
//
// 3. Testing:
//    - Each screen can be tested independently
//    - MockData is included for Chat and Favorites
//
// 4. Navigation:
//    - Use Navigator.push/pop for internal navigation
//    - Use routes for inter-screen navigation

// ─────────────────────────────────────────────────────────────────
// IMPORTS REFERENCE
// ─────────────────────────────────────────────────────────────────
//
// To import all screens:
// import 'package:dentbuy_flutter_app/feature/home/page/index.dart';
//
// Or individual imports:
// import 'package:dentbuy_flutter_app/feature/home/page/main_navigation_screen.dart';
// import 'package:dentbuy_flutter_app/feature/home/page/home_screen.dart';
// import 'package:dentbuy_flutter_app/feature/home/page/chat_screen.dart';
// import 'package:dentbuy_flutter_app/feature/home/page/add_screen.dart';
// import 'package:dentbuy_flutter_app/feature/home/page/favorite_screen.dart';
// import 'package:dentbuy_flutter_app/feature/home/page/profile_screen.dart';
