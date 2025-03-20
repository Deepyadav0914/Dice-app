import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Generated/assets.dart';
import 'exit_dialog.dart';
import 'flare.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = '/GameScreen';
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int randomNo = 1;
  bool toAnimate = false;
  int ply1 = 0, ply2 = 0;
  bool plyturn = true;
  bool isComputer = false;
  var name = 'assets/images/custom.png';
  var boardName1 = 'assets/images/board.png';
  var boardName2 = 'assets/images/custom.png';
  bool changeBoard = false;

  int order(int n) {
    if (n <= 10) {
      return 11 - n;
    } else if (n <= 30 && n > 20) {
      return 31 - n + 20;
    } else if (n <= 50 && n > 40) {
      return 51 - n + 40;
    } else if (n <= 70 && n > 60) {
      return 71 - n + 60;
    } else if (n <= 90 && n > 80) {
      return 91 - n + 80;
    } else {
      return n;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesBg), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.r),
                  child: buildAppBar(context),
                ),
                plyturn
                    ? Container(
                        height: 90,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset(Assets.imagesRed, height: 58),
                            Text(
                              isComputer ? 'Computer' : 'Player 1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'VarelaRound',
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    : isComputer
                        ? Container(
                            height: 90,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child:
                                      Image.asset(Assets.imagesRed, height: 58),
                                ),
                                Expanded(
                                  child: Text(
                                    isComputer ? 'Computer' : 'Player 1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'VarelaRound',
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 2, color: Colors.grey),
                                      ),
                                      child: toAnimate
                                          ? Flare(
                                              animation: '1',
                                            )
                                          : Image.asset(
                                              'assets/images/$randomNo.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : player1(context),
                Container(
                  height: 410,
                  width: 500,
                  child: Stack(
                    children: [
                      Container(
                        child: GridView.count(
                          crossAxisCount: 10, padding: EdgeInsets.all(2),
                          // Generate 100 widgets that display their index in the List.
                          children: List.generate(100, (index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              margin: EdgeInsets.all(0),
                              borderOnForeground: true,
                              color: ply1 == 100 - index || ply2 == 100 - index
                                  ? Color.fromRGBO(255, 255, 255, 1)
                                  : (10 <= index && index <= 19) ||
                                          (30 <= index && index <= 39) ||
                                          (50 <= index && index <= 59) ||
                                          (70 <= index && index <= 79) ||
                                          (90 <= index && index <= 99)
                                      ? index.isOdd
                                          ? Color.fromRGBO(220, 200, 109, 1)
                                          : Color.fromRGBO(39, 25, 60, 1)
                                      : index.isEven
                                          ? Color.fromRGBO(220, 200, 109, 1)
                                          : Color.fromRGBO(39, 25, 60, 1),
                              child: Text(
                                ' ${order(100 - index)}',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          name,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        child: GridView.count(
                          crossAxisCount: 10,
                          padding: EdgeInsets.all(2),
                          children: List.generate(100, (index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              margin: EdgeInsets.all(0),
                              borderOnForeground: true,
                              color: Color.fromRGBO(255, 255, 255, 0.0),
                              child: ply1 == 100 - index
                                  ? ply1 == ply2
                                      ? Center(
                                          child: Image.asset(
                                              Assets.imagesYellow,
                                              height: 30),
                                        )
                                      : Center(
                                          child: Image.asset(Assets.imagesRed,
                                              height: 30),
                                        )
                                  : ply2 == 100 - index
                                      ? ply1 == ply2
                                          ? Center(
                                              child: Image.asset(
                                                  Assets.imagesYellow,
                                                  height: 30),
                                            )
                                          : Center(
                                              child: Image.asset(
                                                  Assets.imagesYellow,
                                                  height: 30),
                                            )
                                      : SizedBox(),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                !plyturn
                    ? Container(
                        height: 90,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(Assets.imagesYellow, height: 58),
                            Text(
                              'Player 2',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'VarelaRound',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      )
                    : player2(context),
                Center(
                  child: Text(
                    '-> Get 1 to start the game for a players <-',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'VarelaRound',
                        color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ShowDialog().exitDialog(context);
                  },
                  child: Container(
                    height: 40.r,
                    width: 150.r,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(width: 3.r, color: Colors.grey),
                    ),
                    child: Center(
                      child: Text(
                        'Exit Game',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'VarelaRound',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.r,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    ]));
  }

  Container player2(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(Assets.imagesYellow, height: 58),
          ),
          Expanded(
            child: Text(
              'Player 2',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                player2onTap();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                  child: toAnimate
                      ? Flare(
                          animation: '1',
                        )
                      : Image.asset('assets/images/$randomNo.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container player1(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(Assets.imagesRed, height: 58),
          ),
          Expanded(
            child: Text(
              isComputer ? 'Computer' : 'Player 1',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'VarelaRound',
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  player1onTap();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                  height: 100,
                  child: toAnimate
                      ? Flare(
                          animation: '1',
                        )
                      : Image.asset('assets/images/$randomNo.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Snakes & Ladders',
          style: TextStyle(
              fontFamily: 'VarelaRound',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25),
        ),
        Spacer(),
        IconButton(
            icon: Icon(
              !isComputer ? Icons.computer_outlined : Icons.people_outline,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.white)),
                        title: Container(
                          height: 40.r,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: Colors.grey.shade700),
                          child: Center(
                            child: Text('Snakes & Ladders',
                                style: TextStyle(
                                    fontFamily: 'VarelaRound',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        content: Text(
                          isComputer
                              ? "Would you like to change Player1 to mannual"
                              : "Would you like to convert Player 1 to Computer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.r,
                              fontFamily: 'VarelaRound',
                              fontWeight: FontWeight.w600),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.r),
                            ),
                            onPressed: () {
                              setState(() {
                                isComputer = !isComputer;
                                plyturn = true;
                                print('isComputer = $isComputer');
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.shade700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'No',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.r),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ));
              // setState(() {
              //   isComputer = !isComputer;
              // });
            }),
        IconButton(
            icon: Icon(Icons.refresh, size: 30, color: Colors.white),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.white)),
                        title: Container(
                          height: 40.r,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: Colors.grey.shade700),
                          child: Center(
                            child: Text('Snakes & Ladders',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'VarelaRound',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        content: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            "Would you like  Restart  Game ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.r,
                                fontFamily: 'VarelaRound',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Change Board',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.r),
                            ),
                            onPressed: () {
                              setState(() {
                                changeBoard = !changeBoard;
                                changeBoard
                                    ? name = boardName1
                                    : name = boardName2;
                                ply1 = 0;
                                ply2 = 0;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.r),
                            ),
                            onPressed: () {
                              setState(() {
                                ply1 = 0;
                                ply2 = 0;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                          10.horizontalSpace,
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.shade700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'No',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.r),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ));
              // setState(() {
              //   ply1=0;ply2=0;
              //   // ply1 = 100;
              // });
            })
      ],
    );
  }

  int snakeLadderCmd(int ply) {
    switch (ply) {
      // Snakes
      case 99:
        ply = 66;
        break;
      case 95:
        ply = 72;
        break;
      case 79:
        ply = 49;
        break;
      case 63:
        ply = 41;
        break;
      case 56:
        ply = 36;
        break;
      case 44:
        ply = 33;
        break;
      case 37:
        ply = 30;
        break;
      case 25:
        ply = 16;
        break;
      case 21:
        ply = 3;
        break;
      case 18:
        ply = 7;
        break;

      // Ladders
      case 5:
        ply = 14;
        break;
      case 20:
        ply = 29;
        break;
      case 23:
        ply = 45;
        break;
      case 40:
        ply = 48;
        break;
      case 42:
        ply = 53;
        break;
      case 58:
        ply = 67;
        break;
      case 70:
        ply = 90;
        break;
      case 71:
        ply = 92;
        break;
      case 75:
        ply = 97;
        break;

      default:
    }
    return ply;
  }

  int snakeLadderCmd2(int ply) {
    switch (ply) {
      // Snakes
      case 17:
        ply = 6;
        break;
      case 33:
        ply = 14;
        break;
      case 39:
        ply = 28;
        break;
      case 54:
        ply = 46;
        break;
      case 81:
        ply = 43;
        break;
      case 99:
        ply = 18;
        break;

      // Ladders
      case 84:
        ply = 95;
        break;
      case 47:
        ply = 86;
        break;
      case 50:
        ply = 59;
        break;
      case 2:
        ply = 43;
        break;
      default:
    }
    return ply;
  }

  player2onTap() {
    var randomizer = Random(); // can get a seed as a parameter

    setState(() {
      toAnimate = true;
      Future.delayed(Duration(seconds: 1)).whenComplete(() {
        setState(() {
          randomNo = randomizer.nextInt(6) + 1;
          print(randomNo);
          toAnimate = false;
          ply2 == 0
              ? randomNo == 1
                  ? ply2 = order(randomNo)
                  : ply2 = 0
              : ply2 + randomNo > 100
                  ? ply2 = ply2
                  : ply2 = 0;
          Future.delayed(Duration(seconds: 1)).whenComplete(() {
            setState(() {
              ply2 = changeBoard ? snakeLadderCmd2(ply2) : snakeLadderCmd(ply2);
            });
          });
          if (ply2 == 100) {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.white)),
                      title: Container(
                        height: 40.r,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: Colors.grey.shade700),
                        child: Center(
                          child: Text('Snakes & Ladders',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'VarelaRound',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      // content:
                      //     Text(""),
                      content: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          "Player 2 WON !!!\nDo you want to Restart ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.r,
                              fontFamily: 'VarelaRound',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Yes',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.r),
                          ),
                          onPressed: () {
                            setState(() {
                              ply1 = 0;
                              ply2 = 0;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'No',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.r),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ));
          }
        });
      });
      Future.delayed(Duration(milliseconds: 1500)).whenComplete(() {
        setState(() {
          plyturn = !plyturn;
          if (isComputer) {
            toAnimate = true;
            Future.delayed(Duration(seconds: 1)).whenComplete(() {
              setState(() {
                randomNo = randomizer.nextInt(6) + 1;
                print(randomNo);
                toAnimate = false;
                ply1 == 0
                    ? randomNo == 1
                        ? ply1 = order(randomNo)
                        : ply1 = 0
                    : ply1 + randomNo > 100
                        ? ply1 = ply1
                        : ply1 = 0;
                Future.delayed(Duration(seconds: 1)).whenComplete(() {
                  setState(() {
                    ply1 = changeBoard
                        ? snakeLadderCmd2(ply1)
                        : snakeLadderCmd(ply1);
                  });
                });
                if (ply1 == 100) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            backgroundColor: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Colors.white)),
                            title: Container(
                              height: 40.r,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r),
                                  color: Colors.grey.shade700),
                              child: Center(
                                child: Text('Snakes & Ladders',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'VarelaRound',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            content: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                "Computer WON !!!\nDo you want to Restart ?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.r,
                                    fontFamily: 'VarelaRound',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.r),
                                ),
                                onPressed: () {
                                  setState(() {
                                    ply1 = 0;
                                    ply2 = 0;
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.grey.shade700,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.r),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ));
                }
              });
              Future.delayed(Duration(milliseconds: 1500)).whenComplete(() {
                setState(() {
                  plyturn = !plyturn;
                });
              });
            });
          }
        });
      });
    });
  }

  player1onTap() {
    var randomizer = Random();
    setState(() {
      toAnimate = true;
      Future.delayed(Duration(seconds: 1)).whenComplete(() {
        setState(() {
          randomNo = randomizer.nextInt(6) + 1;
          print(randomNo);
          toAnimate = false;
          ply1 == 0
              ? randomNo == 1
                  ? ply1 = order(randomNo)
                  : ply1 = 0
              : ply1 + randomNo > 100
                  ? ply1 = ply1
                  : ply1 = order(order(ply1) + randomNo);
          Future.delayed(Duration(seconds: 1)).whenComplete(() {
            setState(() {
              ply1 = changeBoard ? snakeLadderCmd2(ply1) : snakeLadderCmd(ply1);
            });
          });
          if (ply1 == 100) {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.white)),
                      title: Container(
                        height: 40.r,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: Colors.grey.shade700),
                        child: Center(
                          child: Text('Snakes & Ladders',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'VarelaRound',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      // content:
                      //     Text(""),
                      content: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          "Player 1 WON !!!\nDo you want to Restart ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.r,
                              fontFamily: 'VarelaRound',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Yes',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.r),
                          ),
                          onPressed: () {
                            setState(() {
                              ply1 = 0;
                              ply2 = 0;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'No',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.r),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ));
          }
        });
        Future.delayed(Duration(milliseconds: 1500)).whenComplete(() {
          setState(() {
            plyturn = !plyturn;
          });
        });
      });
    });
  }
}
