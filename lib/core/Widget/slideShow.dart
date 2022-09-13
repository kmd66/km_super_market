import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helper/objectColor.dart';
import '../../pages/main/myApp.dart';

class SlideShow extends StatefulWidget {
  SlideShow({required this.children, required this.height, this.padding});
  final List<Widget> children;
  final double height;
  final EdgeInsets? padding;

  @override
  State<SlideShow> createState() => _SlideShow();
}

class _SlideShow extends State<SlideShow> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  List<Widget> get children =>widget.children;
  List<Widget> btns = [];
  bool _isTimer = true;

  @override
  void setState(fn) {
    if(mounted)
      super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: children.length,
      vsync: this,
    );
    _tabController?.addListener(_handleTabIndex);
    btnsAdd();
    startTimer();
  }

  @override
  void dispose() {
    _tabController?.removeListener(_handleTabIndex);
    _tabController?.dispose();
    _isTimer = false;
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {
      btnsAdd();
    });
  }

  void btnsAdd() {
    btns = [];
    for( var i = 0 ; i < children.length; i++ ) {
      btns.add(circleContainer(i));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: widget.height,
        color: MyApp.color.baseBackground,
        padding: widget.padding,
        child: Stack(
          children: [
            Container(
              child:
              TabBarView(
                controller: _tabController,
                children: children,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: btns,
              ),
            )
          ],
        ),
      );
  }
  Widget circleContainer(int i) {
    return
      InkWell(
        onTap: (){
          _tabController!.index = i;
        },
        child:Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
          width: i == _tabController?.index? 15: 10,
          height: 10,
          decoration: BoxDecoration(
              borderRadius: i == _tabController?.index? BorderRadius.circular(5):null,
              shape: i == _tabController?.index? BoxShape.rectangle: BoxShape.circle,
              color:  i == _tabController?.index? MyApp.color.linkColor:darkText
          ),
        ),
      );
  }

  void startTimer() async{
    if(!_isTimer)
      return;

    await Future.delayed(const Duration(milliseconds: 5000), ()
    {
      var i = _tabController!.index + 1;
      if(i>=children.length)
        i = 0;
      _tabController!.index = i;
      startTimer();
    }
    );
  }
}