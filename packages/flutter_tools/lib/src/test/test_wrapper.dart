// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart = 2.8

import 'dart:async';

import 'package:test_core/src/executable.dart' as test; // ignore: implementation_imports
import 'package:test_core/src/platform.dart' as hack show registerPlatformPlugin; // ignore: implementation_imports
import 'package:test_core/src/platform.dart'; // ignore: implementation_imports

export 'package:test_api/backend.dart' show Runtime; // ignore: deprecated_member_use
export 'package:test_core/src/platform.dart' show PlatformPlugin; // ignore: implementation_imports

abstract class TestWrapper {
  const factory TestWrapper() = _DefaultTestWrapper;

  Future<void> main(List<String> args);
  void registerPlatformPlugin(Iterable<Runtime> runtimes, FutureOr<PlatformPlugin> Function() platforms);
}

class _DefaultTestWrapper implements TestWrapper {
  const _DefaultTestWrapper();

  @override
  Future<void> main(List<String> args) async {
    await test.main(args);
  }

  @override
  void registerPlatformPlugin(Iterable<Runtime> runtimes, FutureOr<PlatformPlugin> Function() platforms) {
    hack.registerPlatformPlugin(runtimes, platforms);
  }
}
