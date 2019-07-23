import 'package:flutter/material.dart';
import 'package:get_closr/src/ui/shared/app_colors.dart';
import 'package:get_closr/src/ui/shared/ui_helper.dart';
import 'package:get_closr/src/ui/views/home.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class TestView extends StatefulWidget {
  TestView({Key key}) : super(key: key);

  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  final double _initFabHeight = 120.0;

  double _fabHeight;
  double _panelHeightOpen = 575.0;
  double _panelHeightClosed = 95.0;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .1,
            body: HomeView(),
            collapsed: Container(
              decoration: BoxDecoration(
                color: kClosrBackgroundWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  UIHelper.verticalSpaceSmall(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                            color: kClosrGrey,
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            panel: _panel(),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
          // Positioned(
          //   right: 20.0,
          //   bottom: _fabHeight,
          //   child: FloatingActionButton(
          //     child: Icon(
          //       Icons.gps_fixed,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //     onPressed: () {},
          //     backgroundColor: Colors.white,
          //   ),
          // ),
          // Positioned(
          //   top: 42.0,
          //   child: Container(
          //     padding: const EdgeInsets.fromLTRB(24.0, 18.0, 24.0, 18.0),
          //     child: Text(
          //       "SlidingUpPanel Example",
          //       style: TextStyle(fontWeight: FontWeight.w500),
          //     ),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(24.0),
          //       boxShadow: [
          //         BoxShadow(
          //             color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16.0)
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _panel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 12.0,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Container(
        //       width: 30,
        //       height: 5,
        //       decoration: BoxDecoration(
        //           color: Colors.grey[300],
        //           borderRadius: BorderRadius.all(Radius.circular(12.0))),
        //     ),
        //   ],
        // ),
        SizedBox(
          height: 18.0,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Text(
        //       "Explore Pittsburgh",
        //       style: TextStyle(
        //         fontWeight: FontWeight.normal,
        //         fontSize: 24.0,
        //       ),
        //     ),
        //   ],
        // ),
        SizedBox(
          height: 36.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button("Popular", Icons.favorite, Colors.blue),
            _button("Food", Icons.restaurant, Colors.red),
            _button("Events", Icons.event, Colors.amber),
            _button("More", Icons.more_horiz, Colors.green),
          ],
        ),
        SizedBox(
          height: 36.0,
        ),
        Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Images",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl:
                        "https://images.fineartamerica.com/images-medium-large-5/new-pittsburgh-emmanuel-panagiotakis.jpg",
                    height: 120.0,
                    width: (MediaQuery.of(context).size.width - 48) / 2 - 2,
                    fit: BoxFit.cover,
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        "https://cdn.pixabay.com/photo/2016/08/11/23/48/pnc-park-1587285_1280.jpg",
                    width: (MediaQuery.of(context).size.width - 48) / 2 - 2,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 36.0,
        ),
        Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("About",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Pittsburgh is a city in the Commonwealth of Pennsylvania "
                "in the United States, and is the county seat of Allegheny County. "
                "As of 2017, a population of 305,704 lives within the city limits, "
                "making it the 63rd-largest city in the U.S. The metropolitan population "
                "of 2,353,045 is the largest in both the Ohio Valley and Appalachia, "
                "the second-largest in Pennsylvania (behind Philadelphia), "
                "and the 26th-largest in the U.S.  Pittsburgh is located in the "
                "south west of the state, at the confluence of the Allegheny, "
                "Monongahela, and Ohio rivers, Pittsburgh is known both as 'the Steel City' "
                "for its more than 300 steel-related businesses and as the 'City of Bridges' "
                "for its 446 bridges. The city features 30 skyscrapers, two inclined railways, "
                "a pre-revolutionary fortification and the Point State Park at the "
                "confluence of the rivers. The city developed as a vital link of "
                "the Atlantic coast and Midwest, as the mineral-rich Allegheny "
                "Mountains made the area coveted by the French and British "
                "empires, Virginians, Whiskey Rebels, and Civil War raiders. ",
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _button(String label, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration:
              BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 8.0,
            )
          ]),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }

  Widget _body() {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(40.441589, -80.010948),
        zoom: 13,
        maxZoom: 15,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png"),
        MarkerLayerOptions(markers: [
          Marker(
              point: LatLng(40.441753, -80.011476),
              builder: (ctx) => Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 48.0,
                  ),
              height: 60),
        ]),
      ],
    );
  }
}
