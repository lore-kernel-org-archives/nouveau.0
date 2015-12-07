From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91413] INFO: task Xorg:2419 blocked for more than
	120 seconds.
Date: Mon, 07 Dec 2015 01:26:47 +0000
Message-ID: <bug-91413-8800-Nbfk63ToJZ@http.bugs.freedesktop.org/>
References: <bug-91413-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0672901368=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91413-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0672901368==
Content-Type: multipart/alternative; boundary="1449451607.fb543.10042"; charset="UTF-8"


--1449451607.fb543.10042
Date: Mon, 7 Dec 2015 01:26:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91413

--- Comment #7 from joshchia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
On kernel 4.2.6, I got a similar crash. The CPU locked up. The machine was
doing some heavy computation on many processors. After removing the nouveau
module, the problem went away.

Dec 06 18:51:50 bullseye kernel: WARNING: CPU: 0 PID: 19974 at
kernel/watchdog.c:338 watchdog_overflow_callback+0x79/0xa0()
Dec 06 18:51:50 bullseye kernel: Watchdog detected hard LOCKUP on cpu 0
Dec 06 18:51:50 bullseye kernel: Modules linked in:
Dec 06 18:51:50 bullseye kernel:  ip6t_rpfilter ip6t_REJECT nf_reject_ipv6
xt_conntrack ebtable_nat ebtable_broute bridge stp llc ebtable_filter ebtables
ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle
ip6table_security ip6table_raw ip6table_filter ip6_tables iptable_nat
nf_conntrack_ipv4
Dec 06 18:51:50 bullseye kernel:  crc32_pclmul crc32c_intel drm serio_raw uas
usb_storage hpsa ata_generic pata_acpi wmi
Dec 06 18:51:50 bullseye kernel: CPU: 0 PID: 19974 Comm: redacted Not tainted
4.2.6-201.fc22.x86_64 #1
Dec 06 18:51:50 bullseye kernel: Hardware name: HP ProLiant DL360p Gen8, BIOS
P71 07/01/2015
Dec 06 18:51:50 bullseye kernel:  0000000000000000 000000009a975639
ffff880fff605aa0 ffffffff817729ea
Dec 06 18:51:50 bullseye kernel:  0000000000000000 ffff880fff605af8
ffff880fff605ae0 ffffffff8109e4b6
Dec 06 18:51:50 bullseye kernel:  0000000000000000 ffff881ff92ae000
0000000000000000 ffff880fff605c00
Dec 06 18:51:50 bullseye kernel: Call Trace:
Dec 06 18:51:50 bullseye kernel:  <NMI>  [<ffffffff817729ea>]
dump_stack+0x45/0x57
Dec 06 18:51:50 bullseye kernel:  [<ffffffff8109e4b6>]
warn_slowpath_common+0x86/0xc0
Dec 06 18:51:50 bullseye kernel:  [<ffffffff8109e545>]
warn_slowpath_fmt+0x55/0x70
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81153029>]
watchdog_overflow_callback+0x79/0xa0
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81197f50>]
__perf_event_overflow+0x90/0x1c0
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81198b54>]
perf_event_overflow+0x14/0x20
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81033af7>]
intel_pmu_handle_irq+0x1e7/0x470
Dec 06 18:51:50 bullseye kernel:  [<ffffffff8102a3e6>]
perf_event_nmi_handler+0x26/0x40
Dec 06 18:51:50 bullseye kernel:  [<ffffffff810188b3>] nmi_handle+0x83/0x120
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81018df2>] default_do_nmi+0x42/0xf0
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81018f8a>] do_nmi+0xea/0x140
Dec 06 18:51:50 bullseye kernel:  [<ffffffff8177b701>] end_repeat_nmi+0x1a/0x1e
Dec 06 18:51:50 bullseye kernel:  [<ffffffff810e677c>] ?
queued_spin_lock_slowpath+0x15c/0x170
Dec 06 18:51:50 bullseye kernel:  [<ffffffff810e677c>] ?
queued_spin_lock_slowpath+0x15c/0x170
Dec 06 18:51:50 bullseye kernel:  [<ffffffff810e677c>] ?
queued_spin_lock_slowpath+0x15c/0x170
Dec 06 18:51:50 bullseye kernel:  <<EOE>>  <IRQ>  [<ffffffff817791df>]
_raw_spin_lock_irqsave+0x3f/0x50
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa0218cbe>]
nvkm_fantog_update+0x4e/0x120 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa0218de5>]
nvkm_fantog_set+0x35/0x40 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa02182cc>]
nvkm_fan_update+0xec/0x1e0 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa02183f9>]
nvkm_therm_fan_set+0x19/0x20 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa0217bfc>]
nvkm_therm_update+0x11c/0x2d0 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa0217dca>]
nvkm_therm_alarm+0x1a/0x20 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa021b472>]
nv04_timer_alarm_trigger+0x122/0x170 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa021b521>]
nv04_timer_alarm+0x61/0xc0 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa0218d82>]
nvkm_fantog_update+0x112/0x120 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa0218daa>]
nvkm_fantog_alarm+0x1a/0x20 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa021b472>]
nv04_timer_alarm_trigger+0x122/0x170 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa021b5e2>]
nv04_timer_intr+0x62/0x80 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffffa021211b>] nvkm_mc_intr+0xfb/0x170
[nouveau]
Dec 06 18:51:50 bullseye kernel:  [<ffffffff810f5ff4>]
handle_irq_event_percpu+0x74/0x180
Dec 06 18:51:50 bullseye kernel:  [<ffffffff810f6130>]
handle_irq_event+0x30/0x60
Dec 06 18:51:50 bullseye kernel:  [<ffffffff810f944f>]
handle_edge_irq+0x6f/0x130
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81016e62>] handle_irq+0x72/0x120
Dec 06 18:51:50 bullseye kernel:  [<ffffffff8177c01f>] do_IRQ+0x4f/0xe0
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81779f2b>]
common_interrupt+0x6b/0x6b
Dec 06 18:51:50 bullseye kernel:  <EOI>
Dec 06 18:51:50 bullseye kernel: ---[ end trace c72347df4d25d0c7 ]---
Dec 06 18:51:50 bullseye kernel: INFO: rcu_sched detected stalls on CPUs/tasks:
{ 0} (detected by 17, t=60002 jiffies, g=184581, c=184580, q=0)
Dec 06 18:51:50 bullseye kernel: Task dump for CPU 0:
Dec 06 18:51:50 bullseye kernel: redacted        R  running task        0 19974
  3145 0x00000008
