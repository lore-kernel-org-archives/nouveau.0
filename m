From: Alessandro Pignotti <alex.pigna-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org>
Subject: Windows nVidia driver initialization
Date: Tue, 2 Oct 2007 18:21:06 +0200
Message-ID: <200710021821.13538.alex.pigna@inventati.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0071059793=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0071059793==
Content-Type: multipart/signed;
  boundary="nextPart3846549.R9KgYhtzbb";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3846549.R9KgYhtzbb
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi everyone,

I'm trying to write a qemu driver to emulate an nvidia card, to take a look=
 at=20
commands sent to the board by windows drivers. The implementation is now ve=
ry=20
minimal, only VGA compatibility is granted. I'm seen that windows tries onl=
y=20
to read the start of mmio address space and then select VGA mode. I guess i=
t=20
looks for some kind of success state, but i don't know what it is expecting=
=20
to find. Does anyone know something about this? I've also seen that standar=
d=20
nvidiafb under linux does not try to do a similar test.

Greeting,
Alessandro
=2D-=20
Vi Veri Veniversum Vivus Vici
	-Dr. Faustus - Marlowe
Public GPG Key ID 0x650B3ED9 on subkeys.gpg.net
Key Fingerprint 6243 AAD3 E3EC 52D8 DFAA 2A2F 9FCD 0457 650B 3ED9
Encrypted mails are welcome

--nextPart3846549.R9KgYhtzbb
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBHAm/yn80EV2ULPtkRArQcAKDpFz4iU5k4dbaKWbMSurzrKM+pjgCggFGY
qeVrXp6qBeadco4b64CasjI=
=3Oq0
-----END PGP SIGNATURE-----

--nextPart3846549.R9KgYhtzbb--

--===============0071059793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0071059793==--
