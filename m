From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
	(also NV44A)
Date: Fri, 31 Oct 2014 20:50:26 +0000
Message-ID: <bug-70388-8800-xcSZ8lNeN1@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0608672379=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0608672379==
Content-Type: multipart/alternative; boundary="1414788625.Ad212.10342"; charset="UTF-8"


--1414788625.Ad212.10342
Date: Fri, 31 Oct 2014 20:50:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #33 from Linas Vepstas <linasvepstas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
FYI,

New kernel, new CPU, same old graphics cards:  if vram_pushbuf=1 not specified
on boot line, then kernel hangs about 4 seconds in (near first modesetting); I
can't capture the dmesg ...

This is with this-weeks kernel on mint-qiana-17  Annotated dmesg below; I can
provide the full dmesg if you really want it ... 


[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-3.18.0-rc2-linas
root=UUID=18a92961-a17b-4205-9038-a6eb91849706 ro nouveau.vram_pushbuf=1
nomdmonddf nomdmonisw
...

[    0.000000] AGP: Checking aperture...
[    0.000000] AGP: No AGP bridge found
[    0.000000] AGP: Node 0: aperture [bus addr 0x00000000-0x01ffffff] (32MB)
[    0.000000] AGP: Your BIOS doesn't leave a aperture memory hole
[    0.000000] AGP: Please enable the IOMMU option in the BIOS setup
[    0.000000] AGP: This costs you 64MB of RAM
[    0.000000] AGP: Mapping aperture over RAM [mem 0x94000000-0x97ffffff]
(65536KB)

strange to see above, as I'm pretty sure I have the IOMMU turned on ...
I'm pretty sure the machine does not have any agp slots, instead, there are two
PCIe x16 slots ... 
...
[    0.000000] DMI: ASUSTeK Computer INC. KGP(M)E-D16/KGP(M)E-D16, BIOS 3201   
02/19/2013
...
[    0.648524] pci 0000:00:14.4: can't claim BAR 8 [mem 0xf5800000-0xf8ffffff]:
address conflict with amd_iommu [mem 0xf6000000-0xf6003fff]

Note that one of the two graphics cards is a PCI card NOT a PCIe card!!! I
mention this because of the above BAR road-bump

00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 PCI to PCI
Bridge

[    1.947594] AMD-Vi: Found IOMMU at 0000:00:00.2 cap 0x40
[    1.947599] AMD-Vi: Interrupt remapping enabled
[    1.947617] pci 0000:00:00.2: irq 25 for MSI/MSI-X
[    1.958894] AMD-Vi: Lazy IO/TLB flushing enabled
[    2.042066] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)

[    4.009084] fbcon: nouveaufb (fb1) is primary device
[    4.009086] fbcon: Remapping primary device, fb1, to tty 1-63
[    4.044782] Switched to clocksource tsc
[    4.050013] nouveau  [     DRM] 0xC633: Parsing digital output script table
[    4.161782] nouveau E[     DRM] GPU lockup - switching to software fbcon


I have two DVI cables, one VGA cable.  The edid to the VGA fails ... it didn't
use to ... 

[   16.869739] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 178
[   16.869747] Raw EDID:
[   16.869749]          00 ff ff ff ff ff ff 00 04 72 a6 01 12 12 12 12
[   16.869751]          15 15 01 03 68 27 ff ff ff ff ff ff ff ff ff ff
etc. 
 it tries multiple times, gets different results ... 

Xorg.0.log shows no startup errors, but the framebuffer shows mostly
corruption.

kill -9 of X sends X into 100% cpu usage.  While it does that, this gets
logged:
Oct 31 15:36:35 fanny kernel: [ 2449.191822] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0002 [Xorg[2290]]
Oct 31 15:36:50 fanny kernel: [ 2464.194418] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0002 [Xorg[2290]]
Oct 31 15:37:05 fanny kernel: [ 2479.197017] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0001 [Xorg[2290]]
Oct 31 15:37:20 fanny kernel: [ 2494.199611] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0001 [Xorg[2290]]
Oct 31 15:37:35 fanny kernel: [ 2509.202213] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0000 [Xorg[2290]]
Oct 31 15:37:50 fanny kernel: [ 2524.204809] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0000 [Xorg[2290]]


After this, starting X a second time does not generate any video-out, so
monitors stay blanked. Nothing at all printed in /var/log/syslog. However
kern.log shows:

