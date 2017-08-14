From: Michal Hocko <mhocko@kernel.org>
Subject: nouveau driver locks up with 4.11 kernel
Date: Mon, 14 Aug 2017 21:18:19 +0200
Message-ID: <20170814191818.GA20455@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Hi,
I am having issues with nouveau driver in 4.11 Debian distribution
kernel. I can start X session but the screen locks up e.g. when I try to
exit mplayer fullscreen mode. The lock is swamped with tons of
nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []

messages and I also can see some warnings
 ------------[ cut here ]------------
 WARNING: CPU: 1 PID: 3535 at /build/linux-J4LMtv/linux-4.11.6/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:85 gf100_fifo_gpfifo_engine_fini+0x14f/0x1d0 [nouveau]
 nouveau 0000:03:00.0: timeout
 Modules linked in: nouveau mxm_wmi wmi ttm cpufreq_powersave cpufreq_conservative cpufreq_userspace iptable_filter iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat iptable_mangle ip_tables x_tables binfmt_misc nfsd auth_rpcgss oid_registry nfs_acl nfs lockd grace fscache sunrpc i2c_sis96x hwmon_vid nf_conntrack_ftp nf_conntrack fuse i2c_dev thermal fan ac battery ntfs snd_intel8x0 snd_ac97_codec ac97_bus psmouse lp snd_hda_codec_realtek snd_hda_codec_hdmi snd_hda_codec_generic snd_hda_intel ppdev intel_powerclamp iTCO_wdt iTCO_vendor_support snd_hda_codec coretemp gma500_gfx snd_hda_core evdev serio_raw drm_kms_helper snd_hwdep snd_pcm_oss pcspkr snd_mixer_oss snd_pcm drm snd_seq_midi snd_seq_midi_event sg snd_rawmidi snd_seq snd_seq_device snd_timer parport_pc snd soundcor
 e
  parport i2c_algo_bit shpchp lpc_ich tpm_infineon mfd_core video button ext4 crc16 jbd2 fscrypto ecb crypto_simd cryptd aes_i586 mbcache raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid0 multipath linear uas usb_storage dm_mod raid1 md_mod sd_mod hid_generic usbhid hid ahci libahci libata i2c_i801 scsi_mod ehci_pci uhci_hcd e1000e ptp pps_core ehci_hcd usbcore usb_common
 CPU: 1 PID: 3535 Comm: mpv/vo Tainted: G        W       4.11.0-1-686-pae #1 Debian 4.11.6-1
 Hardware name:                  /D2500HN, BIOS MUCDT10N.86A.0073.2012.1101.1638 11/01/2012
 Call Trace:
  ? dump_stack+0x55/0x73
  ? __warn+0xea/0x110
  ? gf100_fifo_gpfifo_engine_fini+0x14f/0x1d0 [nouveau]
  ? gf100_fifo_gpfifo_engine_fini+0x14f/0x1d0 [nouveau]
  ? warn_slowpath_fmt+0x46/0x60
  ? gf100_fifo_gpfifo_engine_fini+0x14f/0x1d0 [nouveau]
  ? gf100_fifo_gpfifo_engine_addr.isra.1+0xa0/0xa0 [nouveau]
  ? nvkm_fifo_chan_child_fini+0x4e/0x120 [nouveau]
  ? nvkm_object_del+0x58/0x90 [nouveau]
  ? ktime_get+0x4b/0x110
  ? nvkm_oproxy_fini+0x23/0x80 [nouveau]
  ? nvkm_object_fini+0x137/0x300 [nouveau]
  ? nvkm_ioctl_del+0x8c/0xa0 [nouveau]
  ? nvkm_ioctl+0x100/0x290 [nouveau]
  ? __check_object_size+0x9e/0x13c
  ? __check_object_size+0x9e/0x13c
  ? nvif_client_ioctl+0x2b/0x40 [nouveau]
  ? usif_ioctl+0x4eb/0x790 [nouveau]
  ? nouveau_drm_ioctl+0xab/0xb0 [nouveau]
  ? nouveau_pmops_resume+0x80/0x80 [nouveau]
  ? do_vfs_ioctl+0x91/0x6b0
  ? SyS_ioctl+0x60/0x70
  ? do_fast_syscall_32+0x8a/0x150
  ? entry_SYSENTER_32+0x4e/0x7c
 ---[ end trace 1bf6c731018c2e52 ]---

