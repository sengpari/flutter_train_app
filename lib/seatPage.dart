import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  final String departureStation;
  final String arrivalStation;

  const SeatPage({
    super.key,
    required this.departureStation,
    required this.arrivalStation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        children: [
          //출발역과 도착역 표시
          SizedBox(
            height: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.arrow_circle_right_outlined, size: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      departureStation,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),

                    //SizedBox(width: 50),
                    Text(
                      arrivalStation,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          //좌석 선택됨과 선택안됨
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
                      color: Colors.grey[300],
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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
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
        ],
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
        seat(),
        seat(),
        Expanded(
          child: Center(child: Text('$rowNum', style: TextStyle(fontSize: 17))),
        ),

        seat(),
        seat(),
      ],
    );
  }

  Widget seat() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
