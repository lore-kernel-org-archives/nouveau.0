From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100545] New: BUG: null pointer dereference
 dma_fence_wait_timeout from nouveau_drm_ioctl (linux 4.10.5)
Date: Tue, 04 Apr 2017 01:37:41 +0000
Message-ID: <bug-100545-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0657432043=="
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


--===============0657432043==
Content-Type: multipart/alternative; boundary="14912698611.7C041.28467";
 charset="UTF-8"


--14912698611.7C041.28467
Date: Tue, 4 Apr 2017 01:37:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100545

            Bug ID: 100545
           Summary: BUG: null pointer dereference dma_fence_wait_timeout
                    from nouveau_drm_ioctl (linux 4.10.5)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Keywords: have-backtrace
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: rcoe-TsGEh1ee8XYAvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 130660
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130660&action=3Dedit
kernel messages log

Sorry if this is drm error and not a nouveau error.

BUG: unable to handle kernel NULL pointer dereference at 0000000000000021
IP: dma_fence_wait_timeout+0x30/0x110

I had just started the computer, and started X with startx (because reasons=
).
I had opened the configure prefences when the mouse froze.

I'm including the kernel boot messages and traceback as an attachment.

libdrm_nouveau2-32bit-2.4.75-1.1.x86_64
libdrm_nouveau2-2.4.75-1.1.x86_64
libvdpau_nouveau-17.0.1-157.1.x86_64
Mesa-dri-nouveau-17.0.1-157.1.x86_64
xf86-video-nouveau-1.0.14-1.1.x86_64
xorg-x11-7.6_1-16.2.noarch
xorg-x11-devel-7.6-47.2.noarch
xorg-x11-driver-input-7.6_1-14.1.noarch
xorg-x11-driver-video-7.6_1-15.2.x86_64
xorg-x11-essentials-7.6_1-16.2.noarch
xorg-x11-fonts-7.6-31.7.noarch
xorg-x11-fonts-core-7.6-31.7.noarch
xorg-x11-libs-7.6-47.2.noarch
xorg-x11-libX11-ccache-7.6-20.4.noarch
xorg-x11-server-1.19.3-1.1.x86_64
xorg-x11-util-devel-7.6_1-10.2.noarch
xorg-x11-Xvnc-1.7.1-3.1.x86_64

