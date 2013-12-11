From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72599] New: [NVC0] null pointer dereference
 (nouveau_fence_wait_uevent.isra.5)
Date: Wed, 11 Dec 2013 14:38:02 +0000
Message-ID: <bug-72599-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1643097557=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1643097557==
Content-Type: multipart/alternative; boundary="1386772682.8AFF1.4245"; charset="us-ascii"


--1386772682.8AFF1.4245
Date: Wed, 11 Dec 2013 14:38:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72599

          Priority: medium
            Bug ID: 72599
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVC0] null pointer dereference
                    (nouveau_fence_wait_uevent.isra.5)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ua_bugzilla_freedesktop-EqN0DgjA0IPxpcmzjlbVsw@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 90609
  --> https://bugs.freedesktop.org/attachment.cgi?id=90609&action=edit
kernel log (fresh boot, not the oops)

After ~24h use, I got the following:

[56953.400920] BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
[56953.400946] IP: [<ffffffffa0426b19>]
nouveau_fence_wait_uevent.isra.5+0x19/0x450 [nouveau]
[56953.400984] PGD d1cf2067 PUD d2ac8067 PMD 0 
[56953.400998] Oops: 0000 [#1] PREEMPT SMP 
[56953.401010] Modules linked in: xt_CHECKSUM ipt_rpfilter xt_statistic xt_CT
xt_LOG xt_connlimit xt_realm xt_addrtype xt_comment xt_recent xt_nat ipt_ULOG
ipt_REJECT ipt_MASQUERADE ipt_ECN ipt_ah xt_set ip_set nf_nat_tftp nf_nat_sip
nf_nat_pptp nf_nat_proto_gre nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat_amanda
ts_kmp nf_conntrack_amanda nf_conntrack_sane nf_conntrack_tftp nf_conntrack_sip
nf_conntrack_proto_udplite nf_conntrack_proto_sctp nf_conntrack_pptp
nf_conntrack_proto_gre nf_conntrack_netlink nf_conntrack_netbios_ns
nf_conntrack_broadcast nf_conntrack_irc nf_conntrack_h323 nf_conntrack_ftp
xt_TPROXY xt_time xt_TCPMSS xt_tcpmss xt_sctp xt_policy xt_pkttype xt_physdev
xt_owner xt_NFQUEUE xt_NFLOG nfnetlink_log xt_multiport xt_mark xt_mac xt_limit
xt_length xt_iprange xt_helper xt_hashlimit xt_DSCP xt_dscp xt_dccp
xt_conntrack xt_connmark xt_CLASSIFY xt_AUDIT xt_tcpudp xt_state iptable_raw
iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_conntrack
iptable_mangle nfnetlink iptable_filter ip_tables x_tables it87 usblp isl6421
cx24116 cx88_dvb joydev adt7475 videobuf_dvb xpad hwmon_vid dvb_core nouveau
tuner cfbfillrect cfbimgblt video snd_hda_codec_hdmi fbcon bitblit backlight
softcursor font mxm_wmi cfbcopyarea ttm cx8800 cx8802 cx88xx drm_kms_helper
snd_hda_codec_realtek tveeprom snd_virtuoso snd_oxygen_lib snd_hda_intel
btcx_risc videobuf_dma_sg videobuf_core rc_core snd_hda_codec drm
snd_mpu401_uart snd_rawmidi v4l2_common snd_hwdep videodev snd_pcm fb
snd_page_alloc snd_timer coretemp i2c_algo_bit snd fbdev soundcore evdev wmi
xts ablk_helper cryptd lrw gf128mul glue_helper aes_x86_64 sha256_generic fuse
dm_snapshot dm_mirror dm_region_hash dm_log usb_storage
[56953.401482] CPU: 1 PID: 4542 Comm: X Not tainted 3.12.4 #1
[56953.401492] Hardware name: Gigabyte Technology Co., Ltd. P55-UD5/P55-UD5,
BIOS F11c 11/09/2010
[56953.401503] task: ffff88021e10da20 ti: ffff8800d1cea000 task.ti:
ffff8800d1cea000
[56953.401513] RIP: 0010:[<ffffffffa0426b19>]  [<ffffffffa0426b19>]
nouveau_fence_wait_uevent.isra.5+0x19/0x450 [nouveau]
[56953.401548] RSP: 0018:ffff8800d1cebc68  EFLAGS: 00010282
[56953.401557] RAX: 0000000000000000 RBX: ffff8801e809d868 RCX:
0000000000000000
[56953.401567] RDX: 0000000000000001 RSI: ffff8801e809d870 RDI:
ffff8801e809d868
[56953.401576] RBP: 0000000000000001 R08: 00000000000011be R09:
000000000000e200
[56953.401586] R10: ffffffffa045fb40 R11: ffff8800d1cebdf8 R12:
0000000000000000
[56953.401595] R13: ffff8801e809d870 R14: 0000000000000001 R15:
0000000000000001
[56953.401606] FS:  00007f86cdfc5880(0000) GS:ffff880227c40000(0000)
knlGS:0000000000000000
[56953.401617] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[56953.401625] CR2: 0000000000000008 CR3: 00000000d1efb000 CR4:
00000000000007e0
[56953.401634] Stack:
[56953.401639]  0000000000000001 ffff8801e809d870 ffff8801e809d868
ffffffffffffffae
[56953.401656]  ffffffffa0426b0f 0000000000000010 0000000000000282
ffff8800d1cebcb8
[56953.401672]  0000000000000018 ffff8800d1efe500 ffff8801e809d840
0000000000000001
[56953.401689] Call Trace:
[56953.401717]  [<ffffffffa0426b0f>] ?
nouveau_fence_wait_uevent.isra.5+0xf/0x450 [nouveau]
[56953.401749]  [<ffffffffa0426fcf>] ? nouveau_fence_wait+0x7f/0x190 [nouveau]
[56953.401769]  [<ffffffffa036b50f>] ? ttm_bo_wait+0x7f/0x180 [ttm]
[56953.401798]  [<ffffffffa042d43b>] ? nouveau_gem_ioctl_cpu_prep+0x4b/0xd0
[nouveau]
[56953.401820]  [<ffffffffa01f720d>] ? drm_ioctl+0x46d/0x570 [drm]
[56953.401855]  [<ffffffffa0424307>] ? nouveau_drm_ioctl+0x47/0x80 [nouveau]
[56953.401868]  [<ffffffff8110c4cc>] ? do_vfs_ioctl+0x2dc/0x4c0
[56953.401878]  [<ffffffff810fc7cb>] ? __fput+0x10b/0x200
[56953.401888]  [<ffffffff81117817>] ? mntput_no_expire+0x17/0x140
[56953.401898]  [<ffffffff8110c6ec>] ? SyS_ioctl+0x3c/0x80
[56953.401909]  [<ffffffff810fc083>] ? SyS_writev+0x43/0xa0
[56953.401922]  [<ffffffff8143b6a6>] ? system_call_fastpath+0x1a/0x1f
[56953.401930] Code: 7e ff ff ff 48 8b 7b 28 48 85 ff 5b 0f 94 c0 c3 66 90 41
57 41 56 41 55 49 89 f5 41 54 55 89 d5 53 48 89 fb 48 83 ec 50 48 8b 07 <48> 8b
48 08 48 8b 91 f0 00 00 00 4c 8b b9 50 07 00 00 48 8b 42 
[56953.402083] RIP  [<ffffffffa0426b19>]
nouveau_fence_wait_uevent.isra.5+0x19/0x450 [nouveau]
[56953.402114]  RSP <ffff8800d1cebc68>
[56953.402121] CR2: 0000000000000008
[56953.406272] ---[ end trace bd07d1bb1cb0dd7d ]---

X crashed and restarted, the text console was no longer accessible. Further
down the line quite a few of these:

[drm:drm_release] *ERROR* Device busy: 1

Restarting the system hanged right before the restart with continuing errors
from nouveau (>20 errors/sec) which I (due to unthoughtfulness) forgot to write
down. Something with "_W" in it. :(

Kernel is 3.12.4 (x86_64)
xorg-server 1.14.99.903
xf86-video-nouveau 1.0.10
libdrm 2.4.50
mesa 10.0

Default options to the nouveau X driver w/ the exception of "GLXVBlank" set to
"true". The nouveau kernel module sets the performance level to 1.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386772682.8AFF1.4245
Date: Wed, 11 Dec 2013 14:38:02 +0000
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
   title="NEW --- - [NVC0] null pointer dereference (nouveau_fence_wait_uevent.isra.5)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72599">72599</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC0] null pointer dereference (nouveau_fence_wait_uevent.isra.5)
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ua_bugzilla_freedesktop&#64;binary-island.eu
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
        <pre>Created <span class=""><a href="attachment.cgi?id=90609" name="attach_90609" title="kernel log (fresh boot, not the oops)">attachment 90609</a> <a href="attachment.cgi?id=90609&amp;action=edit" title="kernel log (fresh boot, not the oops)">[details]</a></span>
kernel log (fresh boot, not the oops)

After ~24h use, I got the following:

[56953.400920] BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
[56953.400946] IP: [&lt;ffffffffa0426b19&gt;]
nouveau_fence_wait_uevent.isra.5+0x19/0x450 [nouveau]
[56953.400984] PGD d1cf2067 PUD d2ac8067 PMD 0 
[56953.400998] Oops: 0000 [#1] PREEMPT SMP 
[56953.401010] Modules linked in: xt_CHECKSUM ipt_rpfilter xt_statistic xt_CT
xt_LOG xt_connlimit xt_realm xt_addrtype xt_comment xt_recent xt_nat ipt_ULOG
ipt_REJECT ipt_MASQUERADE ipt_ECN ipt_ah xt_set ip_set nf_nat_tftp nf_nat_sip
nf_nat_pptp nf_nat_proto_gre nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat_amanda
ts_kmp nf_conntrack_amanda nf_conntrack_sane nf_conntrack_tftp nf_conntrack_sip
nf_conntrack_proto_udplite nf_conntrack_proto_sctp nf_conntrack_pptp
nf_conntrack_proto_gre nf_conntrack_netlink nf_conntrack_netbios_ns
nf_conntrack_broadcast nf_conntrack_irc nf_conntrack_h323 nf_conntrack_ftp
xt_TPROXY xt_time xt_TCPMSS xt_tcpmss xt_sctp xt_policy xt_pkttype xt_physdev
xt_owner xt_NFQUEUE xt_NFLOG nfnetlink_log xt_multiport xt_mark xt_mac xt_limit
xt_length xt_iprange xt_helper xt_hashlimit xt_DSCP xt_dscp xt_dccp
xt_conntrack xt_connmark xt_CLASSIFY xt_AUDIT xt_tcpudp xt_state iptable_raw
iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_conntrack
iptable_mangle nfnetlink iptable_filter ip_tables x_tables it87 usblp isl6421
cx24116 cx88_dvb joydev adt7475 videobuf_dvb xpad hwmon_vid dvb_core nouveau
tuner cfbfillrect cfbimgblt video snd_hda_codec_hdmi fbcon bitblit backlight
softcursor font mxm_wmi cfbcopyarea ttm cx8800 cx8802 cx88xx drm_kms_helper
snd_hda_codec_realtek tveeprom snd_virtuoso snd_oxygen_lib snd_hda_intel
btcx_risc videobuf_dma_sg videobuf_core rc_core snd_hda_codec drm
snd_mpu401_uart snd_rawmidi v4l2_common snd_hwdep videodev snd_pcm fb
snd_page_alloc snd_timer coretemp i2c_algo_bit snd fbdev soundcore evdev wmi
xts ablk_helper cryptd lrw gf128mul glue_helper aes_x86_64 sha256_generic fuse
dm_snapshot dm_mirror dm_region_hash dm_log usb_storage
[56953.401482] CPU: 1 PID: 4542 Comm: X Not tainted 3.12.4 #1
[56953.401492] Hardware name: Gigabyte Technology Co., Ltd. P55-UD5/P55-UD5,
BIOS F11c 11/09/2010
[56953.401503] task: ffff88021e10da20 ti: ffff8800d1cea000 task.ti:
ffff8800d1cea000
[56953.401513] RIP: 0010:[&lt;ffffffffa0426b19&gt;]  [&lt;ffffffffa0426b19&gt;]
nouveau_fence_wait_uevent.isra.5+0x19/0x450 [nouveau]
[56953.401548] RSP: 0018:ffff8800d1cebc68  EFLAGS: 00010282
[56953.401557] RAX: 0000000000000000 RBX: ffff8801e809d868 RCX:
0000000000000000
[56953.401567] RDX: 0000000000000001 RSI: ffff8801e809d870 RDI:
ffff8801e809d868
[56953.401576] RBP: 0000000000000001 R08: 00000000000011be R09:
000000000000e200
[56953.401586] R10: ffffffffa045fb40 R11: ffff8800d1cebdf8 R12:
0000000000000000
[56953.401595] R13: ffff8801e809d870 R14: 0000000000000001 R15:
0000000000000001
[56953.401606] FS:  00007f86cdfc5880(0000) GS:ffff880227c40000(0000)
knlGS:0000000000000000
[56953.401617] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[56953.401625] CR2: 0000000000000008 CR3: 00000000d1efb000 CR4:
00000000000007e0
[56953.401634] Stack:
[56953.401639]  0000000000000001 ffff8801e809d870 ffff8801e809d868
ffffffffffffffae
[56953.401656]  ffffffffa0426b0f 0000000000000010 0000000000000282
ffff8800d1cebcb8
[56953.401672]  0000000000000018 ffff8800d1efe500 ffff8801e809d840
0000000000000001
[56953.401689] Call Trace:
[56953.401717]  [&lt;ffffffffa0426b0f&gt;] ?
nouveau_fence_wait_uevent.isra.5+0xf/0x450 [nouveau]
[56953.401749]  [&lt;ffffffffa0426fcf&gt;] ? nouveau_fence_wait+0x7f/0x190 [nouveau]
[56953.401769]  [&lt;ffffffffa036b50f&gt;] ? ttm_bo_wait+0x7f/0x180 [ttm]
[56953.401798]  [&lt;ffffffffa042d43b&gt;] ? nouveau_gem_ioctl_cpu_prep+0x4b/0xd0
[nouveau]
[56953.401820]  [&lt;ffffffffa01f720d&gt;] ? drm_ioctl+0x46d/0x570 [drm]
[56953.401855]  [&lt;ffffffffa0424307&gt;] ? nouveau_drm_ioctl+0x47/0x80 [nouveau]
[56953.401868]  [&lt;ffffffff8110c4cc&gt;] ? do_vfs_ioctl+0x2dc/0x4c0
[56953.401878]  [&lt;ffffffff810fc7cb&gt;] ? __fput+0x10b/0x200
[56953.401888]  [&lt;ffffffff81117817&gt;] ? mntput_no_expire+0x17/0x140
[56953.401898]  [&lt;ffffffff8110c6ec&gt;] ? SyS_ioctl+0x3c/0x80
[56953.401909]  [&lt;ffffffff810fc083&gt;] ? SyS_writev+0x43/0xa0
[56953.401922]  [&lt;ffffffff8143b6a6&gt;] ? system_call_fastpath+0x1a/0x1f
[56953.401930] Code: 7e ff ff ff 48 8b 7b 28 48 85 ff 5b 0f 94 c0 c3 66 90 41
57 41 56 41 55 49 89 f5 41 54 55 89 d5 53 48 89 fb 48 83 ec 50 48 8b 07 &lt;48&gt; 8b
48 08 48 8b 91 f0 00 00 00 4c 8b b9 50 07 00 00 48 8b 42 
[56953.402083] RIP  [&lt;ffffffffa0426b19&gt;]
nouveau_fence_wait_uevent.isra.5+0x19/0x450 [nouveau]
[56953.402114]  RSP &lt;ffff8800d1cebc68&gt;
[56953.402121] CR2: 0000000000000008
[56953.406272] ---[ end trace bd07d1bb1cb0dd7d ]---

X crashed and restarted, the text console was no longer accessible. Further
down the line quite a few of these:

[drm:drm_release] *ERROR* Device busy: 1

Restarting the system hanged right before the restart with continuing errors
from nouveau (&gt;20 errors/sec) which I (due to unthoughtfulness) forgot to write
down. Something with &quot;_W&quot; in it. :(

Kernel is 3.12.4 (x86_64)
xorg-server 1.14.99.903
xf86-video-nouveau 1.0.10
libdrm 2.4.50
mesa 10.0

Default options to the nouveau X driver w/ the exception of &quot;GLXVBlank&quot; set to
&quot;true&quot;. The nouveau kernel module sets the performance level to 1.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386772682.8AFF1.4245--

--===============1643097557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1643097557==--
