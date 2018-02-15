From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105117] New: desktop freeze playing video nouveau:
 DATA_ERROR INVALID_BITFIELD
Date: Thu, 15 Feb 2018 15:53:58 +0000
Message-ID: <bug-105117-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1240864147=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1240864147==
Content-Type: multipart/alternative; boundary="15187100370.fca8367.15727"
Content-Transfer-Encoding: 7bit


--15187100370.fca8367.15727
Date: Thu, 15 Feb 2018 15:53:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105117

            Bug ID: 105117
           Summary: desktop freeze playing video nouveau: DATA_ERROR
                    INVALID_BITFIELD
           Product: xorg
           Version: 7.6 (2010.12)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: rcoe-TsGEh1ee8XYAvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I recently upgraded to Linux 4.15.2 and I'm trying to get back to a stable
system.
I'm running the nouveau driver and after starting a video the system locked=
 up,
but the mouse still moved.

01:00.0 VGA compatible controller: NVIDIA Corporation GF108GLM [NVS 5200M] =
(rev
a1)

libdrm_nouveau2-2.4.89-1.1.x86_64
libdrm_nouveau2-32bit-2.4.89-1.1.x86_64
libvdpau_nouveau-18.0.0-186.1.x86_64
Mesa-dri-nouveau-17.2.6-180.2.x86_64
xf86-video-nouveau-1.0.15-1.2.x86_64
xorg-x11-7.6_1-16.4.noarch
xorg-x11-devel-7.6.1-1.1.noarch
xorg-x11-driver-input-7.6_1-14.3.noarch
xorg-x11-driver-video-7.6_1-17.1.x86_64
xorg-x11-essentials-7.6_1-16.4.noarch
xorg-x11-fonts-7.6-32.3.noarch
xorg-x11-fonts-core-7.6-32.3.noarch
xorg-x11-libs-7.6.1-1.1.noarch
xorg-x11-libX11-ccache-7.6-20.5.noarch
xorg-x11-server-1.19.6-2.1.x86_64
xorg-x11-util-devel-7.6_1-10.4.noarch

[  852.947765] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
ch 11 [003f7f0000 WebKitWebProces[8594
]] subc 0 class 9197 mthd 0808 data 200203fd
[  852.947775] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 11
[003f7f0000 WebKitWebProces[8594]] subc 0 mthd 23
90 data 3f000000
[  852.947798] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
ch 11 [003f7f0000 WebKitWebProces[8594
]] subc 0 class 9197 mthd 080c data 01400000
[  852.947815] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 11
[003f7f0000 WebKitWebProces[8594]] subc 0 mthd 00
00 data 00000000
[  852.947842] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
ch 11 [003f7f0000 WebKitWebProces[8594
]] subc 0 class 9197 mthd 0814 data 20090200
[  852.947863] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
ch 11 [003f7f0000 WebKitWebProces[8594
]] subc 0 class 9197 mthd 0820 data 2001054e
[  858.670815] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  858.755541] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  858.841568] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  858.926068] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  859.011451] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  859.097444] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  859.182161] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[ 1050.392729] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[ 1050.477341] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[ 1050.592997] nouveau 0000:01:00.0: WebKitWebProces[8594]: failed to idle
channel 11 [WebKitWebProces[8594]]
[ 1050.676235] nouveau 0000:01:00.0: WebKitWebProces[8594]: failed to idle
channel 11 [WebKitWebProces[8594]]

