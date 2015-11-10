From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92892] New: KDE Plasma locks up: Nouveau reports
 error "resource sanity check" "unable to handle kernel paging request"
Date: Tue, 10 Nov 2015 19:13:13 +0000
Message-ID: <bug-92892-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0955848792=="
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


--===============0955848792==
Content-Type: multipart/alternative; boundary="1447182793.ADb24b0.27510"; charset="UTF-8"


--1447182793.ADb24b0.27510
Date: Tue, 10 Nov 2015 19:13:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92892

            Bug ID: 92892
           Summary: KDE Plasma locks up: Nouveau reports error "resource
                    sanity check" "unable to handle kernel paging request"
           Product: Mesa
           Version: 11.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vlukas-Mmb7MZpHnFY@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 119547
  --> https://bugs.freedesktop.org/attachment.cgi?id=119547&action=edit
Dmesg from system start until and including the second time a kernel backtrace
appears

I was referred by my distributions bug tracking to report an error related to
the Nouveau drivers here.

I use the "Tumbleweed" distribution by Opensuse. This is a kind of rolling
release with package upgrades circa once a week. On 2015-11-08 I pulled that
distributions latest snapshot, which installed among not many other packages
Linux kernel version 4.3.0, which was an upgrade from 4.2.4.

Since then I experience grave issues when using the KDE desktop. Beginning on
that Sunday (i.e. 2015-11-08) after some time of using the desktop I noticed
that KDEs text editor ("Kwrite") would not start anymore when launched from the
file manager. Initially I thought this was an communcation problem inside KDE,
because I could restart the file manager and managed to open one text file. But
then, attempting to launch a second instance of Kwrite via the file mananger
failed again. I tried repeatedly and found that after very few attempts Kwrite
could not be launched anymore. At that time I could still interact with other,
running programs. But after some time the whole desktop locked up. Not even
switchting to a text console via Ctrl + F1 worked. The system had to be
rebooted.

I can now reproduce a whole desktop lockup by this simple procedure:

- Power on
- Login in KDM
- Pressing Alt + F2, then typing konsole in the mini command line
- Entering dmesg in Konsole window.
- Opening a second Konsole tab.
- In that new tab, typing kwrite. Kwrite is not launched successfully by that
attempt.


To gather information, I installed kernel version 4.2.4 from the distributions
package in parallel to 4.3.0.

When I boot 4.2.4, I can not reproduce the desktop lockups.

I have attached the complete dmesg output which stems from the procedure to
reproduce above. As you can see, there are some suspicious kernel backtraces
related to Nouveau. One of these backtraces is associated in time closely to
attempting to launch Kwrite, i.e. after I type "dmesg" for the first time I
only see one backtrace. Then, after entering kwrite I can request dmesg again
and spot the second kernel backtrace.

