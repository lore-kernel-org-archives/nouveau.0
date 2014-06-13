From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79971] New: 3.15.0-11819-gc1fdb2d: oops
Date: Fri, 13 Jun 2014 08:20:26 +0000
Message-ID: <bug-79971-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0835726199=="
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


--===============0835726199==
Content-Type: multipart/alternative; boundary="1402647626.EE42d11.7188"; charset="us-ascii"


--1402647626.EE42d11.7188
Date: Fri, 13 Jun 2014 08:20:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79971

          Priority: medium
            Bug ID: 79971
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: 3.15.0-11819-gc1fdb2d: oops
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: arekm-evZBlRFTdvA@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Tried to upgrade to current linux git but it crashes. My primary GPU is intel.
nouveau is just sleeping.

The problem appeared after recent drm merge from 1-2 day ago.

(on working kernel) $ cat /sys/kernel/debug/vgaswitcheroo/switch 
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynOff:0000:02:00.0

[   10.278052] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[   10.282075] nouveau  [   VBIOS][0000:02:00.0] using image from ACPI
[   10.286261] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[   10.290288] nouveau  [   VBIOS][0000:02:00.0] version 80.07.b3.00.10
[   10.294580] nouveau  [ DEVINIT][0000:02:00.0] adaptor not initialised
[   10.298610] nouveau  [   VBIOS][0000:02:00.0] running init tables
[   10.459281] nouveau 0000:02:00.0: irq 53 for MSI/MSI-X
[   10.459290] nouveau  [     PMC][0000:02:00.0] MSI interrupts enabled
[   10.463323] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[   10.467278] nouveau  [     PFB][0000:02:00.0] RAM size: 2048 MiB
[   10.471193] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[   10.477213] nouveau  [    VOLT][0000:02:00.0] GPU voltage: 600000uv
[   10.513107] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / external
[   10.516957] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[   10.520763] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[   10.524561] nouveau  [     CLK][0000:02:00.0] 07: core 405 MHz memory 810
MHz 
[   10.528366] nouveau  [     CLK][0000:02:00.0] 0a: core 405-1058 MHz memory
1600 MHz 
[   10.532164] nouveau  [     CLK][0000:02:00.0] 0f: core 405-1058 MHz memory
5000 MHz 
[   10.536022] nouveau  [     CLK][0000:02:00.0] --: core 405 MHz memory 810
MHz 
[   10.577969] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[   10.577999] Oops: 0000 [#1] PREEMPT SMP 
[   10.578021] Modules linked in: arc4 joydev iTCO_wdt iTCO_vendor_support
hid_multitouch ext2 ecb mbcache dell_wmi sparse_keymap iwlmvm mac80211
dell_laptop dcdbas intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp
crc32_pclmul ghash_clmulni_intel psmouse microcode serio_raw pcspkr uvcvideo
iwlwifi btusb videobuf2_vmalloc i2c_i801 nouveau(+) bluetooth videobuf2_memops
videobuf2_core cfg80211 v4l2_common 6lowpan_iphc videodev crc16 lpc_ich mxm_wmi
binfmt_misc rfkill usbhid ttm media mfd_core shpchp thermal fan int3403_thermal
snd_hda_codec_realtek snd_hda_codec_hdmi battery ac snd_hda_codec_generic wmi
dell_smo8800 evdev snd_hda_intel snd_hda_controller snd_hda_codec snd_hwdep
snd_pcm snd_timer snd soundcore cpufreq_stats acpi_cpufreq processor vhost_net
tun vhost macvtap macvlan tcp_illinois
[   10.578030]  kvm_intel kvm ipv6 autofs4 efivarfs xfs(E) libcrc32c(E)
crc32c_generic(E) crc32c_intel(E) aesni_intel(E) lrw(E) gf128mul(E)
glue_helper(E) ablk_helper(E) cryptd(E) aes_x86_64(E) dm_crypt(E) dm_mod(E)
sd_mod(E) crc_t10dif(E) crct10dif_generic(E) crct10dif_pclmul(E)
crct10dif_common(E) ahci(E) libahci(E) libata(E) scsi_mod(E) hid_logitech_dj(E)
hid(E) xhci_hcd(E) ehci_pci(E) ehci_hcd(E) usbcore(E) usb_common(E)
[   10.578033] CPU: 1 PID: 4066 Comm: systemd-udevd Tainted: G            E
3.15.0-11819-gc1fdb2d #660
[   10.578033] Hardware name: Dell Inc. XPS 15 9530/XPS 15 9530, BIOS A05
04/16/2014
[   10.578034] task: ffff880417299850 ti: ffff8804141c8000 task.ti:
ffff8804141c8000
[   10.578067] RIP: 0010:[<ffffffffa06c532c>]  [<ffffffffa06c532c>]
_nouveau_disp_dtor+0x26/0x65 [nouveau]
[   10.578068] RSP: 0018:ffff8804141cb8f8  EFLAGS: 00010246
[   10.578069] RAX: 0000000000000000 RBX: ffff880416b84200 RCX:
ffff8804141cb8f0
[   10.578069] RDX: ffffffffffffffe0 RSI: ffff88041768b000 RDI:
0000000000000000
[   10.578070] RBP: ffff8804141cb910 R08: ffff88042e403600 R09:
ffff8804141cb8f0
[   10.578070] R10: 0000000000000020 R11: ffffffffa06854c1 R12:
ffffffffa0750c30
[   10.578070] R13: ffff880416b87d68 R14: ffffffffa0750c80 R15:
ffff88041768b000
[   10.578071] FS:  00007fdcda17a880(0000) GS:ffff88042ea40000(0000)
knlGS:0000000000000000
[   10.578072] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.578073] CR2: 0000000000000000 CR3: 00000004168a9000 CR4:
00000000001407e0
[   10.578073] Stack:
[   10.578074]  ffffffffffffffe0 00000000ffffffed ffffffffa0750c30
ffff8804141cb950
[   10.578075]  ffffffffa0685322 ffff880416b84200 ffff88041768b000
0000000000000023
[   10.578076]  000000000000002d ffff88041768b110 0000000000000021
ffff8804141cb9b8
[   10.578076] Call Trace:
[   10.578099]  [<ffffffffa0685322>] nouveau_object_ctor+0x68/0xa5 [nouveau]
[   10.578126]  [<ffffffffa06c1f0c>] nouveau_devobj_ctor+0x521/0x5b4 [nouveau]
[   10.578146]  [<ffffffffa06852e5>] nouveau_object_ctor+0x2b/0xa5 [nouveau]
[   10.578167]  [<ffffffffa0685a1c>] nouveau_object_new+0x13e/0x1dc [nouveau]
[   10.578197]  [<ffffffffa06f5574>] nouveau_drm_load+0x276/0x86b [nouveau]
[   10.578200]  [<ffffffff812a3cd6>] drm_dev_register+0x79/0xef
[   10.578202]  [<ffffffff812a5db9>] drm_get_pci_dev+0xf7/0x1ba
[   10.578230]  [<ffffffffa06f520b>] nouveau_drm_probe+0x1e8/0x20d [nouveau]
[   10.578233]  [<ffffffff812042d5>] pci_device_probe+0x6e/0xcf
[   10.578236]  [<ffffffff8132f92a>] driver_probe_device+0x12c/0x30b
[   10.578238]  [<ffffffff8132fb99>] __driver_attach+0x58/0x7a
[   10.578240]  [<ffffffff8132fb41>] ? __device_attach+0x38/0x38
[   10.578241]  [<ffffffff8132de5e>] bus_for_each_dev+0x76/0x80
[   10.578243]  [<ffffffff8132f3a9>] driver_attach+0x19/0x1b
[   10.578244]  [<ffffffff8132f03c>] bus_add_driver+0x12a/0x1f4
[   10.578247]  [<ffffffff81330276>] driver_register+0x89/0xc5
[   10.578249]  [<ffffffffa07a4000>] ? 0xffffffffa07a3fff
[   10.578251]  [<ffffffff812037f3>] __pci_register_driver+0x46/0x48
[   10.578252]  [<ffffffff812a5ed5>] drm_pci_init+0x59/0xda
[   10.578254]  [<ffffffffa07a4000>] ? 0xffffffffa07a3fff
[   10.578272]  [<ffffffffa07a4043>] nouveau_drm_init+0x43/0x1000 [nouveau]
[   10.578275]  [<ffffffff810003b7>] do_one_initcall+0x193/0x1a8
[   10.578277]  [<ffffffff811152bf>] ? kfree+0x10e/0x15a
[   10.578279]  [<ffffffff81106d94>] ? __vunmap+0xa4/0xaa
[   10.578282]  [<ffffffff8109aa39>] load_module+0x183f/0x1ea2
[   10.578283]  [<ffffffff81097dcd>] ? store_uevent+0x35/0x35
[   10.578285]  [<ffffffff8109b1df>] SyS_finit_module+0x79/0x8f
[   10.578289]  [<ffffffff8144ba92>] system_call_fastpath+0x16/0x1b
[   10.578298] Code: 5d 41 5e 5d c3 55 48 89 e5 41 54 53 48 89 fb 52 48 8d bf
b8 00 00 00 e8 71 e9 fb ff 48 8b 83 a0 00 00 00 48 8d 50 e0 48 89 55 e8 <4c> 8b
20 48 8b 45 e8 49 83 ec 20 48 8d 50 20 48 8d 83 a0 00 00 
[   10.578323] RIP  [<ffffffffa06c532c>] _nouveau_disp_dtor+0x26/0x65 [nouveau]
[   10.578324]  RSP <ffff8804141cb8f8>
[   10.578324] CR2: 0000000000000000
[   40.369953] ---[ end trace ad22c559c3d7d8ce ]---

