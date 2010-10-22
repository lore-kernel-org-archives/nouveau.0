From: Aaron Sowry <aaron+nv-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Subject: Re: NV50 backlight brightness
Date: Fri, 22 Oct 2010 11:57:40 +0200
Message-ID: <20101022095740.GA30072@aeneby.se>
References: <20101019091030.GA28588@aeneby.se>
	<1287573459.24955.11.camel@araqiel>
	<20101021091621.GA29567@aeneby.se>
	<1287657920.3245.1.camel@nisroch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0457495125=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1287657920.3245.1.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0457495125==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline


--1UWUbFP1cBYEclgG
Content-Type: multipart/mixed; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2010 at 08:45:20PM +1000, Ben Skeggs wrote:
> What value does 0x610084 contain on boot for you?
>=20
Using the attached patch (hopefully early enough on in the initialisation):

[aaron@jules ~]$ dmesg | grep NV50
[drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x0a8600a2)
NV50 0x00610084: 0xa0000000

What's the relevance of this value?

--/04w6evG8XlLl3ft
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="reg_peek.patch"
Content-Transfer-Encoding: quoted-printable

--- /home/aaron/rpmbuild/BUILD/kernel-2.6.35.fc14.orig/drivers/gpu/drm/nouv=
eau/nv50_display.c	2010-09-09 23:00:38.774029000 +0200
+++ /home/aaron/rpmbuild/BUILD/kernel-2.6.35.fc14/linux-2.6.35.x86_64/drive=
rs/gpu/drm/nouveau/nv50_display.c	2010-10-22 11:36:32.252185209 +0200
@@ -205,6 +205,8 @@ nv50_display_init(struct drm_device *dev
=20
 	NV_DEBUG_KMS(dev, "\n");
=20
+	printk("NV50 0x00610084: 0x%08x\n", nv_rd32(dev, 0x00610084));
+
 	nv_wr32(dev, 0x00610184, nv_rd32(dev, 0x00614004));
 	/*
 	 * I think the 0x006101XX range is some kind of main control area

--/04w6evG8XlLl3ft--

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQEcBAEBAgAGBQJMwWAUAAoJECw8YUUfeQL9yckH/0NxQc1cmQMOYLsDxx5nKycA
dYmkk0GDKgz4r7n1yolx7FW7GBUKDfR1bP7ZXMK31YWOWaohZIA+kGIyjcUIN3bM
7QQY0oHqvacPzJW6LMGYuvrrU5gxaA3ejW4ErD7WQ5sy1ncCa7WSrUstVlFgBqaM
BqDav/wiK8p2RzRTqv05n8Wi+ZPRyn2RqJh7zDZrr8S1JP1JvZsLx4e/iYBZZy+b
4/KKzQ7p1gCT4eYgqIAoA99ddv3zi18RW89eN05meCl6AtOnbogFIiBGZDYz0Fq3
7QuL1MjxVcl4RJ41g5jcrwC5pGtxXkrjet+huP36UJmX3ewnihpsI6KPlctS8h0=
=47QY
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--

--===============0457495125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0457495125==--
