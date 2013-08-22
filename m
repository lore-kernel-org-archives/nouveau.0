From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68456] New: kernel NULL pointer dereference on
 'modprobe nouveau'
Date: Thu, 22 Aug 2013 22:57:00 +0000
Message-ID: <bug-68456-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0872469812=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0872469812==
Content-Type: multipart/alternative; boundary="1377212220.88241.21589"; charset="us-ascii"


--1377212220.88241.21589
Date: Thu, 22 Aug 2013 22:57:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68456

          Priority: medium
            Bug ID: 68456
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: kernel NULL pointer dereference on 'modprobe nouveau'
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: hpdeifel-Mmb7MZpHnFY@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Loading the nouveau module leads to an instant crash. I was advised on #nouveau
to try the config option NvI2C=1, which worked. But the default config is
nevertheless broken. I have a "GeForce 7600 GT" card and use the latest (commit
3b56bba6) kernel from anongit.freedesktop.org master which seems to be rebased
onto linux-3.11-rc6.

Here is the generated backtrace:

kernel: BUG: unable to handle kernel NULL pointer dereference at          
(null)
kernel: IP: [<ffffffffa028e94b>] nouveau_i2c_pre_xfer+0xf/0x1d [nouveau]
kernel: PGD 0 
kernel: Oops: 0000 [#1] SMP 
kernel: Modules linked in: nouveau(+) video mxm_wmi i2c_algo_bit ttm
drm_kms_helper drm hwmon_vid i2c_core usbhid usb_storage kvm_amd kvm pcspkr
ohci_pci snd_hda_codec_via ohci_hcd ehci_pci k10temp r8169 snd_hda_intel
ehci_hcd wmi snd_hda_codec snd_pcm snd_page_alloc snd_timer snd acpi_cpufreq
mperf processor thermal_sys hwmon
kernel: CPU: 0 PID: 439 Comm: kworker/0:1 Not tainted 3.11.0-rc6-g3b56bba #2
kernel: Hardware name: System manufacturer System Product Name/M4A77TD, BIOS
0305    09/10/2009
kernel: Workqueue: events work_for_cpu_fn
kernel: task: ffff88012aff2050 ti: ffff88012ab4a000 task.ti: ffff88012ab4a000
kernel: RIP: 0010:[<ffffffffa028e94b>]  [<ffffffffa028e94b>]
nouveau_i2c_pre_xfer+0xf/0x1d [nouveau]
kernel: RSP: 0018:ffff88012ab4b918  EFLAGS: 00010286
kernel: RAX: 0000000000000000 RBX: ffff880128fb7800 RCX: 0000000000000000
kernel: RDX: ffff880128fb7800 RSI: ffffffffa01ebdf5 RDI: ffff88012a2ba800
kernel: RBP: ffff88012a98ecc0 R08: 000000000000000a R09: 00000000fffffffb
kernel: R10: 0000000000000000 R11: ffff880123900001 R12: ffff88012a2ba820
kernel: R13: ffffffffa01ebdf5 R14: ffffffffa02f80c0 R15: ffff88012a98ef00
kernel: FS:  00007f273a9c0780(0000) GS:ffff88012fc00000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
kernel: CR2: 0000000000000000 CR3: 0000000001527000 CR4: 00000000000007f0
kernel: Stack:
kernel: 0000000000000000 ffffffffa026871a ffff880128fb7800 ffff88012a98ecc0
kernel: ffff88012a2ba800 ffff88012a2ba820 ffffffffa02f80c0 ffffffffa028ed5a
kernel: 0000000000000020 ffff88012ab4ba7c ffff88012ab4b9e0 0000000000000000
kernel: Call Trace:
kernel: [<ffffffffa026871a>] ? __i2c_bit_add_bus+0x2a/0x2b3 [i2c_algo_bit]
kernel: [<ffffffffa028ed5a>] ? nouveau_i2c_port_create_+0x136/0x18a [nouveau]
kernel: [<ffffffffa02900b4>] ? nv04_i2c_port_ctor+0x2b/0x5c [nouveau]
kernel: [<ffffffffa027fa84>] ? dcb_i2c_entry+0x24/0x48 [nouveau]
kernel: [<ffffffffa027b00f>] ? nouveau_object_ctor+0x2b/0xb7 [nouveau]
kernel: [<ffffffffa028f030>] ? nouveau_i2c_create_+0xce/0x1de [nouveau]
kernel: [<ffffffffa0279ad3>] ? nouveau_event_create+0x1d/0x5e [nouveau]
kernel: [<ffffffffa029007b>] ? nv04_i2c_ctor+0x1f/0x2d [nouveau]
kernel: [<ffffffffa027b00f>] ? nouveau_object_ctor+0x2b/0xb7 [nouveau]
kernel: [<ffffffffa029b461>] ? nouveau_devobj_ctor+0x52f/0x5a3 [nouveau]
kernel: [<ffffffffa027b00f>] ? nouveau_object_ctor+0x2b/0xb7 [nouveau]
kernel: [<ffffffffa027b81e>] ? nouveau_object_new+0x162/0x20e [nouveau]
kernel: [<ffffffffa02c9c87>] ? nouveau_drm_load+0x154/0x565 [nouveau]
kernel: [<ffffffffa020c455>] ? drm_get_minor+0x196/0x1e8 [drm]
kernel: [<ffffffffa020e08b>] ? drm_get_pci_dev+0x141/0x243 [drm]
kernel: [<ffffffff811a762c>] ? __pci_set_master+0x22/0x6d
kernel: [<ffffffffa02c9656>] ? nouveau_drm_probe+0x1cb/0x1ee [nouveau]
kernel: [<ffffffff811aa8de>] ? local_pci_probe+0x34/0x5b
kernel: [<ffffffff8105350e>] ? work_for_cpu_fn+0xb/0x11
kernel: [<ffffffff8105502d>] ? process_one_work+0x1c1/0x2c8
kernel: [<ffffffff8105514c>] ? process_scheduled_works+0x18/0x25
kernel: [<ffffffff81055875>] ? worker_thread+0x1eb/0x29b
kernel: [<ffffffff8105568a>] ? manage_workers.isra.25+0x1ae/0x1ae
kernel: [<ffffffff81059f28>] ? kthread+0xad/0xb5
kernel: [<ffffffff81059e7b>] ? __kthread_parkme+0x5e/0x5e
kernel: [<ffffffff813b0d6c>] ? ret_from_fork+0x7c/0xb0
kernel: [<ffffffff81059e7b>] ? __kthread_parkme+0x5e/0x5e
kernel: Code: 48 81 c6 80 dc 00 00 e8 69 fd f0 e0 8b 44 24 08 48 83 c4 10 5b c3
e9 10 f2 ff ff 90 51 48 8b 47 18 48 8b 38 48 8b 87 50 03 00 00 <48> 8b 00 48 85
c0 74 02 ff d0 31 c0 5a c3 48 8b 87 50 03 00 00 
kernel: RIP  [<ffffffffa028e94b>] nouveau_i2c_pre_xfer+0xf/0x1d [nouveau]
kernel: RSP <ffff88012ab4b918>
kernel: CR2: 0000000000000000
kernel: ---[ end trace 451adc65612b1d9f ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377212220.88241.21589
Date: Thu, 22 Aug 2013 22:57:00 +0000
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
   title="NEW --- - kernel NULL pointer dereference on 'modprobe nouveau'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68456">68456</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>kernel NULL pointer dereference on 'modprobe nouveau'
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
          <td>hpdeifel&#64;gmx.de
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
        <pre>Loading the nouveau module leads to an instant crash. I was advised on #nouveau
to try the config option NvI2C=1, which worked. But the default config is
nevertheless broken. I have a &quot;GeForce 7600 GT&quot; card and use the latest (commit
3b56bba6) kernel from anongit.freedesktop.org master which seems to be rebased
onto linux-3.11-rc6.

Here is the generated backtrace:

kernel: BUG: unable to handle kernel NULL pointer dereference at          
(null)
kernel: IP: [&lt;ffffffffa028e94b&gt;] nouveau_i2c_pre_xfer+0xf/0x1d [nouveau]
kernel: PGD 0 
kernel: Oops: 0000 [#1] SMP 
kernel: Modules linked in: nouveau(+) video mxm_wmi i2c_algo_bit ttm
drm_kms_helper drm hwmon_vid i2c_core usbhid usb_storage kvm_amd kvm pcspkr
ohci_pci snd_hda_codec_via ohci_hcd ehci_pci k10temp r8169 snd_hda_intel
ehci_hcd wmi snd_hda_codec snd_pcm snd_page_alloc snd_timer snd acpi_cpufreq
mperf processor thermal_sys hwmon
kernel: CPU: 0 PID: 439 Comm: kworker/0:1 Not tainted 3.11.0-rc6-g3b56bba #2
kernel: Hardware name: System manufacturer System Product Name/M4A77TD, BIOS
0305    09/10/2009
kernel: Workqueue: events work_for_cpu_fn
kernel: task: ffff88012aff2050 ti: ffff88012ab4a000 task.ti: ffff88012ab4a000
kernel: RIP: 0010:[&lt;ffffffffa028e94b&gt;]  [&lt;ffffffffa028e94b&gt;]
nouveau_i2c_pre_xfer+0xf/0x1d [nouveau]
kernel: RSP: 0018:ffff88012ab4b918  EFLAGS: 00010286
kernel: RAX: 0000000000000000 RBX: ffff880128fb7800 RCX: 0000000000000000
kernel: RDX: ffff880128fb7800 RSI: ffffffffa01ebdf5 RDI: ffff88012a2ba800
kernel: RBP: ffff88012a98ecc0 R08: 000000000000000a R09: 00000000fffffffb
kernel: R10: 0000000000000000 R11: ffff880123900001 R12: ffff88012a2ba820
kernel: R13: ffffffffa01ebdf5 R14: ffffffffa02f80c0 R15: ffff88012a98ef00
kernel: FS:  00007f273a9c0780(0000) GS:ffff88012fc00000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
kernel: CR2: 0000000000000000 CR3: 0000000001527000 CR4: 00000000000007f0
kernel: Stack:
kernel: 0000000000000000 ffffffffa026871a ffff880128fb7800 ffff88012a98ecc0
kernel: ffff88012a2ba800 ffff88012a2ba820 ffffffffa02f80c0 ffffffffa028ed5a
kernel: 0000000000000020 ffff88012ab4ba7c ffff88012ab4b9e0 0000000000000000
kernel: Call Trace:
kernel: [&lt;ffffffffa026871a&gt;] ? __i2c_bit_add_bus+0x2a/0x2b3 [i2c_algo_bit]
kernel: [&lt;ffffffffa028ed5a&gt;] ? nouveau_i2c_port_create_+0x136/0x18a [nouveau]
kernel: [&lt;ffffffffa02900b4&gt;] ? nv04_i2c_port_ctor+0x2b/0x5c [nouveau]
kernel: [&lt;ffffffffa027fa84&gt;] ? dcb_i2c_entry+0x24/0x48 [nouveau]
kernel: [&lt;ffffffffa027b00f&gt;] ? nouveau_object_ctor+0x2b/0xb7 [nouveau]
kernel: [&lt;ffffffffa028f030&gt;] ? nouveau_i2c_create_+0xce/0x1de [nouveau]
kernel: [&lt;ffffffffa0279ad3&gt;] ? nouveau_event_create+0x1d/0x5e [nouveau]
kernel: [&lt;ffffffffa029007b&gt;] ? nv04_i2c_ctor+0x1f/0x2d [nouveau]
kernel: [&lt;ffffffffa027b00f&gt;] ? nouveau_object_ctor+0x2b/0xb7 [nouveau]
kernel: [&lt;ffffffffa029b461&gt;] ? nouveau_devobj_ctor+0x52f/0x5a3 [nouveau]
kernel: [&lt;ffffffffa027b00f&gt;] ? nouveau_object_ctor+0x2b/0xb7 [nouveau]
kernel: [&lt;ffffffffa027b81e&gt;] ? nouveau_object_new+0x162/0x20e [nouveau]
kernel: [&lt;ffffffffa02c9c87&gt;] ? nouveau_drm_load+0x154/0x565 [nouveau]
kernel: [&lt;ffffffffa020c455&gt;] ? drm_get_minor+0x196/0x1e8 [drm]
kernel: [&lt;ffffffffa020e08b&gt;] ? drm_get_pci_dev+0x141/0x243 [drm]
kernel: [&lt;ffffffff811a762c&gt;] ? __pci_set_master+0x22/0x6d
kernel: [&lt;ffffffffa02c9656&gt;] ? nouveau_drm_probe+0x1cb/0x1ee [nouveau]
kernel: [&lt;ffffffff811aa8de&gt;] ? local_pci_probe+0x34/0x5b
kernel: [&lt;ffffffff8105350e&gt;] ? work_for_cpu_fn+0xb/0x11
kernel: [&lt;ffffffff8105502d&gt;] ? process_one_work+0x1c1/0x2c8
kernel: [&lt;ffffffff8105514c&gt;] ? process_scheduled_works+0x18/0x25
kernel: [&lt;ffffffff81055875&gt;] ? worker_thread+0x1eb/0x29b
kernel: [&lt;ffffffff8105568a&gt;] ? manage_workers.isra.25+0x1ae/0x1ae
kernel: [&lt;ffffffff81059f28&gt;] ? kthread+0xad/0xb5
kernel: [&lt;ffffffff81059e7b&gt;] ? __kthread_parkme+0x5e/0x5e
kernel: [&lt;ffffffff813b0d6c&gt;] ? ret_from_fork+0x7c/0xb0
kernel: [&lt;ffffffff81059e7b&gt;] ? __kthread_parkme+0x5e/0x5e
kernel: Code: 48 81 c6 80 dc 00 00 e8 69 fd f0 e0 8b 44 24 08 48 83 c4 10 5b c3
e9 10 f2 ff ff 90 51 48 8b 47 18 48 8b 38 48 8b 87 50 03 00 00 &lt;48&gt; 8b 00 48 85
c0 74 02 ff d0 31 c0 5a c3 48 8b 87 50 03 00 00 
kernel: RIP  [&lt;ffffffffa028e94b&gt;] nouveau_i2c_pre_xfer+0xf/0x1d [nouveau]
kernel: RSP &lt;ffff88012ab4b918&gt;
kernel: CR2: 0000000000000000
kernel: ---[ end trace 451adc65612b1d9f ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377212220.88241.21589--

--===============0872469812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0872469812==--
