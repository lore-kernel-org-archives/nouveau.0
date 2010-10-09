From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: dual head X config
Date: Sat, 09 Oct 2010 04:16:56 +0200
Message-ID: <87mxqof6uf.fsf@riseup.net>
References: <4CAF4040.5020409@pfu.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1174107519=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CAF4040.5020409-t9zbU3WrWHI@public.gmane.org> ("Grzesiek =?utf-8?Q?S=C3=B3jka=22'?=
	=?utf-8?Q?s?= message of "Fri, 08 Oct 2010 18:01:04 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Grzesiek =?utf-8?Q?S=C3=B3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1174107519==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Grzesiek S=C3=B3jka <pld-t9zbU3WrWHI@public.gmane.org> writes:

> Hi there,
>
> I have a question. I have a dual DVI NV34 adapter and at the moment
> the Xserver works fine. Two separated displays configured as follows:
>
> Section "Monitor"
>   Identifier     "Monitor0"
>   Option         "Primary"    "True"
> EndSection
> Section "Monitor"
>   Identifier     "Monitor1"
>   Option         "RightOf" "Monitor0"
>   Option         "Primary"    "False"
> EndSection
> Section "Device"
>   Identifier     "Device0"
>   Driver         "nouveau"
>   #assigns the output DVI-I-1 to Monitor0
>   Option         "monitor-DVI-I-1" "Monitor0"
>   #assigns the output DVI-I-2 to Monitor1
>   Option         "monitor-DVI-I-2" "Monitor1"
> EndSection
> Section "Screen"
>   Identifier          "screen0"
>   Device              "Device0"
>   Monitor             "Monitor0"
>   DefaultDepth       16
>   SubSection "Display"
>     Depth           16
>     Virtual          3200 1200
>    EndSubSectino
> EndSection
>
> The problem is that I would like to make the mplayer stretch the movie
> to both monitors when going into the fullscreen mode. When I was using
> the binary nvidia driver I used the TwinView to do this. Is it
> possible using the nouveau driver??

You could try "fake xinerama": http://ktown.kde.org/~seli/fakexinerama/

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkyv0JkACgkQg5k4nX1Sv1txCQEApDTouVZnLgoKP0KJeWPIAYq+
ctx2TtG9sxpXqClpKIUA+gK9lOOe1iY3HeL/iRB5q7trB+MWSdKL2GzrxVIZVpTN
=w/9L
-----END PGP SIGNATURE-----
--==-=-=--

--===============1174107519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1174107519==--
