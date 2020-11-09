import 'package:flutter/material.dart';
import 'package:vnpay/vnpay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _result = 'Click';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Center(
              child: MaterialButton(
            child: Text('Vnpay: $_result\n'),
            onPressed: () async {
              String result = await VnPay.payment(
                  isSandbox: "true",
                  scheme: "retailpro",
                  appBackAlert: "Bạn có chắc chắn trở lại ko?",
                  url:"http://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Version=2.0.0&vnp_TmnCode=DMSPRO01&vnp_Amount=4000000&vnp_Command=pay&vnp_CreateDate=20201109153436&vnp_CurrCode=VND&vnp_IpAddr=13.76.152.141&vnp_Locale=vn&vnp_OrderInfo=Thanh+to%C3%A1n+%C4%91%C6%A1n+h%C3%A0ng+C000000008.201109.27&vnp_OrderType=100000&vnp_ReturnUrl=https%3A%2F%2Fapidev2.retailpro.io%2Fretbranddev%2Fb6e9d857-ee21-4bf2-b4e3-e76d41a2500b%2Fpayment%2Freturn&vnp_TxnRef=170&vnp_SecureHashType=SHA256&vnp_SecureHash=73a5cc9a0d295893e05b67a77e682235678ebb50efd96365e8c2eee7aa5aa011",
                  title: "Thanh toán",
                  backIcon: "ion_back",
                  beginColor: "F06744",
                  endColor: "E26F2C",
                  titleColor: "FFFFFF",
                  tmn_code: "DMSPRO01");
              setState(() {
                _result = result;
              });
            },
          )),
        ),
      ),
    );
  }
}
