From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: 2 cards in, but work only separately
Date: Sun, 01 Aug 2010 13:35:18 +0200
Message-ID: <87fwyylg5l.fsf@riseup.net>
References: <201007312208.33260.k@11.lv>
	<20100801114104.43f1b5e4@daedalus.pq.iki.fi>
	<201008010859.40932.k@11.lv>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0240239426=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201008010859.40932.k-atMwuq7AWwA@public.gmane.org> (=?utf-8?Q?=22K=C4=81rlis?=
	Repsons"'s message of "Sun, 1 Aug 2010 08:59:28 +0000")
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

--===============0240239426==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

K=C4=81rlis Repsons <k@11.lv> writes:

> On Sunday 01 August 2010 08:41:04 Pekka Paalanen wrote:
>> On Sat, 31 Jul 2010 22:08:23 +0000
>>=20
>> K=C4=81rlis Repsons <k@11.lv> wrote:
>> > Hi list,
>> > my thanks to developers of nouveau first: I wonder how you put it
>> > together this far, where there's quite enough to appreciate!
>> >=20
>> > This question I have: strangely I can get each of 2 cards to work
>> > separately for a dualseat PC by toggling on/off fbcon=3Dmap: kernel
>> > option (compiled with CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY)
>> > -- by doing so I can have each card initialized and start it's
>> > Xorg, all welll, but can't have both cards initialized (and thus
>> > used) -- why?
>> >=20
>> > In very short, this is what my dmesg says:
>> > [drm] Initialized drm 1.1.0 20060810
>> > nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
>> > [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on
>> > minor 0 nouveau 0000:04:00.0: enabling device (0000 -> 0002)
>> > nouveau 0000:04:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
>> > nouveau 0000:04:00.0: PCI INT A disabled
>> > nouveau: probe of 0000:04:00.0 failed with error -12
>>=20
>> Is this really a continuous section of the kernel log, no
>> lines removed from between?
> No, I removed! See all in attach!
>
>> What versions of the Nouveau components and the kernel you have?
>> What cards do you have?
> Linux 2.6.34-gentoo-r2 (no DRM or nouveau driver in);
>
> nouveau-drm 20100520 from portage (gives me ch7006.ko drm_kms_helper.ko d=
rm.ko=20
> nouveau.ko ttm.ko);
>
> GeForce 7300GS, GeForce 6200LE!

Could you please try again with the latest kernel modules from git? I
think your problem has already been fixed.

>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkxVW/YACgkQg5k4nX1Sv1tuGwD/fj8LpudQzfix6X/QOHCHUnEN
GWe0CHTXOVw2y/1jV6gA/3+dByS+uAt0SESyQBV94t2ONsxf4lrbb83Cs5RyDfis
=w+0Y
-----END PGP SIGNATURE-----
--==-=-=--

--===============0240239426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0240239426==--
