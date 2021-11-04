import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifesum/abdominal_crunch_page.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  late  List<bool> _isChecked;
  static final Color shoppingListItemC = Color(0xff333333);
  static final Color shoppingListItemAmountC = Color(0xff989898);
  static final Color shoppingListItemBorderC = Color(0xffF0F0F0);

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(15, false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ShoppingListAppBar(
          height: 55,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(children: [
            Text(
              'TUE 11/12 -> THU 11/4 ',
              textAlign: TextAlign.center,
            ),
            Text(
              'This list is based on the days showing in your meal planner ',
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 35,horizontal: 10),
                  itemCount: 15,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border(
                              bottom: BorderSide(
                                width: 1,
                                  color: shoppingListItemBorderC
                              ),
                          ),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            splashRadius: 50,
                            checkColor: Colors.white,
                            value: _isChecked[index],
                            shape: CircleBorder(),
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked[index] = value!;
                              });
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Avacado',
                                style: TextStyle(color: shoppingListItemC, fontSize: 15 ),
                              ),
                              Text(
                                '20 grams',
                                style: TextStyle(color: shoppingListItemAmountC, fontSize: 11 ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}

//appbar
class ShoppingListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  static final Color shoppingListC = Color(0xff10a196);
  final double height;

  const ShoppingListAppBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border( ),
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
            Text(
              "Shopping List",
              style: TextStyle(color: Colors.black,fontSize: 18),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AbdominalCrunch()));
              },
              child: Icon(
                Icons.share,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