[ 1052.698895] ------------[ cut here ]------------
[ 1052.698897] nouveau 0000:01:00.0: timeout
[ 1052.698943] WARNING: CPU: 2 PID: 8934 at
../drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:85 gf100_fifo_gp
fifo_engine_fini+0x14e/0x1c0 [nouveau]
[ 1052.698944] Modules linked in: af_packet rfcomm fuse snd_hda_codec_hdmi
vboxnetadp(O) vboxnetflt(O) iscsi_ibft iscs
i_boot_sysfs mei_wdt vboxdrv(O) bnep msr snd_hda_codec_idt
snd_hda_codec_generic arc4 uvcvideo videobuf2_vmalloc video
buf2_memops videobuf2_v4l2 videobuf2_core videodev intel_rapl btusb btrtl
x86_pkg_temp_thermal intel_powerclamp btbcm
brcmsmac btintel cordic brcmutil bluetooth snd_hda_intel ecdh_generic coret=
emp
snd_hda_codec mac80211 snd_hda_core kvm
_intel nouveau snd_hwdep snd_seq cfg80211 mxm_wmi dell_rbtn kvm snd_pcm
irqbypass ttm crct10dif_pclmul crc32_pclmul sn
d_seq_device crc32c_intel ghash_clmulni_intel drm_kms_helper iTCO_wdt
iTCO_vendor_support dell_laptop drm rfkill dell_
wmi fb_sys_fops bcma syscopyarea sysfillrect sysimgblt i2c_algo_bit
dell_smbios_wmi snd_timer pcbc dell_smbios_smm
[ 1052.698971]  dcdbas dell_smbios e1000e snd aesni_intel parport_pc ppdev
aes_x86_64 ptp crypto_simd dell_smm_hwmon g
lue_helper mei_me cryptd joydev pcspkr soundcore wmi_bmof sparse_keymap
dell_wmi_descriptor mei pps_core i2c_i801 lpc_
ich shpchp parport thermal dell_smo8800 ac battery hid_generic usbhid serio=
_raw
sdhci_pci xhci_pci ehci_pci sdhci xhci
_hcd ehci_hcd mmc_core usbcore wmi video button sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua
[ 1052.698992] CPU: 2 PID: 8934 Comm: gstglcontext Tainted: G           O=
=20=20=20=20
4.15.2-1-default #1
[ 1052.698993] Hardware name: Dell Inc. Latitude E6530/07Y85M, BIOS A02
04/24/2012
[ 1052.699014] RIP: 0010:gf100_fifo_gpfifo_engine_fini+0x14e/0x1c0 [nouveau]
[ 1052.699015] RSP: 0018:ffffa1c0483e3a10 EFLAGS: 00010286
[ 1052.699016] RAX: 000000000000001d RBX: ffff90d685953800 RCX:
0000000000000006
[ 1052.699016] RDX: 0000000000000007 RSI: 0000000000000082 RDI:
ffff90d92dc969d0
[ 1052.699017] RBP: ffff90d906fb2800 R08: 0000000000000001 R09:
000000000000039d
[ 1052.699018] R10: ffffffff8d15ae20 R11: 0000000000000000 R12:
ffff90d91aa99800
[ 1052.699018] R13: ffff90d9178a2680 R14: 000000f4a30744e0 R15:
ffff90d8eb3fb780
[ 1052.699019] FS:  00007ff7ef7fe700(0000) GS:ffff90d92dc80000(0000)
knlGS:0000000000000000
[ 1052.699020] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1052.699021] CR2: 00007fe0c53dd000 CR3: 00000002e900a001 CR4:
00000000001606e0
[ 1052.699021] Call Trace:
[ 1052.699043]  nvkm_fifo_chan_child_fini+0x63/0xf0 [nouveau]
[ 1052.699056]  nvkm_oproxy_fini+0x2b/0x80 [nouveau]
[ 1052.699069]  nvkm_object_fini+0xb8/0x210 [nouveau]
[ 1052.699082]  nvkm_object_fini+0x73/0x210 [nouveau]
[ 1052.699093]  nvkm_ioctl_del+0x7e/0xa0 [nouveau]
[ 1052.699105]  nvkm_ioctl+0x10a/0x240 [nouveau]
[ 1052.699116]  nvif_object_fini+0x59/0x80 [nouveau]
[ 1052.699135]  nouveau_channel_del+0x87/0x120 [nouveau]
[ 1052.699152]  ? nouveau_channel_idle+0x84/0xc0 [nouveau]
[ 1052.699169]  nouveau_abi16_chan_fini.isra.3+0x9c/0xe0 [nouveau]
[ 1052.699186]  nouveau_abi16_fini+0x2d/0x70 [nouveau]
[ 1052.699203]  nouveau_drm_postclose+0x4b/0xe0 [nouveau]
[ 1052.699212]  drm_release+0x264/0x380 [drm]
[ 1052.699216]  __fput+0xca/0x1d0
[ 1052.699218]  task_work_run+0x84/0xa0
[ 1052.699220]  do_exit+0x2ca/0xaf0
[ 1052.699227]  ? drm_ioctl+0x254/0x350 [drm]
[ 1052.699228]  do_group_exit+0x3a/0xa0
[ 1052.699230]  get_signal+0x245/0x5b0[ 1052.699235]  do_signal+0x23/0x670
[ 1052.699252]  ? nouveau_drm_ioctl+0x89/0xc0 [nouveau]
[ 1052.699254]  ? do_vfs_ioctl+0x90/0x5f0
[ 1052.699255]  ? __fget+0x6e/0xb0
[ 1052.699257]  exit_to_usermode_loop+0x80/0xe0
[ 1052.699259]  do_syscall_64+0x120/0x140
[ 1052.699261]  entry_SYSCALL_64_after_hwframe+0x26/0x9b
[ 1052.699263] RIP: 0033:0x7ff90d7f8377
[ 1052.699263] RSP: 002b:00007ff7ef7fd7b8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 1052.699264] RAX: fffffffffffffff0 RBX: 000055d5bb5f6b98 RCX:
00007ff90d7f8377
[ 1052.699265] RDX: 00007ff7ef7fd820 RSI: 00000000c0406481 RDI:
0000000000000027
[ 1052.699266] RBP: 00007ff7ef7fd820 R08: 00007ff7e018e480 R09:
0000000000000002
[ 1052.699266] R10: 00007ff7e018e480 R11: 0000000000000246 R12:
00000000c0406481
[ 1052.699267] R13: 0000000000000027 R14: 000055d5bb5f6b90 R15:
00007ff90b482920
[ 1052.699268] Code: 5d 41 5e 41 5f c3 49 8b 7c 24 10 48 8b 5f 50 48 85 db =
74
74 e8 e4 22 4e cb 48 89 da 48 89 c6 48 c7 c7 36 0e 1a c1 e8 12 80 ff ca <0f=
> ff
48 8b 44 24 08 8b 40 48 85 c0 75 1a 48 8b 3c 24 bb 92 ff=20
[ 1052.699287] ---[ end trace f7521aa428293232 ]---
[ 1052.699290] nouveau 0000:01:00.0: fifo: channel 11 [WebKitWebProces[8594=
]]
kick timeout
[ 1052.699294] nouveau: WebKitWebProces[8594]:00000000:0000906f: detach gr
failed, -110
[ 1052.699334] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []

