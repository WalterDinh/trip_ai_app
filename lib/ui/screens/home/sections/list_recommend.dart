part of '../home.dart';

class ListRecommend extends StatelessWidget with BaseWidgetMixin {
  ListRecommend(this.heightCard, this.onPressItem);
  final double heightCard;

  final Function(int id) onPressItem;

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: heightCard,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const ScrollPhysics(parent: ClampingScrollPhysics()),
            primary: false,
            shrinkWrap: false,
            cacheExtent: 6,
            itemCount: 6,
            itemBuilder: (_, index) {
              return ItemRecommend(
                onTab: () {
                  onPressItem(0);
                },
                listAvatar: const [
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU"
                ],
                path: 'https://www.studytienganh.vn/upload/2021/05/99552.jpeg',
                locationName: 'Trang An, Ninh Binh',
                placeName: 'Ninh Binh',
              );
            },
            padding: const EdgeInsets.symmetric(
                horizontal: AppValues.extraLargePadding),
            separatorBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(left: 24),
              );
            },
          ),
        )
      ],
    );
  }
}
