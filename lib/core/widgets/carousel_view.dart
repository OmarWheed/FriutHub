import 'package:flutter/material.dart';

class CustomCarouselController extends ChangeNotifier {
  final int initialItem;
  int _currentItem = 0;

  CustomCarouselController({this.initialItem = 0}) {
    _currentItem = initialItem;
  }

  int get currentItem => _currentItem;

  void jumpToItem(int item) {
    _currentItem = item;
    notifyListeners();
  }

  void nextItem() {
    _currentItem++;
    notifyListeners();
  }

  void previousItem() {
    _currentItem--;
    notifyListeners();
  }
}

class CustomCarouselView extends StatefulWidget {
  final List<Widget> children;
  final CustomCarouselController controller;
  final Axis scrollDirection;
  final double itemExtent;

  const CustomCarouselView({
    super.key,
    required this.children,
    required this.controller,
    this.scrollDirection = Axis.horizontal,
    this.itemExtent = 1.0,
  });

  @override
  State<CustomCarouselView> createState() => _CustomCarouselViewState();
}

class _CustomCarouselViewState extends State<CustomCarouselView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.controller.initialItem,
      viewportFraction: widget.itemExtent,
    );
    widget.controller.addListener(_handleControllerChange);
  }

  @override
  void dispose() {
    _pageController.dispose();
    widget.controller.removeListener(_handleControllerChange);
    super.dispose();
  }

  void _handleControllerChange() {
    if (_pageController.page?.round() != widget.controller.currentItem) {
      _pageController.animateToPage(
        widget.controller.currentItem,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: widget.scrollDirection,
      onPageChanged: (index) {
        widget.controller.jumpToItem(index);
      },
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        return widget.children[index];
      },
    );
  }
} 