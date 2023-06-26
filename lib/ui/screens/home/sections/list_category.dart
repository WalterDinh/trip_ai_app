part of '../home.dart';

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

class ListCategory extends StatelessWidget with BaseWidgetMixin {
  ListCategory({
    super.key,
    required this.heightCategory,
  });

  final double heightCategory;

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        header(context),
        SizedBox(
          height: heightCategory,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const ScrollPhysics(parent: ClampingScrollPhysics()),
            itemCount: listFavoriteActivity.length,
            itemBuilder: (_, index) {
              return ItemCategory(
                onTab: () {
                  return;
                },
                categoryName: listFavoriteActivity[index].name,
                path: 'https://www.studytienganh.vn/upload/2021/05/99552.jpeg',
              );
            },
            padding: const EdgeInsets.symmetric(horizontal: 32),
            separatorBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(left: 14),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget header(BuildContext context) => Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppValues.extraLargePadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Catagories',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            // Ripple(
            //   onTap: () {
            //     return;
            //   },
            //   child: Text(
            //     'See all',
            //     style: Theme.of(context)
            //         .textTheme
            //         .labelMedium!
            //         .copyWith(color: AppColors.textColorGreyLight),
            //   ),
            // )
          ],
        ),
      );
}
