From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91413] INFO: task Xorg:2419 blocked for more than
	120 seconds.
Date: Mon, 17 Aug 2015 13:57:51 +0000
Message-ID: <bug-91413-8800-FSPpVEiAHY@http.bugs.freedesktop.org/>
References: <bug-91413-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0533299623=="
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


--===============0533299623==
Content-Type: multipart/alternative; boundary="1439819871.050A2.2944"; charset="UTF-8"


--1439819871.050A2.2944
Date: Mon, 17 Aug 2015 13:57:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91413

Jim Paris <jim-XrPbb/hENzg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jim-XrPbb/hENzg@public.gmane.org

--- Comment #4 from Jim Paris <jim-XrPbb/hENzg@public.gmane.org> ---
I have the exact same system (slightly older BIOS version) and I'm seeing the
same lockup, which occurred while idling over the weekend.  Seems to be
stemming from nvkm_fantog_update.

This is 4.2-rc6.  I also saw lockups on 4.1.0 which I'm guessing were the same
cause, but I wasn't able to get any logs from those.  3.13 was working fine.

[176041.174195] ------------[ cut here ]------------
[176041.174202] WARNING: CPU: 0 PID: 0 at
/build/linux-Tql0Dq/linux-4.2~rc6/kernel/watchdog.c:311
watchdog_overflow_callback+0x84/0xb0()
[176041.174203] Watchdog detected hard LOCKUP on cpu 0
[176041.174203] Modules linked in: ipt_MASQUERADE nf_nat_masquerade_ipv4
xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp iptable_filter nf_nat_h323
nf_conntrack_h323 nf_nat_pptp nf_nat_proto_gre nf_conntrack_pptp
nf_conntrack_proto_gre nf_nat_tftp nf_conntrack_tftp nf_nat_sip
nf_conntrack_sip nf_nat_irc nf_conntrack_irc nf_nat_ftp nf_conntrack_ftp
iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack
ip_tables x_tables loop sdhci_pci sdhci mmc_core ctr ccm binfmt_misc nfsd
auth_rpcgss oid_registry nfs_acl nfs lockd grace fscache sunrpc joydev
hid_generic usbhid hid uas usb_storage ath3k btusb btrtl btbcm btintel
bluetooth x86_pkg_temp_thermal intel_powerclamp intel_rapl iosf_mbi coretemp
kvm_intel kvm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel sha256_ssse3
sha256_generic hmac drbg ansi_cprng snd_hda_codec_hdmi snd_hda_codec_realtek
aesni_intel nouveau mxm_wmi snd_hda_codec_generic arc4 wmi ttm drm_kms_helper
drm aes_x86_64 lrw snd_hda_intel gf128mul snd_hda_codec glue_helper
snd_hda_core ablk_helper snd_hwdep ath9k ath9k_common ath9k_hw cryptd iTCO_wdt
iTCO_vendor_support snd_pcm xhci_pci evdev dcdbas psmouse serio_raw pcspkr
i2c_algo_bit ath mac80211 cfg80211 snd_timer xhci_hcd snd rfkill soundcore
video battery i2c_i801 lpc_ich mfd_core mei_me mei shpchp processor button
efi_pstore efivars fuse parport_pc ppdev lp parport autofs4 ext4 crc16 mbcache
jbd2 sg sr_mod cdrom sd_mod r8169 mii ahci crc32c_intel libahci libata ehci_pci
ehci_hcd scsi_mod usbcore usb_common fan thermal thermal_sys
[176041.174257] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.2.0-rc6-amd64 #1
Debian 4.2~rc6-1~exp1
[176041.174258] Hardware name: Dell Inc. XPS 8700/0KWVT8, BIOS A08 04/16/2014
[176041.174259]  0000000000000000 ffffffff81729448 ffffffff81546a1d
ffff88021ec05b60
[176041.174260]  ffffffff8106e571 ffff880214e09000 0000000000000000
ffff88021ec05c40
[176041.174262]  ffff88021ec05ef8 0000000000000000 ffffffff8106e5ea
ffffffff81729420
[176041.174263] Call Trace:
[176041.174264]  <NMI>  [<ffffffff81546a1d>] ? dump_stack+0x40/0x50
[176041.174270]  [<ffffffff8106e571>] ? warn_slowpath_common+0x81/0xb0
[176041.174272]  [<ffffffff8106e5ea>] ? warn_slowpath_fmt+0x4a/0x50
[176041.174273]  [<ffffffff811080c4>] ? watchdog_overflow_callback+0x84/0xb0
[176041.174276]  [<ffffffff811427d2>] ? __perf_event_overflow+0x82/0x1b0
[176041.174278]  [<ffffffff81030e24>] ? intel_pmu_handle_irq+0x1d4/0x440
[176041.174281]  [<ffffffff81027fa5>] ? perf_event_nmi_handler+0x25/0x40
[176041.174283]  [<ffffffff8101c804>] ? native_sched_clock+0x24/0x80
[176041.174284]  [<ffffffff810176d2>] ? nmi_handle+0x82/0x110
[176041.174285]  [<ffffffff81017c42>] ? default_do_nmi+0xc2/0x110
[176041.174286]  [<ffffffff81017d6b>] ? do_nmi+0xdb/0x130
[176041.174289]  [<ffffffff8154e414>] ? end_repeat_nmi+0x1a/0x1e
[176041.174290]  [<ffffffff810aedf5>] ?
native_queued_spin_lock_slowpath+0x165/0x180
[176041.174292]  [<ffffffff810aedf5>] ?
native_queued_spin_lock_slowpath+0x165/0x180
[176041.174293]  [<ffffffff810aedf5>] ?
native_queued_spin_lock_slowpath+0x165/0x180
[176041.174293]  <<EOE>>  <IRQ>  [<ffffffff8154bf12>] ?
_raw_spin_lock_irqsave+0x32/0x40
[176041.174306]  [<ffffffffa060742c>] ? nvkm_fantog_update+0x4c/0x110 [nouveau]
[176041.174313]  [<ffffffffa0607542>] ? nvkm_fantog_set+0x32/0x40 [nouveau]
[176041.174320]  [<ffffffffa0606a89>] ? nvkm_fan_update+0xe9/0x1e0 [nouveau]
[176041.174327]  [<ffffffffa060992c>] ? nv04_timer_alarm_trigger+0x10c/0x150
[nouveau]
[176041.174333]  [<ffffffffa06074ee>] ? nvkm_fantog_update+0x10e/0x110
[nouveau]
[176041.174339]  [<ffffffffa060992c>] ? nv04_timer_alarm_trigger+0x10c/0x150
[nouveau]
[176041.174344]  [<ffffffffa0609a8a>] ? nv04_timer_intr+0x6a/0x90 [nouveau]
[176041.174351]  [<ffffffffa0600e2d>] ? nvkm_mc_intr+0xed/0x160 [nouveau]
[176041.174353]  [<ffffffff810bd7eb>] ? handle_irq_event_percpu+0x6b/0x180
[176041.174354]  [<ffffffff810bd940>] ? handle_irq_event+0x40/0x60
[176041.174356]  [<ffffffff810c092b>] ? handle_edge_irq+0x7b/0x140
[176041.174357]  [<ffffffff81015eed>] ? handle_irq+0x1d/0x30
[176041.174359]  [<ffffffff8154ecf6>] ? do_IRQ+0x46/0xd0
[176041.174361]  [<ffffffff8154ccab>] ? common_interrupt+0x6b/0x6b
[176041.174361]  <EOI>  [<ffffffff81424278>] ? cpuidle_enter_state+0xe8/0x220
[176041.174365]  [<ffffffff81424253>] ? cpuidle_enter_state+0xc3/0x220
[176041.174367]  [<ffffffff810aa0f6>] ? cpu_startup_entry+0x256/0x310
[176041.174368]  [<ffffffff8192af5e>] ? start_kernel+0x480/0x48b
[176041.174370]  [<ffffffff8192a120>] ? early_idt_handler_array+0x120/0x120
[176041.174371]  [<ffffffff8192a120>] ? early_idt_handler_array+0x120/0x120
[176041.174373]  [<ffffffff8192a605>] ? x86_64_start_kernel+0x148/0x157
[176041.174374] ---[ end trace 0ed75ece92f6e55f ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1439819871.050A2.2944
Date: Mon, 17 Aug 2015 13:57:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jim&#64;jtan.com" title="Jim Paris &lt;jim&#64;jtan.com&gt;"> <span class="fn">Jim Paris</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INFO: task Xorg:2419 blocked for more than 120 seconds."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91413">bug 91413</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>jim&#64;jtan.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INFO: task Xorg:2419 blocked for more than 120 seconds."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91413#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INFO: task Xorg:2419 blocked for more than 120 seconds."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91413">bug 91413</a>
              from <span class="vcard"><a class="email" href="mailto:jim&#64;jtan.com" title="Jim Paris &lt;jim&#64;jtan.com&gt;"> <span class="fn">Jim Paris</span></a>
</span></b>
        <pre>I have the exact same system (slightly older BIOS version) and I'm seeing the
same lockup, which occurred while idling over the weekend.  Seems to be
stemming from nvkm_fantog_update.

This is 4.2-rc6.  I also saw lockups on 4.1.0 which I'm guessing were the same
cause, but I wasn't able to get any logs from those.  3.13 was working fine.

[176041.174195] ------------[ cut here ]------------
[176041.174202] WARNING: CPU: 0 PID: 0 at
/build/linux-Tql0Dq/linux-4.2~rc6/kernel/watchdog.c:311
watchdog_overflow_callback+0x84/0xb0()
[176041.174203] Watchdog detected hard LOCKUP on cpu 0
[176041.174203] Modules linked in: ipt_MASQUERADE nf_nat_masquerade_ipv4
xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp iptable_filter nf_nat_h323
nf_conntrack_h323 nf_nat_pptp nf_nat_proto_gre nf_conntrack_pptp
nf_conntrack_proto_gre nf_nat_tftp nf_conntrack_tftp nf_nat_sip
nf_conntrack_sip nf_nat_irc nf_conntrack_irc nf_nat_ftp nf_conntrack_ftp
iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack
ip_tables x_tables loop sdhci_pci sdhci mmc_core ctr ccm binfmt_misc nfsd
auth_rpcgss oid_registry nfs_acl nfs lockd grace fscache sunrpc joydev
hid_generic usbhid hid uas usb_storage ath3k btusb btrtl btbcm btintel
bluetooth x86_pkg_temp_thermal intel_powerclamp intel_rapl iosf_mbi coretemp
kvm_intel kvm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel sha256_ssse3
sha256_generic hmac drbg ansi_cprng snd_hda_codec_hdmi snd_hda_codec_realtek
aesni_intel nouveau mxm_wmi snd_hda_codec_generic arc4 wmi ttm drm_kms_helper
drm aes_x86_64 lrw snd_hda_intel gf128mul snd_hda_codec glue_helper
snd_hda_core ablk_helper snd_hwdep ath9k ath9k_common ath9k_hw cryptd iTCO_wdt
iTCO_vendor_support snd_pcm xhci_pci evdev dcdbas psmouse serio_raw pcspkr
i2c_algo_bit ath mac80211 cfg80211 snd_timer xhci_hcd snd rfkill soundcore
video battery i2c_i801 lpc_ich mfd_core mei_me mei shpchp processor button
efi_pstore efivars fuse parport_pc ppdev lp parport autofs4 ext4 crc16 mbcache
jbd2 sg sr_mod cdrom sd_mod r8169 mii ahci crc32c_intel libahci libata ehci_pci
ehci_hcd scsi_mod usbcore usb_common fan thermal thermal_sys
[176041.174257] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.2.0-rc6-amd64 #1
Debian 4.2~rc6-1~exp1
[176041.174258] Hardware name: Dell Inc. XPS 8700/0KWVT8, BIOS A08 04/16/2014
[176041.174259]  0000000000000000 ffffffff81729448 ffffffff81546a1d
ffff88021ec05b60
[176041.174260]  ffffffff8106e571 ffff880214e09000 0000000000000000
ffff88021ec05c40
[176041.174262]  ffff88021ec05ef8 0000000000000000 ffffffff8106e5ea
ffffffff81729420
[176041.174263] Call Trace:
[176041.174264]  &lt;NMI&gt;  [&lt;ffffffff81546a1d&gt;] ? dump_stack+0x40/0x50
[176041.174270]  [&lt;ffffffff8106e571&gt;] ? warn_slowpath_common+0x81/0xb0
[176041.174272]  [&lt;ffffffff8106e5ea&gt;] ? warn_slowpath_fmt+0x4a/0x50
[176041.174273]  [&lt;ffffffff811080c4&gt;] ? watchdog_overflow_callback+0x84/0xb0
[176041.174276]  [&lt;ffffffff811427d2&gt;] ? __perf_event_overflow+0x82/0x1b0
[176041.174278]  [&lt;ffffffff81030e24&gt;] ? intel_pmu_handle_irq+0x1d4/0x440
[176041.174281]  [&lt;ffffffff81027fa5&gt;] ? perf_event_nmi_handler+0x25/0x40
[176041.174283]  [&lt;ffffffff8101c804&gt;] ? native_sched_clock+0x24/0x80
[176041.174284]  [&lt;ffffffff810176d2&gt;] ? nmi_handle+0x82/0x110
[176041.174285]  [&lt;ffffffff81017c42&gt;] ? default_do_nmi+0xc2/0x110
[176041.174286]  [&lt;ffffffff81017d6b&gt;] ? do_nmi+0xdb/0x130
[176041.174289]  [&lt;ffffffff8154e414&gt;] ? end_repeat_nmi+0x1a/0x1e
[176041.174290]  [&lt;ffffffff810aedf5&gt;] ?
native_queued_spin_lock_slowpath+0x165/0x180
[176041.174292]  [&lt;ffffffff810aedf5&gt;] ?
native_queued_spin_lock_slowpath+0x165/0x180
[176041.174293]  [&lt;ffffffff810aedf5&gt;] ?
native_queued_spin_lock_slowpath+0x165/0x180
[176041.174293]  &lt;&lt;EOE&gt;&gt;  &lt;IRQ&gt;  [&lt;ffffffff8154bf12&gt;] ?
_raw_spin_lock_irqsave+0x32/0x40
[176041.174306]  [&lt;ffffffffa060742c&gt;] ? nvkm_fantog_update+0x4c/0x110 [nouveau]
[176041.174313]  [&lt;ffffffffa0607542&gt;] ? nvkm_fantog_set+0x32/0x40 [nouveau]
[176041.174320]  [&lt;ffffffffa0606a89&gt;] ? nvkm_fan_update+0xe9/0x1e0 [nouveau]
[176041.174327]  [&lt;ffffffffa060992c&gt;] ? nv04_timer_alarm_trigger+0x10c/0x150
[nouveau]
[176041.174333]  [&lt;ffffffffa06074ee&gt;] ? nvkm_fantog_update+0x10e/0x110
[nouveau]
[176041.174339]  [&lt;ffffffffa060992c&gt;] ? nv04_timer_alarm_trigger+0x10c/0x150
[nouveau]
[176041.174344]  [&lt;ffffffffa0609a8a&gt;] ? nv04_timer_intr+0x6a/0x90 [nouveau]
[176041.174351]  [&lt;ffffffffa0600e2d&gt;] ? nvkm_mc_intr+0xed/0x160 [nouveau]
[176041.174353]  [&lt;ffffffff810bd7eb&gt;] ? handle_irq_event_percpu+0x6b/0x180
[176041.174354]  [&lt;ffffffff810bd940&gt;] ? handle_irq_event+0x40/0x60
[176041.174356]  [&lt;ffffffff810c092b&gt;] ? handle_edge_irq+0x7b/0x140
[176041.174357]  [&lt;ffffffff81015eed&gt;] ? handle_irq+0x1d/0x30
[176041.174359]  [&lt;ffffffff8154ecf6&gt;] ? do_IRQ+0x46/0xd0
[176041.174361]  [&lt;ffffffff8154ccab&gt;] ? common_interrupt+0x6b/0x6b
[176041.174361]  &lt;EOI&gt;  [&lt;ffffffff81424278&gt;] ? cpuidle_enter_state+0xe8/0x220
[176041.174365]  [&lt;ffffffff81424253&gt;] ? cpuidle_enter_state+0xc3/0x220
[176041.174367]  [&lt;ffffffff810aa0f6&gt;] ? cpu_startup_entry+0x256/0x310
[176041.174368]  [&lt;ffffffff8192af5e&gt;] ? start_kernel+0x480/0x48b
[176041.174370]  [&lt;ffffffff8192a120&gt;] ? early_idt_handler_array+0x120/0x120
[176041.174371]  [&lt;ffffffff8192a120&gt;] ? early_idt_handler_array+0x120/0x120
[176041.174373]  [&lt;ffffffff8192a605&gt;] ? x86_64_start_kernel+0x148/0x157
[176041.174374] ---[ end trace 0ed75ece92f6e55f ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1439819871.050A2.2944--

--===============0533299623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0533299623==--
