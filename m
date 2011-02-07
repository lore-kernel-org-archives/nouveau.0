From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: TDMS bandwidth limits
Date: Mon, 07 Feb 2011 13:26:12 +0100
Message-ID: <87pqr4vxnf.fsf@riseup.net>
References: <DE8B09DD-4ACE-499A-A33C-C12C005803F0@math.uni-bonn.de>
	<87k4hg4x0b.fsf@riseup.net>
	<B6BAA649-2D35-4374-B7F6-568B5B749E47@math.uni-bonn.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1116123645=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <B6BAA649-2D35-4374-B7F6-568B5B749E47-o02PS0xoJP/q4qjOmvqfQQ@public.gmane.org> ("Edgar
	=?utf-8?Q?Fu=C3=9F=22's?= message of "Mon, 7 Feb 2011 12:57:48 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Edgar =?utf-8?Q?Fu=C3=9F?= <ef-o02PS0xoJP/q4qjOmvqfQQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1116123645==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Edgar Fu=C3=9F <ef-o02PS0xoJP/q4qjOmvqfQQ@public.gmane.org> writes:

> So my problem continues.
>
>> They're based on what the nvidia proprietary driver itself refuses to do,
> I see, thanks.
>
>> though, I'm not 100% sure that I had nv44 in my sample when I made that =
change.
> Looks like it limits to 155M in the nv44 case too, so your change is tota=
lly correct.
>
>> It might be using a reduced-blanking mode,
> Indeed it does, thanks. I had ruled out this too early as highly improbab=
le.
>
>> check your Xorg.0.log to be sure. See the "-logverbose" option if you do=
n't
>> get all the timings printed out with the default verbosity level.
> It does tell at least on level 9, thanks.
>
> However, what it doesn't tell is the timing actually used. Anyone more fa=
miliar with the relevant reverse engineering methods (MmioTrace or whatever=
) to find out?
>
A register dump [1] would be the easiest way to find out the exact
timings, but any standard 1600x1200 reduced-blanking mode should do it.

> The other problem is that nouveaufb doesn't (like matroxfb) provide a met=
hod of specifying the exact timing to use (and I would presumably need it i=
n order not to change between FB console and X11).
>
You could just use the same CVT reduced-blanking mode on both X and the
framebuffer console.

> One would come to think that video=3D1600x1200RM would result in a reduce=
d-blanking mode, but drm.debug=3D7 shows it actually does not.
> Reading the source of drm_fb_helper.c reveals that it's almost impossible=
 to achieve rb=3D1.
>
Well, that works for me, can I have a look at your kernel logs?

> Any chance of implementing implicit reduced blanking in nouveau? If someo=
ne could hint me at where to architecturally correctly put it in I will be =
happy to start implementing it myself.
>
> I'm afraid more people than me will run into this and will regard the (ab=
solutely plausible) TDMS bandwidth limiting as a regression ("Help! Help! M=
y 1600x1200 used to work, but now it's broken!") when there's no reduced-bl=
anking workaround.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

[1] http://cgit.freedesktop.org/~currojerez/tvdump/

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk1P5OQACgkQg5k4nX1Sv1trigD+MzSCFZ4t6pV7cfh8rHuJVqS8
xYz7IWe09yG5tzfVoYgA/A9qTjtFMASl5Cj11f46j2Spiyocs4yZr8uPIzhZCYxW
=5GgG
-----END PGP SIGNATURE-----
--==-=-=--

--===============1116123645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1116123645==--
