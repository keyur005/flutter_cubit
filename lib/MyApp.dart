import 'package:cubit_bloc_demo/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (_, Widget) {
              return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: MaterialApp(
                    //debugShowMaterialGrid: true,
                    // showSemanticsDebugger: true,
                    builder: EasyLoading.init(),
                    debugShowCheckedModeBanner: false,
                    title: "flutter",
                    home: HomeScreen(),
                  ));
            }));
  }
}