Oct 31 15:41:47 fanny kernel: [ 2761.045902] INFO: task kworker/10:1:135
blocked for more than 120 seconds.
Oct 31 15:41:47 fanny kernel: [ 2761.045912]       Not tainted 3.18.0-rc2-linas
#5
Oct 31 15:41:47 fanny kernel: [ 2761.045915] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Oct 31 15:41:47 fanny kernel: [ 2761.045920] kworker/10:1    D ffff88085dd53040
    0   135      2 0x00000000
Oct 31 15:41:47 fanny kernel: [ 2761.045959] Workqueue: events
output_poll_execute [drm_kms_helper]
Oct 31 15:41:47 fanny kernel: [ 2761.045964]  ffff88082ea0fc28 0000000000000002
ffff88082e9e1910 ffff88082ea0ffd8
Oct 31 15:41:47 fanny kernel: [ 2761.045971]  0000000000013040 0000000000013040
ffff880831f88000 ffff88082e9e1910
Oct 31 15:41:47 fanny kernel: [ 2761.045978]  ffff88082ea0fc38 ffff8808315a7898
ffff8808315a7946 ffff8808315a79c8
Oct 31 15:41:47 fanny kernel: [ 2761.045985] Call Trace:
Oct 31 15:41:47 fanny kernel: [ 2761.046000]  [<ffffffff81592cf9>]
schedule+0x29/0x70
Oct 31 15:41:47 fanny kernel: [ 2761.046010]  [<ffffffff813cd64d>]
rpm_resume+0x22d/0x620
Oct 31 15:41:47 fanny kernel: [ 2761.046020]  [<ffffffff81080770>] ?
prepare_to_wait_event+0x110/0x110
Oct 31 15:41:47 fanny kernel: [ 2761.046028]  [<ffffffff813cda8d>]
__pm_runtime_resume+0x4d/0x70
Oct 31 15:41:47 fanny kernel: [ 2761.046035]  [<ffffffff8105a4f6>] ?
__queue_delayed_work+0x166/0x1a0
Oct 31 15:41:47 fanny kernel: [ 2761.046106]  [<ffffffffa040c2b6>]
nouveau_connector_detect+0x66/0x3d0 [nouveau]
Oct 31 15:41:47 fanny kernel: [ 2761.046124]  [<ffffffffa011c608>]
output_poll_execute+0xb8/0x180 [drm_kms_helper]
Oct 31 15:41:47 fanny kernel: [ 2761.046132]  [<ffffffff8105ab06>]
process_one_work+0x146/0x400
Oct 31 15:41:47 fanny kernel: [ 2761.046139]  [<ffffffff8105aee0>]
worker_thread+0x120/0x490
Oct 31 15:41:47 fanny kernel: [ 2761.046146]  [<ffffffff8105adc0>] ?
process_one_work+0x400/0x400
Oct 31 15:41:47 fanny kernel: [ 2761.046153]  [<ffffffff8105fd82>]
kthread+0xd2/0xf0
Oct 31 15:41:47 fanny kernel: [ 2761.046159]  [<ffffffff8105fcb0>] ?
kthread_create_on_node+0x1a0/0x1a0
Oct 31 15:41:47 fanny kernel: [ 2761.046166]  [<ffffffff8159722c>]
ret_from_fork+0x7c/0xb0
Oct 31 15:41:47 fanny kernel: [ 2761.046172]  [<ffffffff8105fcb0>] ?
kthread_create_on_node+0x1a0/0x1a0
Oct 31 15:41:47 fanny kernel: [ 2761.046179] INFO: task kworker/3:1:175 blocked
for more than 120 seconds.
Oct 31 15:41:47 fanny kernel: [ 2761.046183]       Not tainted 3.18.0-rc2-linas
#5
Oct 31 15:41:47 fanny kernel: [ 2761.046186] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Oct 31 15:41:47 fanny kernel: [ 2761.046189] kworker/3:1     D ffff88085dc73040
    0   175      2 0x00000000
