part of '../sign_up_page.dart';

final List<FavoriteActivity> listFavoriteActivity = [
  FavoriteActivity(name: 'Culture', id: 0, image: AppImages.introduction3),
  FavoriteActivity(name: 'Food', id: 1, image: AppImages.introduction3),
  FavoriteActivity(name: 'Nature', id: 2, image: AppImages.introduction3),
  FavoriteActivity(name: 'Sea', id: 3, image: AppImages.introduction3),
  FavoriteActivity(name: 'Yachts', id: 4, image: AppImages.introduction3),
  FavoriteActivity(name: 'Tourism', id: 5, image: AppImages.introduction3),
  FavoriteActivity(
      name: 'Sport activities', id: 6, image: AppImages.introduction3),
  FavoriteActivity(name: 'Relax', id: 7, image: AppImages.introduction3)
];

class SignUpStep3 extends StatelessWidget {
  SignUpStep3({Key? key}) : super(key: key);

  final SimpleTextFormFieldController textEmailController =
      SimpleTextFormFieldController();

  final SimpleTextFormFieldController textPasswordController =
      SimpleTextFormFieldController();

  void onSubmit() async {
    AppNavigator.push(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteGrey,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              splashRadius: AppValues.iconSize_20,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.black,
              ),
              onPressed: () => context.read<SignUpCubit>().onAnimateToPage(1),
            )),
        body: Container(
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: AppColors.whiteGrey,
            child: gridViewImage(context)),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: AppColors.darkGrey.withOpacity(0.2),
              offset: const Offset(3, 0),
              blurRadius: 10,
            )
          ]),
          padding: const EdgeInsets.all(24),
          child: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return ElevatedButton(
                  statesController: MaterialStatesController(),
                  onPressed: state.favoriteList!.length >= 3 ? onSubmit : null,
                  child: Text('Continue',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: AppColors.whiteGrey,
                          )));
            },
          ),
        ));
  }

  Widget gridViewImage(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width / 2;
    double childAspectRatio = 1.15;

    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: headerTitle(context),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: buttonWidth,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: childAspectRatio),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Stack(
                children: [
                  imageItem(listFavoriteActivity[index].image),
                  BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return BlurTextView(
                          name: listFavoriteActivity[index].name,
                          isSelected: context
                              .read<SignUpCubit>()
                              .isSelected(listFavoriteActivity[index].id));
                    },
                  ),
                  Positioned.fill(
                      child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        context.read<SignUpCubit>().updateFavoriteListSelected(
                            listFavoriteActivity[index]);
                      },
                    ),
                  )),
                ],
              );
            },
            childCount: listFavoriteActivity.length,
          ),
        ),
        const SliverToBoxAdapter(child: VSpacer(40)),
      ],
    );
  }

  Widget headerTitle(BuildContext context) {
    return Column(
      children: [
        Text('Hi Precious!',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Theme.of(context).primaryColor)),
        Text('Select 3 or more type of interest',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Theme.of(context).primaryColor)),
        const SizedBox(
          height: AppValues.margin_12,
        ),
      ],
    );
  }

  Widget imageItem(AssetImage image) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            blurStyle: BlurStyle.inner,
            color: Color.fromRGBO(0, 0, 0, 0.5),
            blurRadius: 16,
            offset: Offset(0, 1)),
      ], borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image(image: image, fit: BoxFit.cover),
      ),
    );
  }
}

class BlurTextView extends StatelessWidget {
  const BlurTextView({
    super.key,
    required this.name,
    required this.isSelected,
  });

  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
              color: AppColors.backgroundBlackOpacity200,
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  isSelected
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: AppValues.iconSize_20,
                        )
                      : const SizedBox(
                          height: 20,
                        )
                ],
              )),
        ),
      ),
    );
  }
}
