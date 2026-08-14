#!/system/bin/sh
# Universal System Performance Engine v1.1.0

sleep 10

# 1. Virtual Memory & VFS Cache Tuning
sysctl -w vm.vfs_cache_pressure=50 2>/dev/null
sysctl -w vm.stat_interval=10 2>/dev/null
sysctl -w vm.compaction_proactiveness=0 2>/dev/null

# 2. UFS Storage Queue Read-Ahead (2MB) & Depth Tuning
for dev in /sys/block/sd*/queue /sys/block/dm-*/queue; do
    if [ -d "$dev" ]; then
        chmod 666 "$dev/read_ahead_kb" 2>/dev/null
        echo 2048 > "$dev/read_ahead_kb" 2>/dev/null
        echo 128 > "$dev/nr_requests" 2>/dev/null
    fi
done

# 3. Network Packet Pacing & TCP Low Latency
sysctl -w net.core.default_qdisc=fq 2>/dev/null
sysctl -w net.ipv4.tcp_low_latency=1 2>/dev/null
sysctl -w net.ipv4.tcp_fastopen=3 2>/dev/null

# 4. Schedutil Governor Rate Limit Tuning
for cpu in /sys/devices/system/cpu/cpufreq/policy*; do
    if [ -d "$cpu" ]; then
        echo 500 > "$cpu/schedutil/up_rate_limit_us" 2>/dev/null
    fi
done

exit 0
