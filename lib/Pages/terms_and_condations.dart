import 'package:flutter/material.dart';

import '/const/terms_and_condation.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Terms and Conditions",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title("GENERAL TERMS"),
              des(GENERALTERMS),
              title("LICENSE"),
              des(LICENSE),
              title("DEFINITIONS AND KEY TERMS"),
              des(DEFINITIONS_AND_KEY_TERMS),
              title("RESTRICTIONS"),
              des(RESTRICTIONS),
              title("PAYMENT"),
              des(PAYMENT),
              title("YOUR SUGGESTIONS"),
              des(YOUR_SUGGESTIONS),
              title("YOUR CONSENT"),
              des(YOUR_CONSENT),
            ],
          ),
        ),
      ),
    );
  }

  Widget title(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget des(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
