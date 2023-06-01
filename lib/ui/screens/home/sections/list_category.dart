part of '../home.dart';

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
            itemCount: 9,
            itemBuilder: (_, index) {
              return ItemCategory(
                onTab: () {
                  return;
                },
                categoryName: 'Culture',
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
            Ripple(
              onTap: () {
                return;
              },
              child: Text(
                'See all',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: AppColors.textColorGreyLight),
              ),
            )
          ],
        ),
      );
}
