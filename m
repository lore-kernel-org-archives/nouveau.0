From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90569] New: GUI freezes after startup of Ubuntu
 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at
 f84c8000]
Date: Thu, 21 May 2015 21:43:01 +0000
Message-ID: <bug-90569-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1000954760=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1000954760==
Content-Type: multipart/alternative; boundary="1432244581.bD17Db1.6368"; charset="UTF-8"


--1432244581.bD17Db1.6368
Date: Thu, 21 May 2015 21:43:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90569

            Bug ID: 90569
           Summary: GUI freezes after startup of Ubuntu 15.04. on Aspire
                    7520p [BUG: unable to handle kernel paging request at
                    f84c8000]
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jedet-Mmb7MZpHnFY@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115959
  --> https://bugs.freedesktop.org/attachment.cgi?id=115959&action=edit
System log file of 7 BUGs in nouveau

Problem description:
--------------------
GUI freezes. No user interaction (mouse, keyboard) possible. Only hard shutdown
possible.

System specifications:
----------------------
- Operating System: Ubuntu 15.04.
- Computer-Hardware: Acer Aspire 7520p
- Graphic-Card: Nvidia 7000m

Steps to reproduce:
-------------------
1. Start Ubuntu and log in
2. wait or accelerate the freeze by
2.1. starting firefox
2.2. starting a terminal

