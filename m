From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97021] New: Screen locks up randomly while only
 mouse pointer moves, system responsive via ssh
Date: Thu, 21 Jul 2016 12:13:32 +0000
Message-ID: <bug-97021-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1212076164=="
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


--===============1212076164==
Content-Type: multipart/alternative; boundary="14691032130.EbFb5.31900";
 charset="UTF-8"


--14691032130.EbFb5.31900
Date: Thu, 21 Jul 2016 12:13:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97021

            Bug ID: 97021
           Summary: Screen locks up randomly while only mouse pointer
                    moves, system responsive via ssh
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ali.parsai-KK0ffGbhmjU@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 125225
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125225&action=3Dedit
complete dmesg I retrieved using ssh

Screen locks up and becomes unresponsive randomly (mainly while playing a
video). The strange thing is the mouse pointer moves if I move the mouse. T=
he=20
sound also continues to play normally. Here's the relevant dmesg part. The
system is responsive (although poorly) via ssh when this happens. If more
details are needed, please let me know, and I will try to get them via ssh =
when
it locks up.


[ 4011.789011] nouveau 0000:01:00.0: fifo: read fault at 0007960000 engine =
1b
[CE2] client 18 [GR_CE] reason 02 [PTE] on channel 6 [003f829000
opera-developer[5101]]
[ 4011.789021] nouveau 0000:01:00.0: fifo: ce2 engine fault on channel 6,
recovering...
[ 4016.083636] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4020.378575] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4024.673513] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4028.968450] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4033.263426] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4036.404132] NMI watchdog: BUG: soft lockup - CPU#4 stuck for 23s!
[kworker/4:1:6743]
[ 4036.404135] Modules linked in: xt_tcpudp(E) iptable_filter(E) pci_stub(E)
vboxpci(OE) vboxnetadp(OE) vboxnetflt(OE) vboxdrv(OE) ipt_MASQUERADE(E)
nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv=
4(E)
nf_nat_ipv4(E) nf_nat(E) nf_conntrack(E) ip_tables(E) x_tables(E) usblp(E)
snd_hda_codec_hdmi(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E)
joydev(E) snd_hda_intel(E) hid_logitech_hidpp(E) snd_hda_codec(E) bnep(E)
snd_hda_core(E) rfcomm(E) snd_hwdep(E) bluetooth(E) kvm_amd(E) snd_pcm(E)
kvm(E) snd_seq_midi(E) snd_seq_midi_event(E) snd_rawmidi(E) irqbypass(E)
snd_seq(E) edac_mce_amd(E) edac_core(E) serio_raw(E) snd_seq_device(E)
dm_multipath(E) snd_timer(E) k10temp(E) snd(E) soundcore(E) shpchp(E)
i2c_piix4(E) parport_pc(E) ppdev(E) it87(E) hwmon_vid(E) nfsd(E) binfmt_mis=
c(E)
auth_rpcgss(E) nfs_acl(E) lp(E) parport(E) nfs(E) lockd(E) grace(E) sunrpc(=
E)
fscache(E) xfs(E) libcrc32c(E) reiserfs(E) dm_mirror(E) dm_region_hash(E)
dm_log(E) hid_logitech_dj(E) pata_acpi(E) nouveau(E) mxm_wmi(E) video(E)
i2c_algo_bit(E) ttm(E) hid_generic(E) drm_kms_helper(E) usbhid(E) 8139too(E)
syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) hid(E) 8139cp(E)
r8169(E) ahci(E) pata_atiixp(E) mii(E) libahci(E) drm(E) wmi(E)
[ 4036.404204] CPU: 4 PID: 6743 Comm: kworker/4:1 Tainted: G           OE=
=20=20
4.5.3 #1
[ 4036.404206] Hardware name: Gigabyte Technology Co., Ltd.
GA-970A-DS3/GA-970A-DS3, BIOS F6 10/23/2012
[ 4036.404269] Workqueue: events gk104_fifo_recover_work [nouveau]
[ 4036.404272] task: ffff8801fd3e5b00 ti: ffff88006e148000 task.ti:
ffff88006e148000
[ 4036.404274] RIP: 0010:[<ffffffffc0241d95>]  [<ffffffffc0241d95>]
gk104_fifo_recover_work+0x95/0x280 [nouveau]
[ 4036.404319] RSP: 0018:ffff88006e14bde0  EFLAGS: 00000206
[ 4036.404322] RAX: 0000000000000021 RBX: 0000000200000000 RCX:
0000000000000021
[ 4036.404324] RDX: 0000000000000001 RSI: 0000000000000282 RDI:
0000000000000282
[ 4036.404326] RBP: ffff88006e14be18 R08: ffff880098294b40 R09:
00000001802a001b
[ 4036.404328] R10: 0000000098294d01 R11: 0000000000008000 R12:
0000000200000000
[ 4036.404330] R13: 0000000000000001 R14: ffff880231edec00 R15:
ffff880231980ae0
[ 4036.404333] FS:  00007f49e9885700(0000) GS:ffff88023fd00000(0000)
knlGS:0000000000000000
[ 4036.404335] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[ 4036.404337] CR2: 00007f4d3f20d008 CR3: 0000000233f31000 CR4:
00000000000006e0
[ 4036.404339] Stack:
[ 4036.404341]  ffff880098294b40 ffff880231980800 ffff8801e5b35240
ffff88023fd16300
[ 4036.404344]  ffff88023fd1ac00 0000000000000100 ffff880231980ae0
ffff88006e14be60
[ 4036.404348]  ffffffff81093ac3 00000000e5b35270 0000000000000000
ffff88023fd16320
[ 4036.404351] Call Trace:
[ 4036.404358]  [<ffffffff81093ac3>] process_one_work+0x153/0x3f0
[ 4036.404361]  [<ffffffff8109428a>] worker_thread+0x12a/0x4b0
[ 4036.404365]  [<ffffffff817daf0a>] ? __schedule+0x35a/0x970
[ 4036.404368]  [<ffffffff81094160>] ? rescuer_thread+0x350/0x350
[ 4036.404372]  [<ffffffff81099a99>] kthread+0xc9/0xe0
[ 4036.404376]  [<ffffffff810999d0>] ? kthread_park+0x60/0x60
[ 4036.404380]  [<ffffffff817df20f>] ret_from_fork+0x3f/0x70
[ 4036.404383]  [<ffffffff810999d0>] ? kthread_park+0x60/0x60
[ 4036.404385] Code: f8 11 0f 87 9a 01 00 00 ff 24 c5 f8 ea 2b c0 b8 02 00 =
00
00 41 09 c5 b8 fe ff ff ff d3 c0 48 98 49 21 c4 f3 49 0f bc c4 4d 85 e4 <75=
> cd
49 8b 86 80 00 00 00 48 8d b8 30 26 00 00 e8 16 be 19 c1=20
[ 4037.558363] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4041.853302] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4046.148240] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4050.443181] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4054.738121] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4059.033058] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4063.327996] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4064.404618] NMI watchdog: BUG: soft lockup - CPU#4 stuck for 23s!
[kworker/4:1:6743]
[ 4064.404620] Modules linked in: xt_tcpudp(E) iptable_filter(E) pci_stub(E)
vboxpci(OE) vboxnetadp(OE) vboxnetflt(OE) vboxdrv(OE) ipt_MASQUERADE(E)
nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv=
4(E)
nf_nat_ipv4(E) nf_nat(E) nf_conntrack(E) ip_tables(E) x_tables(E) usblp(E)
snd_hda_codec_hdmi(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E)
joydev(E) snd_hda_intel(E) hid_logitech_hidpp(E) snd_hda_codec(E) bnep(E)
snd_hda_core(E) rfcomm(E) snd_hwdep(E) bluetooth(E) kvm_amd(E) snd_pcm(E)
kvm(E) snd_seq_midi(E) snd_seq_midi_event(E) snd_rawmidi(E) irqbypass(E)
snd_seq(E) edac_mce_amd(E) edac_core(E) serio_raw(E) snd_seq_device(E)
dm_multipath(E) snd_timer(E) k10temp(E) snd(E) soundcore(E) shpchp(E)
i2c_piix4(E) parport_pc(E) ppdev(E) it87(E) hwmon_vid(E) nfsd(E) binfmt_mis=
c(E)
auth_rpcgss(E) nfs_acl(E) lp(E) parport(E) nfs(E) lockd(E) grace(E) sunrpc(=
E)
fscache(E) xfs(E) libcrc32c(E) reiserfs(E) dm_mirror(E) dm_region_hash(E)
dm_log(E) hid_logitech_dj(E) pata_acpi(E) nouveau(E) mxm_wmi(E) video(E)
i2c_algo_bit(E) ttm(E) hid_generic(E) drm_kms_helper(E) usbhid(E) 8139too(E)
syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) hid(E) 8139cp(E)
r8169(E) ahci(E) pata_atiixp(E) mii(E) libahci(E) drm(E) wmi(E)
[ 4064.404683] CPU: 4 PID: 6743 Comm: kworker/4:1 Tainted: G           OEL=
=20
4.5.3 #1
[ 4064.404685] Hardware name: Gigabyte Technology Co., Ltd.
GA-970A-DS3/GA-970A-DS3, BIOS F6 10/23/2012
[ 4064.404746] Workqueue: events gk104_fifo_recover_work [nouveau]
[ 4064.404750] task: ffff8801fd3e5b00 ti: ffff88006e148000 task.ti:
ffff88006e148000
[ 4064.404752] RIP: 0010:[<ffffffffc0241d92>]  [<ffffffffc0241d92>]
gk104_fifo_recover_work+0x92/0x280 [nouveau]
[ 4064.404796] RSP: 0018:ffff88006e14bde0  EFLAGS: 00000206
[ 4064.404799] RAX: 0000000000000021 RBX: 0000000200000000 RCX:
0000000000000021
[ 4064.404801] RDX: 0000000000000001 RSI: 0000000000000282 RDI:
0000000000000282
[ 4064.404803] RBP: ffff88006e14be18 R08: ffff880098294b40 R09:
00000001802a001b
[ 4064.404805] R10: 0000000098294d01 R11: 0000000000008000 R12:
0000000200000000
[ 4064.404807] R13: 0000000000000001 R14: ffff880231edec00 R15:
ffff880231980ae0
[ 4064.404809] FS:  00007f49e9885700(0000) GS:ffff88023fd00000(0000)
knlGS:0000000000000000
[ 4064.404811] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[ 4064.404813] CR2: 00007f4d3f20d008 CR3: 0000000233f31000 CR4:
00000000000006e0
[ 4064.404816] Stack:
[ 4064.404817]  ffff880098294b40 ffff880231980800 ffff8801e5b35240
ffff88023fd16300
[ 4064.404821]  ffff88023fd1ac00 0000000000000100 ffff880231980ae0
ffff88006e14be60
[ 4064.404824]  ffffffff81093ac3 00000000e5b35270 0000000000000000
ffff88023fd16320
[ 4064.404827] Call Trace:
[ 4064.404834]  [<ffffffff81093ac3>] process_one_work+0x153/0x3f0
[ 4064.404837]  [<ffffffff8109428a>] worker_thread+0x12a/0x4b0
[ 4064.404841]  [<ffffffff817daf0a>] ? __schedule+0x35a/0x970
[ 4064.404844]  [<ffffffff81094160>] ? rescuer_thread+0x350/0x350
[ 4064.404848]  [<ffffffff81099a99>] kthread+0xc9/0xe0
[ 4064.404851]  [<ffffffff810999d0>] ? kthread_park+0x60/0x60
[ 4064.404856]  [<ffffffff817df20f>] ret_from_fork+0x3f/0x70
[ 4064.404859]  [<ffffffff810999d0>] ? kthread_park+0x60/0x60
[ 4064.404861] Code: e8 17 83 f8 11 0f 87 9a 01 00 00 ff 24 c5 f8 ea 2b c0 =
b8
02 00 00 00 41 09 c5 b8 fe ff ff ff d3 c0 48 98 49 21 c4 f3 49 0f bc c4 <4d=
> 85
e4 75 cd 49 8b 86 80 00 00 00 48 8d b8 30 26 00 00 e8 16=20
[ 4067.622934] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4071.796744] INFO: rcu_sched self-detected stall on CPU
[ 4071.796751]  4-...: (15000 ticks this GP) idle=3D47b/140000000000001/0
softirq=3D374433/374433 fqs=3D14495=20
[ 4071.796753]   (t=3D15000 jiffies g=3D289046 c=3D289045 q=3D4218)
[ 4071.796757] Task dump for CPU 4:
[ 4071.796759] kworker/4:1     R  running task        0  6743      2 0x0000=
0008
[ 4071.796809] Workqueue: events gk104_fifo_recover_work [nouveau]
[ 4071.796811]  ffffffff81c53e40 ffff88023fd03dc8 ffffffff810a7fbf
0000000000000004
[ 4071.796815]  ffffffff81c53e40 ffff88023fd03de0 ffffffff810aa7f9
0000000000000005
[ 4071.796818]  ffff88023fd03e10 ffffffff810dda77 ffff88023fd178c0
ffffffff81c53e40
[ 4071.796821] Call Trace:
[ 4071.796823]  <IRQ>  [<ffffffff810a7fbf>] sched_show_task+0xaf/0x110
[ 4071.796831]  [<ffffffff810aa7f9>] dump_cpu_task+0x39/0x40
[ 4071.796834]  [<ffffffff810dda77>] rcu_dump_cpu_stacks+0x87/0xc0
[ 4071.796838]  [<ffffffff810e1610>] rcu_check_callbacks+0x470/0x720
[ 4071.796841]  [<ffffffff810ab2d1>] ? account_system_time+0x81/0x110
[ 4071.796844]  [<ffffffff810ab57b>] ? account_process_tick+0x6b/0x170
[ 4071.796872]  [<ffffffffc01d972f>] ? nvkm_engine_intr+0x1f/0x30 [nouveau]
[ 4071.796876]  [<ffffffff810f60d0>] ? tick_sched_do_timer+0x30/0x30
[ 4071.796880]  [<ffffffff810e6b02>] update_process_times+0x42/0x70
[ 4071.796883]  [<ffffffff810f5ac3>] tick_sched_handle.isra.15+0x23/0x60
[ 4071.796886]  [<ffffffff810f6118>] tick_sched_timer+0x48/0x80
[ 4071.796889]  [<ffffffff810e7670>] __hrtimer_run_queues+0xe0/0x250
[ 4071.796893]  [<ffffffff810e7b17>] hrtimer_interrupt+0xa7/0x1a0
[ 4071.796898]  [<ffffffff81050b65>] local_apic_timer_interrupt+0x35/0x60
[ 4071.796901]  [<ffffffff817e192d>] smp_apic_timer_interrupt+0x3d/0x50
[ 4071.796905]  [<ffffffff817dfbe2>] apic_timer_interrupt+0x82/0x90
[ 4071.796906]  <EOI>  [<ffffffffc0241e40>] ?
gk104_fifo_recover_work+0x140/0x280 [nouveau]
[ 4071.796951]  [<ffffffff81093ac3>] process_one_work+0x153/0x3f0
[ 4071.796954]  [<ffffffff8109428a>] worker_thread+0x12a/0x4b0
[ 4071.796957]  [<ffffffff817daf0a>] ? __schedule+0x35a/0x970
[ 4071.796960]  [<ffffffff81094160>] ? rescuer_thread+0x350/0x350
[ 4071.796964]  [<ffffffff81099a99>] kthread+0xc9/0xe0
[ 4071.796967]  [<ffffffff810999d0>] ? kthread_park+0x60/0x60
[ 4071.796970]  [<ffffffff817df20f>] ret_from_fork+0x3f/0x70
[ 4071.796974]  [<ffffffff810999d0>] ? kthread_park+0x60/0x60
[ 4071.917872] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4076.212810] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4080.507748] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4084.802686] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4089.097624] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14691032130.EbFb5.31900
Date: Thu, 21 Jul 2016 12:13:33 +0000
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
   title=3D"NEW - Screen locks up randomly while only mouse pointer moves, =
