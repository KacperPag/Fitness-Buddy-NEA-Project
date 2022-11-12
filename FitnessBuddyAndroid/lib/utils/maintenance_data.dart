/*
import 'dart:async';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class MaintenanceData {
  late final bool isUnderMaintenance;
  late final String maintenanceMessage;
}
int _counter = 0;
late DatabaseReference _counterRef;
late DatabaseReference _messagesRef;
late StreamSubscription<DatabaseEvent> _counterSubscription;
late StreamSubscription<DatabaseEvent> _messagesSubscription;
bool _anchorToBottom = false;

String _kTestKey = 'Hello';
String _kTestValue = 'world!';
FirebaseException? _error;
bool initialized = false;

Future<void> init() async {
  _counterRef = FirebaseDatabase.instance.ref('counter');

  final database = FirebaseDatabase.instance;

  _messagesRef = database.ref('messages');

  database.setLoggingEnabled(false);

  if (!kIsWeb) {
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
  }

  if (!kIsWeb) {
    await _counterRef.keepSynced(true);
  }

  setState(() {
    initialized = true;
  });

  try {
    final counterSnapshot = await _counterRef.get();

    print(
      'Connected to directly configured database and read '
          '${counterSnapshot.value}',
    );
  } catch (err) {
    print(err);
  }

  _counterSubscription = _counterRef.onValue.listen(
        (DatabaseEvent event) {
      setState(() {
        _error = null;
        _counter = (event.snapshot.value ?? 0) as int;
      });
    },
    onError: (Object o) {
      final error = o as FirebaseException;
      setState(() {
        _error = error;
      });
    },
  );

  final messagesQuery = _messagesRef.limitToLast(10);

  _messagesSubscription = messagesQuery.onChildAdded.listen(
        (DatabaseEvent event) {
      print('Child added: ${event.snapshot.value}');
    },
    onError: (Object o) {
      final error = o as FirebaseException;
      print('Error: ${error.code} ${error.message}');
    },
  );
}*/
