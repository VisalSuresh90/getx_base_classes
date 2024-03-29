import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A base middleware class for handling navigation and page lifecycle events in GetX.
class BaseMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // Your base redirect logic if needed
    return null;
  }

  /// This function will be called before anything is created. It can be used to
  /// change something about the page or give it a new page.
  @override
  GetPage? onPageCalled(GetPage? page) {
    // Your base onPageCalled logic if needed
    return super.onPageCalled(page);
  }

  /// This function will be called right before the Bindings are initialized.
  /// Here, we can change Bindings for this page.
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    // Your base onBindingsStart logic if needed
    return super.onBindingsStart(bindings);
  }

  /// This function will be called right after the Bindings are initialized.
  /// Here, we can do something after bindings are created and before creating the page.
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    // Your base onPageBuildStart logic if needed
    return super.onPageBuildStart(page);
  }

  /// Page build and widgets of the page will be shown.
  @override
  Widget onPageBuilt(Widget page) {
    // Your base onPageBuilt logic if needed
    return super.onPageBuilt(page);
  }

  /// This function will be called right after disposing all the related objects
  /// (Controllers, views, etc.) of the page.
  @override
  void onPageDispose() {
    // Your base onPageDispose logic if needed
    super.onPageDispose();
  }
}
