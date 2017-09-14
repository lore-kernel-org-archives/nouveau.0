From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102722] [regression] changing resolution hangs the
 display on Lenovo Thinkpad p51
Date: Thu, 14 Sep 2017 06:39:52 +0000
Message-ID: <bug-102722-8800-utyZE5abX6@http.bugs.freedesktop.org/>
References: <bug-102722-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1310452063=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102722-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1310452063==
Content-Type: multipart/alternative; boundary="15053711920.DBfBC79B7.28574";
 charset="UTF-8"


--15053711920.DBfBC79B7.28574
Date: Thu, 14 Sep 2017 06:39:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102722

--- Comment #1 from craig harmer <charmer-freedesktop.org-kYREfu93XNOEi8DpZVb4nw@public.gmane.org> ---
Created attachment 134213
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134213&action=3Dedit
Kubuntu 16.04.3 /var/log/syslog including a "warning" with stack trace

interesting excerpt from /var/log/syslog.  i don't remember exactly, but i =
was
either trying to change the resolution on the laptop display or connect an
external display:

Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xrandr: XRandR::setConfig
done!
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen: Primary output changed =
from
KScreen::Output(Id: 99 , Name: "eDP-1" ) ( "eDP-1" ) to KScreen::Output(Id:=
 99
, Name: "eDP-1" ) ( "eDP-1" )
Aug 30 22:15:00 p51 kernel: [  103.994111] nouveau 0000:01:00.0: disp:
0x6219[0]: INIT_GENERIC_CONDITON: unknown 0x07
Aug 30 22:15:00 p51 kernel: [  104.069777] ------------[ cut here ]--------=
----
Aug 30 22:15:00 p51 kernel: [  104.069799] WARNING: CPU: 5 PID: 2205 at
/build/linux-hwe-YA6IuF/linux-hwe-4.10.0/drivers/gpu/drm/nouveau/nouveau_bo=
.c:137
nouveau_bo_del_ttm+0x7f/0x90 [nouveau]
Aug 30 22:15:00 p51 kernel: [  104.069800] Modules linked in: rfcomm ccm bn=
ep
nls_iso8859_1 arc4 i2c_designware_platform i2c_designware_core iwlmvm
snd_hda_codec_realtek intel_rapl snd_hda_codec_generic snd_seq_midi mac80211
snd_seq_midi_event x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_i=
ntel
snd_hda_codec kvm_intel snd_hda_core snd_hwdep snd_pcm iwlwifi kvm snd_rawm=
idi
cfg80211 irqbypass rtsx_pci_ms memstick uvcvideo joydev thinkpad_acpi
videobuf2_vmalloc input_leds videobuf2_memops serio_raw videobuf2_v4l2
videobuf2_core nvram videodev media snd_seq snd_seq_device idma64 snd_timer
btusb virt_dma btrtl mei_me shpchp mei ucsi intel_lpss_pci intel_pch_thermal
snd hci_uart btbcm btqca btintel bluetooth soundcore intel_lpss_acpi intel_=
lpss
tpm_crb mac_hid acpi_pad parport_pc ppdev lp parport autofs4 algif_skcipher
af_alg
Aug 30 22:15:00 p51 kernel: [  104.069822]  dm_crypt hid_generic usbhid nou=
veau
rtsx_pci_sdmmc crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc mxm_w=
mi
i2c_algo_bit aesni_intel ttm drm_kms_helper aes_x86_64 crypto_simd e1000e
syscopyarea glue_helper sysfillrect cryptd sysimgblt uas fb_sys_fops ptp
psmouse nvme drm pps_core ahci rtsx_pci usb_storage nvme_core libahci wmi
pinctrl_sunrisepoint i2c_hid video pinctrl_intel hid fjes
Aug 30 22:15:00 p51 kernel: [  104.069834] CPU: 5 PID: 2205 Comm: Xorg Not
tainted 4.10.0-33-generic #37~16.04.1-Ubuntu
Aug 30 22:15:00 p51 kernel: [  104.069834] Hardware name: LENOVO
20HHCTO1WW/20HHCTO1WW, BIOS N1UET31W (1.05 ) 02/13/2017
Aug 30 22:15:00 p51 kernel: [  104.069835] Call Trace:
Aug 30 22:15:00 p51 kernel: [  104.069838]  dump_stack+0x63/0x90
Aug 30 22:15:00 p51 kernel: [  104.069839]  __warn+0xcb/0xf0
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper:
RRNotify_CrtcChange
Aug 30 22:15:00 p51 kernel: [  104.069840]  warn_slowpath_null+0x1d/0x20
Aug 30 22:15:00 p51 kernel: [  104.069855]  nouveau_bo_del_ttm+0x7f/0x90
[nouveau]
Aug 30 22:15:00 p51 kernel: [  104.069858]  ttm_bo_release_list+0xb5/0x170
[ttm]
Aug 30 22:15:00 p51 kernel: [  104.069860]  ttm_bo_release+0x1ae/0x240 [ttm]
Aug 30 22:15:00 p51 kernel: [  104.069861]  ttm_bo_unref+0x24/0x30 [ttm]
Aug 30 22:15:00 p51 kernel: [  104.069875]  nouveau_gem_object_del+0x9a/0xf0
[nouveau]
Aug 30 22:15:00 p51 kernel: [  104.069881]  drm_gem_object_free+0x29/0x70 [=
drm]
Aug 30 22:15:00 p51 kernel: [  104.069884]=20
drm_gem_object_unreference_unlocked+0x3a/0xa0 [drm]
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper: #011CRTC:  95
Aug 30 22:15:00 p51 kernel: [  104.069887]=20
drm_gem_object_handle_unreference_unlocked+0x65/0xb0 [drm]
Aug 30 22:15:00 p51 kernel: [  104.069891]=20
drm_gem_object_release_handle+0x53/0x90 [drm]
Aug 30 22:15:00 p51 kernel: [  104.069894]  drm_gem_handle_delete+0x5f/0x90
[drm]
Aug 30 22:15:00 p51 kernel: [  104.069897]  drm_gem_close_ioctl+0x20/0x30 [=
drm]
Aug 30 22:15:00 p51 kernel: [  104.069901]  drm_ioctl+0x21b/0x4d0 [drm]
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper: #011Mode:  1=
06
Aug 30 22:15:00 p51 kernel: [  104.069904]  ? drm_gem_handle_create+0x40/0x=
40
[drm]
Aug 30 22:15:00 p51 kernel: [  104.069906]  ? signal_setup_done+0x6b/0xb0
Aug 30 22:15:00 p51 kernel: [  104.069919]  nouveau_drm_ioctl+0x68/0xc0
[nouveau]
Aug 30 22:15:00 p51 kernel: [  104.069921]  do_vfs_ioctl+0xa1/0x5f0
Aug 30 22:15:00 p51 kernel: [  104.069922]  SyS_ioctl+0x79/0x90
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper: #011Rotation=
:=20
"Rotate_0"
Aug 30 22:15:00 p51 kernel: [  104.069924]  entry_SYSCALL_64_fastpath+0x1e/=
0xad
Aug 30 22:15:00 p51 kernel: [  104.069924] RIP: 0033:0x7ff294fdef07
Aug 30 22:15:00 p51 kernel: [  104.069925] RSP: 002b:00007fff5686def8 EFLAG=
S:
00003246 ORIG_RAX: 0000000000000010
Aug 30 22:15:00 p51 kernel: [  104.069925] RAX: ffffffffffffffda RBX:
0000000000000018 RCX: 00007ff294fdef07
Aug 30 22:15:00 p51 kernel: [  104.069926] RDX: 00007fff5686df30 RSI:
0000000040086409 RDI: 0000000000000018
Aug 30 22:15:00 p51 kernel: [  104.069926] RBP: 00007fff5686de20 R08:
000055b1781bcd18 R09: 000000000000005b
Aug 30 22:15:00 p51 kernel: [  104.069926] R10: 000055b1781bf3c0 R11:
0000000000003246 R12: 00000000c06864a2
Aug 30 22:15:00 p51 kernel: [  104.069927] R13: 0000000000000018 R14:
000055b17854a7c0 R15: 0000000000000000
Aug 30 22:15:00 p51 kernel: [  104.069928] ---[ end trace 1a268d7d8bb56202 =
]---
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper: #011Geometry=
:  0
0 1920 1080
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper:
RRScreenChangeNotify

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15053711920.DBfBC79B7.28574
Date: Thu, 14 Sep 2017 06:39:52 +0000
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
   title=3D"NEW - [regression] changing resolution hangs the display on Len=
