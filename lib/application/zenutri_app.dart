import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:zenutri_app/application/controller_binder.dart';
import 'package:zenutri_app/application/themes/app_bar_themes.dart';
import 'package:zenutri_app/application/themes/app_decorations.dart';
import 'package:zenutri_app/application/themes/button_themes.dart';
import 'package:zenutri_app/application/themes/text_themes.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screens/splash_screen.dart';

class ZenutriApp extends StatefulWidget {
  const ZenutriApp({Key? key}) : super(key: key);

  @override
  State<ZenutriApp> createState() => _ZenutriAppState();
}

class _ZenutriAppState extends State<ZenutriApp> {
  final HttpLink httpLink = HttpLink(
    "https://zenutri-vitamin.myshopify.com/api/2023-10/graphql.json",
    defaultHeaders: <String, String>{
      'Authorization': 'Bearer ae8039b39e897fa4db96ea87c50cbe0d',
    },
  );

  late final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;
    return GraphQLProvider(
      client: client,
      child: GetMaterialApp(
        initialBinding: ControllerBinder(),
        theme: ThemeData(
          primarySwatch: MaterialColor(
            AppColors.primaryColor.value,
            AppColors.colorPalette,
          ),
          fontFamily: 'Outfit',
          textTheme: zenutriTextThemes,
          elevatedButtonTheme: ZenutriButtonThemes.elevatedButtonTheme,
          textButtonTheme: ZenutriButtonThemes.textButtonTheme,
          outlinedButtonTheme: ZenutriButtonThemes.outlinedButtonTheme,
          inputDecorationTheme: ZenutriAppDecorations.inputDecorationTheme,
          appBarTheme: appBarTheme,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