2017-04-03T20:10:19.720098-05:00 mothra kernel: [  211.555207] Oops: 0000 [=
#1]
PREEMPT SMP
[  211.555212] Modules linked in: rfcomm fuse vboxpci(O) vboxnetadp(O)
vboxnetflt(O) snd_hda_codec_hdmi bnep vboxdrv(O) msr snd_hda_codec_idt
snd_hda_codec_generic btusb btrtl btbcm btintel bluetooth arc4 brcmsmac
uvcvideo cordic brcmutil videobuf2_vmalloc videobuf2_memops intel_rapl
videobuf2_v4l2 videobuf2_core x86_pkg_temp_thermal b43 intel_powerclamp
videodev coretemp mac80211 kvm_intel kvm cfg80211 irqbypass dell_rbtn
crct10dif_pclmul crc32_pclmul ssb crc32c_intel ghash_clmulni_intel dell_lap=
top
dell_wmi sparse_keymap iTCO_wdt rfkill dell_smbios pcmcia pcbc mei_wdt dcdb=
as
iTCO_vendor_support pcmcia_core dell_smm_hwmon snd_hda_intel aesni_intel
snd_hda_codec snd_hda_core snd_hwdep aes_x86_64 snd_pcm snd_seq crypto_simd
glue_helper cryptd pcspkr joydev snd_seq_device parport_pc bcma snd_timer p=
pdev
[  211.555287]  parport snd e1000e mei_me soundcore thermal ptp lpc_ich fjes
mei pps_core tpm_tis mfd_core tpm_tis_core battery i2c_i801 dell_smo8800 sh=
pchp
tpm ac nouveau serio_raw mxm_wmi i2c_algo_bit drm_kms_helper syscopyarea
sysfillrect sysimgblt fb_sys_fops sdhci_pci xhci_pci ttm sdhci ehci_pci
xhci_hcd ehci_hcd mmc_core drm usbcore wmi video button sg dm_multipath dm_=
mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua
[  211.555335] CPU: 0 PID: 2979 Comm: InputThread Tainted: G           O=20=
=20=20
4.10.5-1-default #1
[  211.555340] Hardware name: Dell Inc. Latitude E6530/07Y85M, BIOS A02
04/24/2012
[  211.555346] task: ffffa058dbf54000 task.stack: ffffae9d42530000
[  211.555353] RIP: 0010:dma_fence_wait_timeout+0x30/0x110
[  211.555357] RSP: 0018:ffffae9d42533ac0 EFLAGS: 00010206
[  211.555362] RAX: 0000000000000001 RBX: ffffa058d9759c00 RCX:
ffffffffc05a7fa0
[  211.555367] RDX: 7fffffffffffffff RSI: 0000000000000001 RDI:
ffffa058dc592c00
[  211.555372] RBP: ffffa058dc592c00 R08: 0000000000000004 R09:
ffffa058dc592c00
[  211.555377] R10: 00000000fb000000 R11: ffffae9d42533db8 R12:
0000000000000001
[  211.555381] R13: 7fffffffffffffff R14: 0000000000000001 R15:
0000000000000001
[  211.555405] FS:  00007f449b47d700(0000) GS:ffffa058edc00000(0000)
knlGS:0000000000000000
[  211.555427] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  211.555448] CR2: 0000000000000021 CR3: 0000000419549000 CR4:
00000000001406f0
[  211.555470] Call Trace:
[  211.555514]  drm_atomic_helper_wait_for_fences+0x48/0x130 [drm_kms_helpe=
r]
[  211.555607]  nv50_disp_atomic_commit+0x18e/0x290 [nouveau]
[  211.555643]  drm_atomic_helper_update_plane+0xeb/0x150 [drm_kms_helper]
[  211.555690]  __setplane_internal+0x1d9/0x2a0 [drm]
[  211.555718]  ? enqueue_entity+0x110/0x6d0
[  211.555754]  drm_mode_cursor_universal+0x10b/0x1e0 [drm]
[  211.555792]  drm_mode_cursor_common+0x80/0x170 [drm]
[  211.555829]  drm_mode_cursor_ioctl+0x44/0x50 [drm]
[  211.555866]  drm_ioctl+0x1ec/0x410 [drm]
[  211.555903]  ? drm_mode_setplane+0x1a0/0x1a0 [drm]
[  211.555980]  nouveau_drm_ioctl+0x66/0xc0 [nouveau]
[  211.556010]  do_vfs_ioctl+0x8f/0x5d0
[  211.556036]  ? __fget+0x70/0xc0
[  211.556058]  SyS_ioctl+0x74/0x80
[  211.556086]  entry_SYSCALL_64_fastpath+0x1e/0xad

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14912698611.7C041.28467
Date: Tue, 4 Apr 2017 01:37:41 +0000
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
   title=3D"NEW - BUG: null pointer dereference dma_fence_wait_timeout from=
 nouveau_drm_ioctl (linux 4.10.5)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100545">100545</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>BUG: null pointer dereference dma_fence_wait_timeout from nou=
veau_drm_ioctl (linux 4.10.5)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <th>Keywords</th>
          <td>have-backtrace
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130660=
" name=3D"attach_130660" title=3D"kernel messages log">attachment 130660</a=
> <a href=3D"attachment.cgi?id=3D130660&amp;action=3Dedit" title=3D"kernel =
messages log">[details]</a></span>
kernel messages log

Sorry if this is drm error and not a nouveau error.

BUG: unable to handle kernel NULL pointer dereference at 0000000000000021
IP: dma_fence_wait_timeout+0x30/0x110

I had just started the computer, and started X with startx (because reasons=
).
I had opened the configure prefences when the mouse froze.

I'm including the kernel boot messages and traceback as an attachment.

libdrm_nouveau2-32bit-2.4.75-1.1.x86_64
libdrm_nouveau2-2.4.75-1.1.x86_64
libvdpau_nouveau-17.0.1-157.1.x86_64
Mesa-dri-nouveau-17.0.1-157.1.x86_64
xf86-video-nouveau-1.0.14-1.1.x86_64
xorg-x11-7.6_1-16.2.noarch
xorg-x11-devel-7.6-47.2.noarch
xorg-x11-driver-input-7.6_1-14.1.noarch
xorg-x11-driver-video-7.6_1-15.2.x86_64
xorg-x11-essentials-7.6_1-16.2.noarch
xorg-x11-fonts-7.6-31.7.noarch
xorg-x11-fonts-core-7.6-31.7.noarch
xorg-x11-libs-7.6-47.2.noarch
xorg-x11-libX11-ccache-7.6-20.4.noarch
xorg-x11-server-1.19.3-1.1.x86_64
xorg-x11-util-devel-7.6_1-10.2.noarch
xorg-x11-Xvnc-1.7.1-3.1.x86_64

