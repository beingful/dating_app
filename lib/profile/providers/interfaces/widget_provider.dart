import 'package:flutter/material.dart';

abstract interface class WidgetProvider<TEnum extends Enum, TWidgets extends Widget> {
  TWidgets provide(TEnum key);
}