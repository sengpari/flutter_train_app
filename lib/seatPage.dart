import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SeatPage extends StatefulWidget {
  final String departureStation;
  final String arrivalStation;

  SeatPage({
    super.key,
    required this.departureStation,
    required this.arrivalStation,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  String? selectedCol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택'), centerTitle: true),
      body: Column(
        children: [
          //출발역과 도착역 표시
          SizedBox(
            height: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.arrow_circle_right_outlined, size: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.departureStation,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),

                      Text(
                        widget.arrivalStation,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          //좌석 선택됨과 선택안됨 안내
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 6),
                  Text('선택됨', style: TextStyle(fontSize: 13)),
                ],
              ),
              SizedBox(width: 20),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[700]
                          : Colors.white,

                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 6),
                  Text('선택안됨', style: TextStyle(fontSize: 13)),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              children: [
                //좌석배치도
                Row(
                  children: [
                    columnSeat('A'),
                    columnSeat('B'),
                    SizedBox(width: 60),
                    columnSeat('C'),
                    columnSeat('D'),
                  ],
                ),

                SizedBox(height: 6),
                seatRow(1),
                SizedBox(height: 6),
                seatRow(2),
                SizedBox(height: 6),
                seatRow(3),
                SizedBox(height: 6),
                seatRow(4),
                SizedBox(height: 6),
                seatRow(5),
                SizedBox(height: 6),
                seatRow(6),
                SizedBox(height: 6),
                seatRow(7),
                SizedBox(height: 6),
                seatRow(8),
                SizedBox(height: 6),
                seatRow(9),
                SizedBox(height: 6),
                seatRow(10),
                SizedBox(height: 6),
                seatRow(11),
                SizedBox(height: 6),
                seatRow(12),
                SizedBox(height: 6),
                seatRow(13),
                SizedBox(height: 6),
                seatRow(14),
                SizedBox(height: 6),
                seatRow(15),
                SizedBox(height: 6),
                seatRow(16),
                SizedBox(height: 6),
                seatRow(17),
                SizedBox(height: 6),
                seatRow(18),
                SizedBox(height: 6),
                seatRow(19),
                SizedBox(height: 6),
                seatRow(20),
              ],
            ),
          ),
        ],
      ),

      //예매하기 버튼
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (selectedRow != null && selectedCol != null) {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text("예매 하시겠습니까?"),
                    content: Text("좌석 : ${selectedRow}-${selectedCol}"),
                    actions: [
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        child: const Text("취소"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      CupertinoDialogAction(
                        child: const Text("확인"),
                        onPressed: () {
                          // 예매 처리 로직 자리
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('좌석을 선택해주세요')));
              }
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 3,
            ),
            child: const Text(
              '예매 하기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded columnSeat(String colSeat) {
    return Expanded(
      child: Center(child: Text('$colSeat', style: TextStyle(fontSize: 17))),
    );
  }

  Widget seatRow(int rowNum) {
    return Row(
      children: [
        seat(rowNum, 'A'),
        seat(rowNum, 'B'),
        Expanded(
          child: Center(child: Text('$rowNum', style: TextStyle(fontSize: 17))),
        ),

        seat(rowNum, 'C'),
        seat(rowNum, 'D'),
      ],
    );
  }

  Widget seat(int row, String col) {
    bool isSelected = selectedRow == row && selectedCol == col;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: AspectRatio(
          aspectRatio: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedCol = col;
                selectedRow = row;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.purple
                    : Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[700]
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