Why it looks like a nouveau bug?
--------------------------------
Well, I see something like the following in /var/log/systemlog each time, when
the GUI freezes. (I compared the seconds of the clock with the log-entries and
they match - always)
============================================================================
Apr 29 22:16:06 h kernel: [   78.633151] BUG: unable to handle kernel paging
request at f84c8000
Apr 29 22:16:06 h kernel: [   78.633265] IP: [<f8fb6be9>]
nouveau_bo_wr32+0x29/0x60 [nouveau]
Apr 29 22:16:06 h kernel: [   78.633430] *pdpt = 0000000001b79001 *pde =
0000000034c88067 *pte = 0000000000000000 
Apr 29 22:16:06 h kernel: [   78.633546] Oops: 0002 [#1] SMP 
Apr 29 22:16:06 h kernel: [   78.633596] Modules linked in: ctr ccm rfcomm bnep
snd_hda_codec_realtek snd_hda_codec_generic arc4 acer_wmi sparse_keymap
snd_hda_intel snd_hda_controller kvm_amd snd_hda_codec snd_hwdep kvm nouveau
ath5k ath snd_pcm mxm_wmi ttm mac80211 joydev serio_raw edac_core cfg80211
drm_kms_helper snd_seq_midi k8temp edac_mce_amd snd_seq_midi_event drm r852
sm_common nand nand_ecc nand_bch i2c_algo_bit bch shpchp nand_ids snd_rawmidi
mtd r592 memstick btusb snd_seq bluetooth snd_seq_device snd_timer snd
ir_lirc_codec lirc_dev ir_xmp_decoder soundcore ir_mce_kbd_decoder
ir_sharp_decoder ir_sanyo_decoder ir_sony_decoder ir_jvc_decoder ir_rc6_decoder
ir_rc5_decoder ir_nec_decoder rc_rc6_mce ene_ir rc_core mac_hid wmi video
i2c_nforce2 parport_pc ppdev lp parport autofs4 pata_acpi firewire_ohci
sdhci_pci psmouse forcedeth sdhci ahci firewire_core libahci crc_itu_t pata_amd
Apr 29 22:16:06 h kernel: [   78.634843] CPU: 1 PID: 777 Comm: Xorg Not tainted
3.19.0-15-generic #15-Ubuntu
Apr 29 22:16:06 h kernel: [   78.634942] Hardware name: Acer             Aspire
7520     /Fuquene, BIOS V1.30 12/31/2007
Apr 29 22:16:06 h kernel: [   78.635055] task: edd70000 ti: ec07e000 task.ti:
ec07e000
Apr 29 22:16:06 h kernel: [   78.635127] EIP: 0060:[<f8fb6be9>] EFLAGS:
00213246 CPU: 1
Apr 29 22:16:06 h kernel: [   78.635246] EIP is at nouveau_bo_wr32+0x29/0x60
[nouveau]
Apr 29 22:16:06 h kernel: [   78.635317] EAX: c0164400 EBX: 00000000 ECX:
00044130 EDX: f84c8000
Apr 29 22:16:06 h kernel: [   78.635399] ESI: f84b8000 EDI: 00000000 EBP:
ec07fd94 ESP: ec07fd8c
Apr 29 22:16:06 h kernel: [   78.635481]  DS: 007b ES: 007b FS: 00d8 GS: 00e0
SS: 0068
Apr 29 22:16:06 h kernel: [   78.635552] CR0: 8005003b CR2: f84c8000 CR3:
32fa1000 CR4: 000007f0
Apr 29 22:16:06 h kernel: [   78.635633] Stack:
Apr 29 22:16:06 h kernel: [   78.635661]  f4231044 c0168000 ec07fdfc f8fc398b
00000001 00000000 a0ee6df4 ec161800
Apr 29 22:16:06 h kernel: [   78.635783]  01b20000 00000000 00000000 00000000
00000020 00000000 f4c01d01 edd9cf80
Apr 29 22:16:06 h kernel: [   78.635904]  ee280000 e94ce400 f22cd800 f4232000
c0168000 edd9cb40 ec161800 e784ac00
Apr 29 22:16:06 h kernel: [   78.636025] Call Trace:
Apr 29 22:16:06 h kernel: [   78.636109]  [<f8fc398b>]
nouveau_crtc_page_flip+0x34b/0x780 [nouveau]
Apr 29 22:16:06 h kernel: [   78.636225]  [<f8a95328>]
drm_mode_page_flip_ioctl+0x198/0x300 [drm]
Apr 29 22:16:06 h kernel: [   78.636328]  [<f8a95190>] ?
drm_mode_gamma_get_ioctl+0xd0/0xd0 [drm]
Apr 29 22:16:06 h kernel: [   78.636425]  [<f8a861a5>] drm_ioctl+0x1f5/0x560
[drm]
Apr 29 22:16:06 h kernel: [   78.636425]  [<c11bf66f>] ?
core_sys_select+0x18f/0x270
Apr 29 22:16:06 h kernel: [   78.636425]  [<f8a95190>] ?
drm_mode_gamma_get_ioctl+0xd0/0xd0 [drm]
Apr 29 22:16:06 h kernel: [   78.636425]  [<c1348798>] ?
timerqueue_add+0x58/0xc0
Apr 29 22:16:06 h kernel: [   78.636425]  [<c147b071>] ?
__pm_runtime_resume+0x51/0x70
Apr 29 22:16:06 h kernel: [   78.636425]  [<f8faf7cb>]
nouveau_drm_ioctl+0x5b/0xb0 [nouveau]
Apr 29 22:16:06 h kernel: [   78.636425]  [<f8faf770>] ?
nouveau_pmops_thaw+0x20/0x20 [nouveau]
Apr 29 22:16:06 h kernel: [   78.636425]  [<c11bdf72>] do_vfs_ioctl+0x322/0x550
Apr 29 22:16:06 h kernel: [   78.636425]  [<c10c1247>] ?
hrtimer_start+0x27/0x30
Apr 29 22:16:06 h kernel: [   78.636425]  [<c10c277b>] ?
do_setitimer+0x26b/0x270
Apr 29 22:16:06 h kernel: [   78.636425]  [<c10c288b>] ?
SyS_setitimer+0xab/0xe0
Apr 29 22:16:06 h kernel: [   78.636425]  [<c11bf7ea>] ? SyS_select+0x9a/0xd0
Apr 29 22:16:06 h kernel: [   78.636425]  [<c11be200>] SyS_ioctl+0x60/0x90
Apr 29 22:16:06 h kernel: [   78.636425]  [<c16ef5df>]
sysenter_do_call+0x12/0x12
Apr 29 22:16:06 h kernel: [   78.636425] Code: 00 00 55 89 e5 56 53 3e 8d 74 26
00 8b 98 84 01 00 00 8b b0 7c 01 00 00 c1 e2 02 81 e3 80 00 00 00 85 f6 74 1d
01 f2 85 db 75 07 <89> 0a 5b 5e 5d c3 90 89 c8 e8 79 e8 39 c8 5b 5e 5d c3 90 8d
74
Apr 29 22:16:06 h kernel: [   78.674768] EIP: [<f8fb6be9>]
nouveau_bo_wr32+0x29/0x60 [nouveau] SS:ESP 0068:ec07fd8c
Apr 29 22:16:06 h kernel: [   78.674768] CR2: 00000000f84c8000
Apr 29 22:16:06 h kernel: [   78.674768] ---[ end trace a915c30442145198 ]---
============================================================================
For more examples please look into the attached file (namely 'syslog_1').

I think I don't have to explain that the system is pretty unusable, because the
freeze happens about 1-5 minutes after the log in.

If you need any help or have questions - please ask :)