With slightly older kernel versions I also get these kernel backtraces in the
system log (journalctl), but I do NOT experience whole desktop lockups. With
even older kernel versions, I do not get these types of kernel backtraces. 
These are the lines from when journactl indicates a similar backtrace for the
first time: (The installed kernel must have been 4.2.3 as far as I can
determine through inspecting the package install history logfile.)
----- Kernel 4.2.3:
------------------------------------------------------------
Okt 27 15:42:10 linux-5rjk kernel: resource sanity check: requesting [mem
0xddf6d000-0xde06cfff], which spans more than 0000:01:00.0 [mem
0xdc000000-0xddffffff 64bit pref]
Okt 27 15:42:10 linux-5rjk kernel: ------------[ cut here ]------------
Okt 27 15:42:10 linux-5rjk kernel: WARNING: CPU: 0 PID: 5113 at
../arch/x86/mm/ioremap.c:198 __ioremap_caller+0x2de/0x360()
Okt 27 15:42:10 linux-5rjk kernel: Info: mapping multiple BARs. Your kernel is
fine.
Okt 27 15:42:10 linux-5rjk kernel: Modules linked in:
Okt 27 15:42:10 linux-5rjk kernel:  nf_log_ipv6 xt_pkttype nf_log_ipv4
nf_log_common xt_LOG xt_limit iscsi_ibft iscsi_boot_sysfs af_packet ip6t_REJECT
xt_tcpudp nf_conntrack_ipv6 nf_defrag_ipv6 ip6table_raw ipt_REJECT iptable_raw
xt_CT iptable_filter ip6table_mangle nf_conntrack_netbios_ns
nf_conntrack_broadcast nf_conntrack_ipv4 nf_defrag_ipv4 ip_tables xt_conntrack
nf_conntrack ip6table_filter ip6_tables x_tables snd_hda_codec_hdmi
snd_hda_codec_analog snd_hda_codec_generic iTCO_wdt gpio_ich
iTCO_vendor_support ppdev dm_mod coretemp kvm_intel kvm pcspkr i2c_i801
snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep lpc_ich mfd_core snd_pcm
asus_atk0110 8250_fintek parport_pc parport snd_timer nouveau snd mxm_wmi wmi
video ttm drm_kms_helper drm i2c_algo_bit acpi_cpufreq button processor shpchp
soundcore hid_generic usbhid
Okt 27 15:42:10 linux-5rjk kernel:  ata_generic serio_raw firewire_ohci
firewire_core crc_itu_t atl1 mii pata_jmicron ehci_pci uhci_hcd ehci_hcd
usbcore usb_common sg
Okt 27 15:42:10 linux-5rjk kernel: CPU: 0 PID: 5113 Comm: kwrite Not tainted
4.2.3-1-default #1
Okt 27 15:42:10 linux-5rjk kernel: Hardware name: System manufacturer System
Product Name/P5B-E, BIOS 1002    01/30/2007
Okt 27 15:42:10 linux-5rjk kernel:  ffffffff81a20135 ffff880180b93758
ffffffff81661dad 0000000000000007
Okt 27 15:42:10 linux-5rjk kernel:  ffff880180b937a8 ffff880180b93798
ffffffff81068246 ffffc90006cfffff
Okt 27 15:42:10 linux-5rjk kernel:  0000000000100000 ffffc90006c00000
00000000ddf6d000 0000000000000000
Okt 27 15:42:10 linux-5rjk kernel: Call Trace:
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff81007a15>]
try_stack_unwind+0x175/0x190
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff81006223>] dump_trace+0x93/0x3a0
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff81007a7f>]
show_trace_log_lvl+0x4f/0x60
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff8100663c>]
show_stack_log_lvl+0x10c/0x180
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff81007b15>] show_stack+0x25/0x50
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff81661dad>] dump_stack+0x4c/0x6e
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff81068246>]
warn_slowpath_common+0x86/0xc0
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff810682c6>]
warn_slowpath_fmt+0x46/0x50
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff8105425e>]
__ioremap_caller+0x2de/0x360
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff810542f7>]
ioremap_nocache+0x17/0x20
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa0234e72>]
nvkm_barobj_ctor+0xc2/0xf0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa02338d1>]
nvkm_object_ctor+0x31/0xd0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa0234ece>]
nvkm_bar_alloc+0x2e/0x40 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa023092d>]
nvkm_gpuobj_create_+0x26d/0x2a0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa023099d>]
_nvkm_gpuobj_ctor+0x3d/0x50 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa02338d1>]
nvkm_object_ctor+0x31/0xd0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa02309fc>]
nvkm_gpuobj_new+0x4c/0x50 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa0274f41>]
nvkm_vm_get+0x171/0x2c0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa02c4e9e>]
nouveau_bo_vma_add+0x2e/0x90 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa02d63c5>]
nouveau_channel_prep+0x215/0x2f0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa02d6511>]
nouveau_channel_new+0x71/0x700 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa02d53da>]
nouveau_abi16_ioctl_channel_alloc+0x12a/0x3f0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa01493a5>] drm_ioctl+0x125/0x610
[drm]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffffa02bdab0>]
nouveau_drm_ioctl+0x70/0xd0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff811f2bf5>]
do_vfs_ioctl+0x285/0x460
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff811f2e49>] SyS_ioctl+0x79/0x90
Okt 27 15:42:10 linux-5rjk kernel:  [<ffffffff81667e32>]
entry_SYSCALL_64_fastpath+0x16/0x75
Okt 27 15:42:10 linux-5rjk kernel: DWARF2 unwinder stuck at
entry_SYSCALL_64_fastpath+0x16/0x75
Okt 27 15:42:10 linux-5rjk kernel: 
Okt 27 15:42:10 linux-5rjk kernel: Leftover inexact backtrace:
Okt 27 15:42:10 linux-5rjk kernel: ---[ end trace d43371eb12dab49d ]---
Okt 27 15:42:10 linux-5rjk kernel: nouveau E[kwrite[5113]] channel failed to
initialise, -12
Okt 27 15:42:13 linux-5rjk kernel: SFW2-INext-DROP-DEFLT IN=enp3s0 OUT= MAC
[... cut long line, the reporter]
Okt 27 15:42:16 linux-5rjk kernel: SFW2-INext-DROP-DEFLT IN=enp3s0 OUT= MAC
[... cut long line, the reporter]
Okt 27 15:42:30 linux-5rjk kernel: resource sanity check: requesting [mem
0xddf6d000-0xde06cfff], which spans more than 0000:01:00.0 [mem
0xdc000000-0xddffffff 64bit pref]
Okt 27 15:42:30 linux-5rjk kernel: nouveau E[kwrite[5122]] channel failed to
initialise, -12
--------------------------------------------------------------------------------


