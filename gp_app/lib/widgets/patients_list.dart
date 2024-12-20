import 'package:flutter/material.dart';
import 'package:gp_app/screens/doctor_model_screen.dart';
import 'package:gp_app/models/patient_list.dart';

class PatientList extends StatefulWidget {
  final Patient patient;
  final int index;
  final Function() onTap;

  const PatientList({
    Key? key,
    required this.patient,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color:
                _isHovered ? Colors.grey.withOpacity(0.5) : Colors.transparent,
          ),
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 03, 48, 73),
              ),
              child: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 3, 206, 164),
              ),
            ),
            title: Text(widget.patient.name),
            subtitle: Text(widget.patient.info),
            trailing: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 3, 206, 164),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
