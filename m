From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm: disable vblank only if it got previously
 enabled
Date: Fri, 21 Jul 2017 08:33:26 +1000
Message-ID: <82d12ee0-d994-e168-be2a-225b25e54d7d@gmail.com>
References: <1500180236.5334.7.camel@gmx.de>
 <20170719172509.2000-1-tobias.johannes.klausmann@mni.thm.de>
 <CAKb7Uvj0J_gD12qXRLq-DdwtNzNGwKEON-ryUrTeFpS7O_jj2g@mail.gmail.com>
 <20170720081321.34g4gwmojcvaqh7b@phenom.ffwll.local>
 <49c6342b-7adf-473d-01bd-7ecbc49676e9@mni.thm.de>
 <CAKMK7uF=peNM1Ua16OhwivAfmaN+PdFLPWWSJv4jyzsnOp0XNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1886453680=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKMK7uF=peNM1Ua16OhwivAfmaN+PdFLPWWSJv4jyzsnOp0XNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1886453680==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SI28GoJ4lQ1tF8JRjpTXggsUjnDEoLA8a"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SI28GoJ4lQ1tF8JRjpTXggsUjnDEoLA8a
Content-Type: multipart/mixed; boundary="hNfHW1ePLqpNbKIoemeb0t0AQvVSG9KnB";
 protected-headers="v1"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <82d12ee0-d994-e168-be2a-225b25e54d7d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] drm: disable vblank only if it got previously
 enabled
References: <1500180236.5334.7.camel-Mmb7MZpHnFY@public.gmane.org>
 <20170719172509.2000-1-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
 <CAKb7Uvj0J_gD12qXRLq-DdwtNzNGwKEON-ryUrTeFpS7O_jj2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 <20170720081321.34g4gwmojcvaqh7b-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
 <49c6342b-7adf-473d-01bd-7ecbc49676e9-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
 <CAKMK7uF=peNM1Ua16OhwivAfmaN+PdFLPWWSJv4jyzsnOp0XNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <CAKMK7uF=peNM1Ua16OhwivAfmaN+PdFLPWWSJv4jyzsnOp0XNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

--hNfHW1ePLqpNbKIoemeb0t0AQvVSG9KnB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/21/2017 08:05 AM, Daniel Vetter wrote:
> On Thu, Jul 20, 2017 at 11:58 PM, Tobias Klausmann
> <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:
>> Mh ok,
>>
>> paper over in nouveau_display_fini until Ben comes up with a better id=
ea
>> then?!
>=20
> No paper needed, just don't call drm_vblank_off for the atomic case.
> Not sure why that patch isn't landed yet, it should be simple.
I'll be sending at least that part out today.

Ben.
> -Daniel
>=20
>>
>> Greetings,
>>
>> Tobias
>>
>>
>> On 7/20/17 10:13 AM, Daniel Vetter wrote:
>>> On Wed, Jul 19, 2017 at 04:10:50PM -0400, Ilia Mirkin wrote:
>>>> I believe the solution is to not call drm_crtc_vblank_off for atomic=

>>>> modesetting in nouveau_display_fini. I think Ben's working on it.
>>> Yes, the goal of vblank_on/off was very much to not paper over driver=
 bugs
>>> with clever tricks like these. If the driver cant keep track of its
>>> vblank, something has gone wrong, and the core should _not_ fix it up=
=2E
>>> Otherwise we're back to the old style vblank horror show.
>>>
>>> Thanks, Daniel
>>>
>>>> On Wed, Jul 19, 2017 at 1:25 PM, Tobias Klausmann
>>>> <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:
>>>>> mimic the behavior of vblank_disable_fn(), another caller of
>>>>> drm_vblank_disable_and_save().
>>>>>
>>>>> This avoids oopsing, while trying to disable vblank on a not connec=
ted display:
>>>>>
>>>>> [   12.768079] WARNING: CPU: 0 PID: 274 at drivers/gpu/drm/drm_vbla=
nk.c:609 drm_calc_vbltimestamp_from_scanoutpos+0x296/0x320 [drm]
>>>>> [   12.768080] Modules linked in: bnep snd_hda_codec_hdmi rtsx_usb_=
sdmmc uvcvideo rtsx_usb_ms mmc_core videobuf2_vmalloc memstick videobuf2_=
memops videobuf2_v4l2 videobuf2_core rtsx_usb videodev btusb btrtl arc4 s=
nd_hda_codec_realtek snd_hda_codec_generic joydev nls_iso8859_1 hid_multi=
touch nls_cp437 intel_rapl x86_pkg_temp_thermal intel_powerclamp vfat cor=
etemp fat kvm_intel iTCO_wdt iTCO_vendor_support kvm irqbypass crct10dif_=
pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel pcbc aesni_intel ath=
10k_pci snd_hda_intel ath10k_core aes_x86_64 snd_hda_codec crypto_simd at=
h glue_helper cryptd snd_hda_core mac80211 snd_hwdep snd_pcm pcspkr r8169=
 cfg80211 mii snd_timer acer_wmi snd sparse_keymap wmi_bmof idma64 hci_ua=
