From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86650] (NV44): initrd gpu lockup from 3.12 or 3.13
	onwards
Date: Mon, 24 Nov 2014 05:12:09 +0000
Message-ID: <bug-86650-8800-l4DJZDU6za@http.bugs.freedesktop.org/>
References: <bug-86650-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0920845367=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86650-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0920845367==
Content-Type: multipart/alternative; boundary="1416805928.117FB0.21132"; charset="UTF-8"


--1416805928.117FB0.21132
Date: Mon, 24 Nov 2014 05:12:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86650

--- Comment #1 from sebastian-+7HhuH9B2PG2Zizt6A3wSA@public.gmane.org ---
the opensuse bug report can be found here:

http://bugzilla.opensuse.org/show_bug.cgi?id=905696

i also found this on 3.16 but i couldn't reproduce it:

[  549.743272] nouveau  [     DRM] Calling LVDS script 6:
[  549.743278] nouveau  [     DRM] 0xD0D8: Parsing digital output script table
[  550.038974] ------------[ cut here ]------------
[  550.039003] WARNING: CPU: 0 PID: 1034 at
../drivers/gpu/drm/nouveau/nouveau_bo.c:358 nouveau_bo_unpin+0x122/0x130
[nouveau]()
[  550.039151] Modules linked in: md4 md5 nls_utf8 cifs dns_resolver fscache
fuse xt_pkttype xt_LOG xt_limit ctr ccm ip6t_REJECT xt_tcpudp nf_conntrack_ipv6
nf_defrag_ipv6 ip6table_raw ipt_REJECT iptable_raw xt_CT iptable_filter
ip6table_mangle nf_conntrack_netbios_ns nf_conntrack_broadcast
nf_conntrack_ipv4 nf_defrag_ipv4 bnep ip_tables af_packet xt_conntrack
nf_conntrack ip6table_filter bluetooth ip6_tables x_tables 6lowpan_iphc lm90
dm_crypt xts gf128mul algif_skcipher af_alg arc4 b43 bcma mac80211
snd_intel8x0m snd_intel8x0 cfg80211 snd_ac97_codec snd_pcm ppdev snd_seq joydev
powernow_k8 serio_raw snd_seq_device snd_timer pcspkr 8139too edac_core ssb
edac_mce_amd 8139cp r592 sdhci_pci sdhci dm_mod mmc_core mii memstick snd
k8temp i2c_sis630 parport_pc parport asus_laptop soundcore shpchp thermal
[  550.039167]  battery ac97_bus fan ac sparse_keymap rfkill input_polldev
processor pcmcia ata_generic nouveau mxm_wmi wmi i2c_algo_bit drm_kms_helper
ttm firewire_ohci yenta_socket firewire_core crc_itu_t pcmcia_rsrc pcmcia_core
ohci_pci pata_sis drm video button sg
[  550.039171] CPU: 0 PID: 1034 Comm: X Not tainted 3.16.6-2-desktop #1
[  550.039172] Hardware name: ASUSTeK Computer Inc.  A6K       /A6K       ,
BIOS 204     04/29/2005
[  550.039176]  0000000000000009 ffffffff8161ab03 0000000000000000
ffffffff8105bad7
[  550.039178]  ffff88007acc6000 0000000000000000 ffff8800377b6170
ffff8800376234a0
[  550.039180]  ffff8800376e1800 ffffffffa019f492 ffff8800372c9000
0000000000000000
[  550.039181] Call Trace:
[  550.039200]  [<ffffffff8100519e>] dump_trace+0x8e/0x350
[  550.039205]  [<ffffffff81005506>] show_stack_log_lvl+0xa6/0x190
[  550.039210]  [<ffffffff81006c01>] show_stack+0x21/0x50
[  550.039214]  [<ffffffff8161ab03>] dump_stack+0x49/0x6a
[  550.039221]  [<ffffffff8105bad7>] warn_slowpath_common+0x77/0x90
[  550.039265]  [<ffffffffa019f492>] nouveau_bo_unpin+0x122/0x130 [nouveau]
[  550.039503]  [<ffffffffa01b0e3b>] nv_crtc_swap_fbs.isra.4+0x5b/0xf0
[nouveau]
[  550.039751]  [<ffffffffa01b16ec>] nv_crtc_mode_set+0x4c/0xf50 [nouveau]
[  550.039967]  [<ffffffffa01088d9>] drm_crtc_helper_set_mode+0x2e9/0x520
[drm_kms_helper]
[  550.039977]  [<ffffffffa0109678>] drm_crtc_helper_set_config+0x8a8/0xad0
[drm_kms_helper]
[  550.040027]  [<ffffffffa01b07e8>] nouveau_crtc_set_config+0x58/0x130
[nouveau]
[  550.040279]  [<ffffffffa0036dc1>] drm_mode_set_config_internal+0x61/0xe0
[drm]
[  550.040322]  [<ffffffffa010ba6b>] restore_fbdev_mode+0xab/0xd0
[drm_kms_helper]
[  550.040337]  [<ffffffffa010baae>]
drm_fb_helper_restore_fbdev_mode_unlocked+0x1e/0x30 [drm_kms_helper]
[  550.040352]  [<ffffffffa010d642>] drm_fb_helper_set_par+0x22/0x60
[drm_kms_helper]
[  550.040366]  [<ffffffff8138078e>] fb_set_var+0x15e/0x3b0
[  550.040372]  [<ffffffff81377bcb>] fbcon_blank+0x1cb/0x2b0
[  550.040379]  [<ffffffff813f18f1>] do_unblank_screen+0xa1/0x1b0
[  550.040386]  [<ffffffff813e7e93>] complete_change_console+0x53/0xe0
[  550.040391]  [<ffffffff813e8e69>] vt_ioctl+0xf49/0x10d0
[  550.040396]  [<ffffffff813dce9c>] tty_ioctl+0x26c/0xb70
[  550.040402]  [<ffffffff811c9d27>] do_vfs_ioctl+0x2e7/0x4c0
[  550.040417]  [<ffffffff811c9f81>] SyS_ioctl+0x81/0xa0
[  550.040422]  [<ffffffff8162182d>] system_call_fastpath+0x1a/0x1f
[  550.040429]  [<00007fca9b90d477>] 0x7fca9b90d476
[  550.040430] ---[ end trace c3f3982d084ab814 ]---
[  550.051039] nouveau  [     DRM] Calling LVDS script 2:
[  550.051042] nouveau  [     DRM] 0xD13A: Parsing digital output script table
[  550.183561] nouveau  [     DRM] Calling LVDS script 5:
[  550.183565] nouveau  [     DRM] 0xD0B4: Parsing digital output script table

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416805928.117FB0.21132
Date: Mon, 24 Nov 2014 05:12:08 +0000
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
   title="NEW - (NV44): initrd gpu lockup from 3.12 or 3.13 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86650#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - (NV44): initrd gpu lockup from 3.12 or 3.13 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86650">bug 86650</a>
              from <span class="vcard"><a class="email" href="mailto:sebastian&#64;prohtmeyhet.de" title="sebastian&#64;prohtmeyhet.de">sebastian&#64;prohtmeyhet.de</a>
