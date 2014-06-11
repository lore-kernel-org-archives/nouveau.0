From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79912] New: Nouveau unuseable with 3 monitors and a
 geforce GTX 670
Date: Wed, 11 Jun 2014 09:16:16 +0000
Message-ID: <bug-79912-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0843492394=="
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


--===============0843492394==
Content-Type: multipart/alternative; boundary="1402478176.AdCf721.9280"; charset="us-ascii"


--1402478176.AdCf721.9280
Date: Wed, 11 Jun 2014 09:16:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79912

          Priority: medium
            Bug ID: 79912
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau unuseable with 3 monitors and a geforce GTX
                    670
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: tiziano.bacocco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

If i connect a third monitor on HDMI , on that one i get a purple vertical line
on the left , DVI-D one does not work, and framerate of gnome-shell is very
very low

On the kernel logs at boot i get 

[   25.163082] WARNING: CPU: 1 PID: 1188 at drivers/gpu/drm/ttm/ttm_bo_vm.c:269
ttm_bo_vm_open+0x52/0x80 [ttm]()
[   25.163084] Modules linked in: ccm xt_CHECKSUM iptable_mangle ipt_MASQUERADE
iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack
nf_conntrack tun bnep bridge stp llc snd_hda_codec_hdmi x86_pkg_temp_thermal
coretemp snd_hda_codec_realtek snd_hda_codec_generic snd_hda_intel kvm_intel
snd_hda_codec snd_hwdep arc4 ath9k ath9k_common ath9k_hw snd_seq ath
ir_lirc_codec ir_mce_kbd_decoder lirc_dev ir_sony_decoder ir_nec_decoder
ir_sanyo_decoder ir_rc6_decoder ir_jvc_decoder mac80211 ir_rc5_decoder nouveau
r820t kvm snd_seq_device snd_pcm iTCO_wdt rtl2832 cfg80211 crct10dif_pclmul
iTCO_vendor_support dvb_usb_rtl28xxu rtl2830 i2c_algo_bit ttm crc32_pclmul
btusb crc32c_intel dvb_usb_v2 eeepc_wmi asus_wmi snd_timer drm_kms_helper
sparse_keymap snd drm ghash_clmulni_intel dvb_core soundcore
[   25.163138]  bluetooth i2c_i801 radio_ma901 tpm_tis tpm_infineon joydev
videodev mei_me 6lowpan_iphc rfkill rc_core media i2c_core serio_raw tpm
lpc_ich mei shpchp mfd_core microcode nfsd auth_rpcgss nfs_acl lockd sunrpc
raid0 mxm_wmi e1000e ptp pps_core video wmi
[   25.163164] CPU: 1 PID: 1188 Comm: Xorg Tainted: G        W   
3.14.5-200.fc20.x86_64 #1
[   25.163166] Hardware name: ASUS All Series/Z87-PRO, BIOS 0903 05/06/2013
[   25.163168]  0000000000000000 00000000c1415f90 ffff88030476bd90
ffffffff816efa42
[   25.163173]  0000000000000000 ffff88030476bdc8 ffffffff8108a1cd
ffff880309ca6000
[   25.163179]  ffff880309d23ac8 ffff88030bd69f18 0000000000000000
0000000000000000
[   25.163183] Call Trace:
[   25.163189]  [<ffffffff816efa42>] dump_stack+0x45/0x56
[   25.163194]  [<ffffffff8108a1cd>] warn_slowpath_common+0x7d/0xa0
[   25.163199]  [<ffffffff8108a2fa>] warn_slowpath_null+0x1a/0x20
[   25.163209]  [<ffffffffa034b132>] ttm_bo_vm_open+0x52/0x80 [ttm]
[   25.163214]  [<ffffffff81088f17>] copy_process.part.26+0x18f7/0x1b90
[   25.163219]  [<ffffffff81089373>] do_fork+0xc3/0x370
[   25.163225]  [<ffffffff810896a6>] SyS_clone+0x16/0x20
[   25.163229]  [<ffffffff81700189>] stub_clone+0x69/0x90
[   25.163234]  [<ffffffff816ffe29>] ? system_call_fastpath+0x16/0x1b
[   25.163237] ---[ end trace da86bd3f343ad454 ]---
[   25.163241] ------------[ cut here ]------------


