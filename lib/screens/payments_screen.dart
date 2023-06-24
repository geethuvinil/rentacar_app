import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
        title: Text("Payments"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:110,top: 10,bottom: 10),
              child: Text(
                "CAR DETAILS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Divider(),
           carDetailsWidget(content: "Car Name: HONDA ACCORD"),
             carDetailsWidget(content: "Car Model: 2022"),
             carDetailsWidget(content: "Car Price: 4500 rupees per day"),
             carDetailsWidget(content: "Car Fuel: Petrol"),
            carDetailsWidget(content: "Car Color: HONDA ACCORD"),
             carDetailsWidget(content: "Name of the user: RAGHAV"),
             carDetailsWidget(content: "Date of purchase: 22/01/2023"),
             carDetailsWidget(content: "Duration:1 year"),
             carDetailsWidget(content: "Date of return: 22/01/2024"),
             SizedBox(
              height: 80,
             ),
             Center(child: ElevatedButton(onPressed: (){
              OpenCheckout();
             }, child: Text("Pay")))

          ],
        ),
      ),
    );
  }
  carDetailsWidget({String? content}){
    return  Padding(
              padding: const EdgeInsets.only(left: 15,top: 5),
              child: Text(content!, style: TextStyle(
                fontSize: 18,
              ),),
            );
  }
}
