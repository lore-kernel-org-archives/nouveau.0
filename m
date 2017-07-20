From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: Re: [Nouveau] [PATCH] drm: disable vblank only if it got previously
 enabled
Date: Thu, 20 Jul 2017 23:58:19 +0200
Message-ID: <49c6342b-7adf-473d-01bd-7ecbc49676e9@mni.thm.de>
References: <1500180236.5334.7.camel@gmx.de>
 <20170719172509.2000-1-tobias.johannes.klausmann@mni.thm.de>
 <CAKb7Uvj0J_gD12qXRLq-DdwtNzNGwKEON-ryUrTeFpS7O_jj2g@mail.gmail.com>
 <20170720081321.34g4gwmojcvaqh7b@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170720081321.34g4gwmojcvaqh7b@phenom.ffwll.local>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Mh ok,

paper over in nouveau_display_fini until Ben comes up with a better idea
then?!


Greetings,

Tobias


On 7/20/17 10:13 AM, Daniel Vetter wrote:
> On Wed, Jul 19, 2017 at 04:10:50PM -0400, Ilia Mirkin wrote:
>> I believe the solution is to not call drm_crtc_vblank_off for atomic
>> modesetting in nouveau_display_fini. I think Ben's working on it.
> Yes, the goal of vblank_on/off was very much to not paper over driver bugs
> with clever tricks like these. If the driver cant keep track of its
> vblank, something has gone wrong, and the core should _not_ fix it up.
> Otherwise we're back to the old style vblank horror show.
>
> Thanks, Daniel
>
>> On Wed, Jul 19, 2017 at 1:25 PM, Tobias Klausmann
>> <tobias.johannes.klausmann@mni.thm.de> wrote:
>>> mimic the behavior of vblank_disable_fn(), another caller of
>>> drm_vblank_disable_and_save().
>>>
>>> This avoids oopsing, while trying to disable vblank on a not connected display:
>>>
>>> [   12.768079] WARNING: CPU: 0 PID: 274 at drivers/gpu/drm/drm_vblank.c:609 drm_calc_vbltimestamp_from_scanoutpos+0x296/0x320 [drm]
>>> [   12.768080] Modules linked in: bnep snd_hda_codec_hdmi rtsx_usb_sdmmc uvcvideo rtsx_usb_ms mmc_core videobuf2_vmalloc memstick videobuf2_memops videobuf2_v4l2 videobuf2_core rtsx_usb videodev btusb btrtl arc4 snd_hda_codec_realtek snd_hda_codec_generic joydev nls_iso8859_1 hid_multitouch nls_cp437 intel_rapl x86_pkg_temp_thermal intel_powerclamp vfat coretemp fat kvm_intel iTCO_wdt iTCO_vendor_support kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel pcbc aesni_intel ath10k_pci snd_hda_intel ath10k_core aes_x86_64 snd_hda_codec crypto_simd ath glue_helper cryptd snd_hda_core mac80211 snd_hwdep snd_pcm pcspkr r8169 cfg80211 mii snd_timer acer_wmi snd sparse_keymap wmi_bmof idma64 hci_uart virt_dma mei_me soundcore i2c_i801 mei btbcm shpchp intel_lpss_pci in
 tel_pch_thermal
