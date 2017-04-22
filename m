From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100758] New: Kernel Oops when starting X
	nv50_dma_push
Date: Sat, 22 Apr 2017 14:58:04 +0000
Message-ID: <bug-100758-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0196358756=="
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


--===============0196358756==
Content-Type: multipart/alternative; boundary="14928730841.d0CC945.6316";
 charset="UTF-8"


--14928730841.d0CC945.6316
Date: Sat, 22 Apr 2017 14:58:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100758

            Bug ID: 100758
           Summary: Kernel Oops when starting X nv50_dma_push
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kjwinchester-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 130981
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130981&action=3Dedit
Complete boot log

Apr 22 11:38:11 karpov kernel: BUG: unable to handle kernel paging request =
at
00000000ffffffff
Apr 22 11:38:11 karpov kernel: IP: kmem_cache_alloc_trace+0x78/0x1b0
Apr 22 11:38:11 karpov kernel: PGD 1ac726067
Apr 22 11:38:12 karpov kernel: PUD 0
Apr 22 11:38:12 karpov kernel:
Apr 22 11:38:12 karpov kernel: Oops: 0000 [#1] PREEMPT SMP
Apr 22 11:38:12 karpov kernel: Modules linked in: ax25 arc4 snd_hda_codec_h=
dmi
brcmsmac cordic brcmutil b43 mac80211 intel_powerclamp cfg80211 coretemp ssb
kvm_intel snd_hda_codec_idt rng_core pcmcia snd_hda_codec_generic pcmcia_co=
re
uvcvideo kvm snd_hda_intel irqb
ypass videobuf2_vmalloc iTCO_wdt videobuf2_memops iTCO_vendor_support
videobuf2_v4l2 i7core_edac snd_hda_codec videobuf2_core ir_lirc_codec r8169
edac_core crc32c_intel lirc_dev psmouse ir_rc6_decoder hp_wmi input_leds
sparse_keymap mii snd_hda_core snd_hwdep rfkil
l snd_pcm videodev snd_timer snd pcspkr joydev intel_cstate bcma rc_rc6_mce
i2c_i801 mousedev media jmb38x_ms memstick fjes soundcore lpc_ich acpi_cpuf=
req
shpchp ene_ir tpm_tis tpm_tis_core ac tpm rc_core battery thermal evdev
hp_accel lis3lv02d input_polldev mac_h
id sch_fq_codel ip_tables x_tables
Apr 22 11:38:12 karpov kernel:  hid_generic ext4 crc16 jbd2 fscrypto usbhid
mbcache hid sr_mod cdrom sd_mod ahci libahci sdhci_pci ehci_pci serio_raw
libata sdhci ehci_hcd atkbd libps2 firewire_ohci scsi_mod firewire_core usb=
core
mmc_core crc_itu_t usb_common i8042
 serio nouveau button video led_class mxm_wmi wmi i2c_algo_bit drm_kms_help=
er
syscopyarea sysfillrect sysimgblt fb_sys_fops ttm drm
Apr 22 11:38:12 karpov kernel: CPU: 3 PID: 593 Comm: Xorg Not tainted
4.10.11-1-ARCH #1
Apr 22 11:38:12 karpov kernel: Hardware name: Hewlett-Packard HP Pavilion d=
v7
Notebook PC/365C, BIOS F.1D 10/05/2010
Apr 22 11:38:12 karpov kernel: task: ffff8801b7f8b400 task.stack:
ffffc900015b4000
Apr 22 11:38:12 karpov kernel: RIP: 0010:kmem_cache_alloc_trace+0x78/0x1b0
Apr 22 11:38:12 karpov kernel: RSP: 0018:ffffc900015b7b98 EFLAGS: 00010206
Apr 22 11:38:12 karpov kernel: RAX: 0000000000000000 RBX: ffff8801b7087400 =
RCX:
000000000002d783
Apr 22 11:38:12 karpov kernel: RDX: 000000000002d703 RSI: 000000000002d703 =
RDI:
000000000001b660
Apr 22 11:38:12 karpov kernel: RBP: ffffc900015b7bd0 R08: 00000000ffffffff =
R09:
ffffffffa01d4c0f
Apr 22 11:38:12 karpov kernel: R10: 0000000000000000 R11: 0000000000000000 =
R12:
00000000014080c0
Apr 22 11:38:12 karpov kernel: R13: ffff8801b9003540 R14: ffff8801b7087400 =
R15:
ffff8801b9003540
Apr 22 11:38:12 karpov kernel: FS:  00007f3a101b9940(0000)
GS:ffff8801bfcc0000(0000) knlGS:0000000000000000
Apr 22 11:38:12 karpov kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Apr 22 11:38:12 karpov kernel: CR2: 00000000ffffffff CR3: 00000001aa1e1000 =
CR4:
00000000000006e0
Apr 22 11:38:12 karpov kernel: Call Trace:
Apr 22 11:38:12 karpov kernel:  nouveau_fence_new+0x4f/0xb0 [nouveau]
Apr 22 11:38:12 karpov kernel:  ? nv50_dma_push+0xc4/0x100 [nouveau]
Apr 22 11:38:12 karpov kernel:  nouveau_gem_ioctl_pushbuf+0xe7e/0x1610
[nouveau]
Apr 22 11:38:12 karpov kernel:  drm_ioctl+0x21b/0x4c0 [drm]
Apr 22 11:38:12 karpov kernel:  ? ___sys_recvmsg+0x160/0x1f0
Apr 22 11:38:12 karpov kernel:  ? nouveau_gem_ioctl_new+0x150/0x150 [nouvea=
u]
Apr 22 11:38:12 karpov kernel:  ? do_readv_writev+0x151/0x240
Apr 22 11:38:12 karpov kernel:  nouveau_drm_ioctl+0x74/0xc0 [nouveau]
Apr 22 11:38:12 karpov kernel:  do_vfs_ioctl+0xa3/0x5f0
Apr 22 11:38:12 karpov kernel:  ? __fget+0x77/0xb0
Apr 22 11:38:12 karpov kernel:  SyS_ioctl+0x79/0x90
Apr 22 11:38:12 karpov kernel:  entry_SYSCALL_64_fastpath+0x1a/0xa9
Apr 22 11:38:12 karpov kernel: RIP: 0033:0x7f3a0e00f0d7
Apr 22 11:38:12 karpov kernel: RSP: 002b:00007ffc7aeb7728 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
Apr 22 11:38:12 karpov kernel: RAX: ffffffffffffffda RBX: 0000000002627330 =
RCX:
00007f3a0e00f0d7
Apr 22 11:38:12 karpov kernel: RDX: 00007ffc7aeb7790 RSI: 00000000c0406481 =
RDI:
000000000000000b
Apr 22 11:38:12 karpov kernel: RBP: 00007ffc7aeb7460 R08: 0000000000000000 =
R09:
000000000000001c
Apr 22 11:38:12 karpov kernel: R10: 000000000265d820 R11: 0000000000000246 =
R12:
0000000040086409
Apr 22 11:38:12 karpov kernel: R13: 000000000000000b R14: 0000000002bc5ff0 =
R15:
00000000026331e0
Apr 22 11:38:12 karpov kernel: Code: 48 39 f2 75 e7 48 83 78 10 00 4c 8b 00=
 0f
84 02 01 00 00 4d 85 c0 0f 84 f9 00 00 00 49 63 45 20 49 8b 7d 00 48 8d 8a =
80
00 00 00 <49> 8b 1c 00 4c 89 c0 65 48 0f c7 0f 0f 94 c0 84 c0 74 aa 49 63
Apr 22 11:38:12 karpov kernel: RIP: kmem_cache_alloc_trace+0x78/0x1b0 RSP:
ffffc900015b7b98
Apr 22 11:38:12 karpov kernel: CR2: 00000000ffffffff
Apr 22 11:38:13 karpov kernel: ---[ end trace 153927933e455cb4 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14928730841.d0CC945.6316
Date: Sat, 22 Apr 2017 14:58:04 +0000
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
   title=3D"NEW - Kernel Oops when starting X nv50_dma_push"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100758">100758</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel Oops when starting X nv50_dma_push
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
          <th>Severity</th>
          <td>normal
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
          <td>kjwinchester&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130981=
" name=3D"attach_130981" title=3D"Complete boot log">attachment 130981</a> =
<a href=3D"attachment.cgi?id=3D130981&amp;action=3Dedit" title=3D"Complete =
boot log">[details]</a></span>
Complete boot log

Apr 22 11:38:11 karpov kernel: BUG: unable to handle kernel paging request =
at
00000000ffffffff
Apr 22 11:38:11 karpov kernel: IP: kmem_cache_alloc_trace+0x78/0x1b0
Apr 22 11:38:11 karpov kernel: PGD 1ac726067
Apr 22 11:38:12 karpov kernel: PUD 0
Apr 22 11:38:12 karpov kernel:
Apr 22 11:38:12 karpov kernel: Oops: 0000 [#1] PREEMPT SMP
Apr 22 11:38:12 karpov kernel: Modules linked in: ax25 arc4 snd_hda_codec_h=
dmi
brcmsmac cordic brcmutil b43 mac80211 intel_powerclamp cfg80211 coretemp ssb
kvm_intel snd_hda_codec_idt rng_core pcmcia snd_hda_codec_generic pcmcia_co=
re
uvcvideo kvm snd_hda_intel irqb
ypass videobuf2_vmalloc iTCO_wdt videobuf2_memops iTCO_vendor_support
videobuf2_v4l2 i7core_edac snd_hda_codec videobuf2_core ir_lirc_codec r8169
edac_core crc32c_intel lirc_dev psmouse ir_rc6_decoder hp_wmi input_leds
sparse_keymap mii snd_hda_core snd_hwdep rfkil
l snd_pcm videodev snd_timer snd pcspkr joydev intel_cstate bcma rc_rc6_mce
i2c_i801 mousedev media jmb38x_ms memstick fjes soundcore lpc_ich acpi_cpuf=
req
shpchp ene_ir tpm_tis tpm_tis_core ac tpm rc_core battery thermal evdev
hp_accel lis3lv02d input_polldev mac_h
id sch_fq_codel ip_tables x_tables
Apr 22 11:38:12 karpov kernel:  hid_generic ext4 crc16 jbd2 fscrypto usbhid
mbcache hid sr_mod cdrom sd_mod ahci libahci sdhci_pci ehci_pci serio_raw
libata sdhci ehci_hcd atkbd libps2 firewire_ohci scsi_mod firewire_core usb=
core
mmc_core crc_itu_t usb_common i8042
 serio nouveau button video led_class mxm_wmi wmi i2c_algo_bit drm_kms_help=
er
syscopyarea sysfillrect sysimgblt fb_sys_fops ttm drm
Apr 22 11:38:12 karpov kernel: CPU: 3 PID: 593 Comm: Xorg Not tainted
4.10.11-1-ARCH #1
Apr 22 11:38:12 karpov kernel: Hardware name: Hewlett-Packard HP Pavilion d=
v7
Notebook PC/365C, BIOS F.1D 10/05/2010
Apr 22 11:38:12 karpov kernel: task: ffff8801b7f8b400 task.stack:
ffffc900015b4000
Apr 22 11:38:12 karpov kernel: RIP: 0010:kmem_cache_alloc_trace+0x78/0x1b0
Apr 22 11:38:12 karpov kernel: RSP: 0018:ffffc900015b7b98 EFLAGS: 00010206
Apr 22 11:38:12 karpov kernel: RAX: 0000000000000000 RBX: ffff8801b7087400 =
RCX:
000000000002d783
Apr 22 11:38:12 karpov kernel: RDX: 000000000002d703 RSI: 000000000002d703 =
RDI:
000000000001b660
Apr 22 11:38:12 karpov kernel: RBP: ffffc900015b7bd0 R08: 00000000ffffffff =
R09:
ffffffffa01d4c0f
Apr 22 11:38:12 karpov kernel: R10: 0000000000000000 R11: 0000000000000000 =
R12:
00000000014080c0
Apr 22 11:38:12 karpov kernel: R13: ffff8801b9003540 R14: ffff8801b7087400 =
R15:
ffff8801b9003540
Apr 22 11:38:12 karpov kernel: FS:  00007f3a101b9940(0000)
GS:ffff8801bfcc0000(0000) knlGS:0000000000000000
Apr 22 11:38:12 karpov kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Apr 22 11:38:12 karpov kernel: CR2: 00000000ffffffff CR3: 00000001aa1e1000 =
CR4:
00000000000006e0
Apr 22 11:38:12 karpov kernel: Call Trace:
Apr 22 11:38:12 karpov kernel:  nouveau_fence_new+0x4f/0xb0 [nouveau]
Apr 22 11:38:12 karpov kernel:  ? nv50_dma_push+0xc4/0x100 [nouveau]
Apr 22 11:38:12 karpov kernel:  nouveau_gem_ioctl_pushbuf+0xe7e/0x1610
[nouveau]
Apr 22 11:38:12 karpov kernel:  drm_ioctl+0x21b/0x4c0 [drm]
Apr 22 11:38:12 karpov kernel:  ? ___sys_recvmsg+0x160/0x1f0
Apr 22 11:38:12 karpov kernel:  ? nouveau_gem_ioctl_new+0x150/0x150 [nouvea=
u]
Apr 22 11:38:12 karpov kernel:  ? do_readv_writev+0x151/0x240
Apr 22 11:38:12 karpov kernel:  nouveau_drm_ioctl+0x74/0xc0 [nouveau]
Apr 22 11:38:12 karpov kernel:  do_vfs_ioctl+0xa3/0x5f0
Apr 22 11:38:12 karpov kernel:  ? __fget+0x77/0xb0
Apr 22 11:38:12 karpov kernel:  SyS_ioctl+0x79/0x90
Apr 22 11:38:12 karpov kernel:  entry_SYSCALL_64_fastpath+0x1a/0xa9
Apr 22 11:38:12 karpov kernel: RIP: 0033:0x7f3a0e00f0d7
Apr 22 11:38:12 karpov kernel: RSP: 002b:00007ffc7aeb7728 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
Apr 22 11:38:12 karpov kernel: RAX: ffffffffffffffda RBX: 0000000002627330 =
RCX:
00007f3a0e00f0d7
Apr 22 11:38:12 karpov kernel: RDX: 00007ffc7aeb7790 RSI: 00000000c0406481 =
RDI:
000000000000000b
Apr 22 11:38:12 karpov kernel: RBP: 00007ffc7aeb7460 R08: 0000000000000000 =
R09:
000000000000001c
Apr 22 11:38:12 karpov kernel: R10: 000000000265d820 R11: 0000000000000246 =
R12:
0000000040086409
Apr 22 11:38:12 karpov kernel: R13: 000000000000000b R14: 0000000002bc5ff0 =
R15:
00000000026331e0
Apr 22 11:38:12 karpov kernel: Code: 48 39 f2 75 e7 48 83 78 10 00 4c 8b 00=
 0f
84 02 01 00 00 4d 85 c0 0f 84 f9 00 00 00 49 63 45 20 49 8b 7d 00 48 8d 8a =
80
00 00 00 &lt;49&gt; 8b 1c 00 4c 89 c0 65 48 0f c7 0f 0f 94 c0 84 c0 74 aa 4=
9 63
Apr 22 11:38:12 karpov kernel: RIP: kmem_cache_alloc_trace+0x78/0x1b0 RSP:
ffffc900015b7b98
Apr 22 11:38:12 karpov kernel: CR2: 00000000ffffffff
Apr 22 11:38:13 karpov kernel: ---[ end trace 153927933e455cb4 ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14928730841.d0CC945.6316--

--===============0196358756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0196358756==--
