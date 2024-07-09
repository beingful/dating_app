import 'package:flutter/material.dart';

class ChaoticWrap<TModel, TModelWrapper extends Widget> extends StatelessWidget {
  final List<TModel> rootModelItems;
  final TModelWrapper Function(TModel) childProvider;
  final double totalSizeRatio;

  ChaoticWrap({required this.rootModelItems, required this.childProvider, this.totalSizeRatio = 0.4});

  @override
  Widget build(BuildContext context) {
    final Size totalSize = MediaQuery.of(context).size;
    
    return  SingleChildScrollView(
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: rootModelItems.expand((item) =>
        { 
          Padding(
            padding: const EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints: BoxConstraints(
              maxWidth: totalSize.width * totalSizeRatio
              ),
              child: childProvider.call(item)
            )
          )
        }).toList()
      )
    );
  }
}