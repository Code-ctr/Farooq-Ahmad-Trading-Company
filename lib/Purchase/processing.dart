import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/dashborad.dart';
import 'package:farooqtrading/Components/desktoplayout.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/Components/mytextfield.dart';
import 'package:farooqtrading/Components/tankertable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Processing extends StatelessWidget {
  const Processing({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      title: "Tanker Purchase",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [PurchaseLots(), LotsConfig(), TankerTaxing()],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TankerTable(),
            ),
          ),
        ],
      ),
    );
  }
}

// Enter the Tanker that is Coming with x Number Wight to Border
class PurchaseLots extends StatelessWidget {
  PurchaseLots({super.key});
  final qunatity = TextEditingController();
  final tankernumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.27,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Add New Tanker",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
            ),
            BalanceWidget(color: Colors.red),
            Mytextfield(
              controller: qunatity,
              hinttext: "Enter Quantity of Tanker",
              isNumeric: true,
              width: MediaQuery.of(context).size.width * 0.24,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Mytextfield(
              controller: tankernumber,
              hinttext: "Enter Tanker Number Plate",
              width: MediaQuery.of(context).size.width * 0.24,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Mybutton(
              onTap: () {},
              text: "Add",
              color: AppColor.info,
              width: MediaQuery.of(context).size.width * 0.24,
            ),
          ],
        ),
      ),
    );
  }
}

// Lots Can be Return Lost or Transfer to Another Lot but the Same Person
class LotsConfig extends StatefulWidget {
  const LotsConfig({super.key});

  @override
  State<LotsConfig> createState() => _LotsConfigState();
}

class _LotsConfigState extends State<LotsConfig> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.27,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row with checkbox and BalanceWidget
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (val) {
                    setState(() {
                      isChecked = val ?? false;
                    });
                  },
                ),
                const Text(
                  "Enable Transfer",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            BalanceWidget(
              text: "Name of Compnay",
              containercolor: Colors.grey.shade100,
              width: MediaQuery.of(context).size.width * 0.25,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            BalanceWidget(
              color: Colors.red,
              text: "Quantity",
              amount: 20,
              containercolor: Colors.grey.shade100,
              width: MediaQuery.of(context).size.width * 0.25,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            // Disabled buttons if checkbox is not checked
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Mybutton(
                  onTap: isChecked ? () {} : () {}, // disable
                  text: "Return",
                  icon: CupertinoIcons.reply_thick_solid,
                  color: AppColor.divider,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Mybutton(
                  onTap: isChecked ? () {} : () {}, // disable
                  text: "Burn",
                  icon: Icons.whatshot_sharp,
                  color: Colors.deepOrangeAccent,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            Mybutton(
              onTap: isChecked ? () {} : () {}, // disable
              text: "Transfer",
              icon: Icons.transform_rounded,
              color: AppColor.info,
              width: MediaQuery.of(context).size.width * 0.12,
            ),
          ],
        ),
      ),
    );
  }
}

// Here Container Can Be Taxed. Transfer to Another one If Needed
class TankerTaxing extends StatefulWidget {
  const TankerTaxing({super.key});

  @override
  State<TankerTaxing> createState() => _TankerTaxingState();
}

class _TankerTaxingState extends State<TankerTaxing> {
  final finalQuantity = TextEditingController();
  final decading = TextEditingController();
  final taxAmount = TextEditingController();
  final rent = TextEditingController();
  final tankerNumberPlate = TextEditingController();
  final extraAmountPaid = TextEditingController();

  bool showTransferFields = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.27,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BalanceWidget(text: "Tanker No", amount: 50),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),

              Mytextfield(
                controller: finalQuantity,
                hinttext: "Enter Final Quantity of Tanker",
                isNumeric: true,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Mytextfield(
                controller: decading,
                hinttext: "Enter Deduction",
                isNumeric: true,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Mytextfield(
                controller: taxAmount,
                hinttext: "Enter Tax Amount",
                isNumeric: true,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Mytextfield(
                controller: rent,
                hinttext: "Tanker Rent",
                isNumeric: true,
                width: MediaQuery.of(context).size.width * 0.3,
              ),

              //SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              // Transfer Toggle (Button or Checkbox)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: showTransferFields,
                    onChanged: (val) {
                      setState(() {
                        showTransferFields = val ?? false;
                      });
                    },
                  ),
                  const Text("Transfer"),
                ],
              ),

              // Extra fields when Transfer is checked
              if (showTransferFields) ...[
                Mytextfield(
                  controller: tankerNumberPlate,
                  hinttext: "Enter Tanker Number Plate",
                  isNumeric: false,
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
                Mytextfield(
                  controller: extraAmountPaid,
                  hinttext: "Enter Extra Amount Paid",
                  isNumeric: true,
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ],

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              Mybutton(
                onTap: () {
                  // Add functionality
                },
                text: "Add",
                color: AppColor.info,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
