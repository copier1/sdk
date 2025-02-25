// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'TypedDataCopyLib.dart';

void main() {
  final benchmarks = [
    () => Int8ViewToInt8View(),
    () => Int8ToInt8(),
    () => Int8ToUint8Clamped(),
    () => Int8ViewToInt8(),
    () => ByteSwap(),
  ];

  // Run all the code to ensure consistent polymorphism in shared code.
  for (var bm in benchmarks) {
    bm()
      ..setup()
      ..run()
      ..run();
  }

  for (var bm in benchmarks) {
    bm().report();
  }
}
