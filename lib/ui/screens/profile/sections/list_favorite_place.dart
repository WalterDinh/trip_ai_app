import 'package:flutter/material.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/ui/screens/profile/widgets/item_place.dart';

class ListFavoritePlace extends StatelessWidget with BaseWidgetMixin {
  const ListFavoritePlace({
    super.key,
  });

  @override
  Widget body(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ItemPlace(
          onTab: () {
            return;
          },
          listAvatar: const [
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
          ],
          path: 'https://www.studytienganh.vn/upload/2021/05/99552.jpeg',
          locationName: 'Trang An, Ninh Binh',
          placeName: 'Ninh Binh',
        );
      },
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(left: 24),
        );
      },
    );
  }
}