rt virt_dma mei_me soundcore i2c_i801 mei btbcm shpchp intel_lpss_pci int=
el_pch_thermal
>>>>> [   12.768130]  serdev btqca ucsi_acpi btintel typec_ucsi thermal t=
ypec bluetooth ecdh_generic battery ac pinctrl_sunrisepoint rfkill intel_=
lpss_acpi pinctrl_intel intel_lpss acpi_pad nouveau serio_raw i915 mxm_wm=
i ttm i2c_algo_bit drm_kms_helper xhci_pci syscopyarea sysfillrect sysimg=
blt xhci_hcd fb_sys_fops usbcore drm i2c_hid wmi video button sg efivarfs=

>>>>> [   12.768158] CPU: 0 PID: 274 Comm: kworker/0:2 Not tainted 4.12.0=
-desktop-debug-drm+ #2
>>>>> [   12.768160] Hardware name: Acer Aspire VN7-593G/Pluto_KLS, BIOS =
V1.04 03/30/2017
>>>>> [   12.768164] Workqueue: pm pm_runtime_work
>>>>> [   12.768166] task: ffff889bf1627040 task.stack: ffff9541013e4000
>>>>> [   12.768180] RIP: 0010:drm_calc_vbltimestamp_from_scanoutpos+0x29=
6/0x320 [drm]
>>>>> [   12.768181] RSP: 0018:ffff9541013e7b30 EFLAGS: 00010086
>>>>> [   12.768183] RAX: 000000000000001c RBX: ffff889b4cebd000 RCX: 000=
0000000000004
>>>>> [   12.768184] RDX: 0000000080000004 RSI: ffffffff87a2d952 RDI: 000=
00000ffffffff
>>>>> [   12.768186] RBP: ffff9541013e7b90 R08: 0000000000000001 R09: 000=
000000000039f
>>>>> [   12.768187] R10: ffffffffc05fe530 R11: 0000000000000000 R12: 000=
0000000000000
>>>>> [   12.768188] R13: ffff9541013e7ba4 R14: ffff889bf0426088 R15: fff=
f889bf0426000
>>>>> [   12.768190] FS:  0000000000000000(0000) GS:ffff889bfec00000(0000=
) knlGS:0000000000000000
>>>>> [   12.768191] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>> [   12.768192] CR2: 000000edb16580b8 CR3: 000000020cc09000 CR4: 000=
00000003406f0
>>>>> [   12.768193] Call Trace:
>>>>> [   12.768198]  ? enqueue_task_fair+0x64/0x600
>>>>> [   12.768211]  ? drm_get_last_vbltimestamp+0x47/0x70 [drm]
>>>>> [   12.768223]  ? drm_update_vblank_count+0x65/0x240 [drm]
>>>>> [   12.768227]  ? pci_pm_runtime_resume+0xa0/0xa0
>>>>> [   12.768238]  ? drm_vblank_disable_and_save+0x55/0xc0 [drm]
>>>>> [   12.768250]  ? drm_crtc_vblank_off+0xa9/0x1e0 [drm]
>>>>> [   12.768253]  ? pci_pm_runtime_resume+0xa0/0xa0
>>>>> [   12.768299]  ? nouveau_display_fini+0x56/0xd0 [nouveau]
>>>>> [   12.768339]  ? nouveau_display_suspend+0x51/0x110 [nouveau]
>>>>> [   12.768378]  ? nouveau_do_suspend+0x76/0x1c0 [nouveau]
>>>>> [   12.768413]  ? nouveau_pmops_runtime_suspend+0x54/0xb0 [nouveau]=

