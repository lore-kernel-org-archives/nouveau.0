From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: 2 cards in, but work only separately
Date: Mon, 02 Aug 2010 13:33:14 +0200
Message-ID: <87wrs9jll1.fsf@riseup.net>
References: <201007312208.33260.k@11.lv> <201008010859.40932.k@11.lv>
	<20100801103002.GA2719@joi.lan> <201008020919.46649.k@11.lv>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0527871812=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201008020919.46649.k-atMwuq7AWwA@public.gmane.org> (=?utf-8?Q?=22K=C4=81rlis?=
	Repsons"'s message of "Mon, 2 Aug 2010 09:19:33 +0000")
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

--===============0527871812==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

K=C4=81rlis Repsons <k@11.lv> writes:

> On Sunday 01 August 2010 10:30:02 Marcin Slusarz wrote:
>> On Sun, Aug 01, 2010 at 08:59:28AM +0000, K=C4=81rlis Repsons wrote:
>> > On Sunday 01 August 2010 08:41:04 Pekka Paalanen wrote:
>> > > On Sat, 31 Jul 2010 22:08:23 +0000
>> > >=20
>> > > K=C4=81rlis Repsons <k@11.lv> wrote:
>> > > > Hi list,
>> > > > my thanks to developers of nouveau first: I wonder how you put it
>> > > > together this far, where there's quite enough to appreciate!
>> > > >=20
>> > > > This question I have: strangely I can get each of 2 cards to work
>> > > > separately for a dualseat PC by toggling on/off fbcon=3Dmap: kernel
>> > > > option (compiled with CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY)
>> > > > -- by doing so I can have each card initialized and start it's
>> > > > Xorg, all welll, but can't have both cards initialized (and thus
>> > > > used) -- why?
>> > > >=20
>> > > > In very short, this is what my dmesg says:
>> > > > [drm] Initialized drm 1.1.0 20060810
>> > > > nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
>> > > > [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on
>> > > > minor 0 nouveau 0000:04:00.0: enabling device (0000 -> 0002)
>> > > > nouveau 0000:04:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
>> > > > nouveau 0000:04:00.0: PCI INT A disabled
>> > > > nouveau: probe of 0000:04:00.0 failed with error -12
>> > >=20
>> > > Is this really a continuous section of the kernel log, no
>> > > lines removed from between?
>> >=20
>> > No, I removed! See all in attach!
>> >=20
>> > > What versions of the Nouveau components and the kernel you have?
>> > > What cards do you have?
>> >=20
>> > Linux 2.6.34-gentoo-r2 (no DRM or nouveau driver in);
>> >=20
>> > nouveau-drm 20100520 from portage (gives me ch7006.ko drm_kms_helper.ko
>> > drm.ko nouveau.ko ttm.ko);
>> >=20
>> > GeForce 7300GS, GeForce 6200LE!
>>=20
>> These are NV40's (see http://nouveau.freedesktop.org/wiki/CodeNames) and
>> multicard (http://nouveau.freedesktop.org/wiki/FeatureMatrix) on NV40's
>> works since 2010.05.25. Just upgrade.
>>=20
>> Marcin
>
> So I'm back with updated system:
> $ uname gives me 2.6.35-rc3, where Linux 2.6.35-rc6 (object=20
> b37fa16e78d6f9790462b3181602a26b5af36260) is used as base for nouveau-mas=
ter=20
> with HEAD 439a21f25f60221e6d9032cb8ad3bb1aafee44ea, nouveau kernel module=
s=20
> compiled in;
> libdrm 2.4.21-r1 from gentoo x11 overlay;
> xf86-video-nouveau 0.0.16_pre20100615;
> x11-base/xorg-server-1.8.99.905 from overlay too.
>
> Yes, that problem with cards initialization is gone!
>
> But now I'm at the "next level of trouble":=20
> 1. when two Xservers are running, after some minutes video output of the=
=20
> primary card ceases (logging out restarts X and then it's back..), while =
the=20
> second output is still ok;

Kernel and X logs after the crash would be helpful.

> 2. after hibernation/resume the same problematic video output is showing =
me=20
> some vt with my X11 mouse cursor and gpm's one in the same time, all inpu=
t is=20
> directed to X11, but no useful video output for primary card, while secon=
d=20
> output is ok (again X restart helps).
>
> What would you suggest me now?

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkxWrPsACgkQg5k4nX1Sv1vNDwD+IMV/+XNr4F4Dqvc1TZli3V+J
gJ4sb1GSPAXoAvdyYsgA/3fl9eVq+rPU4NhlSLQqOZST1jr1j72MJCENkId6zV1g
=0sK0
-----END PGP SIGNATURE-----
--==-=-=--

--===============0527871812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0527871812==--
