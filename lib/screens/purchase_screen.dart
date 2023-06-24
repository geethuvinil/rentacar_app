import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rent_a_car/screens/prevoius_feedback_screen.dart';

class PurchaseScreen extends StatefulWidget {
  String? perdayAmount;
  PurchaseScreen({this.perdayAmount});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  late Razorpay _razorpay;
   @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: 'SUCCESS:${response.paymentId!}', toastLength: Toast.LENGTH_SHORT);
  }
 void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        // ignore: prefer_interpolation_to_compose_strings
        msg: 'ERROR:' + response.code.toString() + "-" + response.message!, toastLength: Toast.LENGTH_SHORT);
  }

void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: 'EXTERNAL_WALLET:${response.walletName!}', toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose(){
    super.dispose();
    _razorpay.clear();
  }

 // ignore: non_constant_identifier_names
 void OpenCheckout() async{

  var options = {
    'key': 'rzp_test_2RRp8n7Qub9fjY',
    'Key Secret': 'i3WQrvbI56TGsz1NUfAFj7vu',
    'amount':100*100,
    'name':'RENTAL SERVICES',
    'description': '',
    'retry':{'enabled': true , 'max_count':1},
    'send_sms_hash':true,
    'prefill': {'contact': '8606326406','email':
    'content@baabte.com'},
    'external':{
      'wallets':['paytm']
    }
  };

  try{
    _razorpay.open(options);
  } catch (e){
    debugPrint('Error: e');
  }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Purchase"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple.shade900),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    purchaseDetails(
                        value:
                            "Rent amount per day : ${widget.perdayAmount ?? ""} "),
                    purchaseDetails(value: "Rental duration: 2days"),
                    purchaseDetails(value: "Total amount to pay : Rs.3600"),

                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
  height: 20,
),
                    TextButton(onPressed: (){
                      Get.to(() => PrevoiusFeedbackScreen());
                    }, child: Text("View previous feedbacks",
                    style: TextStyle(
                      fontSize: 18
                    ),)),
        SizedBox(
  height: 20,
),
                    ElevatedButton(onPressed: (){
                      OpenCheckout();
                    }, child: Text("Pay"))
          ],
        ),
      ),
    );
  }

  purchaseDetails({String? value}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Text(
        value!,
        style: TextStyle(fontSize: 17, color: Colors.black),
      ),
    );
  }
}
