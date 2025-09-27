import 'package:farooqtrading/Components/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:farooqtrading/DashBorad/navigationcontrol.dart';

class DesktopLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const DesktopLayout({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      // ✅ Custom AppBar with the requested design
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          decoration: BoxDecoration(color: AppColor.background),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              // Breadcrumb
              if (title != "Dash Borad") ...[
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Dash Borad > $title",
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),

      // ✅ Body (unchanged from your original code)
      body: Row(
        children: [
          // ✅ Side Menu (Desktop only)
          if (MediaQuery.of(context).size.width > 600) ...[
            Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.17,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Navigationcontrol(),
            ),
          ],

          // 🔹 Page Content
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
