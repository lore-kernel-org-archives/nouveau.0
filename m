From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: 2 cards in, but work only separately
Date: Mon, 02 Aug 2010 16:07:19 +0200
Message-ID: <87sk2xhzvs.fsf@riseup.net>
References: <201007312208.33260.k@11.lv> <201008020919.46649.k@11.lv>
	<87wrs9jll1.fsf@riseup.net> <201008021332.02470.k@11.lv>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2032536880=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201008021332.02470.k-atMwuq7AWwA@public.gmane.org> (=?utf-8?Q?=22K=C4=81rlis?=
	Repsons"'s message of "Mon, 2 Aug 2010 13:31:52 +0000")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?utf-8?Q?K=C4=81rlis?= Repsons <k@11.lv>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2032536880==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

K=C4=81rlis Repsons <k@11.lv> writes:

> On Monday 02 August 2010 11:33:14 Francisco Jerez wrote:
>> > But now I'm at the "next level of trouble":=20
>> > 1. when two Xservers are running, after some minutes video output of t=
he=20
>> > primary card ceases (logging out restarts X and then it's back..), whi=
le
>> > the  second output is still ok;
>>=20
>> Kernel and X logs after the crash would be helpful.
> I found them to be funnily short: in my kernel log there is this line:
> [drm] nouveau 0000:01:00.0: Setting dpms mode 1 on vga encoder (output 0)
>
> And yes it doesn't come back just by moving mouse.
> In xorg.conf there is /Option "DPMS" "off"/ for each monitor and also for=
 each=20
> server layout Blank, Standby, Suspend, Off *Time is set to "0"...
>
> $ cat Xorg.0.log | egrep "(DPMS|Dpms|dpms)"
> Aug  2 13:05:01 station 19180.806] (II) Loading extension DPMS
> Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): DPMS capabilities: Of=
f;=20
> RGB/Color Display
>
> Now what should I do please?

Show us your full logs, please.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkxW0RcACgkQg5k4nX1Sv1t+AwD+LbV7NNlDpvrgUBwBMvmyowpD
wyPtelGUGSTQqIZOPQEA/jkMlFRj8rXHPenc7x90IiXGqZbwttALm82o2VtL3U9f
=qe1s
-----END PGP SIGNATURE-----
--==-=-=--

--===============2032536880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2032536880==--
