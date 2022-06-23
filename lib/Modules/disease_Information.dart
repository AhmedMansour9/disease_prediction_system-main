
import 'package:flutter/material.dart';

class diseaseInformation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.info_outline),
        title: Text(
          'Information',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),

        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.home_outlined)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'an acute disease of the upper respiratory tract that is marked by inflammation of the mucous membranes of the nose, throat, eyes, and eustachian tubes and by a watery then '
                  'purulent discharge and is caused by any of several viruses (such as a rhinovirus or an adenovirus).',
            textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),

    );
  }
}