ovo Thinkpad p51"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102722#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression] changing resolution hangs the display on Len=
ovo Thinkpad p51"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102722">bug 10272=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
charmer-freedesktop.org&#64;punchdown.org" title=3D"craig harmer &lt;charme=
r-freedesktop.org&#64;punchdown.org&gt;"> <span class=3D"fn">craig harmer</=
span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134213=
" name=3D"attach_134213" title=3D"Kubuntu 16.04.3 /var/log/syslog including=
 a &quot;warning&quot; with stack trace">attachment 134213</a> <a href=3D"a=
ttachment.cgi?id=3D134213&amp;action=3Dedit" title=3D"Kubuntu 16.04.3 /var/=
log/syslog including a &quot;warning&quot; with stack trace">[details]</a><=
/span>
Kubuntu 16.04.3 /var/log/syslog including a &quot;warning&quot; with stack =
trace

interesting excerpt from /var/log/syslog.  i don't remember exactly, but i =
was
either trying to change the resolution on the laptop display or connect an
external display:

Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xrandr: XRandR::setConfig
done!
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen: Primary output changed =
from
KScreen::Output(Id: 99 , Name: &quot;eDP-1&quot; ) ( &quot;eDP-1&quot; ) to=
 KScreen::Output(Id: 99
, Name: &quot;eDP-1&quot; ) ( &quot;eDP-1&quot; )
Aug 30 22:15:00 p51 kernel: [  103.994111] nouveau 0000:01:00.0: disp:
0x6219[0]: INIT_GENERIC_CONDITON: unknown 0x07
Aug 30 22:15:00 p51 kernel: [  104.069777] ------------[ cut here ]--------=
----
Aug 30 22:15:00 p51 kernel: [  104.069799] WARNING: CPU: 5 PID: 2205 at
/build/linux-hwe-YA6IuF/linux-hwe-4.10.0/drivers/gpu/drm/nouveau/nouveau_bo=
.c:137
nouveau_bo_del_ttm+0x7f/0x90 [nouveau]
Aug 30 22:15:00 p51 kernel: [  104.069800] Modules linked in: rfcomm ccm bn=
ep
nls_iso8859_1 arc4 i2c_designware_platform i2c_designware_core iwlmvm
snd_hda_codec_realtek intel_rapl snd_hda_codec_generic snd_seq_midi mac80211
snd_seq_midi_event x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_i=
ntel
snd_hda_codec kvm_intel snd_hda_core snd_hwdep snd_pcm iwlwifi kvm snd_rawm=
idi
cfg80211 irqbypass rtsx_pci_ms memstick uvcvideo joydev thinkpad_acpi
videobuf2_vmalloc input_leds videobuf2_memops serio_raw videobuf2_v4l2
videobuf2_core nvram videodev media snd_seq snd_seq_device idma64 snd_timer
btusb virt_dma btrtl mei_me shpchp mei ucsi intel_lpss_pci intel_pch_thermal
snd hci_uart btbcm btqca btintel bluetooth soundcore intel_lpss_acpi intel_=
lpss
tpm_crb mac_hid acpi_pad parport_pc ppdev lp parport autofs4 algif_skcipher
af_alg
Aug 30 22:15:00 p51 kernel: [  104.069822]  dm_crypt hid_generic usbhid nou=
veau
rtsx_pci_sdmmc crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc mxm_w=
mi
i2c_algo_bit aesni_intel ttm drm_kms_helper aes_x86_64 crypto_simd e1000e
syscopyarea glue_helper sysfillrect cryptd sysimgblt uas fb_sys_fops ptp
psmouse nvme drm pps_core ahci rtsx_pci usb_storage nvme_core libahci wmi
pinctrl_sunrisepoint i2c_hid video pinctrl_intel hid fjes
Aug 30 22:15:00 p51 kernel: [  104.069834] CPU: 5 PID: 2205 Comm: Xorg Not
tainted 4.10.0-33-generic #37~16.04.1-Ubuntu
Aug 30 22:15:00 p51 kernel: [  104.069834] Hardware name: LENOVO
20HHCTO1WW/20HHCTO1WW, BIOS N1UET31W (1.05 ) 02/13/2017
Aug 30 22:15:00 p51 kernel: [  104.069835] Call Trace:
Aug 30 22:15:00 p51 kernel: [  104.069838]  dump_stack+0x63/0x90
Aug 30 22:15:00 p51 kernel: [  104.069839]  __warn+0xcb/0xf0
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper:
RRNotify_CrtcChange
Aug 30 22:15:00 p51 kernel: [  104.069840]  warn_slowpath_null+0x1d/0x20
Aug 30 22:15:00 p51 kernel: [  104.069855]  nouveau_bo_del_ttm+0x7f/0x90
[nouveau]
Aug 30 22:15:00 p51 kernel: [  104.069858]  ttm_bo_release_list+0xb5/0x170
[ttm]
Aug 30 22:15:00 p51 kernel: [  104.069860]  ttm_bo_release+0x1ae/0x240 [ttm]
Aug 30 22:15:00 p51 kernel: [  104.069861]  ttm_bo_unref+0x24/0x30 [ttm]
Aug 30 22:15:00 p51 kernel: [  104.069875]  nouveau_gem_object_del+0x9a/0xf0
[nouveau]
Aug 30 22:15:00 p51 kernel: [  104.069881]  drm_gem_object_free+0x29/0x70 [=
drm]
Aug 30 22:15:00 p51 kernel: [  104.069884]=20
drm_gem_object_unreference_unlocked+0x3a/0xa0 [drm]
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper: #011CRTC:  95
Aug 30 22:15:00 p51 kernel: [  104.069887]=20
drm_gem_object_handle_unreference_unlocked+0x65/0xb0 [drm]
Aug 30 22:15:00 p51 kernel: [  104.069891]=20
drm_gem_object_release_handle+0x53/0x90 [drm]
Aug 30 22:15:00 p51 kernel: [  104.069894]  drm_gem_handle_delete+0x5f/0x90
[drm]
Aug 30 22:15:00 p51 kernel: [  104.069897]  drm_gem_close_ioctl+0x20/0x30 [=
drm]
Aug 30 22:15:00 p51 kernel: [  104.069901]  drm_ioctl+0x21b/0x4d0 [drm]
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper: #011Mode:  1=
06
Aug 30 22:15:00 p51 kernel: [  104.069904]  ? drm_gem_handle_create+0x40/0x=
40
[drm]
Aug 30 22:15:00 p51 kernel: [  104.069906]  ? signal_setup_done+0x6b/0xb0
Aug 30 22:15:00 p51 kernel: [  104.069919]  nouveau_drm_ioctl+0x68/0xc0
[nouveau]
Aug 30 22:15:00 p51 kernel: [  104.069921]  do_vfs_ioctl+0xa1/0x5f0
Aug 30 22:15:00 p51 kernel: [  104.069922]  SyS_ioctl+0x79/0x90
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper: #011Rotation=
:=20
&quot;Rotate_0&quot;
Aug 30 22:15:00 p51 kernel: [  104.069924]  entry_SYSCALL_64_fastpath+0x1e/=
0xad
Aug 30 22:15:00 p51 kernel: [  104.069924] RIP: 0033:0x7ff294fdef07
Aug 30 22:15:00 p51 kernel: [  104.069925] RSP: 002b:00007fff5686def8 EFLAG=
S:
00003246 ORIG_RAX: 0000000000000010
Aug 30 22:15:00 p51 kernel: [  104.069925] RAX: ffffffffffffffda RBX:
0000000000000018 RCX: 00007ff294fdef07
Aug 30 22:15:00 p51 kernel: [  104.069926] RDX: 00007fff5686df30 RSI:
0000000040086409 RDI: 0000000000000018
Aug 30 22:15:00 p51 kernel: [  104.069926] RBP: 00007fff5686de20 R08:
000055b1781bcd18 R09: 000000000000005b
Aug 30 22:15:00 p51 kernel: [  104.069926] R10: 000055b1781bf3c0 R11:
0000000000003246 R12: 00000000c06864a2
Aug 30 22:15:00 p51 kernel: [  104.069927] R13: 0000000000000018 R14:
000055b17854a7c0 R15: 0000000000000000
Aug 30 22:15:00 p51 kernel: [  104.069928] ---[ end trace 1a268d7d8bb56202 =
]---
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper: #011Geometry=
:  0
0 1920 1080
Aug 30 22:15:00 p51 org.kde.KScreen[2281]: kscreen.xcb.helper:
RRScreenChangeNotify</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15053711920.DBfBC79B7.28574--

--===============1310452063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1310452063==--