>>> [   12.768130]  serdev btqca ucsi_acpi btintel typec_ucsi thermal typec bluetooth ecdh_generic battery ac pinctrl_sunrisepoint rfkill intel_lpss_acpi pinctrl_intel intel_lpss acpi_pad nouveau serio_raw i915 mxm_wmi ttm i2c_algo_bit drm_kms_helper xhci_pci syscopyarea sysfillrect sysimgblt xhci_hcd fb_sys_fops usbcore drm i2c_hid wmi video button sg efivarfs
>>> [   12.768158] CPU: 0 PID: 274 Comm: kworker/0:2 Not tainted 4.12.0-desktop-debug-drm+ #2
>>> [   12.768160] Hardware name: Acer Aspire VN7-593G/Pluto_KLS, BIOS V1.04 03/30/2017
>>> [   12.768164] Workqueue: pm pm_runtime_work
>>> [   12.768166] task: ffff889bf1627040 task.stack: ffff9541013e4000
>>> [   12.768180] RIP: 0010:drm_calc_vbltimestamp_from_scanoutpos+0x296/0x320 [drm]
>>> [   12.768181] RSP: 0018:ffff9541013e7b30 EFLAGS: 00010086
>>> [   12.768183] RAX: 000000000000001c RBX: ffff889b4cebd000 RCX: 0000000000000004
>>> [   12.768184] RDX: 0000000080000004 RSI: ffffffff87a2d952 RDI: 00000000ffffffff
>>> [   12.768186] RBP: ffff9541013e7b90 R08: 0000000000000001 R09: 000000000000039f
>>> [   12.768187] R10: ffffffffc05fe530 R11: 0000000000000000 R12: 0000000000000000
>>> [   12.768188] R13: ffff9541013e7ba4 R14: ffff889bf0426088 R15: ffff889bf0426000
>>> [   12.768190] FS:  0000000000000000(0000) GS:ffff889bfec00000(0000) knlGS:0000000000000000
>>> [   12.768191] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   12.768192] CR2: 000000edb16580b8 CR3: 000000020cc09000 CR4: 00000000003406f0
>>> [   12.768193] Call Trace:
>>> [   12.768198]  ? enqueue_task_fair+0x64/0x600
>>> [   12.768211]  ? drm_get_last_vbltimestamp+0x47/0x70 [drm]
>>> [   12.768223]  ? drm_update_vblank_count+0x65/0x240 [drm]
>>> [   12.768227]  ? pci_pm_runtime_resume+0xa0/0xa0
>>> [   12.768238]  ? drm_vblank_disable_and_save+0x55/0xc0 [drm]
>>> [   12.768250]  ? drm_crtc_vblank_off+0xa9/0x1e0 [drm]
>>> [   12.768253]  ? pci_pm_runtime_resume+0xa0/0xa0
>>> [   12.768299]  ? nouveau_display_fini+0x56/0xd0 [nouveau]
>>> [   12.768339]  ? nouveau_display_suspend+0x51/0x110 [nouveau]
>>> [   12.768378]  ? nouveau_do_suspend+0x76/0x1c0 [nouveau]
>>> [   12.768413]  ? nouveau_pmops_runtime_suspend+0x54/0xb0 [nouveau]
>>> [   12.768416]  ? pci_pm_runtime_suspend+0x5c/0x160
>>> [   12.768419]  ? __rpm_callback+0xb6/0x1e0
>>> [   12.768423]  ? kobject_uevent_env+0x111/0x5e0
>>> [   12.768425]  ? pci_pm_runtime_resume+0xa0/0xa0
>>> [   12.768427]  ? rpm_callback+0x1f/0x70
>>> [   12.768429]  ? pci_pm_runtime_resume+0xa0/0xa0
>>> [   12.768431]  ? rpm_suspend+0x11f/0x640
>>> [   12.768441]  ? drm_fb_helper_hotplug_event+0x9a/0xe0 [drm_kms_helper]
>>> [   12.768447]  ? output_poll_execute+0x17b/0x1a0 [drm_kms_helper]
>>> [   12.768449]  ? pm_runtime_work+0x64/0xa0
>>> [   12.768453]  ? process_one_work+0x1db/0x410
>>> [   12.768456]  ? worker_thread+0x47/0x3d0
>>> [   12.768459]  ? process_one_work+0x410/0x410
>>> [   12.768461]  ? kthread+0x117/0x130
>>> [   12.768463]  ? kthread_create_on_node+0x40/0x40
>>> [   12.768466]  ? ret_from_fork+0x25/0x30
>>> [   12.768468] Code: 80 3d 26 f3 01 00 00 0f 85 ad fd ff ff 48 8b 43 20 48 c7 c7 31 a2 20 c0 c6 05 0e f3 01 00 01 48 8b b0 60 01 00 00 e8 75 2e ec c6 <0f> ff e9 88 fd ff ff 31 f6 44 88 55 b0 e8 38 fa ed c6 44 0f b6
>>> [   12.768508] ---[ end trace d9bb853af3659bd5 ]---
>>>
>>> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
>>> ---
>>>  drivers/gpu/drm/drm_vblank.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>>> index a233a6be934a..4a21756bf2bd 100644
>>> --- a/drivers/gpu/drm/drm_vblank.c
>>> +++ b/drivers/gpu/drm/drm_vblank.c
>>> @@ -1140,8 +1140,11 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>>>
>>>         /* Avoid redundant vblank disables without previous
>>>          * drm_crtc_vblank_on(). */
>>> -       if (drm_core_check_feature(dev, DRIVER_ATOMIC) || !vblank->inmodeset)
>>> +       if (drm_core_check_feature(dev, DRIVER_ATOMIC) || (!vblank->inmodeset &&
>>> +               vblank->enabled)) {
>>> +               DRM_DEBUG("disabling vblank on crtc %u\n", pipe);
>>>                 drm_vblank_disable_and_save(dev, pipe);
>>> +       }
>>>
>>>         wake_up(&vblank->queue);
>>>
>>> --
>>> 2.13.2
>>>
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
