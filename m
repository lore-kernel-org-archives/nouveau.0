From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Wayland doesn't work outside of X with nouveau,
	and it should
Date: Mon, 14 Feb 2011 00:20:55 +0100
Message-ID: <AANLkTikRFoOXa8JHoLQQ=ZvrFt0_7TVrmfZLXhb3OEMo@mail.gmail.com>
References: <20110213185318.GT22937@chaosreigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110213185318.GT22937-gf8W+JFHfRr/2OF+hy8yCA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Darxus-gf8W+JFHfRr/2OF+hy8yCA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Feb 13, 2011 at 7:53 PM,  <Darxus-gf8W+JFHfRr/2OF+hy8yCA@public.gmane.org> wrote:
> Since pageflip support for NV50 cards was added on the 9th, wayland should
> work for me outside of X, but all I'm getting is apparently random chunks
> of uninitialized video memory.
>
> It seems nobody has looked into the problem who has an Nvidia card. =A0I =
have
> no idea where to begin.
>
> I added my PCI ID to mesa's dri2_driver_map so I could use egl_dri2 since
> egl_dri2 is what is being used with Intel cards, to make sure it wasn't
> just a difference between egl_dri2 and egl_gallium which I normally use.
> Wayland works fine under X this way with egl_dri2.
>
> I think similar results are happening with ATI/AMD cards, so wayland
> without X is only working on Intel cards.
>
> Build instructions for Wayland are here:
> http://wayland.freedesktop.org/building.html
> They should be up to date and thorough. =A0I have an easier build script =
for
> Ubuntu Maverick here: =A0http://www.chaosreigns.com/wayland/ubuntu.html
> You should be able to just run the compositor program outside of X to get
> DRM output.
>
> My console output (which I don't think contains anything interesting):
>
> X output, which works:
> http://www.chaosreigns.com/wayland/wayland.x11.txt
> With strace:
> http://www.chaosreigns.com/wayland/wayland.x11.strace.txt
>
> DRM output, not working:
> http://www.chaosreigns.com/wayland/wayland.drm.txt
> With strace:
> http://www.chaosreigns.com/wayland/wayland.drm.strace.txt
>
> The script I used to run it:
> http://www.chaosreigns.com/wayland/wayland-compositor.sh
>
> To get your PCI ID:
> $ lspci -nv |grep VGA
> 05:00.0 0300: 10de:0611 (rev a2) (prog-if 00 [VGA controller])
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^^^^
>
> My Mesa patch to add my PCI ID so I can use egl_dri2 (I sent this to
> mesa-dev a while ago, but it didn't get applied - this one is updated).
> You just need to add another line with your PCI ID in nouveau_chip_ids[].
> What would it take to get these in mesa?
>

Nouveau doesn't really do PCI ID lists, so you have to match to the
vendor ID, check that you're dealing with a video card and not some
other nvidia device. Then you can use something like
nouveau_device_open_existing and the struct that you get from that
contains "chipset" which can be used to determine what you have.

> [PATCH] Add nVidia Corporation G92 [GeForce 8800 GT] to dri2_driver_map
>
> ---
> =A0src/egl/drivers/dri2/platform_drm.c | =A0 =A05 +++++
> =A01 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/src/egl/drivers/dri2/platform_drm.c b/src/egl/drivers/dri2/p=
latform_drm.c
> index 42939a5..4652011 100644
> --- a/src/egl/drivers/dri2/platform_drm.c
> +++ b/src/egl/drivers/dri2/platform_drm.c
> @@ -558,6 +558,10 @@ const int r600_chip_ids[] =3D {
> =A0 =A00x6779, /* PCI_CHIP_CAICOS_6779 */
> =A0};
>
> +const int nouveau_chip_ids[] =3D {
> + =A0 0x0611, /* G92 [GeForce 8800 GT] */
> +};
> +
> =A0const struct dri2_driver_map driver_map[] =3D {
> =A0 =A0{ 0x8086, "i915", i915_chip_ids, ARRAY_SIZE(i915_chip_ids) },
> =A0 =A0{ 0x8086, "i965", i965_chip_ids, ARRAY_SIZE(i965_chip_ids) },
> @@ -565,6 +569,7 @@ const struct dri2_driver_map driver_map[] =3D {
> =A0 =A0{ 0x1002, "r200", r200_chip_ids, ARRAY_SIZE(r200_chip_ids) },
> =A0 =A0{ 0x1002, "r300", r300_chip_ids, ARRAY_SIZE(r300_chip_ids) },
> =A0 =A0{ 0x1002, "r600", r600_chip_ids, ARRAY_SIZE(r600_chip_ids) },
> + =A0 { 0x10de, "nouveau", nouveau_chip_ids, ARRAY_SIZE(nouveau_chip_ids)=
 },
> =A0};
>
> =A0char *
> --
> 1.7.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>



-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
