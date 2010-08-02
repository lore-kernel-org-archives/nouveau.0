From: =?utf-8?q?K=C4=81rlis_Repsons?= <k@11.lv>
Subject: Re: 2 cards in, but work only separately
Date: Mon, 2 Aug 2010 13:31:52 +0000
Message-ID: <201008021332.02470.k@11.lv>
References: <201007312208.33260.k@11.lv> <201008020919.46649.k@11.lv>
	<87wrs9jll1.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0698149682=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87wrs9jll1.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0698149682==
Content-Type: multipart/signed;
  boundary="nextPart2039155.kLpOUPp1XI";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2039155.kLpOUPp1XI
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: quoted-printable

On Monday 02 August 2010 11:33:14 Francisco Jerez wrote:
> > But now I'm at the "next level of trouble":=20
> > 1. when two Xservers are running, after some minutes video output of th=
e=20
> > primary card ceases (logging out restarts X and then it's back..), while
> > the  second output is still ok;
>=20
> Kernel and X logs after the crash would be helpful.
I found them to be funnily short: in my kernel log there is this line:
[drm] nouveau 0000:01:00.0: Setting dpms mode 1 on vga encoder (output 0)

And yes it doesn't come back just by moving mouse.
In xorg.conf there is /Option "DPMS" "off"/ for each monitor and also for e=
ach=20
server layout Blank, Standby, Suspend, Off *Time is set to "0"...

$ cat Xorg.0.log | egrep "(DPMS|Dpms|dpms)"
Aug  2 13:05:01 station 19180.806] (II) Loading extension DPMS
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): DPMS capabilities: Off;=
=20
RGB/Color Display

Now what should I do please?

--nextPart2039155.kLpOUPp1XI
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkxWyNIACgkQHuSu329e3GGdCgCfaTOD7Vk+DGidO9ets7QTEcVj
KqYAn2wgDk9SKLZifCrqer7NIakqDmZ+
=6OT4
-----END PGP SIGNATURE-----

--nextPart2039155.kLpOUPp1XI--

--===============0698149682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0698149682==--
