From: Daniel Wallace <daniel.wallace-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org>
Subject: Re: nvidia gt 545 and nouveau
Date: Thu, 5 Apr 2012 04:24:46 -0400
Message-ID: <20120405082446.GA687@Daniel-Tower>
References: <20120405002512.GA1517@Daniel-Tower>
	<CAGZ4FES5fKnRSDVR6f9rLwKuHMr-57-8nWX5UOyeQzvDNo+bMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0453092489=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAGZ4FES5fKnRSDVR6f9rLwKuHMr-57-8nWX5UOyeQzvDNo+bMA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0453092489==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 05, 2012 at 08:46:01AM +0200, Maarten Maathuis wrote:
> On Thu, Apr 5, 2012 at 2:25 AM, Daniel Wallace
> <daniel.wallace-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org> wrote:
> > I have 2 monitors plugged into the same nvidia card
> > (running nouveau) one can be either DVI-I or VGA(vga right now) and the
> > other is hdmi, right now, I am just trying to get the monitors to not
> > be clones of each other and to be side by side. When i do xrandr
> > --output HDMI-1 --pos 0x0 --output VGA-1 --auto --right-of HDMI-1, the
> > whole screen freezes with the mouse in between the 2 monitors and I
> > can't do anything except kill the power and reboot, Anyone have any
> > ideas where to start, because I have looked for several hours now and I
> > can't find anything that would be causing this issue.
> >
> > What happens when It freezes is the mouse literally gets stuck in
> > between the two screens (half on either screen) and since I am unable
> > to do any commands with the keyboard I can't take a screen shot. =A0I
> > would really like to be able to use nouveau and xrandr, because I don't
> > really want to use Xinerama with the proprietary drivers because then I
> > am unable to use compositing.
> >
> > Any thoughts and questions would be greatly appreciated.
> >
> > Thanks,
> > Daniel Wallace
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/nouveau
> >
>=20
> What happens if you want to set the framebuffer size to the size of
> your two monitors combined?
>=20
> 1280x1024+1280x1024 would be:
> xrandr --fb 2560x1024
>=20
> Afterwards xrandr should say "current 2560x1024" somewhere at the
> beginning of it's output.
>=20
> I assume your two monitors work in clone, so i i'm wondering if it's
> the framebuffer allocation that causes the problem.
>=20
> --=20
> Far away from the primal instinct, the song seems to fade away, the
> river get wider between your thoughts and the things we do and say.

with xrandr --fb 3840x1080 then=20
xrandr --output HDMI-1 --pos 0x0 --output VGA-1 --right-of HDMI-1

it now shows both screens, and everything looks fine, except for the
fact that the mouse is on the border of both screens, half on both and
I can't move it or have any keyboard actions, just have to reboot the
computer

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQEcBAEBAgAGBQJPfVbOAAoJEF+l5VRPAQ1IfZIH+wUlost6CMLGGKrUDVvXRva7
vs8GZARZ8fFiv5K3JIFQ2AxY9BldI83MHXtyGwTvTliokHoFvdmigN1wQkK1kV8x
jT2lPiuIBh32DX3p3nxTrPqPRQQPsXpAg/hpq34MGIwbUKQlCJijuROWn7QaDxBA
lKkZX40JoVnCVOvjk0Pz27oDCZSkzINAVdIlBQVZJQvxTVOgfG8yABrQ9KH1Iobn
Bt9z7/7oK2nEeOncdVGFgSQ+oNY2GWETpOYGIfivRHfCRXhrcX+MBVdNDHTcbRKu
eoTbs8we3EKmaWJuIy69vTd1XsY2RN4u5XGDagEQx27a2TCZiA7zWy78y++LX+4=
=0LRs
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--

--===============0453092489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0453092489==--