system responsive via ssh"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97021">97021</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Screen locks up randomly while only mouse pointer moves, syst=
em responsive via ssh
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
          <td>ali.parsai&#64;gmx.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125225=
" name=3D"attach_125225" title=3D"complete dmesg I retrieved using ssh">att=
achment 125225</a> <a href=3D"attachment.cgi?id=3D125225&amp;action=3Dedit"=
 title=3D"complete dmesg I retrieved using ssh">[details]</a></span>
complete dmesg I retrieved using ssh

Screen locks up and becomes unresponsive randomly (mainly while playing a
video). The strange thing is the mouse pointer moves if I move the mouse. T=
he=20
sound also continues to play normally. Here's the relevant dmesg part. The
system is responsive (although poorly) via ssh when this happens. If more
details are needed, please let me know, and I will try to get them via ssh =
when
it locks up.


[ 4011.789011] nouveau 0000:01:00.0: fifo: read fault at 0007960000 engine =
1b
[CE2] client 18 [GR_CE] reason 02 [PTE] on channel 6 [003f829000
opera-developer[5101]]
[ 4011.789021] nouveau 0000:01:00.0: fifo: ce2 engine fault on channel 6,
recovering...
[ 4016.083636] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4020.378575] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4024.673513] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4028.968450] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4033.263426] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4036.404132] NMI watchdog: BUG: soft lockup - CPU#4 stuck for 23s!
[kworker/4:1:6743]
[ 4036.404135] Modules linked in: xt_tcpudp(E) iptable_filter(E) pci_stub(E)
vboxpci(OE) vboxnetadp(OE) vboxnetflt(OE) vboxdrv(OE) ipt_MASQUERADE(E)
nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv=
4(E)
nf_nat_ipv4(E) nf_nat(E) nf_conntrack(E) ip_tables(E) x_tables(E) usblp(E)
snd_hda_codec_hdmi(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E)
joydev(E) snd_hda_intel(E) hid_logitech_hidpp(E) snd_hda_codec(E) bnep(E)
snd_hda_core(E) rfcomm(E) snd_hwdep(E) bluetooth(E) kvm_amd(E) snd_pcm(E)
kvm(E) snd_seq_midi(E) snd_seq_midi_event(E) snd_rawmidi(E) irqbypass(E)
snd_seq(E) edac_mce_amd(E) edac_core(E) serio_raw(E) snd_seq_device(E)
dm_multipath(E) snd_timer(E) k10temp(E) snd(E) soundcore(E) shpchp(E)
i2c_piix4(E) parport_pc(E) ppdev(E) it87(E) hwmon_vid(E) nfsd(E) binfmt_mis=
c(E)
auth_rpcgss(E) nfs_acl(E) lp(E) parport(E) nfs(E) lockd(E) grace(E) sunrpc(=
E)
fscache(E) xfs(E) libcrc32c(E) reiserfs(E) dm_mirror(E) dm_region_hash(E)
dm_log(E) hid_logitech_dj(E) pata_acpi(E) nouveau(E) mxm_wmi(E) video(E)
i2c_algo_bit(E) ttm(E) hid_generic(E) drm_kms_helper(E) usbhid(E) 8139too(E)
syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) hid(E) 8139cp(E)
r8169(E) ahci(E) pata_atiixp(E) mii(E) libahci(E) drm(E) wmi(E)
[ 4036.404204] CPU: 4 PID: 6743 Comm: kworker/4:1 Tainted: G           OE=
=20=20
4.5.3 #1
[ 4036.404206] Hardware name: Gigabyte Technology Co., Ltd.
GA-970A-DS3/GA-970A-DS3, BIOS F6 10/23/2012
[ 4036.404269] Workqueue: events gk104_fifo_recover_work [nouveau]
[ 4036.404272] task: ffff8801fd3e5b00 ti: ffff88006e148000 task.ti:
ffff88006e148000
[ 4036.404274] RIP: 0010:[&lt;ffffffffc0241d95&gt;]  [&lt;ffffffffc0241d95&=
gt;]
gk104_fifo_recover_work+0x95/0x280 [nouveau]
[ 4036.404319] RSP: 0018:ffff88006e14bde0  EFLAGS: 00000206
[ 4036.404322] RAX: 0000000000000021 RBX: 0000000200000000 RCX:
0000000000000021
[ 4036.404324] RDX: 0000000000000001 RSI: 0000000000000282 RDI:
0000000000000282
[ 4036.404326] RBP: ffff88006e14be18 R08: ffff880098294b40 R09:
00000001802a001b
[ 4036.404328] R10: 0000000098294d01 R11: 0000000000008000 R12:
0000000200000000
[ 4036.404330] R13: 0000000000000001 R14: ffff880231edec00 R15:
ffff880231980ae0
[ 4036.404333] FS:  00007f49e9885700(0000) GS:ffff88023fd00000(0000)
knlGS:0000000000000000
[ 4036.404335] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[ 4036.404337] CR2: 00007f4d3f20d008 CR3: 0000000233f31000 CR4:
00000000000006e0
[ 4036.404339] Stack:
[ 4036.404341]  ffff880098294b40 ffff880231980800 ffff8801e5b35240
ffff88023fd16300
[ 4036.404344]  ffff88023fd1ac00 0000000000000100 ffff880231980ae0
ffff88006e14be60
[ 4036.404348]  ffffffff81093ac3 00000000e5b35270 0000000000000000
ffff88023fd16320
[ 4036.404351] Call Trace:
[ 4036.404358]  [&lt;ffffffff81093ac3&gt;] process_one_work+0x153/0x3f0
[ 4036.404361]  [&lt;ffffffff8109428a&gt;] worker_thread+0x12a/0x4b0
[ 4036.404365]  [&lt;ffffffff817daf0a&gt;] ? __schedule+0x35a/0x970
[ 4036.404368]  [&lt;ffffffff81094160&gt;] ? rescuer_thread+0x350/0x350
[ 4036.404372]  [&lt;ffffffff81099a99&gt;] kthread+0xc9/0xe0
[ 4036.404376]  [&lt;ffffffff810999d0&gt;] ? kthread_park+0x60/0x60
[ 4036.404380]  [&lt;ffffffff817df20f&gt;] ret_from_fork+0x3f/0x70
[ 4036.404383]  [&lt;ffffffff810999d0&gt;] ? kthread_park+0x60/0x60
[ 4036.404385] Code: f8 11 0f 87 9a 01 00 00 ff 24 c5 f8 ea 2b c0 b8 02 00 =
00
00 41 09 c5 b8 fe ff ff ff d3 c0 48 98 49 21 c4 f3 49 0f bc c4 4d 85 e4 &lt=
;75&gt; cd
49 8b 86 80 00 00 00 48 8d b8 30 26 00 00 e8 16 be 19 c1=20
[ 4037.558363] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4041.853302] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4046.148240] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4050.443181] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4054.738121] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4059.033058] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4063.327996] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4064.404618] NMI watchdog: BUG: soft lockup - CPU#4 stuck for 23s!
[kworker/4:1:6743]
[ 4064.404620] Modules linked in: xt_tcpudp(E) iptable_filter(E) pci_stub(E)
vboxpci(OE) vboxnetadp(OE) vboxnetflt(OE) vboxdrv(OE) ipt_MASQUERADE(E)
nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv=
4(E)
nf_nat_ipv4(E) nf_nat(E) nf_conntrack(E) ip_tables(E) x_tables(E) usblp(E)
snd_hda_codec_hdmi(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E)
joydev(E) snd_hda_intel(E) hid_logitech_hidpp(E) snd_hda_codec(E) bnep(E)
snd_hda_core(E) rfcomm(E) snd_hwdep(E) bluetooth(E) kvm_amd(E) snd_pcm(E)
kvm(E) snd_seq_midi(E) snd_seq_midi_event(E) snd_rawmidi(E) irqbypass(E)
snd_seq(E) edac_mce_amd(E) edac_core(E) serio_raw(E) snd_seq_device(E)
dm_multipath(E) snd_timer(E) k10temp(E) snd(E) soundcore(E) shpchp(E)
i2c_piix4(E) parport_pc(E) ppdev(E) it87(E) hwmon_vid(E) nfsd(E) binfmt_mis=
c(E)
auth_rpcgss(E) nfs_acl(E) lp(E) parport(E) nfs(E) lockd(E) grace(E) sunrpc(=
E)
fscache(E) xfs(E) libcrc32c(E) reiserfs(E) dm_mirror(E) dm_region_hash(E)
dm_log(E) hid_logitech_dj(E) pata_acpi(E) nouveau(E) mxm_wmi(E) video(E)
i2c_algo_bit(E) ttm(E) hid_generic(E) drm_kms_helper(E) usbhid(E) 8139too(E)
syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) hid(E) 8139cp(E)
r8169(E) ahci(E) pata_atiixp(E) mii(E) libahci(E) drm(E) wmi(E)
[ 4064.404683] CPU: 4 PID: 6743 Comm: kworker/4:1 Tainted: G           OEL=
=20
4.5.3 #1
[ 4064.404685] Hardware name: Gigabyte Technology Co., Ltd.
GA-970A-DS3/GA-970A-DS3, BIOS F6 10/23/2012
[ 4064.404746] Workqueue: events gk104_fifo_recover_work [nouveau]
[ 4064.404750] task: ffff8801fd3e5b00 ti: ffff88006e148000 task.ti:
ffff88006e148000
[ 4064.404752] RIP: 0010:[&lt;ffffffffc0241d92&gt;]  [&lt;ffffffffc0241d92&=
gt;]
gk104_fifo_recover_work+0x92/0x280 [nouveau]
[ 4064.404796] RSP: 0018:ffff88006e14bde0  EFLAGS: 00000206
[ 4064.404799] RAX: 0000000000000021 RBX: 0000000200000000 RCX:
0000000000000021
[ 4064.404801] RDX: 0000000000000001 RSI: 0000000000000282 RDI:
0000000000000282
[ 4064.404803] RBP: ffff88006e14be18 R08: ffff880098294b40 R09:
00000001802a001b
[ 4064.404805] R10: 0000000098294d01 R11: 0000000000008000 R12:
0000000200000000
[ 4064.404807] R13: 0000000000000001 R14: ffff880231edec00 R15:
ffff880231980ae0
[ 4064.404809] FS:  00007f49e9885700(0000) GS:ffff88023fd00000(0000)
knlGS:0000000000000000
[ 4064.404811] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[ 4064.404813] CR2: 00007f4d3f20d008 CR3: 0000000233f31000 CR4:
00000000000006e0
[ 4064.404816] Stack:
[ 4064.404817]  ffff880098294b40 ffff880231980800 ffff8801e5b35240
ffff88023fd16300
[ 4064.404821]  ffff88023fd1ac00 0000000000000100 ffff880231980ae0
ffff88006e14be60
[ 4064.404824]  ffffffff81093ac3 00000000e5b35270 0000000000000000
ffff88023fd16320
[ 4064.404827] Call Trace:
[ 4064.404834]  [&lt;ffffffff81093ac3&gt;] process_one_work+0x153/0x3f0
[ 4064.404837]  [&lt;ffffffff8109428a&gt;] worker_thread+0x12a/0x4b0
[ 4064.404841]  [&lt;ffffffff817daf0a&gt;] ? __schedule+0x35a/0x970
[ 4064.404844]  [&lt;ffffffff81094160&gt;] ? rescuer_thread+0x350/0x350
[ 4064.404848]  [&lt;ffffffff81099a99&gt;] kthread+0xc9/0xe0
[ 4064.404851]  [&lt;ffffffff810999d0&gt;] ? kthread_park+0x60/0x60
[ 4064.404856]  [&lt;ffffffff817df20f&gt;] ret_from_fork+0x3f/0x70
[ 4064.404859]  [&lt;ffffffff810999d0&gt;] ? kthread_park+0x60/0x60
[ 4064.404861] Code: e8 17 83 f8 11 0f 87 9a 01 00 00 ff 24 c5 f8 ea 2b c0 =
b8
02 00 00 00 41 09 c5 b8 fe ff ff ff d3 c0 48 98 49 21 c4 f3 49 0f bc c4 &lt=
;4d&gt; 85
e4 75 cd 49 8b 86 80 00 00 00 48 8d b8 30 26 00 00 e8 16=20
[ 4067.622934] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4071.796744] INFO: rcu_sched self-detected stall on CPU
[ 4071.796751]  4-...: (15000 ticks this GP) idle=3D47b/140000000000001/0
softirq=3D374433/374433 fqs=3D14495=20
[ 4071.796753]   (t=3D15000 jiffies g=3D289046 c=3D289045 q=3D4218)
[ 4071.796757] Task dump for CPU 4:
[ 4071.796759] kworker/4:1     R  running task        0  6743      2 0x0000=
0008
[ 4071.796809] Workqueue: events gk104_fifo_recover_work [nouveau]
[ 4071.796811]  ffffffff81c53e40 ffff88023fd03dc8 ffffffff810a7fbf
0000000000000004
[ 4071.796815]  ffffffff81c53e40 ffff88023fd03de0 ffffffff810aa7f9
0000000000000005
[ 4071.796818]  ffff88023fd03e10 ffffffff810dda77 ffff88023fd178c0
ffffffff81c53e40
[ 4071.796821] Call Trace:
[ 4071.796823]  &lt;IRQ&gt;  [&lt;ffffffff810a7fbf&gt;] sched_show_task+0xa=
f/0x110
[ 4071.796831]  [&lt;ffffffff810aa7f9&gt;] dump_cpu_task+0x39/0x40
[ 4071.796834]  [&lt;ffffffff810dda77&gt;] rcu_dump_cpu_stacks+0x87/0xc0
[ 4071.796838]  [&lt;ffffffff810e1610&gt;] rcu_check_callbacks+0x470/0x720
[ 4071.796841]  [&lt;ffffffff810ab2d1&gt;] ? account_system_time+0x81/0x110
[ 4071.796844]  [&lt;ffffffff810ab57b&gt;] ? account_process_tick+0x6b/0x170
[ 4071.796872]  [&lt;ffffffffc01d972f&gt;] ? nvkm_engine_intr+0x1f/0x30 [no=
uveau]
[ 4071.796876]  [&lt;ffffffff810f60d0&gt;] ? tick_sched_do_timer+0x30/0x30
[ 4071.796880]  [&lt;ffffffff810e6b02&gt;] update_process_times+0x42/0x70
[ 4071.796883]  [&lt;ffffffff810f5ac3&gt;] tick_sched_handle.isra.15+0x23/0=
x60
[ 4071.796886]  [&lt;ffffffff810f6118&gt;] tick_sched_timer+0x48/0x80
[ 4071.796889]  [&lt;ffffffff810e7670&gt;] __hrtimer_run_queues+0xe0/0x250
[ 4071.796893]  [&lt;ffffffff810e7b17&gt;] hrtimer_interrupt+0xa7/0x1a0
[ 4071.796898]  [&lt;ffffffff81050b65&gt;] local_apic_timer_interrupt+0x35/=
0x60
[ 4071.796901]  [&lt;ffffffff817e192d&gt;] smp_apic_timer_interrupt+0x3d/0x=
50
[ 4071.796905]  [&lt;ffffffff817dfbe2&gt;] apic_timer_interrupt+0x82/0x90
[ 4071.796906]  &lt;EOI&gt;  [&lt;ffffffffc0241e40&gt;] ?
gk104_fifo_recover_work+0x140/0x280 [nouveau]
[ 4071.796951]  [&lt;ffffffff81093ac3&gt;] process_one_work+0x153/0x3f0
[ 4071.796954]  [&lt;ffffffff8109428a&gt;] worker_thread+0x12a/0x4b0
[ 4071.796957]  [&lt;ffffffff817daf0a&gt;] ? __schedule+0x35a/0x970
[ 4071.796960]  [&lt;ffffffff81094160&gt;] ? rescuer_thread+0x350/0x350
[ 4071.796964]  [&lt;ffffffff81099a99&gt;] kthread+0xc9/0xe0
[ 4071.796967]  [&lt;ffffffff810999d0&gt;] ? kthread_park+0x60/0x60
[ 4071.796970]  [&lt;ffffffff817df20f&gt;] ret_from_fork+0x3f/0x70
[ 4071.796974]  [&lt;ffffffff810999d0&gt;] ? kthread_park+0x60/0x60
[ 4071.917872] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4076.212810] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4080.507748] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4084.802686] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 4089.097624] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14691032130.EbFb5.31900--

--===============1212076164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1212076164==--
