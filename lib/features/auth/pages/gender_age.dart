import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_store/common/bottomsheet/app_bottomsheet.dart';
import 'package:shopping_store/common/ui/color.dart';
import 'package:shopping_store/common/ui/custom_app_bar.dart';
import 'package:shopping_store/common/ui/custom_button.dart';
import 'package:shopping_store/common/ui/custom_button_outlined.dart';
import 'package:shopping_store/common/ui/text.dart';
import 'package:shopping_store/features/auth/bloc/age_display/age_display_cubit.dart';
import 'package:shopping_store/features/auth/bloc/age_selection_cubit.dart';
import 'package:shopping_store/features/auth/widget/ages.dart';
import 'package:shopping_store/features/auth/bloc/gender_selection_cubit.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  const GenderAndAgeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "",
        onBackPressed: null,
      ),
      backgroundColor: appBackGround,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _tellUs(context),
                const SizedBox(
                  height: 30,
                ),
                _genders(context),
                const SizedBox(
                  height: 30,
                ),
                _howOld(context),
                const SizedBox(
                  height: 30,
                ),
                _age(),
              ],
            ),
          ),
          const Spacer(),
          _finishButton(context)
        ],
      ),
    );
  }
}

Widget _tellUs(BuildContext context) {
  return PrimaryText(
    text: 'Tell us about yourself',
    size: 24,
    fontWeight: FontWeight.w600,
    textColor: colorD2C,
  );
}

Widget _howOld(BuildContext context) {
  return PrimaryText(
    text: 'How old are you',
    size: 18,
    fontWeight: FontWeight.w600,
    textColor: colorD2C,
  );
}

Widget _finishButton(BuildContext context) {
  return PrimaryButton(
    text: "Finish",
    onTap: () {},
    backgroundColor: primary,
    textColor: Colors.white,
  );
}

Widget _genders(BuildContext context) {
  return BlocBuilder<GenderSelectionCubit, int>(builder: (context, state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        genderTile(context, 1, 'Men'),
        const SizedBox(
          width: 20,
        ),
        genderTile(context, 2, 'Women'),
      ],
    );
  });
}

Expanded genderTile(BuildContext context, int genderIndex, String gender) {
  return Expanded(
    flex: 1,
    child: GestureDetector(
      onTap: () {
        context.read<GenderSelectionCubit>().selectGender(genderIndex);
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: context.read<GenderSelectionCubit>().selectedIndex ==
                    genderIndex
                ? primary
                : secondBackground,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            gender,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ),
    ),
  );
}

Widget _age() {
  return BlocBuilder<AgeSelectionCubit, String>(builder: (context, state) {
    return GestureDetector(
      onTap: () {
          AppBottomsheet.display(
            context,
            MultiBlocProvider(providers: [
              BlocProvider.value(
                value: context.read<AgeSelectionCubit>(),
              ),
              BlocProvider.value(
                  value: context.read<AgesDisplayCubit>()..displayAges())
            ], child: const Ages()));
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: secondBackground, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(state), const Icon(Icons.keyboard_arrow_down)],
        ),
      ),
    );
  });
}
