import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const InfinitePage());

class InfinitePage extends StatefulWidget {
  const InfinitePage({Key? key}) : super(key: key);

  @override
  State<InfinitePage> createState() => _MyAppState();
}

class _MyAppState extends State<InfinitePage> {
  String selectloc = "Indonesia";
  String selectloc2 = "Indonesia";
  List<String> locklist = [
    "Indonesia",
    "Malaysia",
    "Singapore",
  ];
  String desc = "";
  double valueIDR = 0, valueMYR = 0, valueSGD = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text("INFINITE",
            style: TextStyle(
                color: Colors.white, fontSize: 29, fontFamily: "Redhat")),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "From",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Redhat"),
                  textAlign: TextAlign.left,
                ),
                DropdownButton(
                  value: selectloc,
                  iconSize: 25,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {
                      selectloc = newValue.toString();
                    });
                  },
                  items: locklist.map((selectloc) {
                    return DropdownMenuItem(
                      child: Text(selectloc,
                          style: const TextStyle(color: Colors.black)),
                      value: selectloc,
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("To",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Redhat")),
                DropdownButton(
                  itemHeight: 60,
                  value: selectloc2,
                  iconSize: 25,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {
                      selectloc2 = newValue.toString();
                    });
                  },
                  items: locklist.map((selectloc2) {
                    return DropdownMenuItem(
                      child: Text(
                        selectloc2,
                      ),
                      value: selectloc2,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 373,
                  height: 61,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffF4BC33),
                    ),
                    onPressed: _convertbtn,
                    child: const Text(
                      "CONVERT",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(desc)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _convertbtn() async {
    var url = Uri.parse(
        'https://freecurrencyapi.net/api/v2/latest?apikey=f0d0b0d0-4163-11ec-acd8-e713c1da2924');
    var response = await http.get(url);
    var rescode = response.statusCode;
    if (rescode == 200) {
      var jsondata = response.body;
      var parsedJson = json.decode(jsondata);
      setState(() {
        valueIDR = parsedJson['data']['IDR'];
        valueMYR = parsedJson['data']['MYR'];
        valueSGD = parsedJson['data']['SGD'];
        desc =
            "The Current Location You Chose is $selectloc2. The Currency for 1 USD is $valueIDR";
      });
    } else {
      // ignore: avoid_print
      print("Failed");
    }
  }
}
