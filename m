From: Francesco Allertsen <fallertsen@gmail.com>
Subject: Nouveau driver broke my video card?
Date: Fri, 5 Nov 2010 13:59:00 +0100
Message-ID: <20101105125900.GC2135@fujiko>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
Cc: Thomas =?iso-8859-1?Q?Hellstr=C3=B6m?= <thellstrom@vmware.com>, nouveau@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
List-Id: nouveau.vger.kernel.org

I've used the nouveau drivers for the last few months and worked very
well, since yesturday!

Yesturday I was working with my laptop using the external monitor and
then (doing nothing special) all the video start to render something
really strange (don't know exactly how to describe it), and at the
beginning the mouse was working, after some seconds it stops moving and
everything was frozen.

I had to reboot my machine with the power on button, and after that at
the bios I got some strange "red dots" somewhere in the screen during
the black screen.  After that the lilo started and I cannot see anything
from the frame buffer (but in the background it was working great).

I've stopped trying yesturday because I didn't have time, and this
morning I started again.
Now I'm not using anymore the -git kernel but the default Slackware
kernel (2.6.35.7), and I'm using the vesa drivers.

It seems to works great with X, but I still have the "red dots" at the
beginning (that scared me a bit).

This morning I also found that yesturday the nouveau module had a
BUG_ON, and this is what I got.

[  625.262773] BUG: unable to handle kernel NULL pointer dereference at 00000014
[  625.262787] IP: [<f82f512f>] nouveau_ttm_io_mem_reserve+0xaf/0xe0 [nouveau]
[  625.262814] *pde = 00000000
[  625.262821] Oops: 0000 [#1] SMP
[  625.262828] last sysfs file: /sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:00/PNP0C09:00/PNP0C0A:00/power_supply/BAT0/energy_full
[  625.262840] Modules linked in: nouveau ttm drm_kms_helper drm i2c_algo_bit snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq snd_seq_device snd_pcm_oss snd_mixer_oss ipv6 cpufreq_ondemand speed
e mperf lp fuse snd_hda_codec_analog usbhid hid iwlagn btusb bluetooth snd_hda_intel joydev snd_hda_codec iwlcore snd_hwdep snd_pcm thinkpad_acpi mac80211 snd_timer thermal cfg80211 processor video p
d thermal_sys parport_pc psmouse intel_agp agpgart hwmon e1000e snd_page_alloc button yenta_socket ehci_hcd ac sg soundcore rtc_cmos rtc_core serio_raw evdev i2c_i801 i2c_core parport rtc_lib led_cla
ia_rsrc pcmcia_core reiserfs
[  625.262889]
[  625.262893] Pid: 1662, comm: X Not tainted 2.6.35.7-smp #1 889202U/889202U
[  625.262896] EIP: 0060:[<f82f512f>] EFLAGS: 00013246 CPU: 1
[  625.262902] EIP is at nouveau_ttm_io_mem_reserve+0xaf/0xe0 [nouveau]
[  625.262905] EAX: 00000000 EBX: f69ebcf8 ECX: 00000088 EDX: 00000001
[  625.262907] ESI: 00000000 EDI: f6680000 EBP: f69ebb8c ESP: f69ebb7c
[  625.262909]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
[  625.262912] Process X (pid: 1662, ti=f69ea000 task=f68e5860 task.ti=f69ea000)
[  625.262913] Stack:
[  625.262915]  f6908400 f69ebcf8 f69ebcf8 f69ebbfc f69ebba4 f81c8e6a f668007c f675e600
[  625.262920] <0> f69ebcf8 f69ebcf8 f69ebc10 f81c8fbc f82f6b1f 00000002 00000000 f675e600
[  625.262926] <0> f668007c f82f694e 00000000 f675e600 f82f60d3 f401eb40 00010000 00000010
[  625.262932] Call Trace:
[  625.262938]  [<f81c8e6a>] ? ttm_mem_reg_ioremap+0x5a/0xc0 [ttm]
[  625.262942]  [<f81c8fbc>] ? ttm_bo_move_memcpy+0x9c/0x360 [ttm]
[  625.262950]  [<f82f6b1f>] ? nouveau_fence_wait+0x4f/0xb0 [nouveau]
[  625.262957]  [<f82f694e>] ? nouveau_fence_unref+0x1e/0x30 [nouveau]
[  625.262963]  [<f82f60d3>] ? nouveau_bo_move_m2mf.clone.8+0x443/0x590 [nouveau]
[  625.262969]  [<c10ef014>] ? pollwake+0x54/0x60
[  625.262975]  [<f82f628d>] ? nouveau_bo_move+0x6d/0x490 [nouveau]
[  625.262980]  [<f81c6067>] ? ttm_bo_unmap_virtual+0x57/0x70 [ttm]
[  625.262987]  [<f82f6220>] ? nouveau_bo_move+0x0/0x490 [nouveau]
[  625.262991]  [<f81c6193>] ? ttm_bo_handle_move_mem+0x113/0x370 [ttm]
[  625.262995]  [<f81c80ca>] ? ttm_bo_move_buffer+0x10a/0x130 [ttm]
[  625.262999]  [<f81c8196>] ? ttm_bo_validate+0xa6/0x130 [ttm]
[  625.263006]  [<f82f6d05>] ? validate_list+0xb5/0x2a0 [nouveau]
[  625.263014]  [<f82f7a27>] ? nouveau_gem_ioctl_pushbuf+0x5c7/0xfa0 [nouveau]
[  625.263019]  [<c13d3c83>] ? unix_stream_recvmsg+0x1c3/0x500
[  625.263025]  [<f82b849c>] ? drm_ioctl+0x2cc/0x470 [drm]
[  625.263032]  [<f82f7460>] ? nouveau_gem_ioctl_pushbuf+0x0/0xfa0 [nouveau]
[  625.263036]  [<c10dfa74>] ? do_sync_read+0xa4/0xe0
[  625.263039]  [<c10ed969>] ? vfs_ioctl+0x39/0xa0
[  625.263044]  [<f82b81d0>] ? drm_ioctl+0x0/0x470 [drm]
[  625.263047]  [<c10ee09a>] ? do_vfs_ioctl+0x6a/0x590
[  625.263051]  [<c117de94>] ? security_file_permission+0x14/0x20
[  625.263054]  [<c10dfda2>] ? rw_verify_area+0x62/0xe0
[  625.263058]  [<c1044090>] ? __do_softirq+0xe0/0x1a0
[  625.263061]  [<c10e0315>] ? vfs_read+0x125/0x190
[  625.263064]  [<c10ee627>] ? sys_ioctl+0x67/0x80
[  625.263067]  [<c140fe4c>] ? syscall_call+0x7/0xb
[  625.263069] Code: 30 06 00 00 01 75 e5 8b 03 8b 40 14 c1 e0 0c 89 43 24 8b 87 34 06 00 00 c6 43 28 01 89 43 1c eb cb 8d 76 00 8b 03 ba 01 00 00 00 <8b> 40 14 c1 e0 0c 89 43 24 8b 45 f0 e8 a0 f4 fb ff 8b 7d fc c6
[  625.263098] EIP: [<f82f512f>] nouveau_ttm_io_mem_reserve+0xaf/0xe0 [nouveau] SS:ESP 0068:f69ebb7c
[  625.263106] CR2: 0000000000000014
[  625.263109] ---[ end trace 826e5e96566077b8 ]---

Unfortunatly I don't know if it was on the last -git kernel or someone
else.

Now, I want to know if it's a nouveau bug or a hardware failure or what
else, and also whant to understand the "red dots" ad the beginning.

If you need more information just let me know, and please Cc me as I'm
not subscribed to the lists.

Thanks

Bye
Francesco
