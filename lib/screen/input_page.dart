import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var _formKey = GlobalKey<FormState>();
  var _controllerUserName = TextEditingController();
  var _controllerPassword = TextEditingController();

  var _gender = "Laki - Laki";

  List<String> _days = [
    "senin",
    "selasa",
    "rabu",
    "kamis",
    "Jumat",
    "sabtu",
    "Minggu"
  ];

  List<String> _selectDays = [];

  double _slider = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Aplikasi Daftar Gym",
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Masukkan Username dan Password",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          _textFormField(),
          const SizedBox(
            height: 32,
          ),
          const ListTile(
            title: Text(
              "Kelamin",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          _radio(),
          const SizedBox(
            height: 32,
          ),
          const ListTile(
            title: Text(
              "Rencana kedatangan pada hari",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          _checkBox(),
          const SizedBox(
            height: 32,
          ),
          const SizedBox(
            height: 32,
          ),
          const ListTile(
            title: Text(
              "Umur",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          _sliderapp(),
          const SizedBox(
            height: 32,
          ),
          const ListTile(
            title: Text(
              "Bottom Sheet",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => openModalBootmSheet(),
            child: Text(
              'Modal BottomSheet',
            ),
          ),
        ],
      ),
    );
  }

  Padding _sliderapp() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Slider(
        value: _slider,
        min: 0,
        max: 100,
        label: '$_slider',
        divisions: 100,
        onChanged: (value) {
          setState(() => _slider = value);
        },
      ),
    );
  }

  Column _checkBox() {
    return Column(
        children: List.generate(_days.length, (index) {
      String day = _days[index];
      return CheckboxListTile(
        title: Text(day),
        value: _selectDays.contains(day),
        onChanged: (value) {
          if (value!) {
            _selectDays.add(day);
          } else {
            _selectDays.remove(day);
          }
          setState(() {});
          print(_selectDays);
        },
      );
    }));
  }

  Column _radio() {
    return Column(
      children: [
        ListTile(
          onTap: () => setState(() => _gender = 'Laki - Laki'),
          leading: Radio(
            value: "Laki - Laki",
            groupValue: _gender,
            onChanged: (value) {
              setState(() => _gender = value.toString());
            },
          ),
          title: Text("Laki-laki"),
        ),
        ListTile(
          onTap: () => setState(() => _gender = 'Perempuan'),
          leading: Radio(
            value: "Perempuan",
            groupValue: _gender,
            onChanged: (value) {
              setState(() => _gender = value.toString());
            },
          ),
          title: Text("Perempuan"),
        ),
      ],
    );
  }

  Padding _textFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) => value == '' ? "Dont Empty" : null,
              controller: _controllerUserName,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              obscureText: true,
              validator: (value) => value == '' ? "Dont Empty" : null,
              controller: _controllerPassword,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(_controllerUserName.text);
                  print(_controllerPassword.text);
                  //.......
                }
              },
              child: Text(
                "Submit ",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openModalBootmSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              const Divider(
                thickness: 3,
                color: Colors.grey,
                indent: 150,
                endIndent: 150,
              ),
              ListTile(
                title: Text("Modal bottom sheet"),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        title: Text("Item Nomor $index"),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
