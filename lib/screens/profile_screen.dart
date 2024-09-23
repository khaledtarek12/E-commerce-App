import 'package:e_commerce_app/providers/theme_provider.dart';
import 'package:e_commerce_app/services/assets_manager.dart';
import 'package:e_commerce_app/widgets/custom_list_tile.dart';
import 'package:e_commerce_app/widgets/subtitletext.dart';
import 'package:e_commerce_app/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Khaled Tarek'),
        leading: Image.asset(
          AssetsManager.shoppingCart,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TitleText(lable: 'Please login to have ultimate access'),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                    border: Border.all(color: Colors.blueAccent, width: 3),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://img.lovepik.com/photo/48008/6386.jpg_wh860.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(lable: 'Khaled Tarek'),
                    SubTitleText(lable: 'tkhaled238@gmail.com')
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(lable: 'General'),
                CustomListTile(
                    image: AssetsManager.orderSvg, lable: 'All orders'),
                CustomListTile(
                    image: AssetsManager.wishlistSvg, lable: 'WishList'),
                CustomListTile(
                    image: AssetsManager.recent, lable: 'Viewed recent'),
                CustomListTile(image: AssetsManager.address, lable: 'Address'),
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                const TitleText(lable: 'Settings'),
                const SizedBox(height: 10),
                SwitchListTile(
                  secondary: Image.asset(AssetsManager.theme, height: 30),
                  title: Text(themeProvider.getIsDarkTheme
                      ? 'Dark Theme'
                      : 'Light Theme'),
                  value: themeProvider.getIsDarkTheme,
                  onChanged: (value) {
                    themeProvider.setDarkTheme(themeValue: value);
                  },
                ),
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                const TitleText(lable: 'Others'),
                const SizedBox(height: 10),
                CustomListTile(
                    image: AssetsManager.privacy, lable: 'Privacy & Policy'),
              ],
            ),
          ),
          Center(
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              icon: const Icon(IconlyBold.logout),
              label: const Text('Logout'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}