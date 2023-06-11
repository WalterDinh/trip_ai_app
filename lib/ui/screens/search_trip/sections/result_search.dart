part of '../search_trip_page.dart';

class ResultSearch extends StatelessWidget {
  const ResultSearch({
    super.key,
    this.data,
  });
  final List<dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
              child: Text(
                'Result',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: AppColors.grey),
              ),
            ),
            Column(
              children: data!.map((e) => Text('23')).toList(),
            )
          ],
        ),
      ),
    );
  }
}
