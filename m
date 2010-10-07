From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Thu, 07 Oct 2010 04:53:15 +0200
Message-ID: <87wrpug1d0.fsf@riseup.net>
References: <4C9E0167.8000507@pfu.pl>
	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi> <4CA1C6C0.1000709@pfu.pl>
	<20100928170227.00665f76@daedalus.pq.iki.fi> <4CA21515.4030903@pfu.pl>
	<20100929193136.644e0d68@daedalus.pq.iki.fi>
	<878w2jike0.fsf@riseup.net> <4CA4A934.4080109@pfu.pl>
	<87zkuzgqsv.fsf@riseup.net> <4CA4D199.8010403@pfu.pl>
	<87pqvuhksw.fsf@riseup.net> <4CA5B64D.8000608@pfu.pl>
	<871v88hgam.fsf@riseup.net> <4CAAFB3A.8010804@pfu.pl>
	<87fwwkhk8h.fsf@riseup.net> <4CAB3BDC.4070502@pfu.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1187903261=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CAB3BDC.4070502-t9zbU3WrWHI@public.gmane.org> ("Grzesiek =?utf-8?Q?S=C3=B3jka=22'?=
	=?utf-8?Q?s?= message of "Tue, 05 Oct 2010 16:53:16 +0200")
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

--===============1187903261==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Grzesiek S=C3=B3jka <pld-t9zbU3WrWHI@public.gmane.org> writes:

> On 10/05/10 14:55, Francisco Jerez wrote:
>>> PS. I'm afraid that my system is not very stable when the AGP support
>>> is turned on both using the nouveau kernel source tree and the PLD
>>> patched 2.6.35-5 version with an extra amd-k7-agp patch. The Xserver
>>> uses the driver:
>> Unstable? How? What's the problem?
>
> Here are the logs:
> http://yen.ipipan.waw.pl/~gs159090/tmp/log.tgz
>
> BTW: Sometimes the Xserver freezes during normal work. Unfortunately I
> was not able to generate such a crush now. I send you logs if it
> happens again.
>
> Regards.
>
> [...]
> [  197.374498] kernel BUG at drivers/gpu/drm/ttm/ttm_tt.c:420!

Oops, I overlooked that, updated patch attached.


--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment; filename=amdk7_agp_user_memory.patch
Content-Transfer-Encoding: quoted-printable

diff --git a/drivers/char/agp/amd-k7-agp.c b/drivers/char/agp/amd-k7-agp.c
index b6b1568..b1b4362 100644
=2D-- a/drivers/char/agp/amd-k7-agp.c
+++ b/drivers/char/agp/amd-k7-agp.c
@@ -309,7 +309,8 @@ static int amd_insert_memory(struct agp_memory *mem, of=
f_t pg_start, int type)
=20
 	num_entries =3D A_SIZE_LVL2(agp_bridge->current_size)->num_entries;
=20
=2D	if (type !=3D 0 || mem->type !=3D 0)
+	if (type !=3D mem->type ||
+	    agp_bridge->driver->agp_type_to_mask_type(agp_bridge, type))
 		return -EINVAL;
=20
 	if ((pg_start + mem->page_count) > num_entries)
@@ -348,7 +349,8 @@ static int amd_remove_memory(struct agp_memory *mem, of=
f_t pg_start, int type)
 	unsigned long __iomem *cur_gatt;
 	unsigned long addr;
=20
=2D	if (type !=3D 0 || mem->type !=3D 0)
+	if (type !=3D mem->type ||
+	    agp_bridge->driver->agp_type_to_mask_type(agp_bridge, type))
 		return -EINVAL;
=20
 	for (i =3D pg_start; i < (mem->page_count + pg_start); i++) {

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF0EAREIAAYFAkytNhsACgkQg5k4nX1Sv1sMZAD1FsEWE5+6nQQkWaGgFwSRIxCB
OukAFHh7GqedZUQLUwD+OvTbauKx/qSFdRNr9XMdVaYHdZpRWbE5hQ5E2FXcSEc=
=6+oU
-----END PGP SIGNATURE-----
--==-=-=--

--===============1187903261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1187903261==--
