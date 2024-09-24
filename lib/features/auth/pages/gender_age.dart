import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_store/common/bloc/button_cubit.dart';
import 'package:shopping_store/common/bloc/button_state.dart';
import 'package:shopping_store/common/bottomsheet/app_bottomsheet.dart';
import 'package:shopping_store/common/ui/basic_reactive_button.dart';
import 'package:shopping_store/common/ui/color.dart';
import 'package:shopping_store/common/ui/custom_app_bar.dart';
import 'package:shopping_store/common/ui/text.dart';
import 'package:shopping_store/features/auth/bloc/age_display/age_display_cubit.dart';
import 'package:shopping_store/features/auth/bloc/age_selection_cubit.dart';
import 'package:shopping_store/features/auth/data/models/user_creation_request.dart';
import 'package:shopping_store/features/auth/domain/usecase/sign_up.dart';
import 'package:shopping_store/features/auth/pages/sign_in.dart';
import 'package:shopping_store/features/auth/pages/signup.dart';
import 'package:shopping_store/features/auth/widget/ages.dart';
import 'package:shopping_store/features/auth/bloc/gender_selection_cubit.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationReq userCreationReq;
  const GenderAndAgeSelectionPage({super.key, required this.userCreationReq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "",
        onBackPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
      ),
      backgroundColor: appBackGround,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
          BlocProvider(create: (context) => ButtonStateCubit()),
        ],
        child: BlocListener<ButtonStateCubit,ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState){
              var snackbar = SnackBar(content: Text(state.errorMessage),behavior: SnackBarBehavior.floating,);
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
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
              _finishButton(context, userCreationReq),
            ],
          ),
        ),
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
                : boxColor,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            gender,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
            color: boxColor, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(state), const Icon(Icons.keyboard_arrow_down)],
        ),
      ),
    );
  });
}

Widget _finishButton(BuildContext context, UserCreationReq userCreationReq) {
  return Container(
    height: 100,
    color: appBackGround,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Center(
      child: Builder(
        builder: (context) {
          return BasicReactiveButton(
            onPressed: () {
              // Access userCreationReq from the current class context
              userCreationReq.gender =
                  context.read<GenderSelectionCubit>().selectedIndex;
              userCreationReq.age =
                  context.read<AgeSelectionCubit>().selectedAge;
              context.read<ButtonStateCubit>().execute(
                    usecase: SignupUseCase(),
                    params: userCreationReq,
                  );
            },
            title: 'Finish',
          );
        },
      ),
    ),
  );
}
