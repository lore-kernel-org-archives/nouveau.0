From: Johannes Winter <yova-YX+nfPaYCPzk1uMJSBkQmQ@public.gmane.org>
Subject: Dual setup next to radeon not working
Date: Sun, 23 Sep 2018 10:01:08 +0200
Message-ID: <20180923100108.65700dcf@radell.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2054991304=="
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

--===============2054991304==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/yZ/MAHK/p8nPXpS5TDBRzRL"; protocol="application/pgp-signature"

--Sig_/yZ/MAHK/p8nPXpS5TDBRzRL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear list,


I'm using an up-to-date debian sid. I don't get my NVDIA Quadro NVS 440
working next to a Radeon HD 2400 PRO:

01:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] RV610 [Radeon HD 2400 PRO]=20
01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] RV610 HDMI
Audio [Radeon HD 2350 PRO / 2400 PRO/XT / HD 3410]=20
03:00.0 PCI bridge: NVIDIA Corporation Device 01b3 (rev a3)=20
04:00.0 PCI bridge: NVIDIA Corporation Device 01b3 (rev a3)=20
04:01.0 PCI bridge: NVIDIA Corporation Device 01b3 (rev a3)=20
05:00.0 VGA compatible controller: NVIDIA Corporation NV43 [Quadro NVS
440] (rev a2)=20
06:00.0 VGA compatible controller: NVIDIA Corporation NV43 [Quadro NVS
440] (rev a2)

After starting gnome I get the mouse courser visible with:=20

xrandr --auto --setprovideroutputsource 1 0 --auto

But no visible windows of any kind.

The logs are filled with:

$ grep nouveau /var/log/kern.log | head
Sep 23 08:32:00 radell kernel: [   27.962958] nouveau 0000:06:00.0:
DRM: 0xD686: Parsing digital output script table Sep 23 08:32:01 radell
kernel: [   28.013900] nouveau 0000:06:00.0: Xorg[1095]: fail
set_domain Sep 23 08:32:01 radell kernel: [   28.013905] nouveau
0000:06:00.0: Xorg[1095]: validating bo list Sep 23 08:32:01 radell
kernel: [   28.013909] nouveau 0000:06:00.0: Xorg[1095]: validate: -22

Any ideas what might be wrong?

Best regards,

Johannes Winter

--Sig_/yZ/MAHK/p8nPXpS5TDBRzRL
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgsWhsbSeIeg3ZAcglXH7ZlwOzu8FAlunSEQACgkQlXH7ZlwO
zu8WIgf+JmCLblSM9xrRfNvcuNAjcoXzPgCThC8DalfFl0YwphDaWmZKoWfnyWqX
4HoGuGr/h6jHyU3N5/q2IeC9v+pwG3uL1C/ws36VmCnrS7RBp2m2OYCMqRZOIjGZ
KnqLsvZeg2LVquKztJdWVwRElbNrO1oW8WXUjBGNyniYsTlZA8rf7EooGUkLI2pz
py/vnscS1eDxemXULkZBF+Ybe2EUREmS9QUODjw/Y1KqVV3wa16OoRl75F6730Yu
nu6ebCbVb+mEwK2PbdTi1y4FHjoWhDZD88VKv6tWFEOhJsQsHItx9x4prIODTh2M
QOlGljO89SctIJjw0Pep/7JaG35JoQ==
=N00v
-----END PGP SIGNATURE-----

--Sig_/yZ/MAHK/p8nPXpS5TDBRzRL--

--===============2054991304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2054991304==--
