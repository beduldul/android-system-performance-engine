#!/system/bin/sh
sleep 10
sysctl -w vm.vfs_cache_pressure=50 2>/dev/null
sysctl -w vm.stat_interval=10 2>/dev/null
sysctl -w vm.compaction_proactiveness=0 2>/dev/null

for dev in /sys/block/sd*/queue/read_ahead_kb /sys/block/dm-*/queue/read_ahead_kb; do
    if [ -f "$dev" ]; then
        chmod 666 "$dev" 2>/dev/null
        echo 2048 > "$dev" 2>/dev/null
    fi
done

sysctl -w net.core.default_qdisc=fq 2>/dev/null
sysctl -w net.ipv4.tcp_low_latency=1 2>/dev/null
sysctl -w net.ipv4.tcp_fastopen=3 2>/dev/null

for pid in $(pgrep -f "xiaomi_touch|touch"); do
    chrt -f -p 98 "$pid" 2>/dev/null
done
exit 0