Dec 06 18:51:50 bullseye kernel:  ffff8819589e7b98 ffff881ff7e69800
ffffffffffffff74 0000000000000028
Dec 06 18:51:50 bullseye kernel:  0000000000000000 0000000000000020
ffff8819589e7b98 ffffffff8164869c
Dec 06 18:51:50 bullseye kernel:  0000000000000000 ffff881ff7e69800
ffff8819589e7bc8 ffffffff816c1c80
Dec 06 18:51:50 bullseye kernel: Call Trace:
Dec 06 18:51:50 bullseye kernel:  [<ffffffff8164869c>] ?
sk_reset_timer+0x1c/0x30
Dec 06 18:51:50 bullseye kernel:  [<ffffffff816c1c80>]
tcp_send_delayed_ack+0x100/0x130
Dec 06 18:51:50 bullseye kernel:  [<ffffffff816b36cd>]
__tcp_ack_snd_check+0x6d/0x90
Dec 06 18:51:50 bullseye kernel:  [<ffffffff816bb4fc>]
tcp_rcv_established+0x4cc/0x780
Dec 06 18:51:50 bullseye kernel:  [<ffffffff813aeac9>] ?
copy_to_iter+0x79/0x260
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81778f2a>] ?
_raw_write_unlock_bh+0x1a/0x20
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81778f3e>] ?
_raw_spin_unlock_bh+0xe/0x10
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81648f66>] ?
release_sock+0x106/0x150
Dec 06 18:51:50 bullseye kernel:  [<ffffffff810d28af>] ?
numa_migrate_preferred+0x2f/0x90
Dec 06 18:51:50 bullseye kernel:  [<ffffffff810d686d>] ?
task_numa_fault+0x7bd/0xae0
Dec 06 18:51:50 bullseye kernel:  [<ffffffff811d5f81>] ?
handle_mm_fault+0xb81/0x17d0
Dec 06 18:51:50 bullseye kernel:  [<ffffffff816447cb>] ? sock_recvmsg+0x3b/0x50
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81644a16>] ?
SYSC_recvfrom+0xd6/0x150
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81065454>] ?
__do_page_fault+0x1b4/0x400
Dec 06 18:51:50 bullseye kernel:  [<ffffffff81774d11>] ? __schedule+0x371/0x950
Dec 06 18:51:50 bullseye kernel:  [<ffffffff810656cf>] ?
do_page_fault+0x2f/0x80
Dec 06 18:51:50 bullseye kernel:  [<ffffffff8177b378>] ? page_fault+0x28/0x30

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449451607.fb543.10042
Date: Mon, 7 Dec 2015 01:26:47 +0000
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
   title="NEW - INFO: task Xorg:2419 blocked for more than 120 seconds."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91413#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INFO: task Xorg:2419 blocked for more than 120 seconds."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91413">bug 91413</a>
              from <span class="vcard"><a class="email" href="mailto:joshchia&#64;gmail.com" title="joshchia&#64;gmail.com">joshchia&#64;gmail.com</a>
