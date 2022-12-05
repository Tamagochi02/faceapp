import 'package:faceapp/models/request.dart';
import 'package:faceapp/routes/request/requests_controller.dart';
import 'package:faceapp/widgets/request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RequestsViewPage extends StatefulWidget {
  static const String route = "/requestsview";
  const RequestsViewPage({Key? key}) : super(key: key);

  @override
  State<RequestsViewPage> createState() => _RequestsViewPageState();
}

class _RequestsViewPageState extends State<RequestsViewPage> {
  final _controller = RequestsController();
  List<Request> _usersRequests = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getRequests().then((requests) => setState(() {
          _usersRequests = requests;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitudes de Amistad"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 37, 36, 102),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: _usersRequests.map((request) => RequestCard(req: request)).toList(),
          )),
    );
  }
}
