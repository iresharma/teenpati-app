import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
	runApp(MaterialApp(
		home: Home(),
	));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

	TextEditingController controller = new TextEditingController();
	int min = 10;
	int money = 0;
	bool play = false;
	int given = 0;
	int initt = 0;
	var color = Colors.blue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
		appBar: AppBar(
			title: Text(
				"TEEN PATTI"
			),
			centerTitle: true,
			actions: <Widget>[
				OutlineButton.icon(
					onPressed: () {
						setState(() {
							min = 10;
							money = 0;
							play = false;
							given = 0;
							initt = 0;
							color = Colors.blue;
						});
					},
					icon: Icon(CupertinoIcons.restart),
					label: Text("Restart"))
			],
		),
		body: Padding(
			padding: EdgeInsets.fromLTRB(10, 100, 10, 50),
			child: Column(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					Text(money.toString()),
					TextField(
						controller: controller,
						keyboardType: TextInputType.numberWithOptions(),
					),
					CupertinoButton(
						child: Text(
							"start",
							style: TextStyle(
								color: color
							),
						),
						onPressed: () {
							setState(() {
								if(play != true){
									play = true;
									money = int.parse(controller.text);
									initt = int.parse(controller.text);
									color = Colors.red;
								}
							});
						},
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							Column(
								mainAxisAlignment: MainAxisAlignment.center,
								children: <Widget>[
									Text("Diff $min"),
									CupertinoButton.filled(
										child: Text("Raise"),
										onPressed: () {
											setState(() {
												min = min * 2;
												money = money - min;
											});
										},
									)
								],
							),
							CupertinoButton.filled(
								child: Text("Bind"),
								onPressed: () {
									setState(() {
										money = money - min;
									});
								}
							),
						],
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[

							CupertinoButton.filled(
								child: Text("fold"),
								onPressed: () {
									setState(() {
										play = false;
										money = initt - money;
									});
								}
							),
							CupertinoButton.filled(
								child: Text("show"),
								onPressed: () {
									setState(() {
										min = min * 2;
										money = money - min;
									});
								}
							),
						],
					)
				],
			),
		)
	);
  }
}