</span></b>
        <pre>On kernel 4.2.6, I got a similar crash. The CPU locked up. The machine was
doing some heavy computation on many processors. After removing the nouveau
module, the problem went away.

Dec 06 18:51:50 bullseye kernel: WARNING: CPU: 0 PID: 19974 at
kernel/watchdog.c:338 watchdog_overflow_callback+0x79/0xa0()
Dec 06 18:51:50 bullseye kernel: Watchdog detected hard LOCKUP on cpu 0
Dec 06 18:51:50 bullseye kernel: Modules linked in:
Dec 06 18:51:50 bullseye kernel:  ip6t_rpfilter ip6t_REJECT nf_reject_ipv6
xt_conntrack ebtable_nat ebtable_broute bridge stp llc ebtable_filter ebtables
ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle
ip6table_security ip6table_raw ip6table_filter ip6_tables iptable_nat
nf_conntrack_ipv4
Dec 06 18:51:50 bullseye kernel:  crc32_pclmul crc32c_intel drm serio_raw uas
usb_storage hpsa ata_generic pata_acpi wmi
Dec 06 18:51:50 bullseye kernel: CPU: 0 PID: 19974 Comm: redacted Not tainted
4.2.6-201.fc22.x86_64 #1
Dec 06 18:51:50 bullseye kernel: Hardware name: HP ProLiant DL360p Gen8, BIOS
P71 07/01/2015
Dec 06 18:51:50 bullseye kernel:  0000000000000000 000000009a975639
ffff880fff605aa0 ffffffff817729ea
Dec 06 18:51:50 bullseye kernel:  0000000000000000 ffff880fff605af8
ffff880fff605ae0 ffffffff8109e4b6
Dec 06 18:51:50 bullseye kernel:  0000000000000000 ffff881ff92ae000
0000000000000000 ffff880fff605c00
Dec 06 18:51:50 bullseye kernel: Call Trace:
Dec 06 18:51:50 bullseye kernel:  &lt;NMI&gt;  [&lt;ffffffff817729ea&gt;]
dump_stack+0x45/0x57
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff8109e4b6&gt;]
warn_slowpath_common+0x86/0xc0
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff8109e545&gt;]
warn_slowpath_fmt+0x55/0x70
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81153029&gt;]
watchdog_overflow_callback+0x79/0xa0
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81197f50&gt;]
__perf_event_overflow+0x90/0x1c0
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81198b54&gt;]
perf_event_overflow+0x14/0x20
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81033af7&gt;]
intel_pmu_handle_irq+0x1e7/0x470
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff8102a3e6&gt;]
perf_event_nmi_handler+0x26/0x40
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff810188b3&gt;] nmi_handle+0x83/0x120
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81018df2&gt;] default_do_nmi+0x42/0xf0
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81018f8a&gt;] do_nmi+0xea/0x140
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff8177b701&gt;] end_repeat_nmi+0x1a/0x1e
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff810e677c&gt;] ?
queued_spin_lock_slowpath+0x15c/0x170
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff810e677c&gt;] ?
queued_spin_lock_slowpath+0x15c/0x170
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff810e677c&gt;] ?
queued_spin_lock_slowpath+0x15c/0x170
Dec 06 18:51:50 bullseye kernel:  &lt;&lt;EOE&gt;&gt;  &lt;IRQ&gt;  [&lt;ffffffff817791df&gt;]
_raw_spin_lock_irqsave+0x3f/0x50
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa0218cbe&gt;]
nvkm_fantog_update+0x4e/0x120 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa0218de5&gt;]
nvkm_fantog_set+0x35/0x40 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa02182cc&gt;]
nvkm_fan_update+0xec/0x1e0 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa02183f9&gt;]
nvkm_therm_fan_set+0x19/0x20 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa0217bfc&gt;]
nvkm_therm_update+0x11c/0x2d0 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa0217dca&gt;]
nvkm_therm_alarm+0x1a/0x20 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa021b472&gt;]
nv04_timer_alarm_trigger+0x122/0x170 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa021b521&gt;]
nv04_timer_alarm+0x61/0xc0 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa0218d82&gt;]
nvkm_fantog_update+0x112/0x120 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa0218daa&gt;]
nvkm_fantog_alarm+0x1a/0x20 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa021b472&gt;]
nv04_timer_alarm_trigger+0x122/0x170 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa021b5e2&gt;]
nv04_timer_intr+0x62/0x80 [nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffffa021211b&gt;] nvkm_mc_intr+0xfb/0x170
[nouveau]
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff810f5ff4&gt;]
handle_irq_event_percpu+0x74/0x180
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff810f6130&gt;]
handle_irq_event+0x30/0x60
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff810f944f&gt;]
handle_edge_irq+0x6f/0x130
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81016e62&gt;] handle_irq+0x72/0x120
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff8177c01f&gt;] do_IRQ+0x4f/0xe0
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81779f2b&gt;]
common_interrupt+0x6b/0x6b
Dec 06 18:51:50 bullseye kernel:  &lt;EOI&gt;
Dec 06 18:51:50 bullseye kernel: ---[ end trace c72347df4d25d0c7 ]---
Dec 06 18:51:50 bullseye kernel: INFO: rcu_sched detected stalls on CPUs/tasks:
{ 0} (detected by 17, t=60002 jiffies, g=184581, c=184580, q=0)
Dec 06 18:51:50 bullseye kernel: Task dump for CPU 0:
Dec 06 18:51:50 bullseye kernel: redacted        R  running task        0 19974
  3145 0x00000008
