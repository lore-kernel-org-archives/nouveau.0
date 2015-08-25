From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91738] [NV117] xf86-video-nouveau 1.0.11 will not
 allow X to start
Date: Tue, 25 Aug 2015 02:53:41 +0000
Message-ID: <bug-91738-8800-O8hcAuAomY@http.bugs.freedesktop.org/>
References: <bug-91738-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1005104969=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91738-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1005104969==
Content-Type: multipart/alternative; boundary="1440471221.f64F2.17555"; charset="UTF-8"


--1440471221.f64F2.17555
Date: Tue, 25 Aug 2015 02:53:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91738

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looks like you still have the same failure from xcmddc. IMO it's worth
investigating/fixing. Will need your vbios though, as I mentioned before.

[    8.700223] BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
[    8.700262] IP: [<ffffffffc0a3ca10>] nvkm_i2c_try_acquire_pad+0x40/0x80
[nouveau]
[    8.700265] PGD 2eb8067 PUD 2f1c067 PMD 0 
[    8.700269] Oops: 0000 [#1] SMP 
[    8.700313] Modules linked in: snd_hda_codec_hdmi snd_hda_intel
snd_hda_controller snd_hda_codec snd_hda_core snd_hwdep joydev snd_pcm
snd_timer hid_generic usbhid hid snd x86_pkg_temp_thermal intel_powerclamp
coretemp intel_rapl btusb btbcm iwlmvm mac80211 btintel bluetooth iosf_mbi
i2c_dev soundcore iwlwifi cfg80211 kvm_intel i915 r8169 rtsx_pci_ms nouveau kvm
ttm drm_kms_helper drm crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel intel_gtt thermal processor video psmouse agpgart
rtsx_pci_sdmmc rfkill mmc_core memstick mei_me mei lpc_ich rtsx_pci thermal_sys
hwmon i2c_algo_bit xhci_pci xhci_hcd mxm_wmi ehci_pci wmi mii microcode
i2c_i801 ehci_hcd evdev tpm_infineon serio_raw tpm_tis tpm battery button ac
i2c_core loop
[    8.700321] CPU: 7 PID: 406 Comm: xcmddc Tainted: G          I     4.1.6 #2
[    8.700322] Hardware name: Notebook                         W230SS          
      /W230SS                 , BIOS 4.6.5 05/13/2014
[    8.700324] task: ffff88041bec4380 ti: ffff8800c613c000 task.ti:
ffff8800c613c000
[    8.700366] RIP: 0010:[<ffffffffc0a3ca10>]  [<ffffffffc0a3ca10>]
nvkm_i2c_try_acquire_pad+0x40/0x80 [nouveau]
[    8.700369] RSP: 0018:ffff8800c613fc38  EFLAGS: 00010286
[    8.700370] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000010000000
[    8.700370] RDX: ffff88041817ec80 RSI: 0000000000000005 RDI:
ffff88041c26d000
[    8.700371] RBP: ffff8800c613fc38 R08: 0000000000018de0 R09:
ffff88041d803e00
[    8.700372] R10: ffff88041d803e00 R11: 0000000000000246 R12:
ffff88041c26d000
[    8.700372] R13: 0000000000000000 R14: ffff880002ffdd00 R15:
ffff88041c26d000
[    8.700373] FS:  00007fa6d1bab780(0000) GS:ffff88042fbc0000(0000)
knlGS:0000000000000000
[    8.700374] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.700375] CR2: 0000000000000008 CR3: 000000041bd0d000 CR4:
00000000001406e0
[    8.700375] Stack:
[    8.700378]  ffff8800c613fca8 ffffffffc0a3cb1d ffff8800c613fc68
ffff8800c613fe08
[    8.700379]  0000000000008002 ffff8800c613fda8 ffff8800c613fe08
ffffffff811d3e74
[    8.700380]  ffff8800c613fcc8 ffffffff810b7779 ffff88041c26d000
ffff88041c26d398
[    8.700381] Call Trace:
[    8.700412]  [<ffffffffc0a3cb1d>] nvkm_i2c_acquire_pad+0xcd/0x150 [nouveau]
[    8.700422]  [<ffffffff811d3e74>] ? mntput+0x24/0x40
[    8.700433]  [<ffffffff810b7779>] ? update_curr+0xd9/0x160
[    8.700448]  [<ffffffffc0a3c930>] nvkm_i2c_acquire+0x40/0x60 [nouveau]
[    8.700462]  [<ffffffffc0a3e863>] aux_xfer+0x53/0x160 [nouveau]
[    8.700480]  [<ffffffffc000abf5>] __i2c_transfer+0x245/0x440 [i2c_core]
[    8.700484]  [<ffffffffc000ae44>] i2c_transfer+0x54/0x90 [i2c_core]
[    8.700487]  [<ffffffffc000aebf>] i2c_master_send+0x3f/0x50 [i2c_core]
[    8.700490]  [<ffffffffc001e460>] i2cdev_write+0x50/0x70 [i2c_dev]
[    8.700509]  [<ffffffff811b2ad8>] __vfs_write+0x28/0xf0
[    8.700518]  [<ffffffff81cc7982>] ? do_nanosleep+0x82/0x110
[    8.700534]  [<ffffffff815e2733>] ? security_file_permission+0x23/0xa0
[    8.700536]  [<ffffffff811b2f73>] ? rw_verify_area+0x53/0x100
[    8.700538]  [<ffffffff811b3209>] vfs_write+0xa9/0x1b0
[    8.700545]  [<ffffffff810e4180>] ? hrtimer_get_res+0x50/0x50
[    8.700547]  [<ffffffff811b4016>] SyS_write+0x46/0xb0
[    8.700549]  [<ffffffff81cc869b>] system_call_fastpath+0x16/0x6e
[    8.700567] Code: 42 08 48 8b 08 8b 09 81 e1 00 00 00 10 74 ec b8 01 00 00
00 f0 0f c1 42 1c 85 c0 74 36 48 8b 42 28 eb 11 0f 1f 84 00 00 00 00 00 <48> 8b
40 08 48 85 c0 74 0f 48 39 c7 75 f2 31 c0 5d c3 66 0f 1f 
[    8.700618] RIP  [<ffffffffc0a3ca10>] nvkm_i2c_try_acquire_pad+0x40/0x80
[nouveau]
[    8.700622]  RSP <ffff8800c613fc38>
[    8.700622] CR2: 0000000000000008

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440471221.f64F2.17555
Date: Tue, 25 Aug 2015 02:53:41 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV117] xf86-video-nouveau 1.0.11 will not allow X to start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV117] xf86-video-nouveau 1.0.11 will not allow X to start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">bug 91738</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looks like you still have the same failure from xcmddc. IMO it's worth
investigating/fixing. Will need your vbios though, as I mentioned before.

