import 'dart:io';

 import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

 class InitiatePayment extends StatefulWidget {
  const InitiatePayment({Key? key}) : super(key: key);

   @override
   InitiatePaymentState createState() => InitiatePaymentState();
 }

 class InitiatePaymentState extends State<InitiatePayment> {
   @override
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }

   @override
   Widget build(BuildContext context) {
     return const WebView(
     //  initialUrl: 'https://checkout.seerbitapi.com/?mid=SBTESTPUBK_o6UBYM4iP1v979KnsP9eExKn2YM4ePUz&paymentReference=P12wqQN2022-11-20 18:28:31',
    initialUrl: 'https://google.com'
     );
   }
 }