Oct 31 15:41:47 fanny kernel: [ 2761.046197] Workqueue: pm pm_runtime_work
Oct 31 15:41:47 fanny kernel: [ 2761.046201]  ffff88082e593bb8 0000000000000002
ffff88082ebbcb30 ffff88082e593fd8
Oct 31 15:41:47 fanny kernel: [ 2761.046207]  0000000000013040 0000000000013040
ffff880831f4cb30 ffff88082ebbcb30
Oct 31 15:41:47 fanny kernel: [ 2761.046214]  ffff88082e593bc8 ffff8808315a7898
ffff8808315a7946 ffff8808315a79c8
Oct 31 15:41:47 fanny kernel: [ 2761.046221] Call Trace:
Oct 31 15:41:47 fanny kernel: [ 2761.046229]  [<ffffffff81592cf9>]
schedule+0x29/0x70
Oct 31 15:41:47 fanny kernel: [ 2761.046236]  [<ffffffff813cd64d>]
rpm_resume+0x22d/0x620
Oct 31 15:41:47 fanny kernel: [ 2761.046243]  [<ffffffff81080770>] ?
prepare_to_wait_event+0x110/0x110
Oct 31 15:41:47 fanny kernel: [ 2761.046251]  [<ffffffff813cdd5c>]
pm_runtime_forbid+0x4c/0x60
Oct 31 15:41:47 fanny kernel: [ 2761.046310]  [<ffffffffa03f6ba8>]
nouveau_pmops_runtime_suspend+0xc8/0xf0 [nouveau]
Oct 31 15:41:47 fanny kernel: [ 2761.046320]  [<ffffffff8131a8ba>]
pci_pm_runtime_suspend+0x6a/0x120
Oct 31 15:41:47 fanny kernel: [ 2761.046326]  [<ffffffff8131a850>] ?
pci_pm_runtime_resume+0x100/0x100
Oct 31 15:41:47 fanny kernel: [ 2761.046332]  [<ffffffff813cc4bd>]
__rpm_callback+0x3d/0x90
Oct 31 15:41:47 fanny kernel: [ 2761.046338]  [<ffffffff81059fd1>] ?
try_to_grab_pending+0xb1/0x150
Oct 31 15:41:47 fanny kernel: [ 2761.046345]  [<ffffffff813cc53f>]
rpm_callback+0x2f/0x90
Oct 31 15:41:47 fanny kernel: [ 2761.046352]  [<ffffffff813cca61>]
rpm_suspend+0x111/0x640
Oct 31 15:41:47 fanny kernel: [ 2761.046359]  [<ffffffff8106b251>] ?
get_parent_ip+0x11/0x50
Oct 31 15:41:47 fanny kernel: [ 2761.046365]  [<ffffffff8106b2e5>] ?
preempt_count_add+0x55/0xb0
Oct 31 15:41:47 fanny kernel: [ 2761.046370]  [<ffffffff813ce3f2>]
pm_runtime_work+0x82/0xb0
Oct 31 15:41:47 fanny kernel: [ 2761.046377]  [<ffffffff8105ab06>]
process_one_work+0x146/0x400
Oct 31 15:41:47 fanny kernel: [ 2761.046384]  [<ffffffff8105aee0>]
worker_thread+0x120/0x490
Oct 31 15:41:47 fanny kernel: [ 2761.046391]  [<ffffffff8105adc0>] ?
process_one_work+0x400/0x400
Oct 31 15:41:47 fanny kernel: [ 2761.046396]  [<ffffffff8105fd82>]
kthread+0xd2/0xf0
Oct 31 15:41:47 fanny kernel: [ 2761.046403]  [<ffffffff8105fcb0>] ?
kthread_create_on_node+0x1a0/0x1a0
Oct 31 15:41:47 fanny kernel: [ 2761.046408]  [<ffffffff8159722c>]
ret_from_fork+0x7c/0xb0
Oct 31 15:41:47 fanny kernel: [ 2761.046414]  [<ffffffff8105fcb0>] ?
kthread_create_on_node+0x1a0/0x1a0



FWIW: my kernel has CONFIG_PM_CORE enabled, but much/most of the rest of ACPI
is not enabled (its not a laptop, and never gets turned off or rebooted).

Don't know if any of my rambling helped, but I conclude:

-- on latest rc kernel, with three-head, dual old graphics cards, one of which
is PCI not PCIe, that nouveau has multiple possibly unrelated issues ...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414788625.Ad212.10342
Date: Fri, 31 Oct 2014 20:50:25 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c33">Comment # 33</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:linasvepstas&#64;gmail.com" title="Linas Vepstas &lt;linasvepstas&#64;gmail.com&gt;"> <span class="fn">Linas Vepstas</span></a>
</span></b>
        <pre>FYI,