</span></b>
        <pre>the opensuse bug report can be found here:

<a href="http://bugzilla.opensuse.org/show_bug.cgi?id=905696">http://bugzilla.opensuse.org/show_bug.cgi?id=905696</a>

i also found this on 3.16 but i couldn't reproduce it:

[  549.743272] nouveau  [     DRM] Calling LVDS script 6:
[  549.743278] nouveau  [     DRM] 0xD0D8: Parsing digital output script table
[  550.038974] ------------[ cut here ]------------
[  550.039003] WARNING: CPU: 0 PID: 1034 at
../drivers/gpu/drm/nouveau/nouveau_bo.c:358 nouveau_bo_unpin+0x122/0x130
[nouveau]()
[  550.039151] Modules linked in: md4 md5 nls_utf8 cifs dns_resolver fscache
fuse xt_pkttype xt_LOG xt_limit ctr ccm ip6t_REJECT xt_tcpudp nf_conntrack_ipv6
nf_defrag_ipv6 ip6table_raw ipt_REJECT iptable_raw xt_CT iptable_filter
ip6table_mangle nf_conntrack_netbios_ns nf_conntrack_broadcast
nf_conntrack_ipv4 nf_defrag_ipv4 bnep ip_tables af_packet xt_conntrack
nf_conntrack ip6table_filter bluetooth ip6_tables x_tables 6lowpan_iphc lm90
dm_crypt xts gf128mul algif_skcipher af_alg arc4 b43 bcma mac80211
snd_intel8x0m snd_intel8x0 cfg80211 snd_ac97_codec snd_pcm ppdev snd_seq joydev
powernow_k8 serio_raw snd_seq_device snd_timer pcspkr 8139too edac_core ssb
edac_mce_amd 8139cp r592 sdhci_pci sdhci dm_mod mmc_core mii memstick snd
k8temp i2c_sis630 parport_pc parport asus_laptop soundcore shpchp thermal
[  550.039167]  battery ac97_bus fan ac sparse_keymap rfkill input_polldev
processor pcmcia ata_generic nouveau mxm_wmi wmi i2c_algo_bit drm_kms_helper
ttm firewire_ohci yenta_socket firewire_core crc_itu_t pcmcia_rsrc pcmcia_core
ohci_pci pata_sis drm video button sg
[  550.039171] CPU: 0 PID: 1034 Comm: X Not tainted 3.16.6-2-desktop #1
[  550.039172] Hardware name: ASUSTeK Computer Inc.  A6K       /A6K       ,
BIOS 204     04/29/2005
[  550.039176]  0000000000000009 ffffffff8161ab03 0000000000000000
ffffffff8105bad7
[  550.039178]  ffff88007acc6000 0000000000000000 ffff8800377b6170
ffff8800376234a0
[  550.039180]  ffff8800376e1800 ffffffffa019f492 ffff8800372c9000
0000000000000000
[  550.039181] Call Trace:
[  550.039200]  [&lt;ffffffff8100519e&gt;] dump_trace+0x8e/0x350
[  550.039205]  [&lt;ffffffff81005506&gt;] show_stack_log_lvl+0xa6/0x190
[  550.039210]  [&lt;ffffffff81006c01&gt;] show_stack+0x21/0x50
[  550.039214]  [&lt;ffffffff8161ab03&gt;] dump_stack+0x49/0x6a
[  550.039221]  [&lt;ffffffff8105bad7&gt;] warn_slowpath_common+0x77/0x90
[  550.039265]  [&lt;ffffffffa019f492&gt;] nouveau_bo_unpin+0x122/0x130 [nouveau]
[  550.039503]  [&lt;ffffffffa01b0e3b&gt;] nv_crtc_swap_fbs.isra.4+0x5b/0xf0
[nouveau]
[  550.039751]  [&lt;ffffffffa01b16ec&gt;] nv_crtc_mode_set+0x4c/0xf50 [nouveau]
[  550.039967]  [&lt;ffffffffa01088d9&gt;] drm_crtc_helper_set_mode+0x2e9/0x520
[drm_kms_helper]
[  550.039977]  [&lt;ffffffffa0109678&gt;] drm_crtc_helper_set_config+0x8a8/0xad0
[drm_kms_helper]
[  550.040027]  [&lt;ffffffffa01b07e8&gt;] nouveau_crtc_set_config+0x58/0x130
[nouveau]
[  550.040279]  [&lt;ffffffffa0036dc1&gt;] drm_mode_set_config_internal+0x61/0xe0
[drm]
[  550.040322]  [&lt;ffffffffa010ba6b&gt;] restore_fbdev_mode+0xab/0xd0
[drm_kms_helper]
[  550.040337]  [&lt;ffffffffa010baae&gt;]
drm_fb_helper_restore_fbdev_mode_unlocked+0x1e/0x30 [drm_kms_helper]
[  550.040352]  [&lt;ffffffffa010d642&gt;] drm_fb_helper_set_par+0x22/0x60
[drm_kms_helper]
[  550.040366]  [&lt;ffffffff8138078e&gt;] fb_set_var+0x15e/0x3b0
[  550.040372]  [&lt;ffffffff81377bcb&gt;] fbcon_blank+0x1cb/0x2b0
[  550.040379]  [&lt;ffffffff813f18f1&gt;] do_unblank_screen+0xa1/0x1b0
[  550.040386]  [&lt;ffffffff813e7e93&gt;] complete_change_console+0x53/0xe0
[  550.040391]  [&lt;ffffffff813e8e69&gt;] vt_ioctl+0xf49/0x10d0
[  550.040396]  [&lt;ffffffff813dce9c&gt;] tty_ioctl+0x26c/0xb70
[  550.040402]  [&lt;ffffffff811c9d27&gt;] do_vfs_ioctl+0x2e7/0x4c0
[  550.040417]  [&lt;ffffffff811c9f81&gt;] SyS_ioctl+0x81/0xa0
[  550.040422]  [&lt;ffffffff8162182d&gt;] system_call_fastpath+0x1a/0x1f
[  550.040429]  [&lt;00007fca9b90d477&gt;] 0x7fca9b90d476
[  550.040430] ---[ end trace c3f3982d084ab814 ]---
[  550.051039] nouveau  [     DRM] Calling LVDS script 2:
[  550.051042] nouveau  [     DRM] 0xD13A: Parsing digital output script table
[  550.183561] nouveau  [     DRM] Calling LVDS script 5:
[  550.183565] nouveau  [     DRM] 0xD0B4: Parsing digital output script table</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416805928.117FB0.21132--

--===============0920845367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0920845367==--
