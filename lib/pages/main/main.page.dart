// import 'package:flutter/cupertino.dart';
// import 'package:frontend/pages/auth/bindings.dart';
// import 'package:frontend/pages/auth/page.dart';
// import 'package:frontend/pages/product/binding.dart';
// import 'package:frontend/pages/product/list.view.dart';
// import 'package:frontend/pages/product/sync_list.view.dart';
// import './../../routes.dart';
// import '../../middlewares/auth.middleware.dart';
import 'main.screen.dart';
import 'package:get/get.dart';
// import './../danger/danger.screen.dart';
// import './../danger/danger.binding.dart';

// import './../sources/sources_list.view.dart';
// import './../sources/binding.dart';
// import './../sources/source_item.dart';

class MainPage extends GetPage {
  MainPage()
      : super(
          name: '/danger', page: () => const MainScreen(),
          // middlewares: [ AuthMiddleware() ],
          // children: [
          // GetPage(
          //     name: Routes.Danger,
          //     page: () => DangerPage(),
          //     binding: DangerBinding()),
          // GetPage(
          //     name: Routes.Products,
          //     page: () => const ProductListView(),
          //     binding: ProductItemListBinding()),
          // GetPage(
          //     name: Routes.ItemsSync,
          //     page: () => const ProductSyncListView(),
          //     binding: ProductSyncListBinding()),
          // // GetPage(
          // //     name: '/settings/sources',
          // //     page: () => const SettingsSourcesListView(),
          // //     binding: SettingsBinding()),
          // GetPage(
          //     name: Routes.Sources,
          //     page: () => const SourcesListView(),
          //     binding: SourcesBinding()),
          // GetPage(
          //   name: Routes.SourceItem,
          //   page: () => SourceItemScreen(),
          // ),
          // ]);
        );
}
