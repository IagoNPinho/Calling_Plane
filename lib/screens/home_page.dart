import 'package:plano_telefonico/model/call_plane_model.dart';
import 'package:plano_telefonico/widgets/picker_call_planos_widget.dart';
import 'package:plano_telefonico/widgets/picker_ddd_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<String> itens = [
    '011',
    '016',
    '017',
    '018',
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItems = doItens(itens);

  static List<DropdownMenuItem<String>> doItens(List<String> itens) {
    return itens
        .map((String value) =>
        DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ))
        .toList();
  }

  EdgeInsets padding ({required double width, required double height}){
    return EdgeInsets.only(
      left: width * 0.05,
      right: width * 0.05,
      top: height * 0.025,
    );
  } 

  static String? _origemSelectValue;
  static String? _destinoSelectValue;
  static String? _planeSelect;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          primary: true,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: padding(width: width, height: height),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Botão Origem
                    Flexible(
                      flex: 1,
                      child: PickerDDD(
                        title: 'Origem',
                        items: _dropDownMenuItems,
                        value: _origemSelectValue,
                        onChanged: (dynamic newValue) {
                          if (newValue != null) {
                            setState(() {
                              _origemSelectValue = newValue;
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: width * 0.025,
                    ),
                    // Botão Destino
                    Flexible(
                      flex: 1,
                      child: PickerDDD(
                        title: 'Destino',
                        items: _dropDownMenuItems,
                        value: _destinoSelectValue,
                        onChanged: (dynamic newValue) {
                          if (newValue != null) {
                            setState(() {
                              _destinoSelectValue = newValue;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: padding(width: width, height: height),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //
                    Flexible(
                      flex: 1,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'DDD Origem',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.025,
                    ),
                    Flexible(
                      flex: 1,
                      child: PickerCallPlaneWidget(
                        title: 'Call Planes',
                        onPlaneSelected: ({required String planes}) {
                          setState(
                                () {
                              _planeSelect = planes;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: padding(width: width, height: height),
                child: AspectRatio(
                  aspectRatio: 2.1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'DDD Origem',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