Dec 06 18:51:50 bullseye kernel:  ffff8819589e7b98 ffff881ff7e69800
ffffffffffffff74 0000000000000028
Dec 06 18:51:50 bullseye kernel:  0000000000000000 0000000000000020
ffff8819589e7b98 ffffffff8164869c
Dec 06 18:51:50 bullseye kernel:  0000000000000000 ffff881ff7e69800
ffff8819589e7bc8 ffffffff816c1c80
Dec 06 18:51:50 bullseye kernel: Call Trace:
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff8164869c&gt;] ?
sk_reset_timer+0x1c/0x30
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff816c1c80&gt;]
tcp_send_delayed_ack+0x100/0x130
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff816b36cd&gt;]
__tcp_ack_snd_check+0x6d/0x90
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff816bb4fc&gt;]
tcp_rcv_established+0x4cc/0x780
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff813aeac9&gt;] ?
copy_to_iter+0x79/0x260
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81778f2a&gt;] ?
_raw_write_unlock_bh+0x1a/0x20
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81778f3e&gt;] ?
_raw_spin_unlock_bh+0xe/0x10
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81648f66&gt;] ?
release_sock+0x106/0x150
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff810d28af&gt;] ?
numa_migrate_preferred+0x2f/0x90
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff810d686d&gt;] ?
task_numa_fault+0x7bd/0xae0
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff811d5f81&gt;] ?
handle_mm_fault+0xb81/0x17d0
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff816447cb&gt;] ? sock_recvmsg+0x3b/0x50
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81644a16&gt;] ?
SYSC_recvfrom+0xd6/0x150
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81065454&gt;] ?
__do_page_fault+0x1b4/0x400
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff81774d11&gt;] ? __schedule+0x371/0x950
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff810656cf&gt;] ?
do_page_fault+0x2f/0x80
Dec 06 18:51:50 bullseye kernel:  [&lt;ffffffff8177b378&gt;] ? page_fault+0x28/0x30</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449451607.fb543.10042--

--===============0672901368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0672901368==--
