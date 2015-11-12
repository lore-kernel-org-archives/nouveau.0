From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Fix pre-nv50 pageflip events
 (v3) -> v4
Date: Thu, 12 Nov 2015 14:48:18 +0100
Message-ID: <20151112134818.GB645@ulmo>
References: <1447167452-998-1-git-send-email-mario.kleiner.de@gmail.com>
 <20151110160033.GB25368@ulmo.nvidia.com>
 <56421A7C.2010201@gmail.com> <5643A131.8090607@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1638668967=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5643A131.8090607-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1638668967==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 09:12:33PM +0100, poma wrote:
> On 10.11.2015 17:25, Mario Kleiner wrote:
> > On 11/10/2015 05:00 PM, Thierry Reding wrote:
> >> On Tue, Nov 10, 2015 at 03:54:52PM +0100, Mario Kleiner wrote:
> >>> From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> >>>
> >>> Apparently pre-nv50 pageflip events happen before the actual vblank
> >>> period. Therefore that functionality got semi-disabled in
> >>>
> >>> commit af4870e406126b7ac0ae7c7ce5751f25ebe60f28
> >>> Author: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>> Date:   Tue May 13 00:42:08 2014 +0200
> >>>
> >>>      drm/nouveau/kms/nv04-nv40: fix pageflip events via special case.
> >>>
> >>> Unfortunately that hack got uprooted in
> >>>
> >>> commit cc1ef118fc099295ae6aabbacc8af94d8d8885eb
> >>> Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>> Date:   Wed Aug 12 17:00:31 2015 +0200
> >>>
> >>>      drm/irq: Make pipe unsigned and name consistent
> >>>
> >>> Trigering a warning when trying to sample the vblank timestamp for a
> >>> non-existing pipe. There's a few ways to fix this:
> >>>
> >>> - Open-code the old behaviour, which just enshrines this slight
> >>>    breakage of the userspace ABI.
> >>>
> >>> - Revert Mario's commit and again inflict broken timestamps, again not
> >>>    pretty.
> >>>
> >>> - Fix this for real by delaying the pageflip TS until the next vblank
> >>>    interrupt, thereby making it accurate.
> >>>
> >>> This patch implements the third option. Since having a page flip
> >>> interrupt that happens when the pageflip gets armed and not when it
> >>> completes in the next vblank seems to be fairly common (older i915 hw
> >>> works very similarly) create a new helper to arm vblank events for
> >>> such drivers.
> >>>
> >>> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D106431
> >>> Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>> Cc: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>> Cc: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> >>>
> >>> v2 (mario): Integrate my own review comments into Daniels patch.
> >>>     - Fix function prototypes in drmP.h
> >>>     - Add missing vblank_put() for pageflip completion without
> >>>       pageflip event.
> >>>     - Initialize sequence number for queued pageflip event to avoidng
> >>>       trouble in drm_handle_vblank_events().
> >>>     - Remove dead code and spelling fix.
> >>>
> >>> v3 (mario): Add a signed-off-by and cc stable tag per Ilja's advice.
> >>>
> >>> Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> >>> (v1) Reviewed-by: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>> (v2/v3) Signed-off-by: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>>
> >>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v4.3
> >>> ---
> >>>   drivers/gpu/drm/drm_irq.c                 | 54 ++++++++++++++++++++=
++++++++++-
> >>>   drivers/gpu/drm/nouveau/nouveau_display.c | 19 ++++++-----
> >>>   include/drm/drmP.h                        |  4 +++
> >>>   3 files changed, 68 insertions(+), 9 deletions(-)
> >>
> >> This looks good to me. Let me clean this up a little and submit it to
> >> Dave.
> >>
> >> Thierry
> >>
> >=20
> > Btw., if somebody has a functional old card for testing this, it should=
=20
> > be easy to verify if it works on pre-nv50. If it would not work it woul=
d=20
> > deliver the pageflip event 1 frame delayed, so at least on standard=20
> > nouveau + default DRI2 + default double-buffering the rate for a tight=
=20
> > loop of page-flipped swaps should go down to 30 fps on a 60 Hz display,=
=20
> > quite noticeable. Afaik we also have Piglit tests for OML_sync_control=
=20
> > which would likely fail if this would be broken.
> >=20
> > Oh and if someone has tips on how to resurrect an old nv-40 PC (booted=
=20
> > with BIOS only) graphics card in a MacPro (EFI boot), i wouldn't mind=
=20
> > hearing them. It would be nice to still be able to use that card for=20
> > testing.
> >=20
> > thanks,
> > -mario
>=20
>=20
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 313 at lib/dma-debug.c:1205 check_sync+0x169/0x6e0()
> nouveau 0000:01:00.0: DMA-API: device driver tries to sync DMA memory it =
has not allocated [device address=3D0x00000000c0bf6468] [size=3D4096 bytes]
> Modules linked in: nouveau(+) ...
> CPU: 0 PID: 313 Comm: systemd-udevd Not tainted 4.3.0-3.fc22.i686+debug #1
> ...
> Call Trace:
>  [<c078a28f>] dump_stack+0x48/0x69
>  [<c0461fc7>] warn_slowpath_common+0x87/0xc0
>  [<c07b9029>] ? check_sync+0x169/0x6e0
>  [<c07b9029>] ? check_sync+0x169/0x6e0
>  [<c046203e>] warn_slowpath_fmt+0x3e/0x60
>  [<c07b9029>] check_sync+0x169/0x6e0
>  [<c07b96ad>] debug_dma_sync_single_for_device+0x7d/0x90
>  [<f7ece298>] ? ttm_bo_del_sub_from_lru+0x18/0x50 [ttm]
>  [<c040bef0>] ? text_poke_bp+0xd0/0xd0
>  [<f85d96db>] nouveau_bo_sync_for_device+0x8b/0xa0 [nouveau]
>  [<f85d97c4>] nouveau_bo_validate+0x34/0x40 [nouveau]
>  [<f85d9958>] nouveau_bo_pin+0x188/0x290 [nouveau]
>  [<f85d7fe0>] ? nv10_bo_put_tile_region+0x80/0x80 [nouveau]
>  [<f85ec7fd>] nouveau_channel_prep+0xfd/0x2c0 [nouveau]
>  [<f85eca17>] nouveau_channel_new+0x57/0x7a0 [nouveau]
>  [<c05da57c>] ? kfree+0xdc/0x280
>  [<f8540082>] ? nvif_object_sclass_put+0x12/0x20 [nouveau]
>  [<f85d5666>] nouveau_drm_load+0x596/0x8d0 [nouveau]
>  [<c04bc14c>] ? trace_hardirqs_on_caller+0x12c/0x1d0
>  [<f7e8bfe9>] ? drm_minor_register+0x89/0x120 [drm]
>  [<f7e8c116>] drm_dev_register+0x96/0xa0 [drm]
>  [<f7e8ece9>] drm_get_pci_dev+0x79/0x1c0 [drm]
>  [<c07d973e>] ? pcibios_set_master+0x4e/0xa0
>  [<f85d5b8e>] nouveau_drm_probe+0x1ee/0x220 [nouveau]
>  [<c07dbf3b>] pci_device_probe+0x7b/0xf0
>  [<c08bf366>] ? devices_kset_move_last+0x56/0xa0
>  [<c08c2de4>] driver_probe_device+0x204/0x490
>  [<c08c30bc>] ? __driver_attach+0x4c/0x90
>  [<c07dbc02>] ? pci_match_device+0xd2/0x100
>  [<c08c30f1>] __driver_attach+0x81/0x90
>  [<c08c3070>] ? driver_probe_device+0x490/0x490
>  [<c08c0b97>] bus_for_each_dev+0x57/0xa0
>  [<c08c25ce>] driver_attach+0x1e/0x20
>  [<c08c3070>] ? driver_probe_device+0x490/0x490
>  [<c08c214f>] bus_add_driver+0x1ef/0x290
>  [<c08c3bdd>] driver_register+0x5d/0xf0
>  [<c07da71a>] __pci_register_driver+0x4a/0x50
>  [<f7e8ef0d>] drm_pci_init+0xdd/0x100 [drm]
>  [<f7f211f9>] nouveau_drm_init+0x1f9/0x1000 [nouveau]
>  [<f7f21000>] ? 0xf7f21000
>  [<c040047a>] do_one_initcall+0xaa/0x200
>  [<f7f21000>] ? 0xf7f21000
>  [<c04dae42>] ? rcu_read_lock_sched_held+0x42/0x80
>  [<c05daf0d>] ? kmem_cache_alloc_trace+0x23d/0x310
>  [<c0582dd1>] ? do_init_module+0x21/0x1b7
>  [<c0582dd1>] ? do_init_module+0x21/0x1b7
>  [<c0582e00>] do_init_module+0x50/0x1b7
>  [<c05036ec>] load_module+0x1ebc/0x2550
>  [<c0b993d7>] ? _raw_spin_unlock_irq+0x27/0x40
>  [<c048e6aa>] ? finish_task_switch+0x8a/0x1d0
>  [<c0503ec7>] SyS_init_module+0x147/0x1a0
>  [<c04012c4>] ? do_audit_syscall_entry.isra.9+0x44/0x50
>  [<c0401627>] ? syscall_trace_enter_phase1+0x107/0x130
>  [<c0b99f05>] syscall_call+0x7/0x7
> ---[ end trace d3c14159641a1388 ]---
>=20
>=20
> NV34 tested with 4.3.0-3.fc22.i686
> i.e. 4.3.0-1.fc24.i686 & drm-nouveau-Fix-pre-nv50-pageflip-events-v4.patch
>=20
> http://koji.fedoraproject.org/koji/buildinfo?buildID=3D695636
> https://patchwork.kernel.org/patch/7591531/mbox

