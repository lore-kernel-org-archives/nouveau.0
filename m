From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82975] New: Regression: NULL pointer dereference in
 nouveau_fence_wait after upgrading to 10.2.6
Date: Fri, 22 Aug 2014 22:02:40 +0000
Message-ID: <bug-82975-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1631179668=="
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


--===============1631179668==
Content-Type: multipart/alternative; boundary="1408744960.3575CD01.25755"; charset="us-ascii"


--1408744960.3575CD01.25755
Date: Fri, 22 Aug 2014 22:02:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82975

          Priority: medium
            Bug ID: 82975
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Regression: NULL pointer dereference  in
                    nouveau_fence_wait after upgrading to 10.2.6
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: scott-SWQjiYvW4NkM/+EeWXf76Q@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 105126
  --> https://bugs.freedesktop.org/attachment.cgi?id=105126&action=edit
dmesg

After updating to 10.2.6 I have encountered the following twice in an 8 hour
period. I have not found any means of reproducing as of yet. This was under 2D
operation with firefox and a terminal emulator open, nothing more.

Kernel: 3.16
Xorg: 1.16
xf86-video-nouveau: 1.0.10
libdrm: 2.4.55
mesa: 10.2.5


[25635.210586] BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
[25635.212110] IP: [<ffffffffa012ed78>] nouveau_fence_wait_uevent+0x38/0x3f0
[nouveau]
[25635.213142] PGD 21f123067 PUD 222926067 PMD 0 
[25635.214184] Oops: 0000 [#1] PREEMPT SMP 
[25635.215222] Modules linked in: tun ext4 crc16 mbcache jbd2 uvcvideo arc4
coretemp iwldvm videobuf2_vmalloc videobuf2_memops videobuf2_core v4l2_common
videodev mac80211 iwlwifi media intel_powerclamp kvm_intel hid_generic joydev
kvm mousedev cfg80211 ppdev dell_laptop rfkill crct10dif_pclmul crc32_pclmul
iTCO_wdt iTCO_vendor_support pcmcia yenta_socket pcmcia_rsrc pcmcia_core
crc32c_intel ghash_clmulni_intel aesni_intel aes_x86_64 lrw gf128mul
glue_helper ablk_helper dell_wmi cryptd sparse_keymap snd_hda_codec_hdmi dcdbas
shpchp psmouse serio_raw microcode e1000e snd_hda_codec_idt
snd_hda_codec_generic parport_pc parport intel_ips ptp pps_core snd_hda_intel
snd_hda_controller snd_hda_codec evdev snd_hwdep snd_pcm dell_smo8800 snd_timer
snd soundcore mac_hid tpm_tis tpm battery ac acpi_cpufreq intel_agp
[25635.218707]  i2c_i801 intel_gtt lpc_ich processor vboxnetflt(O)
vboxnetadp(O) vboxdrv(O) usbhid hid jfs dm_mod sd_mod sr_mod crc_t10dif cdrom
crct10dif_common atkbd libps2 ahci libahci libata scsi_mod ehci_pci sdhci_pci
ehci_hcd sdhci firewire_ohci led_class firewire_core usbcore mmc_core crc_itu_t
usb_common i8042 serio nouveau button video mxm_wmi wmi i2c_algo_bit hwmon
drm_kms_helper ttm drm i2c_core
[25635.222492] CPU: 1 PID: 620 Comm: Xorg.bin Tainted: G           O 
3.16.1-1-ARCH #1
[25635.223809] Hardware name: Dell Inc. Latitude E6510/0N5KHN, BIOS A09
05/26/2011
[25635.225085] task: ffff8800cb1f7010 ti: ffff8802233d8000 task.ti:
ffff8802233d8000
[25635.226375] RIP: 0010:[<ffffffffa012ed78>]  [<ffffffffa012ed78>]
nouveau_fence_wait_uevent+0x38/0x3f0 [nouveau]
[25635.227670] RSP: 0018:ffff8802233dbc48  EFLAGS: 00010246
[25635.228957] RAX: 0000000000000000 RBX: ffff8800b51df100 RCX:
000000000000005d
[25635.230248] RDX: 0000000000000001 RSI: 0000000000000001 RDI:
ffff8800b51df100
[25635.231549] RBP: ffff8802233dbcb0 R08: 0000000000000202 R09:
ffff8802233dbc50
[25635.232841] R10: ffffffffa017bc40 R11: ffff8802233dbde8 R12:
ffff8800b51df100
[25635.234149] R13: 0000000000000001 R14: 0000000000000001 R15:
ffff88003783dd80
[25635.235449] FS:  00007f3f41bee8c0(0000) GS:ffff88022fc40000(0000)
knlGS:0000000000000000
[25635.236740] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[25635.238032] CR2: 0000000000000008 CR3: 000000021f037000 CR4:
00000000000007e0
[25635.239322] Stack:
[25635.240602]  00000000031178e0 0000000000000202 0000000000000000
000000000000005d
[25635.241888]  0000000000000001 0000000000000001 ffff8800b51df100
0000000025d2e153
[25635.243173]  ffff8800b51df100 0000000000000000 0000000000000001
0000000000000001
[25635.244456] Call Trace:
[25635.245746]  [<ffffffffa012f1a9>] nouveau_fence_wait+0x79/0x200 [nouveau]
[25635.247021]  [<ffffffffa0131175>] nouveau_bo_fence_wait+0x15/0x20 [nouveau]
[25635.248292]  [<ffffffffa0074a91>] ttm_bo_wait+0xb1/0x1c0 [ttm]
[25635.249572]  [<ffffffffa013629b>] nouveau_gem_ioctl_cpu_prep+0x5b/0x100
[nouveau]
[25635.250845]  [<ffffffffa0019b9f>] drm_ioctl+0x1df/0x680 [drm]
[25635.252130]  [<ffffffff811d79cf>] ? __d_free+0x3f/0x60
[25635.253414]  [<ffffffffa012c145>] nouveau_drm_ioctl+0x65/0xa0 [nouveau]
[25635.254676]  [<ffffffff811d4a70>] do_vfs_ioctl+0x2d0/0x4b0
[25635.255950]  [<ffffffff811c3d8e>] ? ____fput+0xe/0x10
[25635.257212]  [<ffffffff8108ec24>] ? task_work_run+0xa4/0xe0
[25635.258462]  [<ffffffff811d4cd1>] SyS_ioctl+0x81/0xa0
[25635.259705]  [<ffffffff81530be9>] system_call_fastpath+0x16/0x1b
[25635.260945] Code: 41 55 41 54 49 89 fc 53 4c 8d 4d a0 41 89 f6 be 01 00 00
00 48 83 ec 40 65 48 8b 04 25 28 00 00 00 48 89 45 d0 31 c0 48 8b 47 28 <48> 8b
48 08 48 8b 91 f0 00 00 00 4c 8b a9 68 07 00 00 48 c7 c1 
[25635.262274] RIP  [<ffffffffa012ed78>] nouveau_fence_wait_uevent+0x38/0x3f0
[nouveau]
[25635.263549]  RSP <ffff8802233dbc48>
[25635.264786] CR2: 0000000000000008
[25635.272244] ---[ end trace 410e979c45384bde ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408744960.3575CD01.25755
Date: Fri, 22 Aug 2014 22:02:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Regression: NULL pointer dereference in nouveau_fence_wait after upgrading to 10.2.6"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82975">82975</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Regression: NULL pointer dereference  in nouveau_fence_wait after upgrading to 10.2.6
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>scott&#64;chaos-dragon.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=105126" name="attach_105126" title="dmesg">attachment 105126</a> <a href="attachment.cgi?id=105126&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

After updating to 10.2.6 I have encountered the following twice in an 8 hour
period. I have not found any means of reproducing as of yet. This was under 2D
operation with firefox and a terminal emulator open, nothing more.

Kernel: 3.16
Xorg: 1.16
xf86-video-nouveau: 1.0.10
libdrm: 2.4.55
mesa: 10.2.5


[25635.210586] BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
[25635.212110] IP: [&lt;ffffffffa012ed78&gt;] nouveau_fence_wait_uevent+0x38/0x3f0
[nouveau]
[25635.213142] PGD 21f123067 PUD 222926067 PMD 0 
[25635.214184] Oops: 0000 [#1] PREEMPT SMP 
[25635.215222] Modules linked in: tun ext4 crc16 mbcache jbd2 uvcvideo arc4
coretemp iwldvm videobuf2_vmalloc videobuf2_memops videobuf2_core v4l2_common
videodev mac80211 iwlwifi media intel_powerclamp kvm_intel hid_generic joydev
kvm mousedev cfg80211 ppdev dell_laptop rfkill crct10dif_pclmul crc32_pclmul
iTCO_wdt iTCO_vendor_support pcmcia yenta_socket pcmcia_rsrc pcmcia_core
crc32c_intel ghash_clmulni_intel aesni_intel aes_x86_64 lrw gf128mul
glue_helper ablk_helper dell_wmi cryptd sparse_keymap snd_hda_codec_hdmi dcdbas
shpchp psmouse serio_raw microcode e1000e snd_hda_codec_idt
snd_hda_codec_generic parport_pc parport intel_ips ptp pps_core snd_hda_intel
snd_hda_controller snd_hda_codec evdev snd_hwdep snd_pcm dell_smo8800 snd_timer
snd soundcore mac_hid tpm_tis tpm battery ac acpi_cpufreq intel_agp
[25635.218707]  i2c_i801 intel_gtt lpc_ich processor vboxnetflt(O)
vboxnetadp(O) vboxdrv(O) usbhid hid jfs dm_mod sd_mod sr_mod crc_t10dif cdrom
crct10dif_common atkbd libps2 ahci libahci libata scsi_mod ehci_pci sdhci_pci
ehci_hcd sdhci firewire_ohci led_class firewire_core usbcore mmc_core crc_itu_t
usb_common i8042 serio nouveau button video mxm_wmi wmi i2c_algo_bit hwmon
drm_kms_helper ttm drm i2c_core
[25635.222492] CPU: 1 PID: 620 Comm: Xorg.bin Tainted: G           O 
3.16.1-1-ARCH #1
[25635.223809] Hardware name: Dell Inc. Latitude E6510/0N5KHN, BIOS A09
05/26/2011
[25635.225085] task: ffff8800cb1f7010 ti: ffff8802233d8000 task.ti:
ffff8802233d8000
[25635.226375] RIP: 0010:[&lt;ffffffffa012ed78&gt;]  [&lt;ffffffffa012ed78&gt;]
nouveau_fence_wait_uevent+0x38/0x3f0 [nouveau]
[25635.227670] RSP: 0018:ffff8802233dbc48  EFLAGS: 00010246
[25635.228957] RAX: 0000000000000000 RBX: ffff8800b51df100 RCX:
000000000000005d
[25635.230248] RDX: 0000000000000001 RSI: 0000000000000001 RDI:
ffff8800b51df100
[25635.231549] RBP: ffff8802233dbcb0 R08: 0000000000000202 R09:
ffff8802233dbc50
[25635.232841] R10: ffffffffa017bc40 R11: ffff8802233dbde8 R12:
ffff8800b51df100
[25635.234149] R13: 0000000000000001 R14: 0000000000000001 R15:
ffff88003783dd80
[25635.235449] FS:  00007f3f41bee8c0(0000) GS:ffff88022fc40000(0000)
knlGS:0000000000000000
[25635.236740] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[25635.238032] CR2: 0000000000000008 CR3: 000000021f037000 CR4:
00000000000007e0
[25635.239322] Stack:
[25635.240602]  00000000031178e0 0000000000000202 0000000000000000
000000000000005d
[25635.241888]  0000000000000001 0000000000000001 ffff8800b51df100
0000000025d2e153
[25635.243173]  ffff8800b51df100 0000000000000000 0000000000000001
0000000000000001
[25635.244456] Call Trace:
[25635.245746]  [&lt;ffffffffa012f1a9&gt;] nouveau_fence_wait+0x79/0x200 [nouveau]
[25635.247021]  [&lt;ffffffffa0131175&gt;] nouveau_bo_fence_wait+0x15/0x20 [nouveau]
[25635.248292]  [&lt;ffffffffa0074a91&gt;] ttm_bo_wait+0xb1/0x1c0 [ttm]
[25635.249572]  [&lt;ffffffffa013629b&gt;] nouveau_gem_ioctl_cpu_prep+0x5b/0x100
[nouveau]
[25635.250845]  [&lt;ffffffffa0019b9f&gt;] drm_ioctl+0x1df/0x680 [drm]
[25635.252130]  [&lt;ffffffff811d79cf&gt;] ? __d_free+0x3f/0x60
[25635.253414]  [&lt;ffffffffa012c145&gt;] nouveau_drm_ioctl+0x65/0xa0 [nouveau]
[25635.254676]  [&lt;ffffffff811d4a70&gt;] do_vfs_ioctl+0x2d0/0x4b0
[25635.255950]  [&lt;ffffffff811c3d8e&gt;] ? ____fput+0xe/0x10
[25635.257212]  [&lt;ffffffff8108ec24&gt;] ? task_work_run+0xa4/0xe0
[25635.258462]  [&lt;ffffffff811d4cd1&gt;] SyS_ioctl+0x81/0xa0
[25635.259705]  [&lt;ffffffff81530be9&gt;] system_call_fastpath+0x16/0x1b
[25635.260945] Code: 41 55 41 54 49 89 fc 53 4c 8d 4d a0 41 89 f6 be 01 00 00
00 48 83 ec 40 65 48 8b 04 25 28 00 00 00 48 89 45 d0 31 c0 48 8b 47 28 &lt;48&gt; 8b
48 08 48 8b 91 f0 00 00 00 4c 8b a9 68 07 00 00 48 c7 c1 
[25635.262274] RIP  [&lt;ffffffffa012ed78&gt;] nouveau_fence_wait_uevent+0x38/0x3f0
[nouveau]
[25635.263549]  RSP &lt;ffff8802233dbc48&gt;
[25635.264786] CR2: 0000000000000008
[25635.272244] ---[ end trace 410e979c45384bde ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408744960.3575CD01.25755--

--===============1631179668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1631179668==--
