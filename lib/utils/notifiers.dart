import 'package:flutter_platzi_clone/services/client_appwrite.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => ClientAppwrite(),
    lazy: false,
  ),
];