Best regards
Jedet

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432244581.bD17Db1.6368
Date: Thu, 21 May 2015 21:43:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GUI freezes after startup of Ubuntu 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90569">90569</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GUI freezes after startup of Ubuntu 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at f84c8000]
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
          <td>x86 (IA32)
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
          <td>blocker
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
          <td>jedet&#64;gmx.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115959" name="attach_115959" title="System log file of 7 BUGs in nouveau">attachment 115959</a> <a href="attachment.cgi?id=115959&amp;action=edit" title="System log file of 7 BUGs in nouveau">[details]</a></span>
System log file of 7 BUGs in nouveau

Problem description:
--------------------
GUI freezes. No user interaction (mouse, keyboard) possible. Only hard shutdown
possible.

System specifications:
----------------------
- Operating System: Ubuntu 15.04.
- Computer-Hardware: Acer Aspire 7520p
- Graphic-Card: Nvidia 7000m

Steps to reproduce:
-------------------
1. Start Ubuntu and log in
2. wait or accelerate the freeze by
2.1. starting firefox
2.2. starting a terminal

Why it looks like a nouveau bug?
--------------------------------
Well, I see something like the following in /var/log/systemlog each time, when
the GUI freezes. (I compared the seconds of the clock with the log-entries and
they match - always)
============================================================================
Apr 29 22:16:06 h kernel: [   78.633151] BUG: unable to handle kernel paging
request at f84c8000
Apr 29 22:16:06 h kernel: [   78.633265] IP: [&lt;f8fb6be9&gt;]
nouveau_bo_wr32+0x29/0x60 [nouveau]
Apr 29 22:16:06 h kernel: [   78.633430] *pdpt = 0000000001b79001 *pde =
0000000034c88067 *pte = 0000000000000000 
Apr 29 22:16:06 h kernel: [   78.633546] Oops: 0002 [#1] SMP 
Apr 29 22:16:06 h kernel: [   78.633596] Modules linked in: ctr ccm rfcomm bnep
snd_hda_codec_realtek snd_hda_codec_generic arc4 acer_wmi sparse_keymap
snd_hda_intel snd_hda_controller kvm_amd snd_hda_codec snd_hwdep kvm nouveau
ath5k ath snd_pcm mxm_wmi ttm mac80211 joydev serio_raw edac_core cfg80211
drm_kms_helper snd_seq_midi k8temp edac_mce_amd snd_seq_midi_event drm r852
sm_common nand nand_ecc nand_bch i2c_algo_bit bch shpchp nand_ids snd_rawmidi
mtd r592 memstick btusb snd_seq bluetooth snd_seq_device snd_timer snd
ir_lirc_codec lirc_dev ir_xmp_decoder soundcore ir_mce_kbd_decoder
ir_sharp_decoder ir_sanyo_decoder ir_sony_decoder ir_jvc_decoder ir_rc6_decoder
ir_rc5_decoder ir_nec_decoder rc_rc6_mce ene_ir rc_core mac_hid wmi video
i2c_nforce2 parport_pc ppdev lp parport autofs4 pata_acpi firewire_ohci
sdhci_pci psmouse forcedeth sdhci ahci firewire_core libahci crc_itu_t pata_amd
Apr 29 22:16:06 h kernel: [   78.634843] CPU: 1 PID: 777 Comm: Xorg Not tainted
3.19.0-15-generic #15-Ubuntu
Apr 29 22:16:06 h kernel: [   78.634942] Hardware name: Acer             Aspire
7520     /Fuquene, BIOS V1.30 12/31/2007
Apr 29 22:16:06 h kernel: [   78.635055] task: edd70000 ti: ec07e000 task.ti:
ec07e000
Apr 29 22:16:06 h kernel: [   78.635127] EIP: 0060:[&lt;f8fb6be9&gt;] EFLAGS:
00213246 CPU: 1
Apr 29 22:16:06 h kernel: [   78.635246] EIP is at nouveau_bo_wr32+0x29/0x60
[nouveau]
Apr 29 22:16:06 h kernel: [   78.635317] EAX: c0164400 EBX: 00000000 ECX:
00044130 EDX: f84c8000
Apr 29 22:16:06 h kernel: [   78.635399] ESI: f84b8000 EDI: 00000000 EBP:
ec07fd94 ESP: ec07fd8c
Apr 29 22:16:06 h kernel: [   78.635481]  DS: 007b ES: 007b FS: 00d8 GS: 00e0
SS: 0068
Apr 29 22:16:06 h kernel: [   78.635552] CR0: 8005003b CR2: f84c8000 CR3:
32fa1000 CR4: 000007f0
Apr 29 22:16:06 h kernel: [   78.635633] Stack:
Apr 29 22:16:06 h kernel: [   78.635661]  f4231044 c0168000 ec07fdfc f8fc398b
00000001 00000000 a0ee6df4 ec161800
Apr 29 22:16:06 h kernel: [   78.635783]  01b20000 00000000 00000000 00000000
00000020 00000000 f4c01d01 edd9cf80
Apr 29 22:16:06 h kernel: [   78.635904]  ee280000 e94ce400 f22cd800 f4232000
c0168000 edd9cb40 ec161800 e784ac00
Apr 29 22:16:06 h kernel: [   78.636025] Call Trace:
Apr 29 22:16:06 h kernel: [   78.636109]  [&lt;f8fc398b&gt;]
nouveau_crtc_page_flip+0x34b/0x780 [nouveau]
Apr 29 22:16:06 h kernel: [   78.636225]  [&lt;f8a95328&gt;]
drm_mode_page_flip_ioctl+0x198/0x300 [drm]
Apr 29 22:16:06 h kernel: [   78.636328]  [&lt;f8a95190&gt;] ?
drm_mode_gamma_get_ioctl+0xd0/0xd0 [drm]
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;f8a861a5&gt;] drm_ioctl+0x1f5/0x560
[drm]
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;c11bf66f&gt;] ?
core_sys_select+0x18f/0x270
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;f8a95190&gt;] ?
drm_mode_gamma_get_ioctl+0xd0/0xd0 [drm]
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;c1348798&gt;] ?
timerqueue_add+0x58/0xc0
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;c147b071&gt;] ?
__pm_runtime_resume+0x51/0x70
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;f8faf7cb&gt;]
nouveau_drm_ioctl+0x5b/0xb0 [nouveau]
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;f8faf770&gt;] ?
nouveau_pmops_thaw+0x20/0x20 [nouveau]
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;c11bdf72&gt;] do_vfs_ioctl+0x322/0x550
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;c10c1247&gt;] ?
hrtimer_start+0x27/0x30
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;c10c277b&gt;] ?
do_setitimer+0x26b/0x270
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;c10c288b&gt;] ?
SyS_setitimer+0xab/0xe0
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;c11bf7ea&gt;] ? SyS_select+0x9a/0xd0
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;c11be200&gt;] SyS_ioctl+0x60/0x90
Apr 29 22:16:06 h kernel: [   78.636425]  [&lt;c16ef5df&gt;]
sysenter_do_call+0x12/0x12
Apr 29 22:16:06 h kernel: [   78.636425] Code: 00 00 55 89 e5 56 53 3e 8d 74 26
00 8b 98 84 01 00 00 8b b0 7c 01 00 00 c1 e2 02 81 e3 80 00 00 00 85 f6 74 1d
01 f2 85 db 75 07 &lt;89&gt; 0a 5b 5e 5d c3 90 89 c8 e8 79 e8 39 c8 5b 5e 5d c3 90 8d
74
Apr 29 22:16:06 h kernel: [   78.674768] EIP: [&lt;f8fb6be9&gt;]
nouveau_bo_wr32+0x29/0x60 [nouveau] SS:ESP 0068:ec07fd8c
Apr 29 22:16:06 h kernel: [   78.674768] CR2: 00000000f84c8000
Apr 29 22:16:06 h kernel: [   78.674768] ---[ end trace a915c30442145198 ]---
============================================================================
For more examples please look into the attached file (namely 'syslog_1').

I think I don't have to explain that the system is pretty unusable, because the
freeze happens about 1-5 minutes after the log in.

If you need any help or have questions - please ask :)

Best regards
Jedet</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432244581.bD17Db1.6368--

--===============1000954760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1000954760==--
