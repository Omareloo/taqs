import 'package:flutter/material.dart';

class AttributesWidget extends StatelessWidget {
  const AttributesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container (
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration
            (
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              const Text('Temperature :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
              const SizedBox(height: 8.0,),
              const Text('25 C',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ],
          ),
        ),
        SizedBox(height: 16,),
        Container (
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration
            (
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              const Text('Temperature :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
              const SizedBox(height: 8.0,),
              const Text('23 C',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ],
          ),
        ),
        SizedBox(height: 16,),
        Container (
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration
            (
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              const Text('Temperature :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
              const SizedBox(height: 8.0,),
              const Text('23 C',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ],
          ),
        ),
        SizedBox(height: 16,),
        Container (
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration
            (
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              const Text('Temperature :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
              const SizedBox(height: 8.0,),
              const Text('23 C',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ],
          ),
        ),
        SizedBox(height: 16,),
      ],
    );

  }
}
