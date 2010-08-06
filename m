From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: 2 cards in, but work only separately
Date: Fri, 06 Aug 2010 21:16:02 +0200
Message-ID: <878w4jh7rh.fsf@riseup.net>
References: <201007312208.33260.k@11.lv> <201008021332.02470.k@11.lv>
	<87sk2xhzvs.fsf@riseup.net> <201008021501.30085.k@11.lv>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0645324544=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201008021501.30085.k-atMwuq7AWwA@public.gmane.org> (=?utf-8?Q?=22K=C4=81rlis?=
	Repsons"'s message of "Mon, 2 Aug 2010 15:01:25 +0000")
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

--===============0645324544==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

K=C4=81rlis Repsons <k@11.lv> writes:

> On Monday 02 August 2010 14:07:19 Francisco Jerez wrote:
>> K=C4=81rlis Repsons <k@11.lv> writes:
>> > On Monday 02 August 2010 11:33:14 Francisco Jerez wrote:
>> >> > But now I'm at the "next level of trouble":
>> >> > 1. when two Xservers are running, after some minutes video output of
>> >> > the primary card ceases (logging out restarts X and then it's
>> >> > back..), while the  second output is still ok;
>> >>=20
>> >> Kernel and X logs after the crash would be helpful.
>> >=20
>> > I found them to be funnily short: in my kernel log there is this line:
>> > [drm] nouveau 0000:01:00.0: Setting dpms mode 1 on vga encoder (output=
 0)
>> >=20
>> > And yes it doesn't come back just by moving mouse.
>> > In xorg.conf there is /Option "DPMS" "off"/ for each monitor and also =
for
>> > each server layout Blank, Standby, Suspend, Off *Time is set to "0"...
>> >=20
>> > $ cat Xorg.0.log | egrep "(DPMS|Dpms|dpms)"
>> > Aug  2 13:05:01 station 19180.806] (II) Loading extension DPMS
>> > Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): DPMS capabilities:
>> > Off; RGB/Color Display
>> >=20
>> > Now what should I do please?
>>=20
>> Show us your full logs, please.
> Ok. Here I post the kernel log fragment between start of Xservers at 13:0=
5:00 and crash,
> which happened at 13:14:47, you can find full logs in attach,
> note that syslog-ng has done some "modifications", but I hope they're not
> harmful for us:
>
> Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Allocating FI=
FO number 1
> Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: nouveau_chann=
el_alloc: initialised FIFO 1
> Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Setting dpms =
mode 3 on tmds encoder (output 2)
> Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: 0xD0B6: Parsi=
ng digital output script table
> Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Setting dpms =
mode 0 on tmds encoder (output 2)
> Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Output DVI-I-=
2 is running on CRTC 0 using output A
> Aug  2 13:05:01 station kernel: [drm] nouveau 0000:01:00.0: Allocating FI=
FO number 1
> Aug  2 13:05:01 station kernel: [drm] nouveau 0000:01:00.0: nouveau_chann=
el_alloc: initialised FIFO 1
> Aug  2 13:14:47 station kernel: [drm] nouveau 0000:01:00.0: Setting dpms =
mode 1 on vga encoder (output 0)
> Aug  2 13:17:11 station kernel: [drm] nouveau 0000:04:00.0: nouveau_chann=
el_free: freeing fifo 1
> Aug  2 13:17:11 station kernel: [drm] nouveau 0000:01:00.0: nouveau_chann=
el_free: freeing fifo 1
>
> Let me know what you find...

Apparently something's setting DPMS mode 1 behind the X server
back. Does "xset dpms force on" give you the display back?

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkxcX3IACgkQg5k4nX1Sv1uQ7AD9FIDxnleqkH6jDCsaKZyM+wU+
PRBg+nRRaqhY1XTJCnIA/j0d/mBNKWUFbv3NtA7tatnP44kcnJPXoWq1I/4+sI8S
=ts8J
-----END PGP SIGNATURE-----
--==-=-=--

--===============0645324544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0645324544==--
