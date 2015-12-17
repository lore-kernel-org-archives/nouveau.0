From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91954] "link training failed": nouveau does not
 recover from monitor suspend
Date: Thu, 17 Dec 2015 13:40:00 +0000
Message-ID: <bug-91954-8800-jWg2O9rONG@http.bugs.freedesktop.org/>
References: <bug-91954-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1337932787=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91954-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1337932787==
Content-Type: multipart/alternative; boundary="1450359600.B0DCc23.16726"; charset="UTF-8"


--1450359600.B0DCc23.16726
Date: Thu, 17 Dec 2015 13:40:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91954

--- Comment #4 from Julien HENRY <henryju-Qt13gs6zZMY@public.gmane.org> ---
I have a similar issue on Fedora 23 using kernel rawhide
4.4.0-0.rc5.git0.1.fc24.x86_64 + xorg-x11-drv-nouveau-1.0.12-1.fc23.x86_64.

I have two monitors: DVI + Display port.

After letting them go to suspend mode, when I tried to move the mouse the DVI
one woke up but the one on display port was completely corrupted.
I went to monitor settings in order to change resolution as an attempt to fix
the issue without reboot and it froze completly the UI (I can still SSH from
another computer).

[14390.513212] nouveau 0000:01:00.0: disp: outp 05:0006:0f44: link training
failed
[14390.670611] ------------[ cut here ]------------
[14390.670617] WARNING: CPU: 3 PID: 26365 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[14390.670618] Modules linked in: tun ip6t_rpfilter ip6t_REJECT nf_reject_ipv6
xt_conntrack ebtable_broute bridge stp llc ebtable_filter ebtable_nat ebtables
ip6table_raw ip6table_security ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 ip6table_mangle ip6table_filter ip6_tables iptable_raw
iptable_security iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4
nf_nat nf_conntrack iptable_mangle binfmt_misc gspca_zc3xx gspca_main
v4l2_common videodev media snd_usb_audio snd_usbmidi_lib snd_rawmidi joydev
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic snd_hda_intel
snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_device snd_pcm iTCO_wdt
iTCO_vendor_support intel_rapl eeepc_wmi iosf_mbi x86_pkg_temp_thermal coretemp
asus_wmi sparse_keymap kvm rfkill irqbypass snd_timer
[14390.670639]  snd crct10dif_pclmul crc32_pclmul crc32c_intel soundcore mei_me
mei lpc_ich i2c_i801 shpchp tpm_infineon tpm_tis tpm nfsd auth_rpcgss nfs_acl
lockd grace sunrpc nouveau serio_raw r8169 mxm_wmi i2c_algo_bit drm_kms_helper
uas mii ttm usb_storage drm hid_roccat_konepure hid_roccat hid_roccat_common
video wmi fjes
[14390.670651] CPU: 3 PID: 26365 Comm: kworker/3:1 Tainted: G        W      
4.4.0-0.rc5.git0.1.fc24.x86_64 #1
[14390.670652] Hardware name: ASUS All Series/Z87-C, BIOS 2103 08/15/2014
[14390.670663] Workqueue: events nvif_notify_work [nouveau]
[14390.670664]  0000000000000000 000000005f9a7b6d ffff8801a0fefd10
ffffffff813b022f
[14390.670666]  0000000000000000 ffff8801a0fefd48 ffffffff810a2ef2
ffff880212424000
[14390.670667]  ffff880036a50600 ffff880214c47000 0000000000000000
ffff880214eb63e8
[14390.670668] Call Trace:
[14390.670672]  [<ffffffff813b022f>] dump_stack+0x44/0x55
[14390.670674]  [<ffffffff810a2ef2>] warn_slowpath_common+0x82/0xc0
[14390.670675]  [<ffffffff810a303a>] warn_slowpath_null+0x1a/0x20
[14390.670677]  [<ffffffffa01192ca>] drm_helper_choose_encoder_dpms+0x8a/0x90
[drm_kms_helper]
[14390.670679]  [<ffffffffa01193bb>] drm_helper_connector_dpms+0x4b/0x100
[drm_kms_helper]
[14390.670695]  [<ffffffffa020574b>] nouveau_connector_hotplug+0x5b/0xb0
[nouveau]
[14390.670700]  [<ffffffffa0165a77>] nvif_notify_work+0x27/0xa0 [nouveau]
[14390.670702]  [<ffffffff81791f8e>] ? _raw_spin_unlock_irqrestore+0xe/0x10
[14390.670704]  [<ffffffff810ba9bd>] ? pwq_dec_nr_in_flight+0x4d/0xa0
[14390.670705]  [<ffffffff810bb07e>] process_one_work+0x19e/0x3f0
[14390.670706]  [<ffffffff810bb31e>] worker_thread+0x4e/0x450
[14390.670708]  [<ffffffff8178de30>] ? __schedule+0x3e0/0x9b0
[14390.670709]  [<ffffffff810bb2d0>] ? process_one_work+0x3f0/0x3f0
[14390.670710]  [<ffffffff810bb2d0>] ? process_one_work+0x3f0/0x3f0
[14390.670711]  [<ffffffff810c10a8>] kthread+0xd8/0xf0
[14390.670712]  [<ffffffff810c0fd0>] ? kthread_worker_fn+0x160/0x160
[14390.670714]  [<ffffffff8179284f>] ret_from_fork+0x3f/0x70
[14390.670715]  [<ffffffff810c0fd0>] ? kthread_worker_fn+0x160/0x160
[14390.670716] ---[ end trace 0fc951b1df0a1d95 ]--

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450359600.B0DCc23.16726
Date: Thu, 17 Dec 2015 13:40:00 +0000
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
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954">bug 91954</a>
              from <span class="vcard"><a class="email" href="mailto:henryju&#64;yahoo.fr" title="Julien HENRY &lt;henryju&#64;yahoo.fr&gt;"> <span class="fn">Julien HENRY</span></a>
