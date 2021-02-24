import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bmi_calc/model/bmivalues.dart' as data;
class inputPage extends StatefulWidget {
  @override
  _inputPageState createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  int height=160;
  int weight=80;
  double bmi=20.0;
  String categorie='';
  @override
  void initState() {
    super.initState();
    //All the component values get initialized here
    _update();
  }
  void _update(){
    //bmi and class function getting called from bmivalues.dart
    bmi=data.bmi(height,weight);
    categorie=data.classes(bmi);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF1D1E33),centerTitle: true,
        title: Text("BMI Calculator",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //gauge Widget
            Expanded(
                child:Container(
                  margin: EdgeInsets.fromLTRB(10,15,15,10),
                  decoration: BoxDecoration(
                      color:Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: SfRadialGauge(
                    enableLoadingAnimation: true,
                    animationDuration: 2000,
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 10.0,
                        maximum: 40.0,
                        axisLabelStyle: GaugeTextStyle(color: Colors.white),
                          ranges: <GaugeRange>[
                            //colours being set at the different ranges of gauge
                          GaugeRange(
                              startValue: 10,
                              endValue: 18.5,
                              color: Colors.blueGrey),
                          GaugeRange(
                              startValue: 18.5,
                              endValue: 24.9,
                              color: Colors.green),
                          GaugeRange(
                              startValue: 25.0,
                              endValue: 29.9,
                              color: Colors.amber),
                          GaugeRange(
                              startValue: 30.0,
                              endValue: 40.0,
                              color: Colors.red)
                        ],
                        pointers: <GaugePointer>[
                          //needle attributes re being setted here
                          NeedlePointer(value:bmi,needleColor: Colors.white,
                          knobStyle: KnobStyle(color: Color(0xFFEB1555)))
                        ],
                        annotations: <GaugeAnnotation>[
                          //value of BMi will be shown by this container
                          GaugeAnnotation(
                            widget: Container(
                              padding: EdgeInsets.fromLTRB(10,100,0,0),
                              child: Text('${bmi.toString().substring(0,2)}\nBMI',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                fontWeight: FontWeight.bold,
                                  color: Colors.white,

                              ),),
                            )
                          )
                        ]
                      )
                    ],
                  ),
                )),
          //class of the given will be shown by this container
          Container(
            padding: EdgeInsets.all(10),
            height: 50,
            margin: EdgeInsets.fromLTRB(10,0,15,0),
            decoration: BoxDecoration(
                color:Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Text("Class: "+categorie,style: TextStyle(color: Colors.white,fontSize: 25),textAlign: TextAlign.center,),
          ),

            //height slider widget
            Expanded(child: GestureDetector(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0)
                    ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Text("Height",style:TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF8D8E98),
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                            color: Colors.white,
                        ),),
                        Text("cm",style:TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          ),)
                      ],
                    ),
                    SliderTheme(
                        data:SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                            overlayColor: Color(0x29EB1555),
                        ), child:Slider(
                      value:height.toDouble(),
                      min: 120.0,
                      max:220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (value) {
                        setState(() {
                          //height getting changed on update
                          height=value.round();
                        });
                      },
                    ))
                  ],
                ),
              ),
              ),
            ),

            //weight slider widget
            Expanded(child: GestureDetector(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color:Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Weight",style:TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF8D8E98),
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[

                        Text(weight.toString(),style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),),
                        Text("Kg",style:TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),)
                      ],
                    ),
                    SliderTheme(
                        data:SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: Color(0x29EB1555),
                        ), child:Slider(
                      value:weight.toDouble(),
                      min: 60.0,
                      max:100.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (value) {
                        setState(() {
                          //weight getting changed on update
                          weight=value.round();
                        });
                      },
                    ))
                  ],
                ),

              ),
            ),
            ),
            //calculate BMi button
            Container(
                  margin: EdgeInsets.fromLTRB(15,10,15,20),
                  child: ButtonTheme(
                    minWidth: 240.0,
                    height: 60.0,
                    child: RaisedButton(
                      color: Color(0xFF1D1E33),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(10),
                      child: Text("Calculate",style: TextStyle(fontSize: 20),),
                      onPressed: (){
                        setState(() {
                          //bmi,class,gauge values being updated on press
                          _update();
                        });
                      },

                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