[    8.700223] BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
[    8.700262] IP: [&lt;ffffffffc0a3ca10&gt;] nvkm_i2c_try_acquire_pad+0x40/0x80
[nouveau]
[    8.700265] PGD 2eb8067 PUD 2f1c067 PMD 0 
[    8.700269] Oops: 0000 [#1] SMP 
[    8.700313] Modules linked in: snd_hda_codec_hdmi snd_hda_intel
snd_hda_controller snd_hda_codec snd_hda_core snd_hwdep joydev snd_pcm
snd_timer hid_generic usbhid hid snd x86_pkg_temp_thermal intel_powerclamp
coretemp intel_rapl btusb btbcm iwlmvm mac80211 btintel bluetooth iosf_mbi
i2c_dev soundcore iwlwifi cfg80211 kvm_intel i915 r8169 rtsx_pci_ms nouveau kvm
ttm drm_kms_helper drm crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel intel_gtt thermal processor video psmouse agpgart
rtsx_pci_sdmmc rfkill mmc_core memstick mei_me mei lpc_ich rtsx_pci thermal_sys
hwmon i2c_algo_bit xhci_pci xhci_hcd mxm_wmi ehci_pci wmi mii microcode
i2c_i801 ehci_hcd evdev tpm_infineon serio_raw tpm_tis tpm battery button ac
i2c_core loop
[    8.700321] CPU: 7 PID: 406 Comm: xcmddc Tainted: G          I     4.1.6 #2
[    8.700322] Hardware name: Notebook                         W230SS          
      /W230SS                 , BIOS 4.6.5 05/13/2014
[    8.700324] task: ffff88041bec4380 ti: ffff8800c613c000 task.ti:
ffff8800c613c000
[    8.700366] RIP: 0010:[&lt;ffffffffc0a3ca10&gt;]  [&lt;ffffffffc0a3ca10&gt;]
nvkm_i2c_try_acquire_pad+0x40/0x80 [nouveau]
[    8.700369] RSP: 0018:ffff8800c613fc38  EFLAGS: 00010286
[    8.700370] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000010000000
[    8.700370] RDX: ffff88041817ec80 RSI: 0000000000000005 RDI:
ffff88041c26d000
[    8.700371] RBP: ffff8800c613fc38 R08: 0000000000018de0 R09:
ffff88041d803e00
[    8.700372] R10: ffff88041d803e00 R11: 0000000000000246 R12:
ffff88041c26d000
[    8.700372] R13: 0000000000000000 R14: ffff880002ffdd00 R15:
ffff88041c26d000
[    8.700373] FS:  00007fa6d1bab780(0000) GS:ffff88042fbc0000(0000)
knlGS:0000000000000000
[    8.700374] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.700375] CR2: 0000000000000008 CR3: 000000041bd0d000 CR4:
00000000001406e0
[    8.700375] Stack:
[    8.700378]  ffff8800c613fca8 ffffffffc0a3cb1d ffff8800c613fc68
ffff8800c613fe08
[    8.700379]  0000000000008002 ffff8800c613fda8 ffff8800c613fe08
ffffffff811d3e74
[    8.700380]  ffff8800c613fcc8 ffffffff810b7779 ffff88041c26d000
ffff88041c26d398
[    8.700381] Call Trace:
[    8.700412]  [&lt;ffffffffc0a3cb1d&gt;] nvkm_i2c_acquire_pad+0xcd/0x150 [nouveau]
[    8.700422]  [&lt;ffffffff811d3e74&gt;] ? mntput+0x24/0x40
[    8.700433]  [&lt;ffffffff810b7779&gt;] ? update_curr+0xd9/0x160
[    8.700448]  [&lt;ffffffffc0a3c930&gt;] nvkm_i2c_acquire+0x40/0x60 [nouveau]
[    8.700462]  [&lt;ffffffffc0a3e863&gt;] aux_xfer+0x53/0x160 [nouveau]
[    8.700480]  [&lt;ffffffffc000abf5&gt;] __i2c_transfer+0x245/0x440 [i2c_core]
[    8.700484]  [&lt;ffffffffc000ae44&gt;] i2c_transfer+0x54/0x90 [i2c_core]
[    8.700487]  [&lt;ffffffffc000aebf&gt;] i2c_master_send+0x3f/0x50 [i2c_core]
[    8.700490]  [&lt;ffffffffc001e460&gt;] i2cdev_write+0x50/0x70 [i2c_dev]
[    8.700509]  [&lt;ffffffff811b2ad8&gt;] __vfs_write+0x28/0xf0
[    8.700518]  [&lt;ffffffff81cc7982&gt;] ? do_nanosleep+0x82/0x110
[    8.700534]  [&lt;ffffffff815e2733&gt;] ? security_file_permission+0x23/0xa0
[    8.700536]  [&lt;ffffffff811b2f73&gt;] ? rw_verify_area+0x53/0x100
[    8.700538]  [&lt;ffffffff811b3209&gt;] vfs_write+0xa9/0x1b0
[    8.700545]  [&lt;ffffffff810e4180&gt;] ? hrtimer_get_res+0x50/0x50
[    8.700547]  [&lt;ffffffff811b4016&gt;] SyS_write+0x46/0xb0
[    8.700549]  [&lt;ffffffff81cc869b&gt;] system_call_fastpath+0x16/0x6e
[    8.700567] Code: 42 08 48 8b 08 8b 09 81 e1 00 00 00 10 74 ec b8 01 00 00
00 f0 0f c1 42 1c 85 c0 74 36 48 8b 42 28 eb 11 0f 1f 84 00 00 00 00 00 &lt;48&gt; 8b
40 08 48 85 c0 74 0f 48 39 c7 75 f2 31 c0 5d c3 66 0f 1f 
[    8.700618] RIP  [&lt;ffffffffc0a3ca10&gt;] nvkm_i2c_try_acquire_pad+0x40/0x80
[nouveau]
[    8.700622]  RSP &lt;ffff8800c613fc38&gt;
[    8.700622] CR2: 0000000000000008</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440471221.f64F2.17555--

--===============1005104969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1005104969==--