</span></b>
        <pre>I have a similar issue on Fedora 23 using kernel rawhide
4.4.0-0.rc5.git0.1.fc24.x86_64 + xorg-x11-drv-nouveau-1.0.12-1.fc23.x86_64.

I have two monitors: DVI + Display port.

After letting them go to suspend mode, when I tried to move the mouse the DVI
one woke up but the one on display port was completely corrupted.
I went to monitor settings in order to change resolution as an attempt to fix
the issue without reboot and it froze completly the UI (I can still SSH from
another computer).

[14390.513212] nouveau 0000:01:00.0: disp: outp 05:0006:0f44: link training
failed
[14390.670611] ------------[ cut here ]------------
[14390.670617] WARNING: CPU: 3 PID: 26365 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[14390.670618] Modules linked in: tun ip6t_rpfilter ip6t_REJECT nf_reject_ipv6
xt_conntrack ebtable_broute bridge stp llc ebtable_filter ebtable_nat ebtables
ip6table_raw ip6table_security ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 ip6table_mangle ip6table_filter ip6_tables iptable_raw
iptable_security iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4
nf_nat nf_conntrack iptable_mangle binfmt_misc gspca_zc3xx gspca_main
v4l2_common videodev media snd_usb_audio snd_usbmidi_lib snd_rawmidi joydev
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic snd_hda_intel
snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_device snd_pcm iTCO_wdt
iTCO_vendor_support intel_rapl eeepc_wmi iosf_mbi x86_pkg_temp_thermal coretemp
asus_wmi sparse_keymap kvm rfkill irqbypass snd_timer
[14390.670639]  snd crct10dif_pclmul crc32_pclmul crc32c_intel soundcore mei_me
mei lpc_ich i2c_i801 shpchp tpm_infineon tpm_tis tpm nfsd auth_rpcgss nfs_acl
lockd grace sunrpc nouveau serio_raw r8169 mxm_wmi i2c_algo_bit drm_kms_helper
uas mii ttm usb_storage drm hid_roccat_konepure hid_roccat hid_roccat_common
video wmi fjes
[14390.670651] CPU: 3 PID: 26365 Comm: kworker/3:1 Tainted: G        W      
4.4.0-0.rc5.git0.1.fc24.x86_64 #1
[14390.670652] Hardware name: ASUS All Series/Z87-C, BIOS 2103 08/15/2014
[14390.670663] Workqueue: events nvif_notify_work [nouveau]
[14390.670664]  0000000000000000 000000005f9a7b6d ffff8801a0fefd10
ffffffff813b022f
[14390.670666]  0000000000000000 ffff8801a0fefd48 ffffffff810a2ef2
ffff880212424000
[14390.670667]  ffff880036a50600 ffff880214c47000 0000000000000000
ffff880214eb63e8
[14390.670668] Call Trace:
[14390.670672]  [&lt;ffffffff813b022f&gt;] dump_stack+0x44/0x55
[14390.670674]  [&lt;ffffffff810a2ef2&gt;] warn_slowpath_common+0x82/0xc0
[14390.670675]  [&lt;ffffffff810a303a&gt;] warn_slowpath_null+0x1a/0x20
[14390.670677]  [&lt;ffffffffa01192ca&gt;] drm_helper_choose_encoder_dpms+0x8a/0x90
[drm_kms_helper]
[14390.670679]  [&lt;ffffffffa01193bb&gt;] drm_helper_connector_dpms+0x4b/0x100
[drm_kms_helper]
[14390.670695]  [&lt;ffffffffa020574b&gt;] nouveau_connector_hotplug+0x5b/0xb0
[nouveau]
[14390.670700]  [&lt;ffffffffa0165a77&gt;] nvif_notify_work+0x27/0xa0 [nouveau]
[14390.670702]  [&lt;ffffffff81791f8e&gt;] ? _raw_spin_unlock_irqrestore+0xe/0x10
[14390.670704]  [&lt;ffffffff810ba9bd&gt;] ? pwq_dec_nr_in_flight+0x4d/0xa0
[14390.670705]  [&lt;ffffffff810bb07e&gt;] process_one_work+0x19e/0x3f0
[14390.670706]  [&lt;ffffffff810bb31e&gt;] worker_thread+0x4e/0x450
[14390.670708]  [&lt;ffffffff8178de30&gt;] ? __schedule+0x3e0/0x9b0
[14390.670709]  [&lt;ffffffff810bb2d0&gt;] ? process_one_work+0x3f0/0x3f0
[14390.670710]  [&lt;ffffffff810bb2d0&gt;] ? process_one_work+0x3f0/0x3f0
[14390.670711]  [&lt;ffffffff810c10a8&gt;] kthread+0xd8/0xf0
[14390.670712]  [&lt;ffffffff810c0fd0&gt;] ? kthread_worker_fn+0x160/0x160
[14390.670714]  [&lt;ffffffff8179284f&gt;] ret_from_fork+0x3f/0x70
[14390.670715]  [&lt;ffffffff810c0fd0&gt;] ? kthread_worker_fn+0x160/0x160
[14390.670716] ---[ end trace 0fc951b1df0a1d95 ]--</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450359600.B0DCc23.16726--

--===============1337932787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1337932787==--
