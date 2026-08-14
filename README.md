# Android Gaming Performance Engine

Systemless performance optimization daemon for Android devices, tuned for low latency, zero frame-drop, and high storage read-ahead throughput.

---

## ⚡ Key Optimizations

- **VFS Cache Pressure Tuning**: `vm.vfs_cache_pressure = 50` (Holds game assets and textures longer in RAM).
- **Storage Read-Ahead Optimization**: Increases UFS 3.1 storage read-ahead buffer to **2048 KB (2MB)** for instant map & texture loading.
- **TCP Low Latency & FQ Pacing**: Configures `net.core.default_qdisc = fq` and `net.ipv4.tcp_low_latency = 1` for minimal network jitter.
- **Touchscreen Thread Priority**: Elevates touchscreen driver process (`xiaomi_touch`) priority to Real-Time (`SCHED_FIFO`) to eliminate touch input lag.

---

## 📦 Installation

1. Download `Android_Gaming_Performance_Engine_v1.0.0.zip` from [Releases](https://github.com/beduldul/android-gaming-performance-engine/releases).
2. Install via **Magisk / KernelSU / APatch**.
3. Reboot device.

---

## 📄 License
GPL-3.0 License
