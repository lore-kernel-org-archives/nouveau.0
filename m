From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95282] G96: system hang on video playback via vdpau
Date: Sat, 17 Nov 2018 10:39:33 +0000
Message-ID: <bug-95282-8800-AWWQcXepQt@http.bugs.freedesktop.org/>
References: <bug-95282-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0305335320=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95282-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0305335320==
Content-Type: multipart/alternative; boundary="15424511733.Ed0e68d1.21633"
Content-Transfer-Encoding: 7bit


--15424511733.Ed0e68d1.21633
Date: Sat, 17 Nov 2018 10:39:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95282

--- Comment #22 from Maris Nartiss <maris.nartiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to poma from comment #9)
> Besides, it is enough to just run the application itself, without starting
> the video,

I confirm =E2=80=93 starting xine is enough without any need of playing vid=
eo. I get
the same error as in comment #9 Still the error looks a bit different than =
one
in the log from comment #3

G98M [Quadro NVS 160M]
sys-kernel/gentoo-sources-4.18.0
media-libs/mesa-18.2.2-r1

$ xine --verbose
This is xine (X11 gui) - a free video player v0.99.10.
Built with xine library 1.2.9 (1.2.9)
Found xine library version: 1.2.9 (1.2.9).
main: probing <vdpau> video output plugin
vo_vdpau: vdpau API version : 1
vo_vdpau: vdpau implementation description : G3DVL VDPAU Driver Shared Libr=
ary
version 1.0
vo_vdpau: maximum video surface size for chroma type 4:2:2 is 8192x8192
vo_vdpau: maximum video surface size for chroma type 4:2:0 is 8192x8192
vo_vdpau: maximum output surface size is 8192x8192
vo_vdpau: hold a maximum of 10 video output surfaces for reuse
vo_vdpau: using 3 output surfaces of size 1440x900 for display queue
vo_vdpau: this hardware doesn't support mpeg4-part2.
video_out_vdpau: b 0 c 128 s 128 h 0 [full range ITU-R 470 BG / SDTV]
video_out: max frames used: 1 of 22
video_out: early wakeups: 1 of 127
video_out: max frames used: 0 of 22
video_out: early wakeups: 0 of 128

$ dmesg -t
WARNING: CPU: 0 PID: 28 at drivers/gpu/drm/nouveau/nvif/vmm.c:71
nvif_vmm_put+0x65/0x70 [nouveau]
Modules linked in: ctr ccm uvcvideo videobuf2_vmalloc nouveau videobuf2_mem=
ops
videobuf2_v4l2 videodev videobuf2_common i2c_algo_bit drm_kms_helper
dell_smm_hwmon wmi_bmof dell_wmi iwldvm sparse_keymap coretemp hwmon
snd_hda_codec_idt cfbfillrect syscopyarea kvm_intel mac80211 cfbimgblt
dell_laptop kvm sysfillrect sysimgblt dell_smbios fb_sys_fops cfbcopyarea
dell_wmi_descriptor dcdbas fb snd_hda_codec_generic irqbypass font sdhci_pci
fbdev snd_hda_intel cqhci ttm snd_hda_codec sdhci iwlwifi pcspkr drm mmc_co=
re
firewire_ohci lpc_ich firewire_core snd_hwdep cfg80211 mfd_core crc_itu_t
drm_panel_orientation_quirks vboxpci(O) snd_hda_core vboxnetadp(O)
vboxnetflt(O) rfkill e1000e wmi tpm_tis video tpm_tis_core ptp tpm backlight
pps_core vboxdrv(O) pcc_cpufreq
CPU: 0 PID: 28 Comm: kworker/0:1 Tainted: G           O      4.18.0-gentoo =
#1
Hardware name: Dell Inc. Latitude E6500                  /, BIOS A27 12/06/=
2011
Workqueue: events nouveau_cli_work [nouveau]
RIP: 0010:nvif_vmm_put+0x65/0x70 [nouveau]
Code: 00 00 48 89 e2 be 02 00 00 00 48 c7 04 24 00 00 00 00 48 89 44 24 08 =
e8
a9 e6 ff ff 85 c0 75 0a 48 c7 43 08 00 00 00 00 eb b7 <0f> 0b eb f2 e8 02 9=
0 9f
e0 66 90 53 48 83 ec 20 65 48 8b 04 25 28=20
RSP: 0018:ffffc90000723de8 EFLAGS: 00010282
RAX: 00000000fffffffe RBX: ffffc90000723e10 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffc90000723d58 RDI: ffffc90000723df8
RBP: ffffc90000723e40 R08: 000000000042a000 R09: 0000000000000000
R10: 0000000000000000 R11: fefefefefefefeff R12: ffff8800d10d1e60
R13: dead000000000200 R14: dead000000000100 R15: ffff8800d10d1e70
FS:  0000000000000000(0000) GS:ffff88011b800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd7bd3dc000 CR3: 00000000da5b4000 CR4: 00000000000006f0
Call Trace:
 nouveau_vma_del+0x6b/0xb0 [nouveau]
 nouveau_gem_object_delete_work+0x31/0x60 [nouveau]
 nouveau_cli_work+0x71/0x100 [nouveau]
 process_one_work+0x1cf/0x3f0
 worker_thread+0x28/0x3c0
 ? process_one_work+0x3f0/0x3f0
 kthread+0x10e/0x130
 ? kthread_flush_work_fn+0x10/0x10
 ret_from_fork+0x35/0x40
