From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] vga16fb: refuse to load in face of other driver
	controlling primary card
Date: Fri, 23 Jul 2010 17:00:09 +0200
Message-ID: <AANLkTik4aFSwhfjvmA5RJxa+tLxmhC4_EHcOMpaGEhLD@mail.gmail.com>
References: <20100720191923.GA11056@joi.lan>
	<20100722172039.e935c67d.akpm@linux-foundation.org>
	<20100723131034.GA6618@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100723131034.GA6618@joi.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-fbdev@vger.kernel.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Fri, Jul 23, 2010 at 15:10, Marcin Slusarz <marcin.slusarz@gmail.com=
> wrote:
> diff --git a/drivers/video/fbmem.c b/drivers/video/fbmem.c
> index 731fce6..cb19cae 100644
> --- a/drivers/video/fbmem.c
> +++ b/drivers/video/fbmem.c
> @@ -1504,6 +1504,7 @@ static bool fb_do_apertures_overlap(struct aper=
tures_struct *gena,
> =C2=A0}
>
> =C2=A0#define VGA_FB_PHYS 0xA0000
> +#define VGA_FB_PHYS_LEN 65536

Does this really belong here?

> =C2=A0void remove_conflicting_framebuffers(struct apertures_struct *a=
,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *na=
me, bool primary)
> =C2=A0{
> @@ -1532,6 +1533,17 @@ void remove_conflicting_framebuffers(struct ap=
ertures_struct *a,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(remove_conflicting_framebuffers);
>
> +struct resource *request_vga_mem_region(const char *name)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct resource *res =3D request_mem_region(VG=
A_FB_PHYS,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 VGA_FB_PHYS_LEN, name);
> + =C2=A0 =C2=A0 =C2=A0 if (res =3D=3D NULL)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO "=
%s: other driver owns the primary card, refusing to load\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name);
> + =C2=A0 =C2=A0 =C2=A0 return res;
> +}
> +EXPORT_SYMBOL(request_vga_mem_region);
> +
> =C2=A0/**
> =C2=A0* =C2=A0 =C2=A0 register_framebuffer - registers a frame buffer=
 device
> =C2=A0* =C2=A0 =C2=A0 @fb_info: frame buffer info structure
> @@ -1548,6 +1560,8 @@ register_framebuffer(struct fb_info *fb_info)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct fb_event event;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct fb_videomode mode;
> + =C2=A0 =C2=A0 =C2=A0 bool primary;
> + =C2=A0 =C2=A0 =C2=A0 struct resource *res =3D fb_info->resource;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_registered_fb =3D=3D FB_MAX)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;
> @@ -1555,8 +1569,19 @@ register_framebuffer(struct fb_info *fb_info)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fb_check_foreignness(fb_info))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS=
;
>
> + =C2=A0 =C2=A0 =C2=A0 primary =3D fb_is_primary_device(fb_info);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0remove_conflicting_framebuffers(fb_info->a=
pertures, fb_info->fix.id,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
b_is_primary_device(fb_info));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 primary=
);
> +
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* if the card is primary and the resourc=
e was not already allocated
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* by framebuffer driver then lock vga me=
mory region
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 if (primary && res =3D=3D NULL) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D request_vg=
a_mem_region(fb_info->fix.id);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res =3D=3D NUL=
L)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return -EBUSY;
> + =C2=A0 =C2=A0 =C2=A0 }

More VGA-specific stuff in drivers/video/fbmem.c.
Not all platforms have VGA memory.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
