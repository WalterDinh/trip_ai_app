import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/ui/widgets/spacer.dart';

List<String> items = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
];

class ReviewTab extends StatefulWidget {
  const ReviewTab({Key? key}) : super(key: key);

  @override
  State<ReviewTab> createState() => _ReviewTabState();
}

class _ReviewTabState extends State<ReviewTab> {
  late TextEditingController textEditingController;
  late FocusNode focusNode;

  @override
  void initState() {
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(primary: true, slivers: <Widget>[
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            const ItemReview(
              reviewContent: 'Good trip',
              reviewerName: 'Haku',
              avatarUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU',
            ),
            const ItemReview(
              reviewContent: 'This trip plan was amazing!',
              reviewerName: 'John Doe',
              avatarUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU',
            ),
            const ItemReview(
              reviewContent: 'Good trip',
              reviewerName: 'Haku',
              avatarUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU',
            ),
            const VSpacer(24),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(children: [
                Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Write a comment',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.textHintColorGrey),
                          suffixIcon: Icon(Icons.send,
                              color: Theme.of(context).primaryColor),
                          contentPadding: const EdgeInsets.all(14),
                          fillColor: AppColors.backgroundTextFieldOpacity,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0.0),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1.0),
                          ))),
                )
              ]),
            )
          ],
        ),
      ))
    ]);
  }
}

class ItemReview extends StatelessWidget {
  final String avatarUrl;
  final String reviewerName;
  final String reviewContent;

  const ItemReview({
    required this.avatarUrl,
    required this.reviewerName,
    required this.reviewContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
            radius: 24.0,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviewerName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(reviewContent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