New kernel, new CPU, same old graphics cards:  if vram_pushbuf=1 not specified
on boot line, then kernel hangs about 4 seconds in (near first modesetting); I
can't capture the dmesg ...

This is with this-weeks kernel on mint-qiana-17  Annotated dmesg below; I can
provide the full dmesg if you really want it ... 


[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-3.18.0-rc2-linas
root=UUID=18a92961-a17b-4205-9038-a6eb91849706 ro nouveau.vram_pushbuf=1
nomdmonddf nomdmonisw
...

[    0.000000] AGP: Checking aperture...
[    0.000000] AGP: No AGP bridge found
[    0.000000] AGP: Node 0: aperture [bus addr 0x00000000-0x01ffffff] (32MB)
[    0.000000] AGP: Your BIOS doesn't leave a aperture memory hole
[    0.000000] AGP: Please enable the IOMMU option in the BIOS setup
[    0.000000] AGP: This costs you 64MB of RAM
[    0.000000] AGP: Mapping aperture over RAM [mem 0x94000000-0x97ffffff]
(65536KB)

strange to see above, as I'm pretty sure I have the IOMMU turned on ...
I'm pretty sure the machine does not have any agp slots, instead, there are two
PCIe x16 slots ... 
...
[    0.000000] DMI: ASUSTeK Computer INC. KGP(M)E-D16/KGP(M)E-D16, BIOS 3201   
02/19/2013
...
[    0.648524] pci 0000:00:14.4: can't claim BAR 8 [mem 0xf5800000-0xf8ffffff]:
address conflict with amd_iommu [mem 0xf6000000-0xf6003fff]

Note that one of the two graphics cards is a PCI card NOT a PCIe card!!! I
mention this because of the above BAR road-bump

00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 PCI to PCI
Bridge

[    1.947594] AMD-Vi: Found IOMMU at 0000:00:00.2 cap 0x40
[    1.947599] AMD-Vi: Interrupt remapping enabled
[    1.947617] pci 0000:00:00.2: irq 25 for MSI/MSI-X
[    1.958894] AMD-Vi: Lazy IO/TLB flushing enabled
[    2.042066] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)

[    4.009084] fbcon: nouveaufb (fb1) is primary device
[    4.009086] fbcon: Remapping primary device, fb1, to tty 1-63
[    4.044782] Switched to clocksource tsc
[    4.050013] nouveau  [     DRM] 0xC633: Parsing digital output script table
[    4.161782] nouveau E[     DRM] GPU lockup - switching to software fbcon


I have two DVI cables, one VGA cable.  The edid to the VGA fails ... it didn't
use to ... 

[   16.869739] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 178
[   16.869747] Raw EDID:
[   16.869749]          00 ff ff ff ff ff ff 00 04 72 a6 01 12 12 12 12
[   16.869751]          15 15 01 03 68 27 ff ff ff ff ff ff ff ff ff ff
etc. 
 it tries multiple times, gets different results ... 

Xorg.0.log shows no startup errors, but the framebuffer shows mostly
corruption.

kill -9 of X sends X into 100% cpu usage.  While it does that, this gets
logged:
Oct 31 15:36:35 fanny kernel: [ 2449.191822] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0002 [Xorg[2290]]
Oct 31 15:36:50 fanny kernel: [ 2464.194418] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0002 [Xorg[2290]]
Oct 31 15:37:05 fanny kernel: [ 2479.197017] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0001 [Xorg[2290]]
Oct 31 15:37:20 fanny kernel: [ 2494.199611] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0001 [Xorg[2290]]
Oct 31 15:37:35 fanny kernel: [ 2509.202213] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0000 [Xorg[2290]]
Oct 31 15:37:50 fanny kernel: [ 2524.204809] nouveau E[Xorg[2290]] failed to
idle channel 0xcccc0000 [Xorg[2290]]


After this, starting X a second time does not generate any video-out, so
monitors stay blanked. Nothing at all printed in /var/log/syslog. However
kern.log shows:

Oct 31 15:41:47 fanny kernel: [ 2761.045902] INFO: task kworker/10:1:135
blocked for more than 120 seconds.
Oct 31 15:41:47 fanny kernel: [ 2761.045912]       Not tainted 3.18.0-rc2-linas
#5
Oct 31 15:41:47 fanny kernel: [ 2761.045915] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Oct 31 15:41:47 fanny kernel: [ 2761.045920] kworker/10:1    D ffff88085dd53040
    0   135      2 0x00000000
