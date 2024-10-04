import 'package:flutter/material.dart';
import 'package:project_spa_v3/AppTextStyles.dart';
import 'buttons.dart';
import 'functions.dart';

class EnterPage extends StatelessWidget {
  final supportMethods = SupportMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30.0, top: 20, right: 0, bottom: 5),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('ANDRE', style: AppTextStyles.logoTextStyle)),
          ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.yellow,
                      Colors.tealAccent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FutureBuilder<NetworkImage>(
                    future: supportMethods.fetchEnterImage(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return CircleAvatar(
                          backgroundImage: snapshot.data,
                          radius: 100,
                        );
                      } else {
                        return const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 100,
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ANDREI BLOKHIN',
                style: AppTextStyles.enterPageHeadline,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'TECHNICIAN / ASSOCIATE SOFTWARE ENGINEER',
                style: AppTextStyles.enterPageDescription,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              HoverableElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('ENTER', style: AppTextStyles.buttonText),
                  ],
                ),
              ),
            ],
          ),
          supportMethods.linksContainer(),
        ],
      ),
    );
  }
}
