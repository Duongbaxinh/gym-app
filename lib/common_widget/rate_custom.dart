import 'package:flutter/material.dart';

class RateCustom extends StatelessWidget {
  final double ratting;
  final double size;
  final String? label;
  final Color colorTrack;
  final double height;
  final double min;
  final double max;
  final bool thumShape;
  final int division;
  final bool toplables;
  final List<String> titles;
  final void Function(double)? onRatting;

  const RateCustom(
      {super.key,
      required this.ratting,
      required this.size,
      this.thumShape = false,
      this.label,
      this.onRatting,
      this.height = 25,
      this.min = 0,
      this.max = 100,
      this.division = 5,
      this.toplables = false,
      this.titles = const ['0.0', '1.0', '2.0', '3.0', '4.0', '5.0'],
      this.colorTrack = Colors.white});
  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.headline3!;
    Color colorActive = Theme.of(context).colorScheme.onSecondary!;
    TextStyle subLabel = Theme.of(context).textTheme.subtitle2!;
    List<Widget> topTitle(titles) {
      List<Widget> topWidget = [];
      for (int i = 0; i < titles.length; i++) {
        topWidget.add(Text(
          titles[i],
          style: titleStyle.copyWith(
              color: (i < ratting || i != ratting)
                  ? Colors.transparent
                  : colorActive),
        ));
      }
      return topWidget;
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: topTitle(titles),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (label != null)
                Text(
                  label!,
                  style: subLabel,
                ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      trackHeight: size,
                      valueIndicatorColor: Colors.white,
                      tickMarkShape:
                          RoundSliderTickMarkShape(tickMarkRadius: 0),
                      thumbShape: thumShape
                          ? RoundSliderThumbShape(
                              enabledThumbRadius: height / 2.5, elevation: 0)
                          : SliderComponentShape.noThumb,
                      overlayShape: SliderComponentShape.noOverlay),
                  child: Slider(
                    value: ratting,
                    min: min,
                    max: max,
                    activeColor: colorTrack,
                    inactiveColor: Colors.green,
                    divisions: division,
                    // label: ratting.toString(),
                    onChanged: (value) {
                      if (onRatting != null) {
                        onRatting!(value);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
