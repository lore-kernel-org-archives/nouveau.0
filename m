From: Marko Schuetz-Schmuck <MarkoSchuetz-S0/GAf8tV78@public.gmane.org>
Subject: trouble connecting to Panduit VGA adapter
Date: Fri, 01 Sep 2017 12:50:44 -0400
Message-ID: <8760d2l5wb.fsf@tpad-m.i-did-not-set--mail-host-address--so-tickle-me>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0357448354=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0357448354==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I want to connect to an InFocus projector that sits behind a Panduit VGA
adapter. I use a Thinkpad P51 with a mini display-port to VGA
converter. The laptop runs Manjaro and has the
video-hybrid-intel-nouveau-prime installed and it works with other
monitors. For some reason it does not detect the projector that is
connected through the Panduit. The keyboard shortcut to switch monitor
configuration says "No External Display". xrandr reports only the
built-in screen.=20

I talked to the technician for the room installation and he told me that
he had seen this before on a Ubuntu machine and that switching to the
proprietary nvidia driver solved that problem. For various reasons I'd
rather not switch to that driver.

I also found some lines with "DRM: DDC responded, but no EDID for DP-1"
in them from around the time I tried connecting to the projector. Could
they be related?

Is there some setting or configuration that can help in this case?

Best regards,

Marko

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTovfrETQc10zr+ME0PTg+AoZH0KgUCWamP5AAKCRAPTg+AoZH0
KgnQAKCG/bDmaAoYWgfvcBK0GnPMvM7xLQCcDaAxY55y8wU8noteSKWDL3tep60=
=Sd8B
-----END PGP SIGNATURE-----
--=-=-=--

--===============0357448354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0357448354==--
