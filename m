From: Abelenda Diego <diego.abelenda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Strange problem with dual head on GeForce9600GT (dual DVI)
Date: Tue, 13 Jul 2010 18:42:31 +0200
Message-ID: <20100713184231.6c3ca5db@Lina>
Reply-To: diego.abelenda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0812225025=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0812225025==
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/.UEtv3zlfDZ0wBuZVavgAbt"; protocol="application/pgp-signature"

--Sig_/.UEtv3zlfDZ0wBuZVavgAbt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

I am using nouveau for some time now, I am quite happy with it. I had
two screens connected with DVI to VGA adapters and dual screen was
working no problem. Today I decided to replace the DVI to VGA adapters
with plain DVI-I dual link cables and found out something strange, the
second screen doesn't display anything anymore, it stays black.

I am using gentoo linux with
Linus' kernel 2.6.35_rc4
libdrm 2.4.21
media-libs/mesa 7.8.2
x11-drivers/xf86-video-nouveau 0.0.16_pre20100615

Is it somehow related to
https://bugs.freedesktop.org/show_bug.cgi?id=3D27455 or do I need to open
a new bug report, with some dumps from renouveau ?

--Sig_/.UEtv3zlfDZ0wBuZVavgAbt
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iQIcBAEBAgAGBQJMPJd8AAoJEKJk+FAH5Bn4ayoP/A8LNo7iaGc2izj+oaKDn5xs
Ns+LAUxBjUYqS+PLZxGKEWE+Gk4nhE2ryP27oR4I8w8gQg9IYUyZszlEFdsLM0x+
+oLUdg8H8S9gerA2a9SMtab11dBp8nOQLRJ4SVCyoKGyY2Sobysj/KY0hPkEGbfF
02SPcFOGgK4/YXg63mWPZuWqDPrWDCxoNWFuzk+hJU7Xx9DFAGSUt3d261DU+eBp
azNlIzyha+f+SaHoIea5RXQl3YWRNJ+IIz5x9ICkdQfU7HfInbh4BQgg+25lkyzt
ilZHn5Cg1Z0eu9Ra+apC6eLHuaO2fHnzMabi0nG35Y0iB9V69atBZ1G/jFfUCUYH
12s9ZxyUXylpaVGLvRy+P6YZa/cY1IXAiOQWUHsHUqdWVd9EEV0SrsB/xb/c1VtC
szUBTYcVGZ+E+12mCR3bbS7FG9b8eNVduXvSTYhKfjdeD2SXM1pEGecCByi1jKBt
EVMZL5e/2KtxhwqjLLh4C6R8fQkmF/bmkP4UTTxLIrL79KE77hat+wbulzgwrKSp
o+bFzvsE8MGt/JuaR7gTJ9BXCu7ZB2JkjB/2CFuZ6x/DaZ6ur6vCOmyXrxSZf9cE
AeY52M3Vv0tlfo9Tw9f2xCrjmCIx819Xx+iR4CDTSLX2XocUV4ID1RCjs7RUo8dw
RKCb/PUJRrv0LuPO9BA8
=VeP8
-----END PGP SIGNATURE-----

--Sig_/.UEtv3zlfDZ0wBuZVavgAbt--

--===============0812225025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0812225025==--
