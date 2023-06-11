part of '../search_trip_page.dart';

class DefaultSearchView extends StatelessWidget {
  const DefaultSearchView({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          AppImages.deleteIcon,
          width: AppValues.iconSize_28,
          height: AppValues.iconSize_28,
        ),
        const VSpacer(16),
        Text(
          'Search in contents',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const VSpacer(8),
        Text(
          'Search file names and content for\n your search terms.',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.grey, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
