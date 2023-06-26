import 'package:flutter/material.dart';
import '../widgets/wallet_screen/wallet_screen_lower_section.dart';
import '../widgets/wallet_screen/wallet_screen_upper_section.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
           WalletScreenUpperSection(),
          WalletScreenLowerSection(),
          SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}

