From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/bl: Fix oops on driver unbind
Date: Sun, 18 Mar 2018 21:48:02 +0100
Message-ID: <20180318204802.iagtt2d5gpsfpojo@pmoreau.org>
References: <5c682f35ac338efac66416b7670dc01f1ee02676.1518870434.git.lukas@wunner.de>
 <20180219093803.3bbevbvd574r7epx@pmoreau.org>
 <20180317110740.GA3109@wunner.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0412928434=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180317110740.GA3109-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0412928434==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vr6sspoymkgthcrl"
Content-Disposition: inline


--vr6sspoymkgthcrl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Lukas,

> Sorry Pierre, I missed this question and am seeing it only now on
> saving the message away:

No worries, and thank you for the great explanation! I=E2=80=99ll definitel=
y make a
mental note to try unloading Nouveau, whenever writing/testing similar patc=
hes.

Thanks,
Pierre

--vr6sspoymkgthcrl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEuCp/qmebDh5BvKefO2dY27124hoFAlqu0IIACgkQO2dY2712
4hrPIRAAjgwrIbgUm3KeM8TABpXKwKctcaULyXXpIvJ8IHpA+YGV/Csl291p8f0P
k0Ljj4u9T+CSYHUNnrjRwcbpcJugO6Ha6/ZCxprEQ26sFAt8m3+yKGbsaKbctTGs
1PPLNcnmMcNyZJMEh55dRYOseLssIoPmnkfSOi0Orgkw6+6lGPu9tcoX+52QY7nc
s1mq6b4KqE9PXrQzQjQvmXvYpp8m/tLoL1RNptwHcFIzlQHovXzsgfwA7GiNLRbm
dgBddEEnZmoHoNg1an4wEZiZxOQvQPJPb6HhNpcB2sG9ldZGv5BMd06Idgqm4rim
l5ahRbDGJ+QcR897z/lsKuw2nH57DTnnd/EsdOBCRCMADNz6d4/zyry6Cb5eww2P
SYMu5p6gZddivvD4XNVZlrmf8WwuibvCvv6FrQ3lLzvv1tUEwaGbMcOKvz7uHn4w
pAptU6T48hBbrhL0qs1fNavZ/4dRf0zbsDMRJNC8+TRM9MAagC44cScHM9y5x+Lg
KOY+6YrbzsHDPQqI2Li/1xuxdGHw1ERlcsDTzqGPTHeYi6k1LmLtKP5IxyjRfWfG
RCnjeSxVkGpuoHvLRDfMMVfmaxgZCRV694F+I5LIkTapMWspEr96YNewTGtLQmSo
78rFgoLVWHQ4uaC26qe9QH1A6Gl4XZ7R8FsgZ3skCeYOEYunF5M=
=KWdl
-----END PGP SIGNATURE-----

--vr6sspoymkgthcrl--

--===============0412928434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0412928434==--