---[ end trace be79f07b609be4df ]---
CE: hpet increased min_delta_ns to 20115 nsec
nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] - Address
0021340000
nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, =
e1c:
01000080, e20: 00001800, e24: 00030000
nouveau 0000:01:00.0: gr: 00200000 [] ch 24 [000dcf9000 xine[5772]] subc 3
class 8297 mthd 1558 data 00000001
nouveau 0000:01:00.0: fb: trapped write at 0021340000 on channel 24 [0dcf90=
00
xine[5772]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason
00000002 [PAGE_NOT_PRESENT]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15424511733.Ed0e68d1.21633
Date: Sat, 17 Nov 2018 10:39:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - G96: system hang on video playback via vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95282#c22">Commen=
t # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - G96: system hang on video playback via vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95282">bug 95282<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
maris.nartiss&#64;gmail.com" title=3D"Maris Nartiss &lt;maris.nartiss&#64;g=
mail.com&gt;"> <span class=3D"fn">Maris Nartiss</span></a>
</span></b>
        <pre>(In reply to poma from <a href=3D"show_bug.cgi?id=3D95282#c9">=
comment #9</a>)
<span class=3D"quote">&gt; Besides, it is enough to just run the applicatio=
n itself, without starting
&gt; the video,</span >

I confirm =E2=80=93 starting xine is enough without any need of playing vid=
eo. I get
the same error as in <a href=3D"show_bug.cgi?id=3D95282#c9">comment #9</a> =
Still the error looks a bit different than one
in the log from <a href=3D"show_bug.cgi?id=3D95282#c3">comment #3</a>

G98M [Quadro NVS 160M]
sys-kernel/gentoo-sources-4.18.0
media-libs/mesa-18.2.2-r1

$ xine --verbose
This is xine (X11 gui) - a free video player v0.99.10.
Built with xine library 1.2.9 (1.2.9)
Found xine library version: 1.2.9 (1.2.9).
main: probing &lt;vdpau&gt; video output plugin
vo_vdpau: vdpau API version : 1
vo_vdpau: vdpau implementation description : G3DVL VDPAU Driver Shared Libr=
ary
version 1.0
vo_vdpau: maximum video surface size for chroma type 4:2:2 is 8192x8192
vo_vdpau: maximum video surface size for chroma type 4:2:0 is 8192x8192
vo_vdpau: maximum output surface size is 8192x8192
vo_vdpau: hold a maximum of 10 video output surfaces for reuse
vo_vdpau: using 3 output surfaces of size 1440x900 for display queue
vo_vdpau: this hardware doesn't support mpeg4-part2.
video_out_vdpau: b 0 c 128 s 128 h 0 [full range ITU-R 470 BG / SDTV]
video_out: max frames used: 1 of 22
video_out: early wakeups: 1 of 127
video_out: max frames used: 0 of 22
video_out: early wakeups: 0 of 128

$ dmesg -t
WARNING: CPU: 0 PID: 28 at drivers/gpu/drm/nouveau/nvif/vmm.c:71
nvif_vmm_put+0x65/0x70 [nouveau]
Modules linked in: ctr ccm uvcvideo videobuf2_vmalloc nouveau videobuf2_mem=
ops
videobuf2_v4l2 videodev videobuf2_common i2c_algo_bit drm_kms_helper
dell_smm_hwmon wmi_bmof dell_wmi iwldvm sparse_keymap coretemp hwmon
snd_hda_codec_idt cfbfillrect syscopyarea kvm_intel mac80211 cfbimgblt
dell_laptop kvm sysfillrect sysimgblt dell_smbios fb_sys_fops cfbcopyarea
dell_wmi_descriptor dcdbas fb snd_hda_codec_generic irqbypass font sdhci_pci
fbdev snd_hda_intel cqhci ttm snd_hda_codec sdhci iwlwifi pcspkr drm mmc_co=
re
firewire_ohci lpc_ich firewire_core snd_hwdep cfg80211 mfd_core crc_itu_t
drm_panel_orientation_quirks vboxpci(O) snd_hda_core vboxnetadp(O)
vboxnetflt(O) rfkill e1000e wmi tpm_tis video tpm_tis_core ptp tpm backlight
pps_core vboxdrv(O) pcc_cpufreq
CPU: 0 PID: 28 Comm: kworker/0:1 Tainted: G           O      4.18.0-gentoo =
#1
Hardware name: Dell Inc. Latitude E6500                  /, BIOS A27 12/06/=
2011
Workqueue: events nouveau_cli_work [nouveau]
RIP: 0010:nvif_vmm_put+0x65/0x70 [nouveau]
Code: 00 00 48 89 e2 be 02 00 00 00 48 c7 04 24 00 00 00 00 48 89 44 24 08 =
e8
a9 e6 ff ff 85 c0 75 0a 48 c7 43 08 00 00 00 00 eb b7 &lt;0f&gt; 0b eb f2 e=
8 02 90 9f
e0 66 90 53 48 83 ec 20 65 48 8b 04 25 28=20
RSP: 0018:ffffc90000723de8 EFLAGS: 00010282
RAX: 00000000fffffffe RBX: ffffc90000723e10 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffc90000723d58 RDI: ffffc90000723df8
RBP: ffffc90000723e40 R08: 000000000042a000 R09: 0000000000000000
R10: 0000000000000000 R11: fefefefefefefeff R12: ffff8800d10d1e60
R13: dead000000000200 R14: dead000000000100 R15: ffff8800d10d1e70
FS:  0000000000000000(0000) GS:ffff88011b800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd7bd3dc000 CR3: 00000000da5b4000 CR4: 00000000000006f0
Call Trace:
 nouveau_vma_del+0x6b/0xb0 [nouveau]
 nouveau_gem_object_delete_work+0x31/0x60 [nouveau]
 nouveau_cli_work+0x71/0x100 [nouveau]
 process_one_work+0x1cf/0x3f0
 worker_thread+0x28/0x3c0
 ? process_one_work+0x3f0/0x3f0
 kthread+0x10e/0x130
 ? kthread_flush_work_fn+0x10/0x10
 ret_from_fork+0x35/0x40
---[ end trace be79f07b609be4df ]---
CE: hpet increased min_delta_ns to 20115 nsec
nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] - Address
0021340000
nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, =
e1c:
01000080, e20: 00001800, e24: 00030000
nouveau 0000:01:00.0: gr: 00200000 [] ch 24 [000dcf9000 xine[5772]] subc 3
class 8297 mthd 1558 data 00000001
nouveau 0000:01:00.0: fb: trapped write at 0021340000 on channel 24 [0dcf90=
00
xine[5772]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason
00000002 [PAGE_NOT_PRESENT]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15424511733.Ed0e68d1.21633--

--===============0305335320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0305335320==--