This doesn't look at all related and has probably been an issue for
quite some time. I /think/ this happens because memory is allocated from
the non-DMA pool (i.e. using alloc_page()) and then ends up getting run
through the dma_sync_*() API for cache maintenance. But the assumption
is that you can only do cache maintenance by the dma_sync_*() API on
memory allocated by dma_alloc_*(), hence the warning.

There was some discussion about this a while ago, and there was some
conclusion that an API was needed to do cache maintenance on non-DMA-
allocated pages of memory, but I don't think any work happened towards
that API.

Adding Alex and Arnd who had been part of that discussion, though
possibly in different threads. Guys, I've been doing too many unrelated
things lately it seems, because I can't remember where exactly we left
off. I vaguely remember that at some point somebody (maybe Russell) had
objected to adding such a non-DMA cache-maintenance API, but I can't
find a link to the relevant threads.

Thierry

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWRJifAAoJEN0jrNd/PrOh4oYP/3oTgGSxvn16cGFbzyL4FTPR
P9NKjSqtS7st2yPYcxyvmcT1qujruDKGPA4ubmxMGJnD+29SBz17yFTUEvbpprRL
Wrl5NqLzfryvdP8Vlnj9QpbOBmwmnwDhO/HYzfu+RlCP5USeRLVUEMuzGCOU91bG
Z8PO5sVCYNBYuODyhEuWo6WWuhStDSJxpj2kFzZRSa2JSo78thpkE1zraVD/oJn8
m3eTJ25Fv2FD4jbBhcn+C8R/Hm0Ij+1ljwE6wWqLLr1D1C8AtuVuz33qFyKckKsb
YWjGRQqFPIlNIH/e/UtTmOtcmf5DZpTLkDhPcY/fYbTDs3QPA4qmj3VHhIUHthyo
hDaOiNokaWRZza9JG8aQs5ciVfgjAfRlpcQ74TswS0vmHBiAa8sOXTgS8Egyhi0f
aPv9rrLiTTRAHOS75wctZz/ILBrjBF7dtpByVvBV8JYLcqpG8Mrs1QtRTDA4Zg5M
lhMtzT2uYzT1B4K9Ym1bWB4EY8kEk2Q4NaW0aRHnVX/zZ1Q548ILAh5qI/ZpweYF
uqus+O7n79Ppn0FT/j8jAhJI6ACu4NXS/Z7Q/juG6d0BZtuu+6mLJM2+pRro8ISQ
RQJKcdiNNdu1h3B4tcYmbx5J2Nnm8G4qskfP5SZnrL1edl1U7REi0RK2gfJB2hcN
FhbrWSV8P8HkIi4egImO
=a+6/
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--

--===============1638668967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1638668967==--
