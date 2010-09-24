From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: AMD768 & GeForce5200: nouveau bug??
Date: Fri, 24 Sep 2010 22:27:51 +0200
Message-ID: <8739syrins.fsf@riseup.net>
References: <4C9CB7B2.3010401@pfu.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1943458512=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C9CB7B2.3010401-t9zbU3WrWHI@public.gmane.org> ("Grzesiek =?utf-8?Q?S=C3=B3jka=22'?=
	=?utf-8?Q?s?= message of "Fri, 24 Sep 2010 16:37:38 +0200")
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

--===============1943458512==
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
> 	Im using ASUS A7M266-D mainboard based on AMD768 chipset and Nvidia
> GeForce FX5200 dual DVI graphics adapter. I'm forced to switch from
> binary Nvidia drivers to nouveau but the problem is that nouveau.ko
> would not load with AGP support turned on. Is it a nouveau/kernel bug??
> 	To build the kernel I used the kernel tree downloaded from the nouveau
> repository about a week ago. The dmesg output with/without the AGP
> support you can find at:
> http://yen.ipipan.waw.pl/~gs159090/tmp/withAGP.txt.gz
> http://yen.ipipan.waw.pl/~gs159090/tmp/withoutAGP.txt.gz
> And here is lspci -vv output
> http://yen.ipipan.waw.pl/~gs159090/tmp/lspci-vv.txt.gz
>
> Thanks in advance for any help.

That looks like a bug in the amdk7 agp driver, can you give this patch a
try?

>
> Regards
> Greg
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau


--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment; filename=amdk7_agp_user_memory.patch
Content-Transfer-Encoding: quoted-printable

diff --git a/drivers/char/agp/amd-k7-agp.c b/drivers/char/agp/amd-k7-agp.c
index b6b1568..82e5189 100644
=2D-- a/drivers/char/agp/amd-k7-agp.c
+++ b/drivers/char/agp/amd-k7-agp.c
@@ -303,13 +303,15 @@ static void amd_irongate_tlbflush(struct agp_memory *=
temp)
=20
 static int amd_insert_memory(struct agp_memory *mem, off_t pg_start, int t=
ype)
 {
+	struct agp_bridge_data *bridge =3D mem->bridge;
 	int i, j, num_entries;
 	unsigned long __iomem *cur_gatt;
 	unsigned long addr;
=20
 	num_entries =3D A_SIZE_LVL2(agp_bridge->current_size)->num_entries;
=20
=2D	if (type !=3D 0 || mem->type !=3D 0)
+	if (!bridge || type !=3D mem->type ||
+	    bridge->driver->agp_type_to_mask_type(bridge, type))
 		return -EINVAL;
=20
 	if ((pg_start + mem->page_count) > num_entries)

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkydCcgACgkQg5k4nX1Sv1u5YAD9ENeJ1Sdd+3csWEjmE25CkmKM
3RxtiGw6/gJH9F01nUgA/jnlqp4UypV2CUaKWT7ikVq6SMTUUeaWkoIdr72ZT55k
=Xi05
-----END PGP SIGNATURE-----
--==-=-=--

--===============1943458512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1943458512==--
