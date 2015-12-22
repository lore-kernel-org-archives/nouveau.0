From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81690] nouveau GPU locks up under memory pressure
Date: Tue, 22 Dec 2015 12:15:10 +0000
Message-ID: <bug-81690-8800-lzz5txbMOT@http.bugs.freedesktop.org/>
References: <bug-81690-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1827985567=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81690-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1827985567==
Content-Type: multipart/alternative; boundary="1450786510.e1174.15482"; charset="UTF-8"


--1450786510.e1174.15482
Date: Tue, 22 Dec 2015 12:15:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81690

--- Comment #10 from Philippe "RzR" Coval <philippe.coval.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I think I am also affected by this nouveau bug, on :

01:00.0 VGA compatible controller: NVIDIA Corporation GK106 [GeForce GTX 645
OEM] (rev a1)


Now I have installed koops,
I can provide more traces or data if anyone want to tell me what to do.


[ 1480.528031] ------------[ cut here ]------------
[ 1480.528033] WARNING: CPU: 0 PID: 4 at
/home/kernel/COD/linux/include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[ 1480.528034] Modules linked in: bnep rfcomm bluetooth uvcvideo joydev
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_core v4l2_common
intel_rapl videodev x86_pkg_temp_thermal media intel_powerclamp input_leds
coretemp kvm_intel kvm irqbypass snd_hda_codec_hdmi snd_hda_codec_realtek
snd_hda_codec_generic snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep mei_me
dcdbas snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq
snd_seq_device snd_timer snd soundcore mei shpchp lpc_ich 8250_fintek mac_hid
serio_raw binfmt_misc parport_pc ppdev lp parport drbg ansi_cprng dm_crypt
hid_generic usbhid hid uas usb_storage nouveau mxm_wmi wmi i2c_algo_bit ttm
drm_kms_helper crct10dif_pclmul crc32_pclmul syscopyarea sysfillrect sysimgblt
fb_sys_fops aesni_intel aes_x86_64 lrw gf128mul glue_helper e1000e drm
ablk_helper cryptd psmouse ahci ptp libahci pps_core video fjes
[ 1480.528054] CPU: 0 PID: 4 Comm: kworker/0:0 Tainted: G        W      
4.4.0-999-generic #201512202100
[ 1480.528055] Hardware name: Dell Inc. OptiPlex 9020/0PC5F7, BIOS A02
08/15/2013
[ 1480.528060] Workqueue: events nvif_notify_work [nouveau]
[ 1480.528061]  0000000000000000 0000000097f6c821 ffff88040b663d10
ffffffff813c9124
[ 1480.528062]  0000000000000000 ffff88040b663d48 ffffffff8107db92
ffff880035ec0000
[ 1480.528063]  ffff880035ecb000 ffff880035ecb000 0000000000000003
0000000000000000
[ 1480.528064] Call Trace:
[ 1480.528066]  [<ffffffff813c9124>] dump_stack+0x44/0x60
[ 1480.528067]  [<ffffffff8107db92>] warn_slowpath_common+0x82/0xc0
[ 1480.528068]  [<ffffffff8107dcda>] warn_slowpath_null+0x1a/0x20
[ 1480.528070]  [<ffffffffc0263353>] drm_helper_choose_crtc_dpms+0x93/0xa0
[drm_kms_helper]
[ 1480.528072]  [<ffffffffc02633d7>] drm_helper_connector_dpms+0x77/0x100
[drm_kms_helper]
[ 1480.528088]  [<ffffffffc038eb70>] ? nv50_display_crtc_get+0x20/0x20
[nouveau]
[ 1480.528102]  [<ffffffffc038b53b>] nouveau_connector_hotplug+0x3b/0xb0
[nouveau]
[ 1480.528108]  [<ffffffffc02eaa77>] nvif_notify_work+0x27/0xa0 [nouveau]
[ 1480.528109]  [<ffffffff81094f6d>] ? pwq_dec_nr_in_flight+0x4d/0xa0
[ 1480.528111]  [<ffffffff8109687a>] process_one_work+0x1aa/0x440
[ 1480.528112]  [<ffffffff81096b5b>] worker_thread+0x4b/0x4c0
[ 1480.528113]  [<ffffffff81096b10>] ? process_one_work+0x440/0x440
[ 1480.528115]  [<ffffffff8109ccd8>] kthread+0xd8/0xf0
[ 1480.528116]  [<ffffffff8109cc00>] ? kthread_create_on_node+0x1a0/0x1a0
[ 1480.528118]  [<ffffffff817fd38f>] ret_from_fork+0x3f/0x70
[ 1480.528119]  [<ffffffff8109cc00>] ? kthread_create_on_node+0x1a0/0x1a0
[ 1480.528120] ---[ end trace 83b6c8059d499e87 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450786510.e1174.15482
Date: Tue, 22 Dec 2015 12:15:10 +0000
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
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690">bug 81690</a>
              from <span class="vcard"><a class="email" href="mailto:philippe.coval.pro&#64;gmail.com" title="Philippe &quot;RzR&quot; Coval &lt;philippe.coval.pro&#64;gmail.com&gt;"> <span class="fn">Philippe &quot;RzR&quot; Coval</span></a>
</span></b>
        <pre>I think I am also affected by this nouveau bug, on :

01:00.0 VGA compatible controller: NVIDIA Corporation GK106 [GeForce GTX 645
OEM] (rev a1)


Now I have installed koops,
I can provide more traces or data if anyone want to tell me what to do.


[ 1480.528031] ------------[ cut here ]------------
[ 1480.528033] WARNING: CPU: 0 PID: 4 at
/home/kernel/COD/linux/include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[ 1480.528034] Modules linked in: bnep rfcomm bluetooth uvcvideo joydev
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_core v4l2_common
intel_rapl videodev x86_pkg_temp_thermal media intel_powerclamp input_leds
coretemp kvm_intel kvm irqbypass snd_hda_codec_hdmi snd_hda_codec_realtek
snd_hda_codec_generic snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep mei_me
dcdbas snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq
snd_seq_device snd_timer snd soundcore mei shpchp lpc_ich 8250_fintek mac_hid
serio_raw binfmt_misc parport_pc ppdev lp parport drbg ansi_cprng dm_crypt
hid_generic usbhid hid uas usb_storage nouveau mxm_wmi wmi i2c_algo_bit ttm
drm_kms_helper crct10dif_pclmul crc32_pclmul syscopyarea sysfillrect sysimgblt
fb_sys_fops aesni_intel aes_x86_64 lrw gf128mul glue_helper e1000e drm
ablk_helper cryptd psmouse ahci ptp libahci pps_core video fjes
[ 1480.528054] CPU: 0 PID: 4 Comm: kworker/0:0 Tainted: G        W      
4.4.0-999-generic #201512202100
[ 1480.528055] Hardware name: Dell Inc. OptiPlex 9020/0PC5F7, BIOS A02
08/15/2013
[ 1480.528060] Workqueue: events nvif_notify_work [nouveau]
[ 1480.528061]  0000000000000000 0000000097f6c821 ffff88040b663d10
ffffffff813c9124
[ 1480.528062]  0000000000000000 ffff88040b663d48 ffffffff8107db92
ffff880035ec0000
[ 1480.528063]  ffff880035ecb000 ffff880035ecb000 0000000000000003
0000000000000000
[ 1480.528064] Call Trace:
[ 1480.528066]  [&lt;ffffffff813c9124&gt;] dump_stack+0x44/0x60
[ 1480.528067]  [&lt;ffffffff8107db92&gt;] warn_slowpath_common+0x82/0xc0
[ 1480.528068]  [&lt;ffffffff8107dcda&gt;] warn_slowpath_null+0x1a/0x20
[ 1480.528070]  [&lt;ffffffffc0263353&gt;] drm_helper_choose_crtc_dpms+0x93/0xa0
[drm_kms_helper]
[ 1480.528072]  [&lt;ffffffffc02633d7&gt;] drm_helper_connector_dpms+0x77/0x100
[drm_kms_helper]
[ 1480.528088]  [&lt;ffffffffc038eb70&gt;] ? nv50_display_crtc_get+0x20/0x20
[nouveau]
[ 1480.528102]  [&lt;ffffffffc038b53b&gt;] nouveau_connector_hotplug+0x3b/0xb0
[nouveau]
[ 1480.528108]  [&lt;ffffffffc02eaa77&gt;] nvif_notify_work+0x27/0xa0 [nouveau]
[ 1480.528109]  [&lt;ffffffff81094f6d&gt;] ? pwq_dec_nr_in_flight+0x4d/0xa0
[ 1480.528111]  [&lt;ffffffff8109687a&gt;] process_one_work+0x1aa/0x440
[ 1480.528112]  [&lt;ffffffff81096b5b&gt;] worker_thread+0x4b/0x4c0
[ 1480.528113]  [&lt;ffffffff81096b10&gt;] ? process_one_work+0x440/0x440
[ 1480.528115]  [&lt;ffffffff8109ccd8&gt;] kthread+0xd8/0xf0
[ 1480.528116]  [&lt;ffffffff8109cc00&gt;] ? kthread_create_on_node+0x1a0/0x1a0
[ 1480.528118]  [&lt;ffffffff817fd38f&gt;] ret_from_fork+0x3f/0x70
[ 1480.528119]  [&lt;ffffffff8109cc00&gt;] ? kthread_create_on_node+0x1a0/0x1a0
[ 1480.528120] ---[ end trace 83b6c8059d499e87 ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450786510.e1174.15482--

--===============1827985567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1827985567==--
