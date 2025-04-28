import 'package:flutter/material.dart';
import 'package:flutter_application_1/rewards_page.dart';

class VoucherRedeemScreen extends StatelessWidget {
  final RewardItem reward;

  const VoucherRedeemScreen({
    Key? key,
    required this.reward,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3.2.1-VoucherRedeem'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              reward.imageAsset,
              height: 100,
            ),
            const SizedBox(height: 16),
            Text(
              reward.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              reward.amount,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Points required: ${reward.pointsRequired}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}