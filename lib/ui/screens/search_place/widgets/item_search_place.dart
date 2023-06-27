import 'package:flutter/material.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/spacer.dart';
import 'package:my_app/ui/widgets/start_rating.dart';

class ItemPlaceSearch extends StatelessWidget {
  const ItemPlaceSearch({
    super.key,
    required this.itemHeight,
    required this.title,
    required this.rating,
    required this.type,
    required this.address,
    required this.imageUrl,
  });

  final double itemHeight;
  final String title;
  final String imageUrl;

  final double rating;
  final String type;
  final String address;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 6,
          borderOnForeground: true,
          margin: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppValues.smallRadius),
                    child: Image.network(
                        height: itemHeight,
                        width: itemHeight * 3 / 4,
                        fit: BoxFit.cover,
                        imageUrl),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const VSpacer(4),
                    Row(
                      children: [
                        Text(rating.toString()),
                        StarRating(
                          starCount: 5,
                          rating: rating,
                        )
                      ],
                    ),
                    Text('$type - $address'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
