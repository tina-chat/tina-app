import 'dart:async';

class StreamingDeltaPersister {
  final FutureOr<void> Function(String delga) appendDelta;

  /// Coalesce rapid deltas; keep this low to feel realtime but not spam writes.
  final Duration debounce;

  /// Safety bound: even if tokens keep flowing, flush at least this often.
  final Duration maxFlushInterval;

  final StringBuffer _buffer = StringBuffer();
  Timer? _debounceTimer;
  Timer? _maxTimer;

  /// Serialize writes without locks by running a single drain loop.
  bool _draining = false;
  final List<String> _pendingWrites = <String>[]; // FIFO of batched chunks

  bool _closed = false;

  StreamingDeltaPersister({
    required this.appendDelta,
    Duration? debounce,
    Duration? maxFlushInterval,
  }) : debounce = debounce ?? const Duration(milliseconds: 60),
       maxFlushInterval = maxFlushInterval ?? const Duration(milliseconds: 300);

  /// Feed each incoming delta (e.g., token/partial text segment) here.
  void addDelta(String delta) {
    if (_closed) return; // Ignore late deltas after close()
    if (delta.isEmpty) return;
    _buffer.write(delta);
    _scheduleFlushes();
  }

  void _scheduleFlushes() {
    // Debounce: reset the short timer on every delta
    _debounceTimer?.cancel();
    _debounceTimer = Timer(debounce, _flush);

    // Max interval: ensure a flush even with constant traffic
    _maxTimer ??= Timer(maxFlushInterval, _flush);
  }

  Future<void> _flush() async {
    _debounceTimer?.cancel();
    _debounceTimer = null;
    _maxTimer?.cancel();
    _maxTimer = null;

    if (_buffer.isEmpty) return;

    final chunk = _buffer.toString();
    _buffer.clear();

    _pendingWrites.add(chunk);
    if (!_draining) {
      _draining = true;
      // fire-and-forget; we don't await here to avoid reentrancy issues.
      // ignore: discarded_futures
      _drainLoop();
    }
  }

  Future<void> _drainLoop() async {
    try {
      while (_pendingWrites.isNotEmpty) {
        final chunk = _pendingWrites.removeAt(0);
        await appendDelta(chunk);
      }
    } finally {
      _draining = false;
    }
  }

  /// Ensure any remaining text is persisted and all writes complete.
  Future<void> close() async {
    if (_closed) return;
    _closed = true;

    await _flush();

    // Wait until the drain loop has finished any in-flight writes.
    while (_draining) {
      await Future<void>.delayed(const Duration(milliseconds: 1));
    }
  }
}
