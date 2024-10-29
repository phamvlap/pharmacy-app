import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImagesSlider extends StatefulWidget {
  final List<String> imageUrls;

  const CarouselImagesSlider(
    this.imageUrls, {
    super.key,
  });

  @override
  State<CarouselImagesSlider> createState() => _CarouselImagesSliderState();
}

class _CarouselImagesSliderState extends State<CarouselImagesSlider> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int imageCount = widget.imageUrls.length;

    return SizedBox(
      height: 300.0,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              height: 300.0,
              viewportFraction: 1.0,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
            ),
            items: widget.imageUrls.map(
              (imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              },
            ).toList(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 48.0,
              height: 48.0,
              margin: const EdgeInsets.only(left: 8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[400],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.grey[700],
                ),
                onPressed: () {
                  carouselController.previousPage();
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 48.0,
              height: 48.0,
              margin: const EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[400],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey[700],
                ),
                onPressed: () {
                  carouselController.nextPage();
                },
              ),
            ),
          ),
          Positioned(
            right: 8.0,
            bottom: 8.0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                '${_currentIndex + 1}/$imageCount',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
