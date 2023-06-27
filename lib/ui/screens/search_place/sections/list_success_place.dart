part of '../search_place_page.dart';

class ListSuccessPlace extends StatelessWidget {
  double itemHeight = 90;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Near you',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.grey),
                ),
                Column(
                  children: [1, 2, 3, 4]
                      .map((e) => ItemPlaceSearch(
                            itemHeight: itemHeight,
                            address: '12 Trang An',
                            rating: 4.5,
                            title: 'Moon Coffee',
                            type: 'Coffee shop',
                            imageUrl:
                                'https://miro.medium.com/v2/resize:fit:1200/1*lOMXPP4Q1o5zu0VZEGr2sg.jpeg',
                          ))
                      .toList(),
                )
              ],
            )),
      ),
    );
  }
}
