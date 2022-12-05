import 'package:faceapp/models/request.dart';
import 'package:faceapp/routes/request/requests_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RequestCard extends StatefulWidget {
  final Request req;
  const RequestCard({Key? key, required this.req}) : super(key: key);

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  final _controller = RequestsController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
          child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(7)),
        width: double.maxFinite,
        height: 100,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              children: [
                Text(widget.req.userSource!.name,
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                SizedBox(
                  child:
                      ElevatedButton(onPressed: () {
                        _controller.sendRequest(widget.req.userSource!.id);
                      }, child: Text("Aceptar")),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
      )),
    );
  }
}
