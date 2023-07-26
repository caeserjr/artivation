import 'package:Artivation/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class LoadingContainer extends StatefulWidget {
  final double? size, height, width;
  final int itemCount;
  final String type;
  const LoadingContainer({
    Key? key,
    this.size = 40,
    this.height = 40,
    this.width,
    this.type = "profile",
    this.itemCount = 10,
  }) : super(key: key);

  @override
  State<LoadingContainer> createState() => _LoadingContainerState();
}

class _LoadingContainerState extends State<LoadingContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.type == "profile"
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ShimmerEffect.circular(
                  height: 64,
                  width: 64,
                  shapeBorder: CircleBorder(),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 20,
                    ),
                    child: ShimmerEffect.rectangular(
                      height: 15,
                      width: MediaQuery.of(context).size.width * .35,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 10,
                    ),
                    child: ShimmerEffect.rectangular(
                      height: 15,
                      width: MediaQuery.of(context).size.width * .65,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        : widget.type == "explore"
            ? Container(
                child: ShimmerEffect.circular(
                  height: 250,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              )
            : Container(
                child: ListView.builder(
                  itemCount: widget.itemCount,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ShimmerEffect.circular(
                        height: 64,
                        width: 64,
                        shapeBorder: CircleBorder(),
                      ),
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: ShimmerEffect.rectangular(
                          height: 15,
                          width: MediaQuery.of(context).size.width * .35,
                          shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      subtitle: ShimmerEffect.rectangular(
                        height: 14,
                        shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  },
                ),
              );
  }
}
