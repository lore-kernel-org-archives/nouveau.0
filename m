From: =?utf-8?q?K=C4=81rlis_Repsons?= <k@11.lv>
Subject: Re: 2 cards in, but work only separately
Date: Mon, 2 Aug 2010 19:11:24 +0000
Message-ID: <201008021911.29661.k@11.lv>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1934481393=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1934481393==
Content-Type: multipart/signed;
  boundary="nextPart45751441.UhQ4XMrDIu";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart45751441.UhQ4XMrDIu
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 02 August 2010 14:07:19 Francisco Jerez wrote:
> K=C4=81rlis Repsons <k@11.lv> writes:
> > On Monday 02 August 2010 11:33:14 Francisco Jerez wrote:
> >> > But now I'm at the "next level of trouble":
> >> > 1. when two Xservers are running, after some minutes video output of
> >> > the primary card ceases (logging out restarts X and then it's
> >> > back..), while the  second output is still ok;
> >>=20
> >> Kernel and X logs after the crash would be helpful.
> >=20
> > I found them to be funnily short: in my kernel log there is this line:
> > [drm] nouveau 0000:01:00.0: Setting dpms mode 1 on vga encoder (output =
0)
> >=20
> > And yes it doesn't come back just by moving mouse.
> > In xorg.conf there is /Option "DPMS" "off"/ for each monitor and also f=
or
> > each server layout Blank, Standby, Suspend, Off *Time is set to "0"...
> >=20
> > $ cat Xorg.0.log | egrep "(DPMS|Dpms|dpms)"
> > Aug  2 13:05:01 station 19180.806] (II) Loading extension DPMS
> > Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): DPMS capabilities:
> > Off; RGB/Color Display
> >=20
> > Now what should I do please?
>=20
> Show us your full logs, please.
Ok. Here I post the kernel log fragment between start of Xservers at 13:05:=
00=20
and crash, which happened at 13:14:47. I sent full logs to Francisco, they=
=20
were not accepted in this list because 144KB > 100KB.

Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Allocating FIFO=
=20
number 1
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0:=20
nouveau_channel_alloc: initialised FIFO 1
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Setting dpms mo=
de=20
3 on tmds encoder (output 2)
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: 0xD0B6: Parsing=
=20
digital output script table
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Setting dpms mo=
de=20
0 on tmds encoder (output 2)
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Output DVI-I-2 =
is=20
running on CRTC 0 using output A
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:01:00.0: Allocating FIFO=
=20
number 1
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:01:00.0:=20
nouveau_channel_alloc: initialised FIFO 1
Aug  2 13:14:47 station kernel: [drm] nouveau 0000:01:00.0: Setting dpms mo=
de=20
1 on vga encoder (output 0)
Aug  2 13:17:11 station kernel: [drm] nouveau 0000:04:00.0:=20
nouveau_channel_free: freeing fifo 1
Aug  2 13:17:11 station kernel: [drm] nouveau 0000:01:00.0:=20
nouveau_channel_free: freeing fifo 1

So lets see later what is there...

--nextPart45751441.UhQ4XMrDIu
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkxXGGEACgkQHuSu329e3GGs7QCePEEuUNHpkPOQcc+RnbMR6aIk
Q2UAoLDHliavzwgX/mc3RO1IC2nX2+Q2
=v/Fb
-----END PGP SIGNATURE-----

--nextPart45751441.UhQ4XMrDIu--

--===============1934481393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1934481393==--
