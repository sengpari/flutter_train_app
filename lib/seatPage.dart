import 'package:flutter/material.dart';


class SeatPage extends StatelessWidget {
final String departureStation;
  final String arrivalStation;

  const SeatPage({super.key,required this.departureStation,
    required this.arrivalStation,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택'),centerTitle: true),
      body: Column(
        children: [
          Row(children: [
            Text(departureStation, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),),
            SizedBox(width: 10),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
              Text(arrivalStation, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),),
          ],),
          Text('선택됨과 선택안됨'),
          Text('좌석박스배열'),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
              
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
        ],
      ),
    );
  }
}