import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj/helper/textStyle.dart';
import 'package:prj/pages/login/obj.dart';
import '../core/Widget/btn/baseBorderButton.dart';
import '../core/Widget/card/card1.dart';
import '../core/Widget/card/cardMore.dart';
import '../core/Widget/sections/containerBackColor.dart';
import '../core/Widget/sections/rowSpaceBetween.dart';
import '../core/Widget/slideShow.dart';
import '../core/abstract/baseNavigationWidget.dart';
import '../core/model/enums.dart';
import '../core/model/navigation.dart';
import '../helper/appFont.dart';
import '../helper/objectColor.dart';
import 'main/myApp.dart';

class HomePage extends BaseStatefulWidget<_HomePage> {
  HomePage(GlobalKey<NavigatorState> key) : super(key);

  @override
  _HomePage createState(){
    state = _HomePage();
    return state!;
  }
}

class _HomePage extends BaseNavigationWidget {
  _HomePage() : super(ChengState(StateType.Main), RouteList.HomePage);
  @override
  Widget stateBuild(BuildContext context) {
    return Column(children: [
      BaseBorderButton(
        '',
        btnColor: MyApp.color.baseTextColor,
        pading: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 7.0),
        onPress:() {},
        icon: AppFont.search_normal_11,
        textStyle: Style.h4(),
      ),

      SlideShow(
        padding: EdgeInsets.symmetric(vertical: 14.0),
        height: 200,
        children: [
          Image.asset('assets/img/slid1.jpg',
            fit: BoxFit.fill,
          ),
          Image.asset('assets/img/slid1.jpg',
            fit: BoxFit.fill,
          ),
          Image.asset('assets/img/slid1.jpg',
            fit: BoxFit.fill,
          )
        ],
      ),

      RowSpaceBetween(
        Text('دسته بندی ها', maxLines: 1,style: Style.h4(fontWeight: FontWeight.bold),),
        Text('بیشتر', maxLines: 1,style: Style.h5(color: MyApp.color.linkColor),),
      ),
      list1(context),

      Padding(
        padding: EdgeInsets.only(top: 25.0),
        child:
        RowSpaceBetween(
          Text('محبوب ترین', maxLines: 1,style: Style.h4(fontWeight: FontWeight.bold),),
          Text('بیشتر', maxLines: 1,style: Style.h5(color: MyApp.color.linkColor),),
        ),
      ),
      list2(context),

      Padding(
        padding: EdgeInsets.only(top: 25.0),
        child:
        RowSpaceBetween(
          Text('دارای تخفیف', maxLines: 1,style: Style.h4(fontWeight: FontWeight.bold),),
          Text('بیشتر', maxLines: 1,style: Style.h5(color: MyApp.color.linkColor),),
        ),
      ),
      list1(context),

      Padding(
        padding: EdgeInsets.only(top: 25.0),
        child:
        RowSpaceBetween(
          Text('کالای اساسی', maxLines: 1,style: Style.h4(fontWeight: FontWeight.bold),),
          Text('بیشتر', maxLines: 1,style: Style.h5(color: MyApp.color.linkColor),),
        ),
      ),
      list2(context),
    ]);
  }

  Widget list1(BuildContext context) {
    List<Widget> list=[];
    list.add(Card1(img:'assets/img/1.png',text:'نان'));
    list.add(Card1(img:'assets/img/2.png',text:'لبنیات'));
    list.add(Card1(img:'assets/img/3.png',text:'تنقلات'));
    list.add(Card1(img:'assets/img/4.png',text:'میوه و سبزی'));
    list.add(Card1(img:'assets/img/5.png',text:'کالای اساسی'));
    list.add(CardMore());
    return
      Padding(
          padding: EdgeInsets.only(top: 5.0),
          child:
          Container(
            height: 210,
            child:
            ListView(
                scrollDirection: Axis.horizontal,
                children: list
            ),
          )
      );
  }

  Widget list2(BuildContext context) {
    List<Widget> list=[];
    list.add(Card1(img:'assets/img/5.png',text:'کالای اساسی'));
    list.add(Card1(img:'assets/img/1.png',text:'نان'));
    list.add(Card1(img:'assets/img/4.png',text:'میوه و سبزی'));
    list.add(Card1(img:'assets/img/3.png',text:'تنقلات'));
    list.add(Card1(img:'assets/img/2.png',text:'لبنیات'));
    list.add(CardMore());
    return
      Padding(
          padding: EdgeInsets.only(top: 5.0),
          child:
          Container(
            height: 210,
            child:
            ListView(
                scrollDirection: Axis.horizontal,
                children: list
            ),
          )
      );
  }

}