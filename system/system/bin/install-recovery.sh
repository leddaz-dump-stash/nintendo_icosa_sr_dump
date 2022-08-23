#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/SOS:18466816:d7091d48227163cd179fa29b5a611e1da2dba19c; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/LNX:11509760:09b014bd44c5f00446c5afb9a2c1755893b0894f \
          --target EMMC:/dev/block/by-name/SOS:18466816:d7091d48227163cd179fa29b5a611e1da2dba19c && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