Oct 31 15:41:47 fanny kernel: [ 2761.045959] Workqueue: events
output_poll_execute [drm_kms_helper]
Oct 31 15:41:47 fanny kernel: [ 2761.045964]  ffff88082ea0fc28 0000000000000002
ffff88082e9e1910 ffff88082ea0ffd8
Oct 31 15:41:47 fanny kernel: [ 2761.045971]  0000000000013040 0000000000013040
ffff880831f88000 ffff88082e9e1910
Oct 31 15:41:47 fanny kernel: [ 2761.045978]  ffff88082ea0fc38 ffff8808315a7898
ffff8808315a7946 ffff8808315a79c8
Oct 31 15:41:47 fanny kernel: [ 2761.045985] Call Trace:
Oct 31 15:41:47 fanny kernel: [ 2761.046000]  [&lt;ffffffff81592cf9&gt;]
schedule+0x29/0x70
Oct 31 15:41:47 fanny kernel: [ 2761.046010]  [&lt;ffffffff813cd64d&gt;]
rpm_resume+0x22d/0x620
Oct 31 15:41:47 fanny kernel: [ 2761.046020]  [&lt;ffffffff81080770&gt;] ?
prepare_to_wait_event+0x110/0x110
Oct 31 15:41:47 fanny kernel: [ 2761.046028]  [&lt;ffffffff813cda8d&gt;]
__pm_runtime_resume+0x4d/0x70
Oct 31 15:41:47 fanny kernel: [ 2761.046035]  [&lt;ffffffff8105a4f6&gt;] ?
__queue_delayed_work+0x166/0x1a0
Oct 31 15:41:47 fanny kernel: [ 2761.046106]  [&lt;ffffffffa040c2b6&gt;]
nouveau_connector_detect+0x66/0x3d0 [nouveau]
Oct 31 15:41:47 fanny kernel: [ 2761.046124]  [&lt;ffffffffa011c608&gt;]
output_poll_execute+0xb8/0x180 [drm_kms_helper]
Oct 31 15:41:47 fanny kernel: [ 2761.046132]  [&lt;ffffffff8105ab06&gt;]
process_one_work+0x146/0x400
Oct 31 15:41:47 fanny kernel: [ 2761.046139]  [&lt;ffffffff8105aee0&gt;]
worker_thread+0x120/0x490
Oct 31 15:41:47 fanny kernel: [ 2761.046146]  [&lt;ffffffff8105adc0&gt;] ?
process_one_work+0x400/0x400
Oct 31 15:41:47 fanny kernel: [ 2761.046153]  [&lt;ffffffff8105fd82&gt;]
kthread+0xd2/0xf0
Oct 31 15:41:47 fanny kernel: [ 2761.046159]  [&lt;ffffffff8105fcb0&gt;] ?
kthread_create_on_node+0x1a0/0x1a0
Oct 31 15:41:47 fanny kernel: [ 2761.046166]  [&lt;ffffffff8159722c&gt;]
ret_from_fork+0x7c/0xb0
Oct 31 15:41:47 fanny kernel: [ 2761.046172]  [&lt;ffffffff8105fcb0&gt;] ?
kthread_create_on_node+0x1a0/0x1a0
Oct 31 15:41:47 fanny kernel: [ 2761.046179] INFO: task kworker/3:1:175 blocked
for more than 120 seconds.
Oct 31 15:41:47 fanny kernel: [ 2761.046183]       Not tainted 3.18.0-rc2-linas
#5
Oct 31 15:41:47 fanny kernel: [ 2761.046186] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Oct 31 15:41:47 fanny kernel: [ 2761.046189] kworker/3:1     D ffff88085dc73040
    0   175      2 0x00000000
