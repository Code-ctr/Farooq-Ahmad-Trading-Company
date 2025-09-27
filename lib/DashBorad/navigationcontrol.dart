import 'package:farooqtrading/Banks/banks.dart';
import 'package:farooqtrading/Customers/customer.dart';
import 'package:farooqtrading/DirectPayment/directpayment.dart';
import 'package:farooqtrading/Expenses/expense_panel.dart';
import 'package:farooqtrading/Investor/investor.dart';
import 'package:farooqtrading/Sell/sell.dart';
import 'package:farooqtrading/Stocks/stocks.dart';
import 'package:farooqtrading/ThirdParty/thirdparty.dart';
import 'package:flutter/material.dart';
import 'package:farooqtrading/Company/companyhome.dart';
import 'package:farooqtrading/Components/dashborad.dart';
import 'package:farooqtrading/Purchase/purchase_home.dart';
import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/device_config.dart';

class Navigationcontrol extends StatelessWidget {
  Navigationcontrol({super.key});

  final List<String> _buttonname = [
    "Home",
    "Company",
    "LPG Purchase",
    "Third Party",
    "Investor",
    "Customer",
    "Direct Payment",
    "Sell Panel",
    "Stocks",
    "Bank",
    "Expense",
    "Roznamcha",
  ];

  final List<IconData> menuIcons = [
    Icons.home,
    Icons.business,
    Icons.local_gas_station,
    Icons.groups,
    Icons.account_balance,
    Icons.person,
    Icons.payment,
    Icons.sell,
    Icons.inventory,
    Icons.account_balance_wallet,
    Icons.money_off,
    Icons.assignment,
  ];

  // 🔹 Navigation logic
  void _navigate(BuildContext context, String pageName) {
    Widget page;

    switch (pageName) {
      case "Home":
        page = Dashboard();
        break;
      case "Company":
        page = const Companyhome();
        break;
      case "LPG Purchase":
        page = PurchaseHome();
        break;
      case "Customer":
        page = const Customers();
        break;
      case "Third Party":
        page = Thirdparty();
        break;
      case "Investor":
        page = Investor();
        break;
      case "Direct Payment":
        page = Directpayment();
        break;
      case "Sell Panel":
        page = Sell();
        break;
      case "Stocks":
        page = Stocks();
        break;
      case "Bank":
        page = Banks();
        break;
      case "Expense":
        page = ExpensePanel();
        break;
      // case "Roznamcha":
      //   page = const RoznamchaPage();
      //   break;
      default:
        page = Scaffold(
          appBar: AppBar(title: Text(pageName)),
          body: Center(child: Text("Page for $pageName not created yet")),
        );
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),

      // ✅ Desktop Sidebar
      child:
          DeviceConfig.isDesktop
              ? SingleChildScrollView(
                child: Column(
                  children: List.generate(_buttonname.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Mybutton(
                        onTap: () => _navigate(context, _buttonname[index]),
                        text: _buttonname[index],
                        icon: menuIcons[index],
                        enableHover: true,
                        buttoncolor: Colors.black,
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                    );
                  }),
                ),
              )
              // ✅ Mobile Grid (2 columns)
              : GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
                children: List.generate(_buttonname.length, (index) {
                  return Mybutton(
                    onTap: () => _navigate(context, _buttonname[index]),
                    text: _buttonname[index],
                    icon: menuIcons[index],
                    color: AppColor.accentLight,
                  );
                }),
              ),
    );
  }
}
