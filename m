From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84424] New: nouveau crash log [mesa-10.3.0]
Date: Sun, 28 Sep 2014 14:27:16 +0000
Message-ID: <bug-84424-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2136086569=="
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


--===============2136086569==
Content-Type: multipart/alternative; boundary="1411914435.c4a2a400.31304"; charset="us-ascii"


--1411914435.c4a2a400.31304
Date: Sun, 28 Sep 2014 14:27:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84424

          Priority: medium
            Bug ID: 84424
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau crash log [mesa-10.3.0]
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: reuben.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 107006
  --> https://bugs.freedesktop.org/attachment.cgi?id=107006&action=edit
dmesg log

This may not be very useful, but I'm leaving it here just in case. Complete
uncut dmesg log attached. Nothing out of the ordinary was found in the X logs.

mesa-10.3.0
kernel-3.16.2
xorg-server-1.16.1

====================

0a:00.0 VGA compatible controller: NVIDIA Corporation G96GL [Quadro FX 580]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation Device 063a
        Flags: bus master, fast devsel, latency 0, IRQ 90
        Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Memory at c0000000 (64-bit, prefetchable) [size=512M]
        Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at e800 [size=128]
        Expansion ROM at fe980000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
<?>
        Kernel driver in use: nouveau
        Kernel modules: nouveau, nvidia

====================

Relevant portion of dmesg:

