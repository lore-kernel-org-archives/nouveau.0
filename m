From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Some cosmetic NV10TCL method changes.
Date: Thu, 05 Nov 2009 19:01:26 +0100
Message-ID: <87y6mkrguh.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1673021231=="
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

--===============1673021231==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The attached patch does the cosmetic renouveau.xml changes I
proposed. I'm about to reply myself with some other patches to update
libdrm and then fix the API break up.


--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment; filename=rename_some_nv10tcl_methods.patch
Content-Transfer-Encoding: quoted-printable

=2D-- renouveau.xml	3 Nov 2009 22:13:56 -0000	1.280
+++ renouveau.xml	5 Nov 2009 17:49:20 -0000
@@ -376,6 +376,12 @@
       <item value=3D"0x0007" name=3D"X8R8G8B8"/>
     </list>
=20
+    <list name=3D"nv10_vtxfmt_type">
+      <item value=3D"0x0000" name=3D"UBYTE"/>
+      <item value=3D"0x0001" name=3D"USHORT"/>
+      <item value=3D"0x0002" name=3D"FLOAT"/>
+    </list>
+
     <list name=3D"nv10_tx_format">
       <item value=3D"0x0000" name=3D"L8"/>
       <item value=3D"0x0001" name=3D"A8"/>
@@ -2219,10 +2225,10 @@
     <reg32 offset=3D"0x06c4" name=3D"LIGHT_MODEL_FRONT_SIDE_PRODUCT_AMBIEN=
T_PLUS_EMISSION_R" type=3D"float"/>
     <reg32 offset=3D"0x06c8" name=3D"LIGHT_MODEL_FRONT_SIDE_PRODUCT_AMBIEN=
T_PLUS_EMISSION_G" type=3D"float"/>
     <reg32 offset=3D"0x06cc" name=3D"LIGHT_MODEL_FRONT_SIDE_PRODUCT_AMBIEN=
T_PLUS_EMISSION_B" type=3D"float"/>
=2D    <reg32 offset=3D"0x06e8" name=3D"VIEWPORT_SCALE_X" type=3D"float"/>
=2D    <reg32 offset=3D"0x06ec" name=3D"VIEWPORT_SCALE_Y" type=3D"float"/>
=2D    <reg32 offset=3D"0x06f0" name=3D"VIEWPORT_SCALE_Z" type=3D"float"/>
=2D    <reg32 offset=3D"0x06f4" name=3D"VIEWPORT_SCALE_W" type=3D"float"/>
+    <reg32 offset=3D"0x06e8" name=3D"VIEWPORT_TRANSLATE_X" type=3D"float"/>
+    <reg32 offset=3D"0x06ec" name=3D"VIEWPORT_TRANSLATE_Y" type=3D"float"/>
+    <reg32 offset=3D"0x06f0" name=3D"VIEWPORT_TRANSLATE_Z" type=3D"float"/>
+    <reg32 offset=3D"0x06f4" name=3D"VIEWPORT_TRANSLATE_W" type=3D"float"/>
     <reg32 offset=3D"0x06f8" name=3D"POINT_PARAMETER" size=3D"8" type=3D"f=
loat"/>
     <reg32 offset=3D"0x0800" name=3D"LIGHT_FRONT_SIDE_PRODUCT_AMBIENT_R" s=
ize=3D"8" stride=3D"128" type=3D"float"/>
     <reg32 offset=3D"0x0804" name=3D"LIGHT_FRONT_SIDE_PRODUCT_AMBIENT_G" s=
ize=3D"8" stride=3D"128" type=3D"float"/>
@@ -2330,9 +2336,9 @@
     <reg32 offset=3D"0x0ce4" name=3D"VERTEX_WGH_1F" type=3D"float"/>
     <reg32 offset=3D"0x0cec" name=3D"EDGEFLAG_ENABLE" type=3D"boolean"/>
     <reg32 offset=3D"0x0cf0" name=3D"VERTEX_ARRAY_VALIDATE"/>
=2D    <reg32 offset=3D"0x0d00" name=3D"VERTEX_ARRAY_ATTRIB_OFFSET" size=3D=
"8" stride=3D"8" type=3D"hexa"/>
=2D    <reg32 offset=3D"0x0d04" name=3D"VERTEX_ARRAY_ATTRIB_FORMAT" size=3D=
"8" stride=3D"8" type=3D"bitfield">
=2D      <bitfield name=3D"TYPE" high=3D"3" low=3D"0" type=3D"int"/>
+    <reg32 offset=3D"0x0d00" name=3D"VTXBUF_ADDRESS" size=3D"8" stride=3D"=
8" type=3D"hexa"/>
+    <reg32 offset=3D"0x0d04" name=3D"VTXFMT" size=3D"8" stride=3D"8" type=
=3D"bitfield">
+      <bitfield name=3D"TYPE" high=3D"3" low=3D"0" type=3D"enum" enum_name=
=3D"nv10_vtxfmt_type"/>
       <bitfield name=3D"FIELDS" high=3D"7" low=3D"4" type=3D"int"/>
       <bitfield name=3D"STRIDE" high=3D"15" low=3D"8" type=3D"int"/>
     </reg32>

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkrzEvYACgkQ196Zy2qEI5ftVQCff2ej1OX3eJ+oDT+zfYXPtgGb
oQcAoOuPG9mwrGh/nAodljBJs9trJ0t4
=LphN
-----END PGP SIGNATURE-----
--==-=-=--

--===============1673021231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1673021231==--
