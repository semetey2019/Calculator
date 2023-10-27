import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tex_zadacha/widgets/image_piker.dart';
import 'package:tex_zadacha/pages/second_page.dart';
import 'package:tex_zadacha/widgets/text_form_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

late File _image;

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final dateController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final textController = TextEditingController();
  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  bool hidePass = true;

  bool checkedValue = true;

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    phoneMaskFormatter.clear();

    super.dispose();
  }

  List<XFile> images = [];

  final service = ImagePickerService();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 29),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    ("Регистрация"),
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.orangeAccent),
                  ),
                  const SizedBox(height: 40),
                  TextFormFieldWidget(
                    controller: textController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Заполните поле';
                      } else {
                        return null;
                      }
                    },
                    inputType: TextInputType.name,
                    hintText: "Напишите ваше имя",
                    obscureText1: false,
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Заполните поле';
                      } else {
                        return null;
                      }
                    },
                    controller: passController,
                    inputType: TextInputType.emailAddress,
                    hintText: 'Ваш пароль',
                    obscureText1: hidePass,
                    maxLength: 8,
                    onTap: () {
                      setState(() {
                        hidePass = !hidePass;
                      });
                    },
                    icon: Icon(
                      hidePass ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldWidget(
                    controller: dateController,
                    obscureText1: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Заполните поле';
                      } else {
                        return null;
                      }
                    },
                    inputType: TextInputType.datetime,
                    inputFormatters: [phoneMaskFormatter],
                    hintText: 'Дата сегодня',
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Заполните поле';
                      } else {
                        return null;
                      }
                    },
                    controller: phoneController,
                    obscureText1: false,
                    hintText: 'Номер телефона',
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 17),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue, Colors.purple, Colors.pink],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                    child: images.isNotEmpty
                        ? GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 10,
                            ),
                            children: images
                                .map(
                                  (e) => ItemCard(
                                    file: File(e.path),
                                  ),
                                )
                                .toList(),
                          )
                        : IconButton(
                            onPressed: () async {
                              final value = await service.pickImages();
                              images = value;

                              if (_formKey.currentState!.validate()) {
                              } else {
                                null;
                              }

                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.photo_camera,
                              size: 50,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  const SizedBox(height: 41),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CalculatorPage()));
                      } else {
                        null;
                      }
                    },
                    child: Text("enter",
                        style: theme.textTheme.titleSmall
                            ?.copyWith(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 1,
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 55),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.file});
  final File file;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.6,
      width: width * 0.6,
      child: Image.file(file),
    );
  }
}
