From: Christopher James Halse Rogers <raof-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Bugs from Ubuntu - what would you like to see?
Date: Mon, 01 Mar 2010 12:22:30 +1100
Message-ID: <1267406550.17231.53.camel@Spike>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0841935921=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0841935921==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-dOhAFs6BdsYoKY58Gu6m"


--=-dOhAFs6BdsYoKY58Gu6m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As you probably know, Ubuntu is switching from -nv to -nouveau as the
default X driver for nvidia cards in the upcoming Lucid 10.04 release.
We've got a pretty nice automated bug-reporting tool in Ubuntu called
apport, which can grab all sorts of interesting logs and relevant
information.

Since we've switched over to nouveau by default, I expect the volume of
bugs filed against the Ubuntu packages will increase dramatically.  I
want to make sure that these bugs are as useful as possible for the
Nouveau project so that I can feed useful bugs up to
bugs.freedesktop.org.

Currently, the apport hooks attach Xorg logs, dmesg, and xrandr
--verbose output, among other things.  This seems to cover much of the
information I've seen requested on bugs.fdo, but is there anything else
that would be useful to automatically attach?

I notice that the Intel driver now raises udev events when it detects a
GPU error.  We have a udev rule triggered by this event which collects a
register dump & triggers a bug report when it happens.  It doesn't look
like nouveau currently triggers any userspace events on errors, but it
seems that it should be quite easy to do from the look of i915_irq.c &
the PGRAPH error patch on the list.  Would automatically-triggered (but
not automatically reported) bug reports on PGRAPH errors be useful?

Currently we have the kernel module & drm from 2.6.33 + the nv5x ctxprog
generator from master, and a recent snapshot of the DDX in Lucid.  As
that starts to get old the X team will provide up to date snapshot
packages so that users can retest bugs against the latest code.

Is there anything else that you'd like Ubuntu to do to ensure good bugs
reach you?

--=-dOhAFs6BdsYoKY58Gu6m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAABAgAGBQJLixbPAAoJEBUHnPSAqAygPz4IAKhssQry5zF4ukd0LlKyP+1J
RbI/6a9tAETH2rdqRXMq38gjaJNSR/0brnsaOcq9sePQz6lwamCrzVgiJF9gwkVt
wEOYNxUmjwpl0o4Ns4qAeiGtOQmdW4d6XL5bmtKSipRAj8m2tLG2juVwDwJmUle+
3rYrtxKlzRv64ERTlPko9imx2iX7JddN/aBB3FhwQ0dhR3wsBrJG9z5JUdme2A/p
4X6WfOBdBPpQkaAGgrTyzBoKtyddRRXUSAYt4xyMgarCjxhxZFMWutjwqn88wOJO
7PKEiXYtY7jXb0gyVsB1GVGYjJRAe/hUI3/qYV6k35q18GKa+mA0EcRmMU6jhyc=
=HN2x
-----END PGP SIGNATURE-----

--=-dOhAFs6BdsYoKY58Gu6m--


--===============0841935921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0841935921==--
