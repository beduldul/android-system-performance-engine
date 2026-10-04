[![shellcheck](https://github.com/beduldul/android-system-performance-engine/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/beduldul/android-system-performance-engine/actions/workflows/shellcheck.yml)
# Universal Android System Performance Engine v1.1.0

Systemless performance optimization engine for Android devices, tuned for low latency, zero frame-drop, and high storage read-ahead throughput.

---

## Key Optimizations in v1.1.0

- **VFS Cache Pressure Tuning**: `vm.vfs_cache_pressure = 50` (Holds game assets and textures longer in RAM).
- **Storage Read-Ahead & Queue Depth**: Increases UFS storage read-ahead buffer to **2048 KB (2MB)** and sets `nr_requests = 128`.
- **CPU Schedutil Rate Limits**: Sets `up_rate_limit_us = 500` on `schedutil` CPU policies for instant frequency response.
- **TCP Low Latency & FQ Pacing**: Configures `net.core.default_qdisc = fq` and `net.ipv4.tcp_low_latency = 1` for minimal network jitter.

---

## Installation

1. Download `Android_System_Performance_Engine_v1.1.0.zip` from [Releases](https://github.com/beduldul/android-system-performance-engine/releases).
2. Install via **Magisk / KernelSU / APatch**.
3. Reboot device.

---

## License
MIT License
