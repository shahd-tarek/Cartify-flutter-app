import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool visiable = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff66A4E2),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Image.asset("images/Intersect.png"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelStyle:
                    TextStyle(color: Color.fromARGB(255, 2, 46, 25)),
                labelText: "Full name",
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Name can't be null");
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelStyle:
                    TextStyle(color: Color.fromARGB(255, 2, 46, 25)),
                labelText: "Email",
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("email can't be null");
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: visiable,
              validator: (value) {
                if (value!.length < 6) {
                  return ("password is too short");
                }
                return null;
              },
              decoration: InputDecoration(
                floatingLabelStyle:
                    const TextStyle(color: Color.fromARGB(255, 2, 46, 25)),
                prefixIcon: const Icon(Icons.lock),
                border: const OutlineInputBorder(),
                labelText: "Password",
                labelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visiable = !visiable;
                      });
                    },
                    icon: Icon(
                        visiable ? Icons.visibility : Icons.visibility_off)),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff66A4E2),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Reset',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff66A4E2),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