I couldn't switch desktops -- I had to reboot.
[ 1052.699232]  ? futex_wake+0x83/0x150

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15187100370.fca8367.15727
Date: Thu, 15 Feb 2018 15:53:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - desktop freeze playing video nouveau: DATA_ERROR INVALID_=
BITFIELD"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105117">105117</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>desktop freeze playing video nouveau: DATA_ERROR INVALID_BITF=
IELD
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.6 (2010.12)
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>rcoe&#64;wi.rr.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I recently upgraded to Linux 4.15.2 and I'm trying to get back=
 to a stable
system.
I'm running the nouveau driver and after starting a video the system locked=
 up,
but the mouse still moved.

01:00.0 VGA compatible controller: NVIDIA Corporation GF108GLM [NVS 5200M] =
(rev
a1)

libdrm_nouveau2-2.4.89-1.1.x86_64
libdrm_nouveau2-32bit-2.4.89-1.1.x86_64
libvdpau_nouveau-18.0.0-186.1.x86_64
Mesa-dri-nouveau-17.2.6-180.2.x86_64
xf86-video-nouveau-1.0.15-1.2.x86_64
xorg-x11-7.6_1-16.4.noarch
xorg-x11-devel-7.6.1-1.1.noarch
xorg-x11-driver-input-7.6_1-14.3.noarch
xorg-x11-driver-video-7.6_1-17.1.x86_64
xorg-x11-essentials-7.6_1-16.4.noarch
xorg-x11-fonts-7.6-32.3.noarch
xorg-x11-fonts-core-7.6-32.3.noarch
xorg-x11-libs-7.6.1-1.1.noarch
xorg-x11-libX11-ccache-7.6-20.5.noarch
xorg-x11-server-1.19.6-2.1.x86_64
xorg-x11-util-devel-7.6_1-10.4.noarch

