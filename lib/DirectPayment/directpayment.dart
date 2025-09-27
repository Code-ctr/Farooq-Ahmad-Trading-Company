import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/desktoplayout.dart';
import 'package:farooqtrading/Components/drop.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/Components/mytextfield.dart';
import 'package:flutter/material.dart';

class Directpayment extends StatefulWidget {
  const Directpayment({super.key});

  @override
  State<Directpayment> createState() => _DirectpaymentState();
}

class _DirectpaymentState extends State<Directpayment> {
  final amount = TextEditingController();
  final detail = TextEditingController();
  String? selectedCustomer;
  String? partySelection;
  String? selectedParty;
  int restkey = 0;
  int selcetingrestkey = 0;
  int partyrestkey = 0;
  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      title: "Direct Payment",
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Direct Payment",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Direct transfer to investor or counterparty",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              Drop(
                key: ValueKey("selected Customer_$restkey"),
                initialValue: selectedCustomer,
                onChanged: (value) {
                  setState(() {
                    selectedCustomer = value;
                  });
                },
                hinttext: "Select Customer",
                items: ['A', 'B'],
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Drop(
                key: ValueKey("option_$selcetingrestkey"),
                initialValue: partySelection,
                onChanged: (value) {
                  setState(() {
                    partySelection = value;
                  });
                },
                hinttext: "Transfer to",
                items: ['Customer to Third Party', 'Customer to Investor'],
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Drop(
                key: ValueKey("select party_$partyrestkey"),
                initialValue: selectedParty,
                onChanged: (value) {
                  setState(() {
                    selectedParty = value;
                  });
                },
                hinttext: "Transfer to",
                items: ['Customer to Third Party', 'Customer to Investor'],
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Mytextfield(
                controller: amount,
                hinttext: "Enter Amount",
                isNumeric: true,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Mytextfield(
                controller: detail,
                hinttext: "Transfer Detail",
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Mybutton(
                onTapAsync:
                    isSaving
                        ? null
                        : () async {
                          setState(() => isSaving = true);

                          // simulate saving work
                          await Future.delayed(const Duration(seconds: 1));
                          setState(() {
                            selectedCustomer = null;
                            partySelection = null;
                            selectedParty = null;
                            restkey++;
                            selcetingrestkey++;
                            partyrestkey++;
                            amount.clear();
                            detail.clear();
                            isSaving = false;
                          });
                        },
                text: isSaving ? "Processing..." : "Transfer",
                color: isSaving ? Colors.grey : AppColor.info,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