followed by
nouveau 0000:03:00.0: fifo: channel 6 [mpv/vo[3535]] kick timeout
nouveau: mpv/vo[3535]:00000000:0000906f: detach gr failed, -110

Then there are
nouveau 0000:03:00.0: mpv/vo[3535]: failed to idle channel 6 [mpv/vo[3535]]

Is this a known issue? 

$ grep "kernel: nouveau" /var/log/kern.log | sed 's@.*kernel: @@' | uniq -c
grep "kernel: nouveau" /var/log/kern.log | sed 's@.*kernel: @@' | uniq -c
      1 nouveau 0000:03:00.0: NVIDIA GF119 (0d90a0a1)
      1 nouveau 0000:03:00.0: bios: version 75.19.1b.00.01
      1 nouveau 0000:03:00.0: bios: OOB 1 144b0928 144b0928
      1 nouveau 0000:03:00.0: bios: OOB 1 00f11900 00f11900
      1 nouveau 0000:03:00.0: fb: 512 MiB DDR3
      1 nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
      1 nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
      1 nouveau 0000:03:00.0: DRM: TMDS table version 2.0
      1 nouveau 0000:03:00.0: DRM: DCB version 4.0
      1 nouveau 0000:03:00.0: DRM: DCB outp 00: 02000300 00000000
      1 nouveau 0000:03:00.0: DRM: DCB outp 01: 01000302 00020030
      1 nouveau 0000:03:00.0: DRM: DCB outp 02: 02011362 00020010
      1 nouveau 0000:03:00.0: DRM: DCB outp 03: 04022310 00000000
      1 nouveau 0000:03:00.0: DRM: DCB conn 00: 00001030
      1 nouveau 0000:03:00.0: DRM: DCB conn 01: 00002161
      1 nouveau 0000:03:00.0: DRM: DCB conn 02: 00000200
      1 nouveau 0000:03:00.0: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
      1 nouveau 0000:03:00.0: DRM: MM: using COPY0 for buffer copies
      1 nouveau 0000:03:00.0: DRM: allocated 1920x1080 fb: 0x60000, bo f1000000
      1 nouveau 0000:03:00.0: fb0: nouveaufb frame buffer device
    110 nouveau 0000:03:00.0: fifo: INTR 01000000: 00000005
      1 nouveau 0000:03:00.0: DRM: suspending console...
      1 nouveau 0000:03:00.0: DRM: suspending display...
      1 nouveau 0000:03:00.0: DRM: evicting buffers...
      1 nouveau 0000:03:00.0: DRM: waiting for kernel channels to go idle...
      1 nouveau 0000:03:00.0: DRM: suspending fence...
      1 nouveau 0000:03:00.0: DRM: suspending object tree...
      1 nouveau 0000:03:00.0: DRM: resuming object tree...
      1 nouveau 0000:03:00.0: DRM: resuming fence...
      1 nouveau 0000:03:00.0: DRM: resuming display...
      1 nouveau 0000:03:00.0: DRM: resuming console...
    184 nouveau 0000:03:00.0: fifo: INTR 01000000: 00000005
      1 nouveau 0000:03:00.0: fifo: INTR 00010000: 00000001
      1 nouveau 0000:03:00.0: fifo: INTR 00800000
     59 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: timeout
      1 nouveau 0000:03:00.0: fifo: channel 6 [mpv/vo[3535]] kick timeout
      1 nouveau: mpv/vo[3535]:00000000:0000906f: detach gr failed, -110
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 0d []
     59 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: timeout
      1 nouveau 0000:03:00.0: fifo: channel 6 [mpv/vo[3535]] kick timeout
      1 nouveau: mpv/vo[3535]:00000000:0000906f: detach sw failed, -110
    447 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: mpv/vo[3535]: failed to idle channel 6 [mpv/vo[3535]]
    446 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: mpv/vo[3535]: failed to idle channel 6 [mpv/vo[3535]]
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 0d []
     59 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: runlist update timeout
      1 nouveau 0000:03:00.0: fifo: INTR 00000001: 00000003
    821 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: PBDMA0: 00000002 [] ch 6 [0000000000 unknown] subc 0 mthd 001c data 00000002
   3637 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: x-terminal-emul[3280]: failed to idle channel 5 [x-terminal-emul[3280]]
    446 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: x-terminal-emul[3280]: failed to idle channel 5 [x-terminal-emul[3280]]
     60 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: timeout
      1 nouveau 0000:03:00.0: fifo: channel 5 [x-terminal-emul[3280]] kick timeout
      1 nouveau: x-terminal-emul[3280]:00000000:0000906f: detach gr failed, -110
     60 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: timeout
      1 nouveau 0000:03:00.0: fifo: channel 5 [x-terminal-emul[3280]] kick timeout
      1 nouveau: x-terminal-emul[3280]:00000000:0000906f: detach sw failed, -110
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 0d []
     59 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: runlist update timeout
    447 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: Xorg[3059]: failed to idle channel 4 [Xorg[3059]]
    447 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: Xorg[3059]: failed to idle channel 4 [Xorg[3059]]
     59 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: timeout
      1 nouveau 0000:03:00.0: fifo: channel 4 [Xorg[3059]] kick timeout
      1 nouveau: Xorg[3059]:00000000:0000906f: detach gr failed, -110
     60 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: timeout
      1 nouveau 0000:03:00.0: fifo: channel 4 [Xorg[3059]] kick timeout
      1 nouveau: Xorg[3059]:00000000:0000906f: detach sw failed, -110
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 0d []
     60 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: runlist update timeout
    446 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: Xorg[3059]: failed to idle channel 3 [Xorg[3059]]
     60 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: timeout
      1 nouveau 0000:03:00.0: fifo: channel 3 [Xorg[3059]] kick timeout
      1 nouveau: Xorg[3059]:00000000:0000906f: detach ce0 failed, -110
    446 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: Xorg[3059]: failed to idle channel 3 [Xorg[3059]]
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 0d []
     60 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: runlist update timeout
    446 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: Xorg[3059]: failed to idle channel 2 [Xorg[3059]]
     60 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: timeout
      1 nouveau 0000:03:00.0: fifo: channel 2 [Xorg[3059]] kick timeout
      1 nouveau: Xorg[3059]:00000000:0000906f: detach sw failed, -110
     60 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: timeout
      1 nouveau 0000:03:00.0: fifo: channel 2 [Xorg[3059]] kick timeout
      1 nouveau: Xorg[3059]:00000000:0000906f: detach gr failed, -110
    446 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: Xorg[3059]: failed to idle channel 2 [Xorg[3059]]
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 0d []
     60 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: runlist update timeout
     59 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: DRM: EVO timeout
     10 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 0d []
     59 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: runlist update timeout
      3 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 0d []
     59 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: runlist update timeout
    447 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: Xorg[3739]: failed to idle channel 3 [Xorg[3739]]
    446 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: Xorg[3739]: failed to idle channel 3 [Xorg[3739]]
    447 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: Xorg[3739]: failed to idle channel 3 [Xorg[3739]]
    446 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: Xorg[3739]: failed to idle channel 3 [Xorg[3739]]
    447 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: Xorg[3739]: failed to idle channel 3 [Xorg[3739]]
      6 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: SCHED_ERROR 0d []
     59 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
      1 nouveau 0000:03:00.0: fifo: runlist update timeout
   4249 nouveau 0000:03:00.0: fifo: SCHED_ERROR 13 []
-- 
Michal Hocko
SUSE Labs
