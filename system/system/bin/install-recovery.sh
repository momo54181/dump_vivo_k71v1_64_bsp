#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:854904dc63f168fe531a46990016b4868e0d3e5f; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:e08136e7718a5c22f5136950de9462ec0aad3e72 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:854904dc63f168fe531a46990016b4868e0d3e5f && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
