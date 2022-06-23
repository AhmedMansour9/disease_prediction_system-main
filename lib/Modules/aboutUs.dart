
import 'package:flutter/material.dart';

class aboutUsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Accurate and on-time analysis of any health-related '
                    'problem is important for the prevention and treatment '
                    'of the illness. The traditional of diagnosis may not be sufficient'
                    ' in the case of a serious ailment. So, our objective is to develop'
                    ' a medical diagnosis system based on machine learning (ML) algorithms '
                    'for prediction of any disease that can way help in a more accurate and '
                    'faster diagnosis than the conventional method. Also, given the circumstances'
                    ' we are living in at the present time due to the Covid-19, this project will be'
                    ' very effective in achieving social distancing and reducing overcrowding in hospitals,'
                    ' which will reduce the risk of infection.',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,





                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
