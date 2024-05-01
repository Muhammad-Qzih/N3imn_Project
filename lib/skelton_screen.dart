import 'package:flutter/material.dart';

class Skelton extends StatefulWidget {
  const Skelton({super.key});

  @override
  State<Skelton> createState() => _SkeltonState();
}

class _SkeltonState extends State<Skelton> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
            
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  "Barber Screens:",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("barbersignup");
                      },
                      child: const Text('Signup'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action for barber button
                        Navigator.of(context).pushNamed("barberlogin");
                      },
                      child: const Text('Login'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action for barber button
                        Navigator.of(context).pushNamed("barberhomepage");
                      },
                      child: const Text('HomePage'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action for barber button
                        Navigator.of(context).pushNamed("barberresetpassword");
                      },
                      child: const Text('ResetPassword'),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "Customer Screens:",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action for customer button
                        Navigator.of(context).pushNamed("customersignup");
                      },
                      child: const Text('Signup'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action for customer button
                        Navigator.of(context).pushNamed("customerlogin");
                      },
                      child: const Text('Login'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("customerhomepage");
                        // Action for customer button
                      },
                      child: const Text('Customer Home'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action for barber button
                        Navigator.of(context)
                            .pushNamed("customerresetpassword");
                      },
                      child: const Text('ResetPassword'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
