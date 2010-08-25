From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: shouldn't nouveau.ko depend on fbcon.ko?
Date: Wed, 25 Aug 2010 18:15:53 +0200
Message-ID: <87sk22brd2.fsf@riseup.net>
References: <AANLkTinqnf3qpSBhb6g7EtxVO3d+_BbcYfxXZJC9Ht9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1136174338=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinqnf3qpSBhb6g7EtxVO3d+_BbcYfxXZJC9Ht9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Dragos Delcea's message of "Wed, 25 Aug 2010 16:26:40 +0300")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dragos Delcea <dragos.delcea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1136174338==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Dragos Delcea <dragos.delcea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Hi,
>
> I noticed that loading nouveau doesn't load fbcon automatically; and without fbcon, when loading nouveau the
> console turns blank. I spent a few good hours until I was able to figure out that I had to manually modprobe
> fbcon to get the console back after loading nouveau.
> This is happening on a vanilla 2.6.35.3; shouldn't there be dependencies in place between modules?
>
> Note that I haven't got to the xorg part just yet, I'm currently installing gentoo.
>
We already do, except for kernels compiled with "Configure standard
kernel features (for small systems)". Strictly speaking, nouveau doesn't
depend on fbcon so that option is left open for e.g. embedded platforms
that don't need a framebuffer console.

> thanks,
> Dragos
>
> PS please include me in the reply as I'm not subscribed.
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkx1QboACgkQg5k4nX1Sv1uiTQEAjXhdWOyMdera/mL5UFiKUbiD
AAZsODrNrpHWgmgkLCYA/3TsJaFIwyHUFkiRwcyiCi2zpXViq78jrgDGG5kbuoEu
=BhDY
-----END PGP SIGNATURE-----
--==-=-=--

--===============1136174338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1136174338==--