and when using it thousands of lines with
[  342.347721] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.360259] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.373450] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.386710] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.400035] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.412854] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.426119] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  343.290435] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402478176.AdCf721.9280
Date: Wed, 11 Jun 2014 09:16:16 +0000
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
   title="NEW --- - Nouveau unuseable with 3 monitors and a geforce GTX 670"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79912">79912</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau unuseable with 3 monitors and a geforce GTX 670
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>tiziano.bacocco&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
        <pre>If i connect a third monitor on HDMI , on that one i get a purple vertical line
on the left , DVI-D one does not work, and framerate of gnome-shell is very
very low

On the kernel logs at boot i get 

[   25.163082] WARNING: CPU: 1 PID: 1188 at drivers/gpu/drm/ttm/ttm_bo_vm.c:269
ttm_bo_vm_open+0x52/0x80 [ttm]()
[   25.163084] Modules linked in: ccm xt_CHECKSUM iptable_mangle ipt_MASQUERADE
iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack
nf_conntrack tun bnep bridge stp llc snd_hda_codec_hdmi x86_pkg_temp_thermal
coretemp snd_hda_codec_realtek snd_hda_codec_generic snd_hda_intel kvm_intel
snd_hda_codec snd_hwdep arc4 ath9k ath9k_common ath9k_hw snd_seq ath
ir_lirc_codec ir_mce_kbd_decoder lirc_dev ir_sony_decoder ir_nec_decoder
ir_sanyo_decoder ir_rc6_decoder ir_jvc_decoder mac80211 ir_rc5_decoder nouveau
r820t kvm snd_seq_device snd_pcm iTCO_wdt rtl2832 cfg80211 crct10dif_pclmul
iTCO_vendor_support dvb_usb_rtl28xxu rtl2830 i2c_algo_bit ttm crc32_pclmul
btusb crc32c_intel dvb_usb_v2 eeepc_wmi asus_wmi snd_timer drm_kms_helper
sparse_keymap snd drm ghash_clmulni_intel dvb_core soundcore
[   25.163138]  bluetooth i2c_i801 radio_ma901 tpm_tis tpm_infineon joydev
videodev mei_me 6lowpan_iphc rfkill rc_core media i2c_core serio_raw tpm
lpc_ich mei shpchp mfd_core microcode nfsd auth_rpcgss nfs_acl lockd sunrpc
raid0 mxm_wmi e1000e ptp pps_core video wmi
[   25.163164] CPU: 1 PID: 1188 Comm: Xorg Tainted: G        W   
3.14.5-200.fc20.x86_64 #1
[   25.163166] Hardware name: ASUS All Series/Z87-PRO, BIOS 0903 05/06/2013
[   25.163168]  0000000000000000 00000000c1415f90 ffff88030476bd90
ffffffff816efa42
[   25.163173]  0000000000000000 ffff88030476bdc8 ffffffff8108a1cd
ffff880309ca6000
[   25.163179]  ffff880309d23ac8 ffff88030bd69f18 0000000000000000
0000000000000000
[   25.163183] Call Trace:
[   25.163189]  [&lt;ffffffff816efa42&gt;] dump_stack+0x45/0x56
[   25.163194]  [&lt;ffffffff8108a1cd&gt;] warn_slowpath_common+0x7d/0xa0
[   25.163199]  [&lt;ffffffff8108a2fa&gt;] warn_slowpath_null+0x1a/0x20
[   25.163209]  [&lt;ffffffffa034b132&gt;] ttm_bo_vm_open+0x52/0x80 [ttm]
[   25.163214]  [&lt;ffffffff81088f17&gt;] copy_process.part.26+0x18f7/0x1b90
[   25.163219]  [&lt;ffffffff81089373&gt;] do_fork+0xc3/0x370
[   25.163225]  [&lt;ffffffff810896a6&gt;] SyS_clone+0x16/0x20
[   25.163229]  [&lt;ffffffff81700189&gt;] stub_clone+0x69/0x90
[   25.163234]  [&lt;ffffffff816ffe29&gt;] ? system_call_fastpath+0x16/0x1b
[   25.163237] ---[ end trace da86bd3f343ad454 ]---
[   25.163241] ------------[ cut here ]------------


and when using it thousands of lines with
[  342.347721] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.360259] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.373450] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.386710] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.400035] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.412854] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  342.426119] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d
[  343.290435] nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x10005080 0x0000400d</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402478176.AdCf721.9280--

--===============0843492394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0843492394==--