>>>>> [   12.768416]  ? pci_pm_runtime_suspend+0x5c/0x160
>>>>> [   12.768419]  ? __rpm_callback+0xb6/0x1e0
>>>>> [   12.768423]  ? kobject_uevent_env+0x111/0x5e0
>>>>> [   12.768425]  ? pci_pm_runtime_resume+0xa0/0xa0
>>>>> [   12.768427]  ? rpm_callback+0x1f/0x70
>>>>> [   12.768429]  ? pci_pm_runtime_resume+0xa0/0xa0
>>>>> [   12.768431]  ? rpm_suspend+0x11f/0x640
>>>>> [   12.768441]  ? drm_fb_helper_hotplug_event+0x9a/0xe0 [drm_kms_he=
lper]
>>>>> [   12.768447]  ? output_poll_execute+0x17b/0x1a0 [drm_kms_helper]
>>>>> [   12.768449]  ? pm_runtime_work+0x64/0xa0
>>>>> [   12.768453]  ? process_one_work+0x1db/0x410
>>>>> [   12.768456]  ? worker_thread+0x47/0x3d0
>>>>> [   12.768459]  ? process_one_work+0x410/0x410
>>>>> [   12.768461]  ? kthread+0x117/0x130
>>>>> [   12.768463]  ? kthread_create_on_node+0x40/0x40
>>>>> [   12.768466]  ? ret_from_fork+0x25/0x30
>>>>> [   12.768468] Code: 80 3d 26 f3 01 00 00 0f 85 ad fd ff ff 48 8b 4=
3 20 48 c7 c7 31 a2 20 c0 c6 05 0e f3 01 00 01 48 8b b0 60 01 00 00 e8 75=
 2e ec c6 <0f> ff e9 88 fd ff ff 31 f6 44 88 55 b0 e8 38 fa ed c6 44 0f b=
6
>>>>> [   12.768508] ---[ end trace d9bb853af3659bd5 ]---
>>>>>
>>>>> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20c@public.gmane.org=
de>
>>>>> ---
>>>>>  drivers/gpu/drm/drm_vblank.c | 5 ++++-
>>>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vbl=
ank.c
>>>>> index a233a6be934a..4a21756bf2bd 100644
>>>>> --- a/drivers/gpu/drm/drm_vblank.c
>>>>> +++ b/drivers/gpu/drm/drm_vblank.c
>>>>> @@ -1140,8 +1140,11 @@ void drm_crtc_vblank_off(struct drm_crtc *cr=
tc)
>>>>>
>>>>>         /* Avoid redundant vblank disables without previous
>>>>>          * drm_crtc_vblank_on(). */
>>>>> -       if (drm_core_check_feature(dev, DRIVER_ATOMIC) || !vblank->=
inmodeset)
>>>>> +       if (drm_core_check_feature(dev, DRIVER_ATOMIC) || (!vblank-=
>inmodeset &&
>>>>> +               vblank->enabled)) {
>>>>> +               DRM_DEBUG("disabling vblank on crtc %u\n", pipe);
>>>>>                 drm_vblank_disable_and_save(dev, pipe);
>>>>> +       }
>>>>>
>>>>>         wake_up(&vblank->queue);
>>>>>
>>>>> --
>>>>> 2.13.2
>>>>>
>>>>> _______________________________________________
>>>>> Nouveau mailing list
>>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>>> _______________________________________________
>>>> Nouveau mailing list
>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>=20
>=20
>=20


--hNfHW1ePLqpNbKIoemeb0t0AQvVSG9KnB--

--SI28GoJ4lQ1tF8JRjpTXggsUjnDEoLA8a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAllxL7cACgkQdgucYlCS
kfucdA//U6TN598arHg+eFQg1zYL6QThXrfxPFA0RpRm9Jnkg6mvHDSsjuYdR4iz
ucl2pgX387V+seAa/s+pPUjepqeV2UvhSE7O7b9+KmURqZAcR35jvpYPUgQTZ3Ll
7qrj+Fo7UF3jlCwCLeYQVvMipM4OKq71VNbsidJ6UDDxbcBw+GgUh5NSMt2I7Pj7
JsU0GEAM/Q4kFzchMCKZZrWKQ9rTduPblsm0Bfvhf9HcmyaN7bFB7wMvvudGR3/t
vm3oaKFC09j8ADHUyZ1Ptw4N4V+8C2bkCn5jSqHgQmK/d9I1hF3tuDDAIMDTxAh7
Kp+p7WWbFGOKrtyaf7UkXY0MPGdcgwBTyX+6T2dJf9C3Fu6eSDrc7Z2/HWHQvKaH
J2GMQN38JE3NP6WN53JeZUnaO6bXBS50QxyAPhyiy66oMlWBX1kTCZq9KgF6H+pl
zWKYhBrxxp/S0Ns8QGmJNnbwz/F2Ym/PH4JFAsSAX0J/XEshZ2KlvkH04cFtUad9
dBLDMYNePTDcaES95XYIVXmIls4bDIcLQsTtBINGCN90n6+1Luo8kGHv1PcG/tta
tv8ltil6WoAKO8qMPUTo080kY4he3oB9V8FpSX0MMsFTV6f4k3wddgNmXtet/quE
AFdxohBI0MiO0D1BOdEGHIgWjyBvO0k9kPsNZnZhUIfw1XmQhY0=
=gLxS
-----END PGP SIGNATURE-----

--SI28GoJ4lQ1tF8JRjpTXggsUjnDEoLA8a--

--===============1886453680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1886453680==--
