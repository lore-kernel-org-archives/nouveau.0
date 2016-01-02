From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93557] New: Kernel Panic on Linux Kernel 4.4 when
 loading KDE/KDM on Nvidia GeForce 7025 / nForce 630a
Date: Sat, 02 Jan 2016 00:00:36 +0000
Message-ID: <bug-93557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0156574303=="
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


--===============0156574303==
Content-Type: multipart/alternative; boundary="1451692836.67BDF2F21.21707"; charset="UTF-8"


--1451692836.67BDF2F21.21707
Date: Sat, 2 Jan 2016 00:00:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93557

            Bug ID: 93557
           Summary: Kernel Panic on Linux Kernel 4.4 when loading KDE/KDM
                    on Nvidia GeForce 7025 / nForce 630a
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: xgfwtvdh-GK+4nHxFadIswetKESUqMA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

As imirkin told me in the irc i should fill up a bugreport.

System: Clean install of debian testing from 1.1.2016 dailybuild with kde
chosen. Kernel 4.4.0-rc6 installed from experimental.

The main needed information is this kernel panic captured with netconsole:

[ 1059.265197] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b020
[ 1059.265516] nouveau 0000:00:0d.0: bus: MMIO write of 010d0001 FAULT at
00b010
[ 1060.724984] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b010
[ 1060.847845] nouveau 0000:00:0d.0: bus: MMIO write of 010a0001 FAULT at
00b010
[ 1060.848340] nouveau 0000:00:0d.0: bus: MMIO write of 010c0001 FAULT at
00b020
[ 1061.073132] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b010
[ 1061.073350] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b020
[ 1061.265858] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
00b010
[ 1061.266331] nouveau 0000:00:0d.0: bus: MMIO write of 018c0001 FAULT at
00b020
[ 1061.266954] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b010
[ 1068.679841] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
00b010
[ 1068.691605] nouveau 0000:00:0d.0: bus: MMIO write of 018b0001 FAULT at
00b030
[ 1069.007856] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b010
[ 1069.008076] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b030
[ 1069.009128] nouveau 0000:00:0d.0: bus: MMIO write of 04200001 FAULT at
00b010
[ 1071.267098] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
00b030
[ 1071.267686] nouveau 0000:00:0d.0: bus: MMIO write of 018b0001 FAULT at
00b040
[ 1075.811130] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b030
[ 1075.811472] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b040
[ 1079.219933] BUG: unable to handle kernel NULL pointer dereference at
0000000000000020
[ 1079.219999] IP: [<ffffffffa053448d>] nv40_gr_intr+0x1fd/0x380 [nouveau]
[ 1079.220079] PGD 6a5b2067 PUD 6a5b1067 PMD 0 
[ 1079.220109] Oops: 0000 [#1] SMP 
[ 1079.220130] Modules linked in: netconsole snd_hda_codec_via
snd_hda_codec_generic joydev pcspkr hid_roccat_koneplus hid_roccat
hid_roccat_common nouveau evdev kvm_amd kvm serio_raw snd_hda_intel mxm_wmi
snd_hda_codec irqbypass wmi k10temp snd_hda_core video snd_hwdep ttm snd_pcm
edac_mce_amd edac_core drm_kms_helper snd_timer sg drm i2c_algo_bit shpchp
i2c_nforce2 button snd soundcore 8250_fintek acpi_cpufreq tpm_tis tpm processor
parport_pc ppdev lp parport autofs4 ext4 crc16 mbcache jbd2 configfs sd_mod
sr_mod cdrom usbhid hid ata_generic ohci_pci pata_amd sata_nv forcedeth libata
scsi_mod ehci_pci ohci_hcd ehci_hcd usbcore usb_common
[ 1079.220909] CPU: 0 PID: 987 Comm: kwin_x11 Not tainted 4.4.0-rc6-amd64 #1
Debian 4.4~rc6-1~exp1
[ 1079.220953] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./N68-S3 UCC, BIOS P1.60 09/19/2011
[ 1079.220999] task: ffff880069d0c480 ti: ffff880069db0000 task.ti:
ffff880069db0000
[ 1079.221035] RIP: 0010:[<ffffffffa053448d>]  [<ffffffffa053448d>]
nv40_gr_intr+0x1fd/0x380 [nouveau]
[ 1079.221101] RSP: 0000:ffff88006fc03c58  EFLAGS: 00010016
[ 1079.221128] RAX: 0000000000000003 RBX: ffff88006bb1f140 RCX:
0000000000000000
[ 1079.221162] RDX: 0000000000000000 RSI: 000000000000000c RDI:
0000000000000000
[ 1079.221252] RBP: ffff880055090ac0 R08: 0000000000000000 R09:
0000000000064000
[ 1079.221286] R10: 00007ff87985d250 R11: 0000000001a05010 R12:
0000000000100000
[ 1079.221320] R13: ffff88006bb1f198 R14: ffff88006c66cc00 R15:
0000000000006400
[ 1079.221355] FS:  00007ff87985c940(0000) GS:ffff88006fc00000(0000)
knlGS:0000000000000000
[ 1079.221393] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1079.221421] CR2: 0000000000000020 CR3: 0000000000040000 CR4:
00000000000006f0
[ 1079.221455] Stack:
[ 1079.221467]  0000000000000000 000000006d715f11 ffffffff810b244e
0000000100000086
[ 1079.221508]  ffff880069f466c8 0000000000000046 0000000000000001
0000000000000001
[ 1079.221549]  0000000000000000 ffff88006c0351a8 0000000000000096
0200000000000002
[ 1079.221590] Call Trace:
[ 1079.221604]  <IRQ> 
[ 1079.221618]  [<ffffffff810b244e>] ? __wake_up_common+0x4e/0x90
[ 1079.221665]  [<ffffffffa02ee7d6>] ? drm_handle_vblank+0x1c6/0x280 [drm]
[ 1079.221719]  [<ffffffffa05601a4>] ? nouveau_display_vblank_handler+0x14/0x20
[nouveau]
[ 1079.221768]  [<ffffffffa04c3cde>] ? nvif_notify+0x9e/0x180 [nouveau]
[ 1079.221819]  [<ffffffffa0552aed>] ? nvkm_sw_mthd+0x8d/0xe0 [nouveau]
[ 1079.221862]  [<ffffffffa04c4c51>] ? nvkm_event_get+0x71/0x80 [nouveau]
[ 1079.221906]  [<ffffffffa04c6a9e>] ? nvkm_notify_send+0x3e/0x130 [nouveau]
[ 1079.221950]  [<ffffffffa04c4d28>] ? nvkm_event_send+0xc8/0xe0 [nouveau]
[ 1079.222001]  [<ffffffffa051627d>] ? nvkm_disp_vblank+0x3d/0x60 [nouveau]
[ 1079.222052]  [<ffffffffa0504d40>] ? nvkm_mc_intr+0x70/0x110 [nouveau]
[ 1079.222100]  [<ffffffffa05091d1>] ? nvkm_pci_intr+0x51/0x90 [nouveau]
[ 1079.222134]  [<ffffffff810c683d>] ? handle_irq_event_percpu+0x6d/0x170
[ 1079.222166]  [<ffffffff810c6979>] ? handle_irq_event+0x39/0x60
[ 1079.222195]  [<ffffffff810c9a24>] ? handle_fasteoi_irq+0x94/0x150
[ 1079.222226]  [<ffffffff81017dd9>] ? handle_irq+0x19/0x30
[ 1079.222253]  [<ffffffff8158c8d6>] ? do_IRQ+0x46/0xd0
[ 1079.222278]  [<ffffffff8158aa02>] ? common_interrupt+0x82/0x82
[ 1079.222306]  <EOI> 
[ 1079.222318] Code: 5a a0 be 80 00 00 00 e8 52 06 f9 ff 8b 43 50 85 c0 0f 84
ab 00 00 00 48 85 ed 0f 84 6a 01 00 00 48 8b 55 78 45 89 f9 41 c1 e1 04 <48> 8b
42 20 0f b7 b2 98 00 00 00 48 8d 48 70 8b 43 20 44 8b 74 
[ 1079.222568] RIP  [<ffffffffa053448d>] nv40_gr_intr+0x1fd/0x380 [nouveau]
[ 1079.222622]  RSP <ffff88006fc03c58>
[ 1079.222639] CR2: 0000000000000020
[ 1079.234870] ---[ end trace 31e903725b04f0a8 ]---
[ 1079.234873] Kernel panic - not syncing: Fatal exception in interrupt
[ 1079.234907] Kernel Offset: disabled
[ 1079.234925] ---[ end Kernel panic - not syncing: Fatal exception in
interrupt

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1451692836.67BDF2F21.21707
Date: Sat, 2 Jan 2016 00:00:36 +0000
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
   title="NEW - Kernel Panic on Linux Kernel 4.4 when loading KDE/KDM on Nvidia GeForce 7025 / nForce 630a"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93557">93557</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel Panic on Linux Kernel 4.4 when loading KDE/KDM on Nvidia GeForce 7025 / nForce 630a
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
          <td>xgfwtvdh&#64;sharklasers.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>As imirkin told me in the irc i should fill up a bugreport.

System: Clean install of debian testing from 1.1.2016 dailybuild with kde
chosen. Kernel 4.4.0-rc6 installed from experimental.

The main needed information is this kernel panic captured with netconsole:

[ 1059.265197] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b020
[ 1059.265516] nouveau 0000:00:0d.0: bus: MMIO write of 010d0001 FAULT at
00b010
[ 1060.724984] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b010
[ 1060.847845] nouveau 0000:00:0d.0: bus: MMIO write of 010a0001 FAULT at
00b010
[ 1060.848340] nouveau 0000:00:0d.0: bus: MMIO write of 010c0001 FAULT at
00b020
[ 1061.073132] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b010
[ 1061.073350] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b020
[ 1061.265858] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
00b010
[ 1061.266331] nouveau 0000:00:0d.0: bus: MMIO write of 018c0001 FAULT at
00b020
[ 1061.266954] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b010
[ 1068.679841] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
00b010
[ 1068.691605] nouveau 0000:00:0d.0: bus: MMIO write of 018b0001 FAULT at
00b030
[ 1069.007856] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b010
[ 1069.008076] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b030
[ 1069.009128] nouveau 0000:00:0d.0: bus: MMIO write of 04200001 FAULT at
00b010
[ 1071.267098] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
00b030
[ 1071.267686] nouveau 0000:00:0d.0: bus: MMIO write of 018b0001 FAULT at
00b040
[ 1075.811130] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b030
[ 1075.811472] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
00b040
[ 1079.219933] BUG: unable to handle kernel NULL pointer dereference at
0000000000000020
[ 1079.219999] IP: [&lt;ffffffffa053448d&gt;] nv40_gr_intr+0x1fd/0x380 [nouveau]
[ 1079.220079] PGD 6a5b2067 PUD 6a5b1067 PMD 0 
[ 1079.220109] Oops: 0000 [#1] SMP 
[ 1079.220130] Modules linked in: netconsole snd_hda_codec_via
snd_hda_codec_generic joydev pcspkr hid_roccat_koneplus hid_roccat
hid_roccat_common nouveau evdev kvm_amd kvm serio_raw snd_hda_intel mxm_wmi
snd_hda_codec irqbypass wmi k10temp snd_hda_core video snd_hwdep ttm snd_pcm
edac_mce_amd edac_core drm_kms_helper snd_timer sg drm i2c_algo_bit shpchp
i2c_nforce2 button snd soundcore 8250_fintek acpi_cpufreq tpm_tis tpm processor
parport_pc ppdev lp parport autofs4 ext4 crc16 mbcache jbd2 configfs sd_mod
sr_mod cdrom usbhid hid ata_generic ohci_pci pata_amd sata_nv forcedeth libata
scsi_mod ehci_pci ohci_hcd ehci_hcd usbcore usb_common
[ 1079.220909] CPU: 0 PID: 987 Comm: kwin_x11 Not tainted 4.4.0-rc6-amd64 #1
Debian 4.4~rc6-1~exp1
[ 1079.220953] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./N68-S3 UCC, BIOS P1.60 09/19/2011
[ 1079.220999] task: ffff880069d0c480 ti: ffff880069db0000 task.ti:
ffff880069db0000
[ 1079.221035] RIP: 0010:[&lt;ffffffffa053448d&gt;]  [&lt;ffffffffa053448d&gt;]
nv40_gr_intr+0x1fd/0x380 [nouveau]
[ 1079.221101] RSP: 0000:ffff88006fc03c58  EFLAGS: 00010016
[ 1079.221128] RAX: 0000000000000003 RBX: ffff88006bb1f140 RCX:
0000000000000000
[ 1079.221162] RDX: 0000000000000000 RSI: 000000000000000c RDI:
0000000000000000
[ 1079.221252] RBP: ffff880055090ac0 R08: 0000000000000000 R09:
0000000000064000
[ 1079.221286] R10: 00007ff87985d250 R11: 0000000001a05010 R12:
0000000000100000
[ 1079.221320] R13: ffff88006bb1f198 R14: ffff88006c66cc00 R15:
0000000000006400
[ 1079.221355] FS:  00007ff87985c940(0000) GS:ffff88006fc00000(0000)
knlGS:0000000000000000
[ 1079.221393] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1079.221421] CR2: 0000000000000020 CR3: 0000000000040000 CR4:
00000000000006f0
[ 1079.221455] Stack:
[ 1079.221467]  0000000000000000 000000006d715f11 ffffffff810b244e
0000000100000086
[ 1079.221508]  ffff880069f466c8 0000000000000046 0000000000000001
0000000000000001
[ 1079.221549]  0000000000000000 ffff88006c0351a8 0000000000000096
0200000000000002
[ 1079.221590] Call Trace:
[ 1079.221604]  &lt;IRQ&gt; 
[ 1079.221618]  [&lt;ffffffff810b244e&gt;] ? __wake_up_common+0x4e/0x90
[ 1079.221665]  [&lt;ffffffffa02ee7d6&gt;] ? drm_handle_vblank+0x1c6/0x280 [drm]
[ 1079.221719]  [&lt;ffffffffa05601a4&gt;] ? nouveau_display_vblank_handler+0x14/0x20
[nouveau]
[ 1079.221768]  [&lt;ffffffffa04c3cde&gt;] ? nvif_notify+0x9e/0x180 [nouveau]
[ 1079.221819]  [&lt;ffffffffa0552aed&gt;] ? nvkm_sw_mthd+0x8d/0xe0 [nouveau]
[ 1079.221862]  [&lt;ffffffffa04c4c51&gt;] ? nvkm_event_get+0x71/0x80 [nouveau]
[ 1079.221906]  [&lt;ffffffffa04c6a9e&gt;] ? nvkm_notify_send+0x3e/0x130 [nouveau]
[ 1079.221950]  [&lt;ffffffffa04c4d28&gt;] ? nvkm_event_send+0xc8/0xe0 [nouveau]
[ 1079.222001]  [&lt;ffffffffa051627d&gt;] ? nvkm_disp_vblank+0x3d/0x60 [nouveau]
[ 1079.222052]  [&lt;ffffffffa0504d40&gt;] ? nvkm_mc_intr+0x70/0x110 [nouveau]
[ 1079.222100]  [&lt;ffffffffa05091d1&gt;] ? nvkm_pci_intr+0x51/0x90 [nouveau]
[ 1079.222134]  [&lt;ffffffff810c683d&gt;] ? handle_irq_event_percpu+0x6d/0x170
[ 1079.222166]  [&lt;ffffffff810c6979&gt;] ? handle_irq_event+0x39/0x60
[ 1079.222195]  [&lt;ffffffff810c9a24&gt;] ? handle_fasteoi_irq+0x94/0x150
[ 1079.222226]  [&lt;ffffffff81017dd9&gt;] ? handle_irq+0x19/0x30
[ 1079.222253]  [&lt;ffffffff8158c8d6&gt;] ? do_IRQ+0x46/0xd0
[ 1079.222278]  [&lt;ffffffff8158aa02&gt;] ? common_interrupt+0x82/0x82
[ 1079.222306]  &lt;EOI&gt; 
[ 1079.222318] Code: 5a a0 be 80 00 00 00 e8 52 06 f9 ff 8b 43 50 85 c0 0f 84
ab 00 00 00 48 85 ed 0f 84 6a 01 00 00 48 8b 55 78 45 89 f9 41 c1 e1 04 &lt;48&gt; 8b
42 20 0f b7 b2 98 00 00 00 48 8d 48 70 8b 43 20 44 8b 74 
[ 1079.222568] RIP  [&lt;ffffffffa053448d&gt;] nv40_gr_intr+0x1fd/0x380 [nouveau]
[ 1079.222622]  RSP &lt;ffff88006fc03c58&gt;
[ 1079.222639] CR2: 0000000000000020
[ 1079.234870] ---[ end trace 31e903725b04f0a8 ]---
[ 1079.234873] Kernel panic - not syncing: Fatal exception in interrupt
[ 1079.234907] Kernel Offset: disabled
[ 1079.234925] ---[ end Kernel panic - not syncing: Fatal exception in
interrupt</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1451692836.67BDF2F21.21707--

--===============0156574303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0156574303==--