2017-04-03T20:10:19.720098-05:00 mothra kernel: [  211.555207] Oops: 0000 [=
#1]
PREEMPT SMP
[  211.555212] Modules linked in: rfcomm fuse vboxpci(O) vboxnetadp(O)
vboxnetflt(O) snd_hda_codec_hdmi bnep vboxdrv(O) msr snd_hda_codec_idt
snd_hda_codec_generic btusb btrtl btbcm btintel bluetooth arc4 brcmsmac
uvcvideo cordic brcmutil videobuf2_vmalloc videobuf2_memops intel_rapl
videobuf2_v4l2 videobuf2_core x86_pkg_temp_thermal b43 intel_powerclamp
videodev coretemp mac80211 kvm_intel kvm cfg80211 irqbypass dell_rbtn
crct10dif_pclmul crc32_pclmul ssb crc32c_intel ghash_clmulni_intel dell_lap=
top
dell_wmi sparse_keymap iTCO_wdt rfkill dell_smbios pcmcia pcbc mei_wdt dcdb=
as
iTCO_vendor_support pcmcia_core dell_smm_hwmon snd_hda_intel aesni_intel
snd_hda_codec snd_hda_core snd_hwdep aes_x86_64 snd_pcm snd_seq crypto_simd
glue_helper cryptd pcspkr joydev snd_seq_device parport_pc bcma snd_timer p=
pdev
[  211.555287]  parport snd e1000e mei_me soundcore thermal ptp lpc_ich fjes
mei pps_core tpm_tis mfd_core tpm_tis_core battery i2c_i801 dell_smo8800 sh=
pchp
tpm ac nouveau serio_raw mxm_wmi i2c_algo_bit drm_kms_helper syscopyarea
sysfillrect sysimgblt fb_sys_fops sdhci_pci xhci_pci ttm sdhci ehci_pci
xhci_hcd ehci_hcd mmc_core drm usbcore wmi video button sg dm_multipath dm_=
mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua
[  211.555335] CPU: 0 PID: 2979 Comm: InputThread Tainted: G           O=20=
=20=20
4.10.5-1-default #1
[  211.555340] Hardware name: Dell Inc. Latitude E6530/07Y85M, BIOS A02
04/24/2012
[  211.555346] task: ffffa058dbf54000 task.stack: ffffae9d42530000
[  211.555353] RIP: 0010:dma_fence_wait_timeout+0x30/0x110
[  211.555357] RSP: 0018:ffffae9d42533ac0 EFLAGS: 00010206
[  211.555362] RAX: 0000000000000001 RBX: ffffa058d9759c00 RCX:
ffffffffc05a7fa0
[  211.555367] RDX: 7fffffffffffffff RSI: 0000000000000001 RDI:
ffffa058dc592c00
[  211.555372] RBP: ffffa058dc592c00 R08: 0000000000000004 R09:
ffffa058dc592c00
[  211.555377] R10: 00000000fb000000 R11: ffffae9d42533db8 R12:
0000000000000001
[  211.555381] R13: 7fffffffffffffff R14: 0000000000000001 R15:
0000000000000001
[  211.555405] FS:  00007f449b47d700(0000) GS:ffffa058edc00000(0000)
knlGS:0000000000000000
[  211.555427] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  211.555448] CR2: 0000000000000021 CR3: 0000000419549000 CR4:
00000000001406f0
[  211.555470] Call Trace:
[  211.555514]  drm_atomic_helper_wait_for_fences+0x48/0x130 [drm_kms_helpe=
r]
[  211.555607]  nv50_disp_atomic_commit+0x18e/0x290 [nouveau]
[  211.555643]  drm_atomic_helper_update_plane+0xeb/0x150 [drm_kms_helper]
[  211.555690]  __setplane_internal+0x1d9/0x2a0 [drm]
[  211.555718]  ? enqueue_entity+0x110/0x6d0
[  211.555754]  drm_mode_cursor_universal+0x10b/0x1e0 [drm]
[  211.555792]  drm_mode_cursor_common+0x80/0x170 [drm]
[  211.555829]  drm_mode_cursor_ioctl+0x44/0x50 [drm]
[  211.555866]  drm_ioctl+0x1ec/0x410 [drm]
[  211.555903]  ? drm_mode_setplane+0x1a0/0x1a0 [drm]
[  211.555980]  nouveau_drm_ioctl+0x66/0xc0 [nouveau]
[  211.556010]  do_vfs_ioctl+0x8f/0x5d0
[  211.556036]  ? __fget+0x70/0xc0
[  211.556058]  SyS_ioctl+0x74/0x80
[  211.556086]  entry_SYSCALL_64_fastpath+0x1e/0xad</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14912698611.7C041.28467--

--===============0657432043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0657432043==--
