From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Build failure for gallium nouveau driver from git
Date: Sun, 31 Oct 2010 15:27:05 +0100
Message-ID: <87zktu8mkm.fsf@riseup.net>
References: <4CCD2C73.1070806@azabani.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2108315899=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CCD2C73.1070806-Boohn7ZbvbpBDgjK7y7TUQ@public.gmane.org> (Delan Azabani's message of "Sun,
	31 Oct 2010 16:44:35 +0800")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: delan-Boohn7ZbvbpBDgjK7y7TUQ@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2108315899==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Delan Azabani <delan-Boohn7ZbvbpBDgjK7y7TUQ@public.gmane.org> writes:

> The latest git version of freedesktop/mesa/mesa (building for gallium
> driver according to nouveau wiki/GalliumHowto) does not compile. The
> messages shown are:
>
> nouveau_screen.c: In function =E2=80=98nouveau_screen_init=E2=80=99:
> nouveau_screen.c:239: warning: passing argument 4 of
> =E2=80=98nouveau_channel_alloc=E2=80=99 makes pointer from integer withou=
t a cast
> /usr/include/nouveau/nouveau_channel.h:51: note: expected =E2=80=98struct
> nouveau_channel **=E2=80=99 but argument is of type =E2=80=98int=E2=80=99
> nouveau_screen.c:239: error: too many arguments to function
> =E2=80=98nouveau_channel_alloc=E2=80=99
>
> I'm running Ubuntu 10.10 with the latest git libdrm installed. Nvidia
> proprietary drivers are not installed; running distribution-packaged
> 2D-only nouveau driver. By the way, my understanding of the code is
> limited, so the things I try to fix the problem with are probably silly.
>
nouveau_channel_alloc() is defined in libdrm_nouveau. If you're sure you
built it from git, you have a stale version installed somewhere else,
'find / |grep nouveau_channel.h" will tell you where.

I don't know for sure because I'm not an Ubuntu user, but most likely
the distro-provided 2D driver is going to be too old to be compatible
with libdrm-git and you'll have to build it from sources as well.

> This line seems to be the culprit:
>
> ret =3D nouveau_channel_alloc(dev, 0xbeef0201, 0xbeef0202, 512*1024,
> &screen->channel);
>
> Even though nouveau_context.c has a similar call with the same number of
> arguments, it isn't an error. I also couldn't find the function
> definition for nouveau_channel_alloc anywhere. Naively, I remove the
> last argument so it looks like this:
>
> ret =3D nouveau_channel_alloc(dev, 0xbeef0201, 0xbeef0202, 512*1024);
>
> The error disappears, and the compile continues. Another error now:
>
> nv50_surface.c: In function =E2=80=98nv50_surface_set=E2=80=99:
> nv50_surface.c:95: error: =E2=80=98NOUVEAU_BO_TILE_LAYOUT_MASK=E2=80=99 u=
ndeclared
> (first use in this function)
> nv50_surface.c:95: error: (Each undeclared identifier is reported only on=
ce
> nv50_surface.c:95: error: for each function it appears in.)
> make[4]: *** [nv50_surface.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> nv50_transfer.c: In function =E2=80=98nv50_transfer_rect_m2mf=E2=80=99:
> nv50_transfer.c:48: error: =E2=80=98NOUVEAU_BO_TILE_LAYOUT_MASK=E2=80=99 =
undeclared
> (first use in this function)
> nv50_transfer.c:48: error: (Each undeclared identifier is reported only o=
nce
> nv50_transfer.c:48: error: for each function it appears in.)
> nv50_transfer.c: In function =E2=80=98nv50_upload_sifc=E2=80=99:
> nv50_transfer.c:283: error: =E2=80=98NOUVEAU_BO_TILE_LAYOUT_MASK=E2=80=99=
 undeclared
> (first use in this function)
> make[4]: *** [nv50_transfer.o] Error 1
>
> Don't know how to fix that one. Even the nouveau_channel_alloc error,
> which I 'fixed', seems odd because it was called elsewhere just the same
> without fail.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkzNfLkACgkQg5k4nX1Sv1uAfQD+MojXjAYWKO/IAcloQllacyKa
Jt7A4TdmA+vHsCfykCAA+wTd9fbYu9n9oVdCrLLwQRbw9xtAp1vVSydv+WLa7NId
=t8+S
-----END PGP SIGNATURE-----
--==-=-=--

--===============2108315899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2108315899==--
