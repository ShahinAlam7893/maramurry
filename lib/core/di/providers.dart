import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> get all => [
    Provider.value(value: true),
        // AuthProvider,
        // HomeProvider,

      ];
}