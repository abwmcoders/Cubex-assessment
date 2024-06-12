import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/pallet.dart';
import '../resources/ui_helper.dart';
import 'base_viewmodel.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  const BaseView({super.key, required this.vmBuilder, required this.builder});

  final T Function(BuildContext) vmBuilder;
  final Widget Function(BuildContext, T) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: vmBuilder(context),
      child: Consumer<T>(
        builder: _buildScreenContent,
      ),
    );
  }

  Widget _buildScreenContent(BuildContext context, T viewModel, Widget? child) {
    return !viewModel.isInitialized && viewModel.isLoading == true
        ? Container(
            color: Palette.greyColor,
            child: const Center(child: CircularProgressIndicator()),
          )
        : Stack(
            children: [
              builder(context, viewModel),
              Visibility(
                visible: viewModel.isLoading,
                child: const Scaffold(
                  backgroundColor: Color.fromRGBO(91, 89, 89, 0.98),
                  body: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    //color: Palette.semiGreyColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Thank you for your\npatience",
                          style: TextStyle(
                            fontFamily: "MT",
                            fontSize: 19,
                            color: Palette.accentColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        UIHelper.verticalSpaceMedium,
                        CircularProgressIndicator(
                          color: Palette.primaryColor,
                          //value: 12.0,
                          //strokeWidth: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