For your information I have attached files showing the package install history
(only the most recent weeks), output of "hwinfo --gfx" and a bit of information
about installed packages (I hope you can make something out of the RPM output,
if not I am glad to supply any missing information). Of course I attached the
dmesg output as well, as written above.

For reference I opened this report in Opensuses bug tracking:
https://bugzilla.opensuse.org/show_bug.cgi?id=954473

For further information, for some time now (ca. since mid 2015) I also get
similar Nouveau failure message to those that are attached here:
https://bugs.freedesktop.org/show_bug.cgi?id=92504
But these do not usually provoke hard desktop lockups, and are only seen when I
also use Firefox, which I do sparingly. So that is likely a separate problem,
which has a weak relation to my recent troubles.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1447182793.ADb24b0.27510
Date: Tue, 10 Nov 2015 19:13:13 +0000
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
   title="NEW - KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892">92892</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.0
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>vlukas&#64;gmx.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=119547" name="attach_119547" title="Dmesg from system start until and including the second time a kernel backtrace appears">attachment 119547</a> <a href="attachment.cgi?id=119547&amp;action=edit" title="Dmesg from system start until and including the second time a kernel backtrace appears">[details]</a></span>
Dmesg from system start until and including the second time a kernel backtrace
appears

I was referred by my distributions bug tracking to report an error related to
the Nouveau drivers here.

I use the &quot;Tumbleweed&quot; distribution by Opensuse. This is a kind of rolling
release with package upgrades circa once a week. On 2015-11-08 I pulled that
distributions latest snapshot, which installed among not many other packages
Linux kernel version 4.3.0, which was an upgrade from 4.2.4.

Since then I experience grave issues when using the KDE desktop. Beginning on
that Sunday (i.e. 2015-11-08) after some time of using the desktop I noticed
that KDEs text editor (&quot;Kwrite&quot;) would not start anymore when launched from the
file manager. Initially I thought this was an communcation problem inside KDE,
because I could restart the file manager and managed to open one text file. But
then, attempting to launch a second instance of Kwrite via the file mananger
failed again. I tried repeatedly and found that after very few attempts Kwrite
could not be launched anymore. At that time I could still interact with other,
running programs. But after some time the whole desktop locked up. Not even
switchting to a text console via Ctrl + F1 worked. The system had to be
rebooted.

I can now reproduce a whole desktop lockup by this simple procedure:

- Power on
- Login in KDM
- Pressing Alt + F2, then typing konsole in the mini command line
- Entering dmesg in Konsole window.
- Opening a second Konsole tab.
- In that new tab, typing kwrite. Kwrite is not launched successfully by that
attempt.


To gather information, I installed kernel version 4.2.4 from the distributions
package in parallel to 4.3.0.

When I boot 4.2.4, I can not reproduce the desktop lockups.

