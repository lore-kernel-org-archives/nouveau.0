From: =?utf-8?q?K=C4=81rlis_Repsons?= <k@11.lv>
Subject: Re: 2 cards in, but work only separately
Date: Mon, 2 Aug 2010 09:19:33 +0000
Message-ID: <201008020919.46649.k@11.lv>
References: <201007312208.33260.k@11.lv> <201008010859.40932.k@11.lv>
	<20100801103002.GA2719@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2047257635=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100801103002.GA2719-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2047257635==
Content-Type: multipart/signed;
  boundary="nextPart3019503.YEhrTYXvLU";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3019503.YEhrTYXvLU
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 01 August 2010 10:30:02 Marcin Slusarz wrote:
> On Sun, Aug 01, 2010 at 08:59:28AM +0000, K=C4=81rlis Repsons wrote:
> > On Sunday 01 August 2010 08:41:04 Pekka Paalanen wrote:
> > > On Sat, 31 Jul 2010 22:08:23 +0000
> > >=20
> > > K=C4=81rlis Repsons <k@11.lv> wrote:
> > > > Hi list,
> > > > my thanks to developers of nouveau first: I wonder how you put it
> > > > together this far, where there's quite enough to appreciate!
> > > >=20
> > > > This question I have: strangely I can get each of 2 cards to work
> > > > separately for a dualseat PC by toggling on/off fbcon=3Dmap: kernel
> > > > option (compiled with CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY)
> > > > -- by doing so I can have each card initialized and start it's
> > > > Xorg, all welll, but can't have both cards initialized (and thus
> > > > used) -- why?
> > > >=20
> > > > In very short, this is what my dmesg says:
> > > > [drm] Initialized drm 1.1.0 20060810
> > > > nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
> > > > [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on
> > > > minor 0 nouveau 0000:04:00.0: enabling device (0000 -> 0002)
> > > > nouveau 0000:04:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
> > > > nouveau 0000:04:00.0: PCI INT A disabled
> > > > nouveau: probe of 0000:04:00.0 failed with error -12
> > >=20
> > > Is this really a continuous section of the kernel log, no
> > > lines removed from between?
> >=20
> > No, I removed! See all in attach!
> >=20
> > > What versions of the Nouveau components and the kernel you have?
> > > What cards do you have?
> >=20
> > Linux 2.6.34-gentoo-r2 (no DRM or nouveau driver in);
> >=20
> > nouveau-drm 20100520 from portage (gives me ch7006.ko drm_kms_helper.ko
> > drm.ko nouveau.ko ttm.ko);
> >=20
> > GeForce 7300GS, GeForce 6200LE!
>=20
> These are NV40's (see http://nouveau.freedesktop.org/wiki/CodeNames) and
> multicard (http://nouveau.freedesktop.org/wiki/FeatureMatrix) on NV40's
> works since 2010.05.25. Just upgrade.
>=20
> Marcin

So I'm back with updated system:
$ uname gives me 2.6.35-rc3, where Linux 2.6.35-rc6 (object=20
b37fa16e78d6f9790462b3181602a26b5af36260) is used as base for nouveau-maste=
r=20
with HEAD 439a21f25f60221e6d9032cb8ad3bb1aafee44ea, nouveau kernel modules=
=20
compiled in;
libdrm 2.4.21-r1 from gentoo x11 overlay;
xf86-video-nouveau 0.0.16_pre20100615;
x11-base/xorg-server-1.8.99.905 from overlay too.

Yes, that problem with cards initialization is gone!

But now I'm at the "next level of trouble":=20
1. when two Xservers are running, after some minutes video output of the=20
primary card ceases (logging out restarts X and then it's back..), while th=
e=20
second output is still ok;
2. after hibernation/resume the same problematic video output is showing me=
=20
some vt with my X11 mouse cursor and gpm's one in the same time, all input =
is=20
directed to X11, but no useful video output for primary card, while second=
=20
output is ok (again X restart helps).

What would you suggest me now?

--nextPart3019503.YEhrTYXvLU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkxWjbIACgkQHuSu329e3GEo/wCg1WyzpiAPpBSG5RCb5OeB21yi
zvEAn3gHjvKEXDLSwy5EnKn6VXKIFUgk
=4Agi
-----END PGP SIGNATURE-----

--nextPart3019503.YEhrTYXvLU--

--===============2047257635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2047257635==--
