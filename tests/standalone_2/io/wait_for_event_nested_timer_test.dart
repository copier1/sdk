// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// VMOptions=--enable-deprecated-wait-for

// @dart = 2.9

import 'dart:async';
import 'dart:cli';

import 'package:async_helper/async_helper.dart';
import 'package:expect/expect.dart';

import 'wait_for_event_helper.dart';

// Tests that all messages are processed before waitForEvent() returns.

main() {
  initWaitForEvent();
  asyncStart();
  bool flag = false;
  Timer.run(() {
    Timer.run(() {
      Timer.run(() {
        Timer.run(() {
          flag = true;
          asyncEnd();
        });
      });
    });
  });
  Expect.isFalse(flag);
  waitForEvent();
  Expect.isTrue(flag);
}