[ 2643.920441] BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
[ 2643.920454] IP: [<ffffffffa017eac6>]
nouveau_fence_wait_uevent.isra.3+0x36/0x3e0 [nouveau]
[ 2643.920478] PGD 140a75067 PUD 100702067 PMD 0 
[ 2643.920483] Oops: 0000 [#1] PREEMPT SMP 
[ 2643.920487] Modules linked in: act_police cls_basic cls_flow cls_fw cls_u32
sch_fq_codel sch_tbf sch_prio sch_htb sch_hfsc sch_sfq arptable_filter
arp_tables xt_CHECKSUM ipt_rpfilter xt_geoip(O) xt_statistic xt_CT xt_LOG
xt_connlimit xt_realm xt_addrtype xt_comment xt_recent ipt_ULOG ipt_MASQUERADE
ipt_ECN ipt_CLUSTERIP ipt_ah xt_set nf_nat_tftp nf_nat_snmp_basic
nf_conntrack_snmp nf_nat_sip nf_nat_pptp nf_nat_proto_gre nf_nat_irc
nf_nat_h323 nf_nat_ftp nf_nat_amanda ts_kmp nf_conntrack_amanda
nf_conntrack_sane nf_conntrack_tftp nf_conntrack_sip nf_conntrack_proto_udplite
nf_conntrack_proto_sctp nf_conntrack_pptp nf_conntrack_proto_gre
nf_conntrack_netlink nf_conntrack_netbios_ns nf_conntrack_broadcast
nf_conntrack_irc nf_conntrack_h323 nf_conntrack_ftp xt_TPROXY xt_time xt_TCPMSS
xt_tcpmss xt_sctp
[ 2643.920563]  xt_policy xt_pkttype xt_physdev xt_owner xt_NFQUEUE xt_NFLOG
xt_multiport xt_mark xt_mac xt_limit xt_length xt_iprange xt_helper
xt_hashlimit xt_DSCP xt_dscp xt_dccp xt_conntrack xt_connmark xt_CLASSIFY
xt_AUDIT xt_state iptable_raw wacom uas nouveau r8169 ttm drm_kms_helper
microcode mii wmi edac_core snd_hda_codec_realtek snd_hda_codec_generic
snd_hda_intel snd_hda_controller snd_hda_codec snd_hwdep v4l2loopback(O)
snd_aloop
[ 2643.920610] CPU: 5 PID: 439 Comm: X Tainted: G           O  3.16.2-gentoo #1
[ 2643.920614] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8
02/24/2011
[ 2643.920617] task: ffff8801004c6540 ti: ffff88013ece4000 task.ti:
ffff88013ece4000
[ 2643.920621] RIP: 0010:[<ffffffffa017eac6>]  [<ffffffffa017eac6>]
nouveau_fence_wait_uevent.isra.3+0x36/0x3e0 [nouveau]
[ 2643.920635] RSP: 0018:ffff88013ece7ca8  EFLAGS: 00010282
[ 2643.920638] RAX: 0000000000000000 RBX: ffff88006d3fa068 RCX:
0000000000000000
[ 2643.920641] RDX: 0000000000000001 RSI: 0000000000000001 RDI:
ffff88006d3fa068
[ 2643.920644] RBP: ffff88006d3fa070 R08: 0000000000000540 R09:
ffff88013ece7ca8
[ 2643.920647] R10: ffffffffa01c72e0 R11: ffff88013ece7e08 R12:
0000000000000001
[ 2643.920651] R13: ffff8801408af9c0 R14: 0000000000000001 R15:
0000000000000001
[ 2643.920654] FS:  00007fa4c6057900(0000) GS:ffff880147d40000(0000)
knlGS:0000000000000000
[ 2643.920658] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2643.920660] CR2: 0000000000000008 CR3: 00000001007aa000 CR4:
00000000000007e0
[ 2643.920663] Stack:
[ 2643.920664]  0000000002162af8 0000000000000540 00000000001e8dbd
0000000000000000
[ 2643.920670]  000000000000000d 0000000000000008 ffff88006d3fa040
0000000000000001
[ 2643.920676]  0000000000000000 ffff8801408af9c0 0000000000000001
0000000000000001
[ 2643.920683] Call Trace:
[ 2643.920698]  [<ffffffffa017f027>] ? nouveau_fence_wait+0x77/0x180 [nouveau]
[ 2643.920705]  [<ffffffffa00bf437>] ? ttm_bo_wait+0xa7/0x1a0 [ttm]
[ 2643.920716]  [<ffffffffa0183b0a>] ? nouveau_gem_object_del+0x4a/0x50
[nouveau]
[ 2643.920727]  [<ffffffffa01855ac>] ? nouveau_gem_ioctl_cpu_prep+0x5c/0xf0
[nouveau]
[ 2643.920733]  [<ffffffff814cf75f>] ? drm_ioctl+0x20f/0x5f0
[ 2643.920744]  [<ffffffffa017c2d6>] ? nouveau_drm_ioctl+0x76/0xa0 [nouveau]
[ 2643.920749]  [<ffffffff811799b7>] ? do_vfs_ioctl+0x2c7/0x490
[ 2643.920753]  [<ffffffff810a25c5>] ? vtime_account_user+0x45/0x60
[ 2643.920757]  [<ffffffff81179c19>] ? SyS_ioctl+0x99/0xb0
[ 2643.920761]  [<ffffffff818b6dec>] ? tracesys+0x7e/0xe2
[ 2643.920765]  [<ffffffff818b6e4b>] ? tracesys+0xdd/0xe2
[ 2643.920768] Code: 6c 24 38 48 89 fb 4c 89 64 24 40 4c 89 6c 24 48 41 89 d4
4c 89 74 24 50 4c 89 7c 24 58 48 89 f5 48 8b 07 49 89 e1 be 01 00 00 00 <48> 8b
50 08 48 8b 8a f0 00 00 00 4c 8b aa 50 07 00 00 48 8b 41 
[ 2643.920816] RIP  [<ffffffffa017eac6>]
nouveau_fence_wait_uevent.isra.3+0x36/0x3e0 [nouveau]
[ 2643.920828]  RSP <ffff88013ece7ca8>
[ 2643.920830] CR2: 0000000000000008
[ 2643.925739] ---[ end trace 5129d13251e71ceb ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411914435.c4a2a400.31304
Date: Sun, 28 Sep 2014 14:27:15 +0000
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
   title="NEW --- - nouveau crash log [mesa-10.3.0]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84424">84424</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau crash log [mesa-10.3.0]
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
          <td>reuben.m&#64;gmail.com
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
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=107006" name="attach_107006" title="dmesg log">attachment 107006</a> <a href="attachment.cgi?id=107006&amp;action=edit" title="dmesg log">[details]</a></span>
dmesg log

This may not be very useful, but I'm leaving it here just in case. Complete
uncut dmesg log attached. Nothing out of the ordinary was found in the X logs.

mesa-10.3.0
kernel-3.16.2
xorg-server-1.16.1

====================

0a:00.0 VGA compatible controller: NVIDIA Corporation G96GL [Quadro FX 580]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation Device 063a
        Flags: bus master, fast devsel, latency 0, IRQ 90
        Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Memory at c0000000 (64-bit, prefetchable) [size=512M]
        Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at e800 [size=128]
        Expansion ROM at fe980000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
&lt;?&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau, nvidia

====================

Relevant portion of dmesg:

[ 2643.920441] BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
[ 2643.920454] IP: [&lt;ffffffffa017eac6&gt;]
nouveau_fence_wait_uevent.isra.3+0x36/0x3e0 [nouveau]
[ 2643.920478] PGD 140a75067 PUD 100702067 PMD 0 
[ 2643.920483] Oops: 0000 [#1] PREEMPT SMP 
[ 2643.920487] Modules linked in: act_police cls_basic cls_flow cls_fw cls_u32
sch_fq_codel sch_tbf sch_prio sch_htb sch_hfsc sch_sfq arptable_filter
arp_tables xt_CHECKSUM ipt_rpfilter xt_geoip(O) xt_statistic xt_CT xt_LOG
xt_connlimit xt_realm xt_addrtype xt_comment xt_recent ipt_ULOG ipt_MASQUERADE
ipt_ECN ipt_CLUSTERIP ipt_ah xt_set nf_nat_tftp nf_nat_snmp_basic
nf_conntrack_snmp nf_nat_sip nf_nat_pptp nf_nat_proto_gre nf_nat_irc
nf_nat_h323 nf_nat_ftp nf_nat_amanda ts_kmp nf_conntrack_amanda
nf_conntrack_sane nf_conntrack_tftp nf_conntrack_sip nf_conntrack_proto_udplite
nf_conntrack_proto_sctp nf_conntrack_pptp nf_conntrack_proto_gre
nf_conntrack_netlink nf_conntrack_netbios_ns nf_conntrack_broadcast
nf_conntrack_irc nf_conntrack_h323 nf_conntrack_ftp xt_TPROXY xt_time xt_TCPMSS
xt_tcpmss xt_sctp
[ 2643.920563]  xt_policy xt_pkttype xt_physdev xt_owner xt_NFQUEUE xt_NFLOG
xt_multiport xt_mark xt_mac xt_limit xt_length xt_iprange xt_helper
xt_hashlimit xt_DSCP xt_dscp xt_dccp xt_conntrack xt_connmark xt_CLASSIFY
xt_AUDIT xt_state iptable_raw wacom uas nouveau r8169 ttm drm_kms_helper
microcode mii wmi edac_core snd_hda_codec_realtek snd_hda_codec_generic
snd_hda_intel snd_hda_controller snd_hda_codec snd_hwdep v4l2loopback(O)
snd_aloop
[ 2643.920610] CPU: 5 PID: 439 Comm: X Tainted: G           O  3.16.2-gentoo #1
[ 2643.920614] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8
02/24/2011
[ 2643.920617] task: ffff8801004c6540 ti: ffff88013ece4000 task.ti:
ffff88013ece4000
[ 2643.920621] RIP: 0010:[&lt;ffffffffa017eac6&gt;]  [&lt;ffffffffa017eac6&gt;]
nouveau_fence_wait_uevent.isra.3+0x36/0x3e0 [nouveau]
[ 2643.920635] RSP: 0018:ffff88013ece7ca8  EFLAGS: 00010282
[ 2643.920638] RAX: 0000000000000000 RBX: ffff88006d3fa068 RCX:
0000000000000000
[ 2643.920641] RDX: 0000000000000001 RSI: 0000000000000001 RDI:
ffff88006d3fa068
[ 2643.920644] RBP: ffff88006d3fa070 R08: 0000000000000540 R09:
ffff88013ece7ca8
[ 2643.920647] R10: ffffffffa01c72e0 R11: ffff88013ece7e08 R12:
0000000000000001
[ 2643.920651] R13: ffff8801408af9c0 R14: 0000000000000001 R15:
0000000000000001
[ 2643.920654] FS:  00007fa4c6057900(0000) GS:ffff880147d40000(0000)
knlGS:0000000000000000
[ 2643.920658] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2643.920660] CR2: 0000000000000008 CR3: 00000001007aa000 CR4:
00000000000007e0
[ 2643.920663] Stack:
[ 2643.920664]  0000000002162af8 0000000000000540 00000000001e8dbd
0000000000000000
[ 2643.920670]  000000000000000d 0000000000000008 ffff88006d3fa040
0000000000000001
[ 2643.920676]  0000000000000000 ffff8801408af9c0 0000000000000001
0000000000000001
[ 2643.920683] Call Trace:
[ 2643.920698]  [&lt;ffffffffa017f027&gt;] ? nouveau_fence_wait+0x77/0x180 [nouveau]
[ 2643.920705]  [&lt;ffffffffa00bf437&gt;] ? ttm_bo_wait+0xa7/0x1a0 [ttm]
[ 2643.920716]  [&lt;ffffffffa0183b0a&gt;] ? nouveau_gem_object_del+0x4a/0x50
[nouveau]
[ 2643.920727]  [&lt;ffffffffa01855ac&gt;] ? nouveau_gem_ioctl_cpu_prep+0x5c/0xf0
[nouveau]
[ 2643.920733]  [&lt;ffffffff814cf75f&gt;] ? drm_ioctl+0x20f/0x5f0
[ 2643.920744]  [&lt;ffffffffa017c2d6&gt;] ? nouveau_drm_ioctl+0x76/0xa0 [nouveau]
[ 2643.920749]  [&lt;ffffffff811799b7&gt;] ? do_vfs_ioctl+0x2c7/0x490
[ 2643.920753]  [&lt;ffffffff810a25c5&gt;] ? vtime_account_user+0x45/0x60
[ 2643.920757]  [&lt;ffffffff81179c19&gt;] ? SyS_ioctl+0x99/0xb0
[ 2643.920761]  [&lt;ffffffff818b6dec&gt;] ? tracesys+0x7e/0xe2
[ 2643.920765]  [&lt;ffffffff818b6e4b&gt;] ? tracesys+0xdd/0xe2
[ 2643.920768] Code: 6c 24 38 48 89 fb 4c 89 64 24 40 4c 89 6c 24 48 41 89 d4
4c 89 74 24 50 4c 89 7c 24 58 48 89 f5 48 8b 07 49 89 e1 be 01 00 00 00 &lt;48&gt; 8b
50 08 48 8b 8a f0 00 00 00 4c 8b aa 50 07 00 00 48 8b 41 
[ 2643.920816] RIP  [&lt;ffffffffa017eac6&gt;]
nouveau_fence_wait_uevent.isra.3+0x36/0x3e0 [nouveau]
[ 2643.920828]  RSP &lt;ffff88013ece7ca8&gt;
[ 2643.920830] CR2: 0000000000000008
[ 2643.925739] ---[ end trace 5129d13251e71ceb ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411914435.c4a2a400.31304--

--===============2136086569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2136086569==--