Oct 31 15:41:47 fanny kernel: [ 2761.046197] Workqueue: pm pm_runtime_work
Oct 31 15:41:47 fanny kernel: [ 2761.046201]  ffff88082e593bb8 0000000000000002
ffff88082ebbcb30 ffff88082e593fd8
Oct 31 15:41:47 fanny kernel: [ 2761.046207]  0000000000013040 0000000000013040
ffff880831f4cb30 ffff88082ebbcb30
Oct 31 15:41:47 fanny kernel: [ 2761.046214]  ffff88082e593bc8 ffff8808315a7898
ffff8808315a7946 ffff8808315a79c8
Oct 31 15:41:47 fanny kernel: [ 2761.046221] Call Trace:
Oct 31 15:41:47 fanny kernel: [ 2761.046229]  [&lt;ffffffff81592cf9&gt;]
schedule+0x29/0x70
Oct 31 15:41:47 fanny kernel: [ 2761.046236]  [&lt;ffffffff813cd64d&gt;]
rpm_resume+0x22d/0x620
Oct 31 15:41:47 fanny kernel: [ 2761.046243]  [&lt;ffffffff81080770&gt;] ?
prepare_to_wait_event+0x110/0x110
Oct 31 15:41:47 fanny kernel: [ 2761.046251]  [&lt;ffffffff813cdd5c&gt;]
pm_runtime_forbid+0x4c/0x60
Oct 31 15:41:47 fanny kernel: [ 2761.046310]  [&lt;ffffffffa03f6ba8&gt;]
nouveau_pmops_runtime_suspend+0xc8/0xf0 [nouveau]
Oct 31 15:41:47 fanny kernel: [ 2761.046320]  [&lt;ffffffff8131a8ba&gt;]
pci_pm_runtime_suspend+0x6a/0x120
Oct 31 15:41:47 fanny kernel: [ 2761.046326]  [&lt;ffffffff8131a850&gt;] ?
pci_pm_runtime_resume+0x100/0x100
Oct 31 15:41:47 fanny kernel: [ 2761.046332]  [&lt;ffffffff813cc4bd&gt;]
__rpm_callback+0x3d/0x90
Oct 31 15:41:47 fanny kernel: [ 2761.046338]  [&lt;ffffffff81059fd1&gt;] ?
try_to_grab_pending+0xb1/0x150
Oct 31 15:41:47 fanny kernel: [ 2761.046345]  [&lt;ffffffff813cc53f&gt;]
rpm_callback+0x2f/0x90
Oct 31 15:41:47 fanny kernel: [ 2761.046352]  [&lt;ffffffff813cca61&gt;]
rpm_suspend+0x111/0x640
Oct 31 15:41:47 fanny kernel: [ 2761.046359]  [&lt;ffffffff8106b251&gt;] ?
get_parent_ip+0x11/0x50
Oct 31 15:41:47 fanny kernel: [ 2761.046365]  [&lt;ffffffff8106b2e5&gt;] ?
preempt_count_add+0x55/0xb0
Oct 31 15:41:47 fanny kernel: [ 2761.046370]  [&lt;ffffffff813ce3f2&gt;]
pm_runtime_work+0x82/0xb0
Oct 31 15:41:47 fanny kernel: [ 2761.046377]  [&lt;ffffffff8105ab06&gt;]
process_one_work+0x146/0x400
Oct 31 15:41:47 fanny kernel: [ 2761.046384]  [&lt;ffffffff8105aee0&gt;]
worker_thread+0x120/0x490
Oct 31 15:41:47 fanny kernel: [ 2761.046391]  [&lt;ffffffff8105adc0&gt;] ?
process_one_work+0x400/0x400
Oct 31 15:41:47 fanny kernel: [ 2761.046396]  [&lt;ffffffff8105fd82&gt;]
kthread+0xd2/0xf0
Oct 31 15:41:47 fanny kernel: [ 2761.046403]  [&lt;ffffffff8105fcb0&gt;] ?
kthread_create_on_node+0x1a0/0x1a0
Oct 31 15:41:47 fanny kernel: [ 2761.046408]  [&lt;ffffffff8159722c&gt;]
ret_from_fork+0x7c/0xb0
Oct 31 15:41:47 fanny kernel: [ 2761.046414]  [&lt;ffffffff8105fcb0&gt;] ?
kthread_create_on_node+0x1a0/0x1a0



FWIW: my kernel has CONFIG_PM_CORE enabled, but much/most of the rest of ACPI
is not enabled (its not a laptop, and never gets turned off or rebooted).

Don't know if any of my rambling helped, but I conclude:

-- on latest rc kernel, with three-head, dual old graphics cards, one of which
is PCI not PCIe, that nouveau has multiple possibly unrelated issues ...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414788625.Ad212.10342--

--===============0608672379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0608672379==--
