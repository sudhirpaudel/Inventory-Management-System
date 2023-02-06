import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventorymanagementsystem/screens/mainscreen.dart';
import 'package:inventorymanagementsystem/theme/material_theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bloc/client/client_bloc.dart';
import 'bloc/products_bloc/products_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyD36TvVD3ltQqjt28akAozieogFCqmka5k",
        projectId: "inventorymanagementbb",
        storageBucket: "inventorymanagementbb.appspot.com",
        messagingSenderId: "1023790873683",
        appId: "1:1023790873683:web:cb634e273d034bb43c1aa6",
      ),
    );
  } else {
    Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc()..add(GetProducts()),
        ),
        BlocProvider(
          create: (context) => ClientBloc()..add(GetClients()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: materialAppTheme.theme,
        home: const MainScreen(),
      ),
    );
  }
}