[  852.947765] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
ch 11 [003f7f0000 WebKitWebProces[8594
]] subc 0 class 9197 mthd 0808 data 200203fd
[  852.947775] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 11
[003f7f0000 WebKitWebProces[8594]] subc 0 mthd 23
90 data 3f000000
[  852.947798] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
ch 11 [003f7f0000 WebKitWebProces[8594
]] subc 0 class 9197 mthd 080c data 01400000
[  852.947815] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 11
[003f7f0000 WebKitWebProces[8594]] subc 0 mthd 00
00 data 00000000
[  852.947842] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
ch 11 [003f7f0000 WebKitWebProces[8594
]] subc 0 class 9197 mthd 0814 data 20090200
[  852.947863] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
ch 11 [003f7f0000 WebKitWebProces[8594
]] subc 0 class 9197 mthd 0820 data 2001054e
[  858.670815] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  858.755541] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  858.841568] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  858.926068] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  859.011451] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  859.097444] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[  859.182161] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[ 1050.392729] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[ 1050.477341] nouveau 0000:01:00.0: WebKitWebProces[8594]: nv50cal_space: =
-16
[ 1050.592997] nouveau 0000:01:00.0: WebKitWebProces[8594]: failed to idle
channel 11 [WebKitWebProces[8594]]
[ 1050.676235] nouveau 0000:01:00.0: WebKitWebProces[8594]: failed to idle
channel 11 [WebKitWebProces[8594]]