$ lspci -vvnn |grep -iE "(graph|3d)"
00:02.0 VGA compatible controller [0300]: Intel Corporation 4th Gen Core
Processor Integrated Graphics Controller [8086:0416] (rev 06) (prog-if 00 [VGA
controller])
02:00.0 3D controller [0302]: NVIDIA Corporation GK107M [GeForce GT 750M]
[10de:0fe4] (rev a1)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402647626.EE42d11.7188
Date: Fri, 13 Jun 2014 08:20:26 +0000
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
   title="NEW --- - 3.15.0-11819-gc1fdb2d: oops"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79971">79971</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>3.15.0-11819-gc1fdb2d: oops
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>arekm&#64;maven.pl
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
        <pre>Tried to upgrade to current linux git but it crashes. My primary GPU is intel.
nouveau is just sleeping.

The problem appeared after recent drm merge from 1-2 day ago.

(on working kernel) $ cat /sys/kernel/debug/vgaswitcheroo/switch 
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynOff:0000:02:00.0

[   10.278052] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[   10.282075] nouveau  [   VBIOS][0000:02:00.0] using image from ACPI
[   10.286261] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[   10.290288] nouveau  [   VBIOS][0000:02:00.0] version 80.07.b3.00.10
[   10.294580] nouveau  [ DEVINIT][0000:02:00.0] adaptor not initialised
[   10.298610] nouveau  [   VBIOS][0000:02:00.0] running init tables
[   10.459281] nouveau 0000:02:00.0: irq 53 for MSI/MSI-X
[   10.459290] nouveau  [     PMC][0000:02:00.0] MSI interrupts enabled
[   10.463323] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[   10.467278] nouveau  [     PFB][0000:02:00.0] RAM size: 2048 MiB
[   10.471193] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[   10.477213] nouveau  [    VOLT][0000:02:00.0] GPU voltage: 600000uv
[   10.513107] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / external
[   10.516957] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[   10.520763] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[   10.524561] nouveau  [     CLK][0000:02:00.0] 07: core 405 MHz memory 810
MHz 
[   10.528366] nouveau  [     CLK][0000:02:00.0] 0a: core 405-1058 MHz memory
1600 MHz 
[   10.532164] nouveau  [     CLK][0000:02:00.0] 0f: core 405-1058 MHz memory
5000 MHz 
[   10.536022] nouveau  [     CLK][0000:02:00.0] --: core 405 MHz memory 810
MHz 
[   10.577969] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[   10.577999] Oops: 0000 [#1] PREEMPT SMP 
[   10.578021] Modules linked in: arc4 joydev iTCO_wdt iTCO_vendor_support
hid_multitouch ext2 ecb mbcache dell_wmi sparse_keymap iwlmvm mac80211
dell_laptop dcdbas intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp
crc32_pclmul ghash_clmulni_intel psmouse microcode serio_raw pcspkr uvcvideo
iwlwifi btusb videobuf2_vmalloc i2c_i801 nouveau(+) bluetooth videobuf2_memops
videobuf2_core cfg80211 v4l2_common 6lowpan_iphc videodev crc16 lpc_ich mxm_wmi
binfmt_misc rfkill usbhid ttm media mfd_core shpchp thermal fan int3403_thermal
snd_hda_codec_realtek snd_hda_codec_hdmi battery ac snd_hda_codec_generic wmi
dell_smo8800 evdev snd_hda_intel snd_hda_controller snd_hda_codec snd_hwdep
snd_pcm snd_timer snd soundcore cpufreq_stats acpi_cpufreq processor vhost_net
tun vhost macvtap macvlan tcp_illinois
[   10.578030]  kvm_intel kvm ipv6 autofs4 efivarfs xfs(E) libcrc32c(E)
crc32c_generic(E) crc32c_intel(E) aesni_intel(E) lrw(E) gf128mul(E)
glue_helper(E) ablk_helper(E) cryptd(E) aes_x86_64(E) dm_crypt(E) dm_mod(E)
sd_mod(E) crc_t10dif(E) crct10dif_generic(E) crct10dif_pclmul(E)
crct10dif_common(E) ahci(E) libahci(E) libata(E) scsi_mod(E) hid_logitech_dj(E)
hid(E) xhci_hcd(E) ehci_pci(E) ehci_hcd(E) usbcore(E) usb_common(E)
[   10.578033] CPU: 1 PID: 4066 Comm: systemd-udevd Tainted: G            E
3.15.0-11819-gc1fdb2d #660
[   10.578033] Hardware name: Dell Inc. XPS 15 9530/XPS 15 9530, BIOS A05
04/16/2014
[   10.578034] task: ffff880417299850 ti: ffff8804141c8000 task.ti:
ffff8804141c8000
[   10.578067] RIP: 0010:[&lt;ffffffffa06c532c&gt;]  [&lt;ffffffffa06c532c&gt;]
_nouveau_disp_dtor+0x26/0x65 [nouveau]
[   10.578068] RSP: 0018:ffff8804141cb8f8  EFLAGS: 00010246
[   10.578069] RAX: 0000000000000000 RBX: ffff880416b84200 RCX:
ffff8804141cb8f0
[   10.578069] RDX: ffffffffffffffe0 RSI: ffff88041768b000 RDI:
0000000000000000
[   10.578070] RBP: ffff8804141cb910 R08: ffff88042e403600 R09:
ffff8804141cb8f0
[   10.578070] R10: 0000000000000020 R11: ffffffffa06854c1 R12:
ffffffffa0750c30
[   10.578070] R13: ffff880416b87d68 R14: ffffffffa0750c80 R15:
ffff88041768b000
[   10.578071] FS:  00007fdcda17a880(0000) GS:ffff88042ea40000(0000)
knlGS:0000000000000000
[   10.578072] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.578073] CR2: 0000000000000000 CR3: 00000004168a9000 CR4:
00000000001407e0
[   10.578073] Stack:
[   10.578074]  ffffffffffffffe0 00000000ffffffed ffffffffa0750c30
ffff8804141cb950
[   10.578075]  ffffffffa0685322 ffff880416b84200 ffff88041768b000
0000000000000023
[   10.578076]  000000000000002d ffff88041768b110 0000000000000021
ffff8804141cb9b8
[   10.578076] Call Trace:
[   10.578099]  [&lt;ffffffffa0685322&gt;] nouveau_object_ctor+0x68/0xa5 [nouveau]
[   10.578126]  [&lt;ffffffffa06c1f0c&gt;] nouveau_devobj_ctor+0x521/0x5b4 [nouveau]
[   10.578146]  [&lt;ffffffffa06852e5&gt;] nouveau_object_ctor+0x2b/0xa5 [nouveau]
[   10.578167]  [&lt;ffffffffa0685a1c&gt;] nouveau_object_new+0x13e/0x1dc [nouveau]
[   10.578197]  [&lt;ffffffffa06f5574&gt;] nouveau_drm_load+0x276/0x86b [nouveau]
[   10.578200]  [&lt;ffffffff812a3cd6&gt;] drm_dev_register+0x79/0xef
[   10.578202]  [&lt;ffffffff812a5db9&gt;] drm_get_pci_dev+0xf7/0x1ba
[   10.578230]  [&lt;ffffffffa06f520b&gt;] nouveau_drm_probe+0x1e8/0x20d [nouveau]
[   10.578233]  [&lt;ffffffff812042d5&gt;] pci_device_probe+0x6e/0xcf
[   10.578236]  [&lt;ffffffff8132f92a&gt;] driver_probe_device+0x12c/0x30b
[   10.578238]  [&lt;ffffffff8132fb99&gt;] __driver_attach+0x58/0x7a
[   10.578240]  [&lt;ffffffff8132fb41&gt;] ? __device_attach+0x38/0x38
[   10.578241]  [&lt;ffffffff8132de5e&gt;] bus_for_each_dev+0x76/0x80
[   10.578243]  [&lt;ffffffff8132f3a9&gt;] driver_attach+0x19/0x1b
[   10.578244]  [&lt;ffffffff8132f03c&gt;] bus_add_driver+0x12a/0x1f4
[   10.578247]  [&lt;ffffffff81330276&gt;] driver_register+0x89/0xc5
[   10.578249]  [&lt;ffffffffa07a4000&gt;] ? 0xffffffffa07a3fff
[   10.578251]  [&lt;ffffffff812037f3&gt;] __pci_register_driver+0x46/0x48
[   10.578252]  [&lt;ffffffff812a5ed5&gt;] drm_pci_init+0x59/0xda
[   10.578254]  [&lt;ffffffffa07a4000&gt;] ? 0xffffffffa07a3fff
[   10.578272]  [&lt;ffffffffa07a4043&gt;] nouveau_drm_init+0x43/0x1000 [nouveau]
[   10.578275]  [&lt;ffffffff810003b7&gt;] do_one_initcall+0x193/0x1a8
[   10.578277]  [&lt;ffffffff811152bf&gt;] ? kfree+0x10e/0x15a
[   10.578279]  [&lt;ffffffff81106d94&gt;] ? __vunmap+0xa4/0xaa
[   10.578282]  [&lt;ffffffff8109aa39&gt;] load_module+0x183f/0x1ea2
[   10.578283]  [&lt;ffffffff81097dcd&gt;] ? store_uevent+0x35/0x35
[   10.578285]  [&lt;ffffffff8109b1df&gt;] SyS_finit_module+0x79/0x8f
[   10.578289]  [&lt;ffffffff8144ba92&gt;] system_call_fastpath+0x16/0x1b
[   10.578298] Code: 5d 41 5e 5d c3 55 48 89 e5 41 54 53 48 89 fb 52 48 8d bf
b8 00 00 00 e8 71 e9 fb ff 48 8b 83 a0 00 00 00 48 8d 50 e0 48 89 55 e8 &lt;4c&gt; 8b
20 48 8b 45 e8 49 83 ec 20 48 8d 50 20 48 8d 83 a0 00 00 
[   10.578323] RIP  [&lt;ffffffffa06c532c&gt;] _nouveau_disp_dtor+0x26/0x65 [nouveau]
[   10.578324]  RSP &lt;ffff8804141cb8f8&gt;
[   10.578324] CR2: 0000000000000000
[   40.369953] ---[ end trace ad22c559c3d7d8ce ]---

$ lspci -vvnn |grep -iE &quot;(graph|3d)&quot;
00:02.0 VGA compatible controller [0300]: Intel Corporation 4th Gen Core
Processor Integrated Graphics Controller [8086:0416] (rev 06) (prog-if 00 [VGA
controller])
02:00.0 3D controller [0302]: NVIDIA Corporation GK107M [GeForce GT 750M]
[10de:0fe4] (rev a1)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402647626.EE42d11.7188--

--===============0835726199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0835726199==--
