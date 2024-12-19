import 'package:flutter/material.dart';

void main() {
  runApp(const SimpleFormApp());
}
class SimpleFormApp extends StatelessWidget {
  const SimpleFormApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'A Simple Contact Form',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: const SimpleForm(),
      ),
    );
  }
}

class SimpleForm extends StatefulWidget {
  const SimpleForm({super.key});

  @override
  State<SimpleForm> createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String selectedGender = '';
  String preferredContact = 'Email';
  bool isSubscribed = false;

  String resultMessage = '';
  String error1 = '';
  String error2='';


  final List<String> contactMethods = ['Email', 'Phone', 'SMS'];


  void submitForm() {
    if (nameController.text.isEmpty || emailController.text.isEmpty ||
        selectedGender.isEmpty) {
      setState(() {
        error1 = 'Please fill out all the fields.';
      });
    } else if (!emailController.text.contains('@') ||
        !emailController.text.contains('.com')) {
      setState(() {
        error2 = 'Please enter a valid email address.';
      });
    } else {
      setState(() {
        resultMessage =
        'Submitted Information:\n'
            'Name: ${nameController.text}\n'
            'Email: ${emailController.text}\n'
            'Gender: $selectedGender\n'
            'Preferred Contact Method: $preferredContact\n'
            'Subscribed to Newsletter: ${isSubscribed ? 'Yes' : 'No'}';

      });
  }
    }

  void clearForm() {
    setState(() {
      nameController.clear();
      emailController.clear();
      selectedGender = '';
      preferredContact = 'Email';
      isSubscribed = false;
      resultMessage = '';
      error1 = '';
      error2 = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const Text('Name'),
        SizedBox(
          width: 230,
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Email'),
        SizedBox(
          width: 230,
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Gender'),
        Row(
          children: [
            Row(
              children: [
                Radio(
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
                const Text('Male'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'Female',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'Other',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
                const Text('Other'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text('Preferred Contact Method'),
        SizedBox(
            width: 230,
            child: Container(
          decoration: BoxDecoration(border: Border.all()) ,
          child: DropdownButton<String>(
            value: preferredContact,
            onChanged: (String? newValue) {
              setState(() {
                preferredContact = newValue!;
              });
            },
            items: contactMethods
                .map((method) => DropdownMenuItem(
              value: method,
              child: Text(method),
            ))
                .toList(),
          ),

        ),

    ),
        const SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              value: isSubscribed,
              onChanged: (value) {
                setState(() {
                  isSubscribed = value!;
                });
              },
            ),
            const Text('Subscribe to newsletter'),
          ],
        ),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: submitForm,
              child: const Row(
              children: [ Icon(Icons.check),Text('Submit')]
              )
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: clearForm,
              child: const Row(
              children: [Icon(Icons.clear),Text('Clear')]
            ),
            )
          ] ,
        ),
        const SizedBox(height:8),
         if (error1.isNotEmpty)
           Container(
                decoration: const BoxDecoration(),
                child: Text(error1, style: const TextStyle(color: Colors.red)),
              )

        else if (error2.isNotEmpty)
          Container(
                decoration: const BoxDecoration(),
                child: Text(error2, style: const TextStyle(color: Colors.red)),
              )
       else if(resultMessage.isNotEmpty)
          Center(
           child: Container(
              decoration: BoxDecoration(border: Border.all( color: Colors.blue)),
              child:Text(resultMessage, style:const TextStyle(color: Colors.black))
            ),
    )
    ],
    );
  }
}