I have attached the complete dmesg output which stems from the procedure to
reproduce above. As you can see, there are some suspicious kernel backtraces
related to Nouveau. One of these backtraces is associated in time closely to
attempting to launch Kwrite, i.e. after I type &quot;dmesg&quot; for the first time I
only see one backtrace. Then, after entering kwrite I can request dmesg again
and spot the second kernel backtrace.

With slightly older kernel versions I also get these kernel backtraces in the
system log (journalctl), but I do NOT experience whole desktop lockups. With
even older kernel versions, I do not get these types of kernel backtraces. 
These are the lines from when journactl indicates a similar backtrace for the
first time: (The installed kernel must have been 4.2.3 as far as I can
determine through inspecting the package install history logfile.)
----- Kernel 4.2.3:
------------------------------------------------------------
Okt 27 15:42:10 linux-5rjk kernel: resource sanity check: requesting [mem
0xddf6d000-0xde06cfff], which spans more than 0000:01:00.0 [mem
0xdc000000-0xddffffff 64bit pref]
Okt 27 15:42:10 linux-5rjk kernel: ------------[ cut here ]------------
Okt 27 15:42:10 linux-5rjk kernel: WARNING: CPU: 0 PID: 5113 at
../arch/x86/mm/ioremap.c:198 __ioremap_caller+0x2de/0x360()
Okt 27 15:42:10 linux-5rjk kernel: Info: mapping multiple BARs. Your kernel is
fine.
Okt 27 15:42:10 linux-5rjk kernel: Modules linked in:
Okt 27 15:42:10 linux-5rjk kernel:  nf_log_ipv6 xt_pkttype nf_log_ipv4
nf_log_common xt_LOG xt_limit iscsi_ibft iscsi_boot_sysfs af_packet ip6t_REJECT
xt_tcpudp nf_conntrack_ipv6 nf_defrag_ipv6 ip6table_raw ipt_REJECT iptable_raw
xt_CT iptable_filter ip6table_mangle nf_conntrack_netbios_ns
nf_conntrack_broadcast nf_conntrack_ipv4 nf_defrag_ipv4 ip_tables xt_conntrack
nf_conntrack ip6table_filter ip6_tables x_tables snd_hda_codec_hdmi
snd_hda_codec_analog snd_hda_codec_generic iTCO_wdt gpio_ich
iTCO_vendor_support ppdev dm_mod coretemp kvm_intel kvm pcspkr i2c_i801
snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep lpc_ich mfd_core snd_pcm
asus_atk0110 8250_fintek parport_pc parport snd_timer nouveau snd mxm_wmi wmi
video ttm drm_kms_helper drm i2c_algo_bit acpi_cpufreq button processor shpchp
soundcore hid_generic usbhid
Okt 27 15:42:10 linux-5rjk kernel:  ata_generic serio_raw firewire_ohci
firewire_core crc_itu_t atl1 mii pata_jmicron ehci_pci uhci_hcd ehci_hcd
usbcore usb_common sg
Okt 27 15:42:10 linux-5rjk kernel: CPU: 0 PID: 5113 Comm: kwrite Not tainted
4.2.3-1-default #1
Okt 27 15:42:10 linux-5rjk kernel: Hardware name: System manufacturer System
Product Name/P5B-E, BIOS 1002    01/30/2007
Okt 27 15:42:10 linux-5rjk kernel:  ffffffff81a20135 ffff880180b93758
ffffffff81661dad 0000000000000007
Okt 27 15:42:10 linux-5rjk kernel:  ffff880180b937a8 ffff880180b93798
ffffffff81068246 ffffc90006cfffff
Okt 27 15:42:10 linux-5rjk kernel:  0000000000100000 ffffc90006c00000
00000000ddf6d000 0000000000000000
Okt 27 15:42:10 linux-5rjk kernel: Call Trace:
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff81007a15&gt;]
try_stack_unwind+0x175/0x190
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff81006223&gt;] dump_trace+0x93/0x3a0
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff81007a7f&gt;]
show_trace_log_lvl+0x4f/0x60
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff8100663c&gt;]
show_stack_log_lvl+0x10c/0x180
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff81007b15&gt;] show_stack+0x25/0x50
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff81661dad&gt;] dump_stack+0x4c/0x6e
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff81068246&gt;]
warn_slowpath_common+0x86/0xc0
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff810682c6&gt;]
warn_slowpath_fmt+0x46/0x50
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff8105425e&gt;]
__ioremap_caller+0x2de/0x360
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff810542f7&gt;]
ioremap_nocache+0x17/0x20
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa0234e72&gt;]
nvkm_barobj_ctor+0xc2/0xf0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa02338d1&gt;]
nvkm_object_ctor+0x31/0xd0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa0234ece&gt;]
nvkm_bar_alloc+0x2e/0x40 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa023092d&gt;]
nvkm_gpuobj_create_+0x26d/0x2a0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa023099d&gt;]
_nvkm_gpuobj_ctor+0x3d/0x50 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa02338d1&gt;]
nvkm_object_ctor+0x31/0xd0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa02309fc&gt;]
nvkm_gpuobj_new+0x4c/0x50 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa0274f41&gt;]
nvkm_vm_get+0x171/0x2c0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa02c4e9e&gt;]
nouveau_bo_vma_add+0x2e/0x90 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa02d63c5&gt;]
nouveau_channel_prep+0x215/0x2f0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa02d6511&gt;]
nouveau_channel_new+0x71/0x700 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa02d53da&gt;]
nouveau_abi16_ioctl_channel_alloc+0x12a/0x3f0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa01493a5&gt;] drm_ioctl+0x125/0x610
[drm]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffffa02bdab0&gt;]
nouveau_drm_ioctl+0x70/0xd0 [nouveau]
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff811f2bf5&gt;]
do_vfs_ioctl+0x285/0x460
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff811f2e49&gt;] SyS_ioctl+0x79/0x90
Okt 27 15:42:10 linux-5rjk kernel:  [&lt;ffffffff81667e32&gt;]
entry_SYSCALL_64_fastpath+0x16/0x75
Okt 27 15:42:10 linux-5rjk kernel: DWARF2 unwinder stuck at
entry_SYSCALL_64_fastpath+0x16/0x75
Okt 27 15:42:10 linux-5rjk kernel: 
Okt 27 15:42:10 linux-5rjk kernel: Leftover inexact backtrace:
Okt 27 15:42:10 linux-5rjk kernel: ---[ end trace d43371eb12dab49d ]---
Okt 27 15:42:10 linux-5rjk kernel: nouveau E[kwrite[5113]] channel failed to
initialise, -12
Okt 27 15:42:13 linux-5rjk kernel: SFW2-INext-DROP-DEFLT IN=enp3s0 OUT= MAC
[... cut long line, the reporter]
Okt 27 15:42:16 linux-5rjk kernel: SFW2-INext-DROP-DEFLT IN=enp3s0 OUT= MAC
[... cut long line, the reporter]
Okt 27 15:42:30 linux-5rjk kernel: resource sanity check: requesting [mem
0xddf6d000-0xde06cfff], which spans more than 0000:01:00.0 [mem
0xdc000000-0xddffffff 64bit pref]
Okt 27 15:42:30 linux-5rjk kernel: nouveau E[kwrite[5122]] channel failed to
initialise, -12
--------------------------------------------------------------------------------


For your information I have attached files showing the package install history
(only the most recent weeks), output of &quot;hwinfo --gfx&quot; and a bit of information
about installed packages (I hope you can make something out of the RPM output,
if not I am glad to supply any missing information). Of course I attached the
dmesg output as well, as written above.

For reference I opened this report in Opensuses bug tracking:
<a href="https://bugzilla.opensuse.org/show_bug.cgi?id=954473">https://bugzilla.opensuse.org/show_bug.cgi?id=954473</a>

For further information, for some time now (ca. since mid 2015) I also get
similar Nouveau failure message to those that are attached here:
<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVA5] Corruption in Plasma 5 on resume -- set_domain failures"
   href="show_bug.cgi?id=92504">https://bugs.freedesktop.org/show_bug.cgi?id=92504</a>
But these do not usually provoke hard desktop lockups, and are only seen when I
also use Firefox, which I do sparingly. So that is likely a separate problem,
which has a weak relation to my recent troubles.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447182793.ADb24b0.27510--

--===============0955848792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0955848792==--