[ 1052.698895] ------------[ cut here ]------------
[ 1052.698897] nouveau 0000:01:00.0: timeout
[ 1052.698943] WARNING: CPU: 2 PID: 8934 at
../drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:85 gf100_fifo_gp
fifo_engine_fini+0x14e/0x1c0 [nouveau]
[ 1052.698944] Modules linked in: af_packet rfcomm fuse snd_hda_codec_hdmi
vboxnetadp(O) vboxnetflt(O) iscsi_ibft iscs
i_boot_sysfs mei_wdt vboxdrv(O) bnep msr snd_hda_codec_idt
snd_hda_codec_generic arc4 uvcvideo videobuf2_vmalloc video
buf2_memops videobuf2_v4l2 videobuf2_core videodev intel_rapl btusb btrtl
x86_pkg_temp_thermal intel_powerclamp btbcm
brcmsmac btintel cordic brcmutil bluetooth snd_hda_intel ecdh_generic coret=
emp
snd_hda_codec mac80211 snd_hda_core kvm
_intel nouveau snd_hwdep snd_seq cfg80211 mxm_wmi dell_rbtn kvm snd_pcm
irqbypass ttm crct10dif_pclmul crc32_pclmul sn
d_seq_device crc32c_intel ghash_clmulni_intel drm_kms_helper iTCO_wdt
iTCO_vendor_support dell_laptop drm rfkill dell_
wmi fb_sys_fops bcma syscopyarea sysfillrect sysimgblt i2c_algo_bit
dell_smbios_wmi snd_timer pcbc dell_smbios_smm
[ 1052.698971]  dcdbas dell_smbios e1000e snd aesni_intel parport_pc ppdev
aes_x86_64 ptp crypto_simd dell_smm_hwmon g
lue_helper mei_me cryptd joydev pcspkr soundcore wmi_bmof sparse_keymap
dell_wmi_descriptor mei pps_core i2c_i801 lpc_
ich shpchp parport thermal dell_smo8800 ac battery hid_generic usbhid serio=
_raw
sdhci_pci xhci_pci ehci_pci sdhci xhci
_hcd ehci_hcd mmc_core usbcore wmi video button sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua
[ 1052.698992] CPU: 2 PID: 8934 Comm: gstglcontext Tainted: G           O=
=20=20=20=20
4.15.2-1-default #1
[ 1052.698993] Hardware name: Dell Inc. Latitude E6530/07Y85M, BIOS A02
04/24/2012
[ 1052.699014] RIP: 0010:gf100_fifo_gpfifo_engine_fini+0x14e/0x1c0 [nouveau]
[ 1052.699015] RSP: 0018:ffffa1c0483e3a10 EFLAGS: 00010286
[ 1052.699016] RAX: 000000000000001d RBX: ffff90d685953800 RCX:
0000000000000006
[ 1052.699016] RDX: 0000000000000007 RSI: 0000000000000082 RDI:
ffff90d92dc969d0
[ 1052.699017] RBP: ffff90d906fb2800 R08: 0000000000000001 R09:
000000000000039d
[ 1052.699018] R10: ffffffff8d15ae20 R11: 0000000000000000 R12:
ffff90d91aa99800
[ 1052.699018] R13: ffff90d9178a2680 R14: 000000f4a30744e0 R15:
ffff90d8eb3fb780
[ 1052.699019] FS:  00007ff7ef7fe700(0000) GS:ffff90d92dc80000(0000)
knlGS:0000000000000000
[ 1052.699020] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1052.699021] CR2: 00007fe0c53dd000 CR3: 00000002e900a001 CR4:
00000000001606e0
[ 1052.699021] Call Trace:
[ 1052.699043]  nvkm_fifo_chan_child_fini+0x63/0xf0 [nouveau]
[ 1052.699056]  nvkm_oproxy_fini+0x2b/0x80 [nouveau]
[ 1052.699069]  nvkm_object_fini+0xb8/0x210 [nouveau]
[ 1052.699082]  nvkm_object_fini+0x73/0x210 [nouveau]
[ 1052.699093]  nvkm_ioctl_del+0x7e/0xa0 [nouveau]
[ 1052.699105]  nvkm_ioctl+0x10a/0x240 [nouveau]
[ 1052.699116]  nvif_object_fini+0x59/0x80 [nouveau]
[ 1052.699135]  nouveau_channel_del+0x87/0x120 [nouveau]
[ 1052.699152]  ? nouveau_channel_idle+0x84/0xc0 [nouveau]
[ 1052.699169]  nouveau_abi16_chan_fini.isra.3+0x9c/0xe0 [nouveau]
[ 1052.699186]  nouveau_abi16_fini+0x2d/0x70 [nouveau]
[ 1052.699203]  nouveau_drm_postclose+0x4b/0xe0 [nouveau]
[ 1052.699212]  drm_release+0x264/0x380 [drm]
[ 1052.699216]  __fput+0xca/0x1d0
[ 1052.699218]  task_work_run+0x84/0xa0
[ 1052.699220]  do_exit+0x2ca/0xaf0
[ 1052.699227]  ? drm_ioctl+0x254/0x350 [drm]
[ 1052.699228]  do_group_exit+0x3a/0xa0
[ 1052.699230]  get_signal+0x245/0x5b0[ 1052.699235]  do_signal+0x23/0x670
[ 1052.699252]  ? nouveau_drm_ioctl+0x89/0xc0 [nouveau]
[ 1052.699254]  ? do_vfs_ioctl+0x90/0x5f0
[ 1052.699255]  ? __fget+0x6e/0xb0
[ 1052.699257]  exit_to_usermode_loop+0x80/0xe0
[ 1052.699259]  do_syscall_64+0x120/0x140
[ 1052.699261]  entry_SYSCALL_64_after_hwframe+0x26/0x9b
[ 1052.699263] RIP: 0033:0x7ff90d7f8377
[ 1052.699263] RSP: 002b:00007ff7ef7fd7b8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 1052.699264] RAX: fffffffffffffff0 RBX: 000055d5bb5f6b98 RCX:
00007ff90d7f8377
[ 1052.699265] RDX: 00007ff7ef7fd820 RSI: 00000000c0406481 RDI:
0000000000000027
[ 1052.699266] RBP: 00007ff7ef7fd820 R08: 00007ff7e018e480 R09:
0000000000000002
[ 1052.699266] R10: 00007ff7e018e480 R11: 0000000000000246 R12:
00000000c0406481
[ 1052.699267] R13: 0000000000000027 R14: 000055d5bb5f6b90 R15:
00007ff90b482920
[ 1052.699268] Code: 5d 41 5e 41 5f c3 49 8b 7c 24 10 48 8b 5f 50 48 85 db =
74
74 e8 e4 22 4e cb 48 89 da 48 89 c6 48 c7 c7 36 0e 1a c1 e8 12 80 ff ca &lt=
;0f&gt; ff
48 8b 44 24 08 8b 40 48 85 c0 75 1a 48 8b 3c 24 bb 92 ff=20
[ 1052.699287] ---[ end trace f7521aa428293232 ]---
[ 1052.699290] nouveau 0000:01:00.0: fifo: channel 11 [WebKitWebProces[8594=
]]
kick timeout
[ 1052.699294] nouveau: WebKitWebProces[8594]:00000000:0000906f: detach gr
failed, -110
[ 1052.699334] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []

I couldn't switch desktops -- I had to reboot.
[ 1052.699232]  ? futex_wake+0x83/0x150</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15187100370.fca8367.15727--

--===============1240864147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1240864147==--
