From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC] tegra: Initial support
Date: Fri, 28 Nov 2014 10:17:08 +0100
Message-ID: <20141128091707.GC5978@ulmo>
References: <1417106361-705-1-git-send-email-thierry.reding@gmail.com>
 <CAKb7UvjCYMvtwFJAzRdd_JJE956fW_F6upEK5vUeWUQHV_y07w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2113727577=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UvjCYMvtwFJAzRdd_JJE956fW_F6upEK5vUeWUQHV_y07w@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org


--===============2113727577==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2014 at 12:32:43AM -0500, Ilia Mirkin wrote:
> On Thu, Nov 27, 2014 at 11:39 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > Tegra K1 and later use a GPU that can be driven by the Nouveau driver.
> > But the GPU is a pure render node and has no display engine, hence the
> > scanout needs to happen on the Tegra display hardware. The GPU and the
> > display engine each have a separate DRM device node exposed by the
> > kernel.
> >
> > To make the setup appear as a single device, this driver instantiates
> > a Nouveau screen with each instance of a Tegra screen and forwards GPU
> > requests to the Nouveau screen. For purposes of scanout it will import
> > buffers created on the GPU into the display driver. Handles that
> > userspace requests are those of the display driver so that they can be
> > used to create framebuffers.
> >
> > This has been tested with some GBM test programs, as well as kmscube and
> > weston. All of those run without modifications, but I'm sure there is a
> > lot that can be improved.
> >
> > TODO:
> > - use Nouveau headers to get at the prototype for creating a screen
> > - implement enough support to seamlessly integrate with X
> > - refactor some of the code to be reusable by other drivers
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> With the exception of resource creation, I don't see anything
> tegra-specific in here. Is there perhaps something that could be done
> to abstract that a little more, e.g. a wrapper driver, or...
> something? This is a situation that several mobile GPU's are in,
> AFAIK, and it may be nice to make it work for them as well.

I think it might be possible to factor out some things to reduce some
amount of boilerplate, but I don't expect it to be very much. There is
likely going to be hardware-specific details in each of these drivers
that will be hard to abstract out.

Given that this is the first driver of this sort I have no idea what
other drivers will require, so it doesn't seem wise for me to make this
any more generic. It's very likely to turn out completely wrong. Hence
why I opted for just a straight implementation that would work on Tegra.

That said, if it turns out that drivers for other SoCs need to duplicate
a lot of the code in this driver I'm sure we can find ways to alleviate
some of that. But like I already said in my reply to Rob, I don't think
a common wrapper driver is going to cut it. Perhaps something like the
u_transfer abstraction could work, but there is potential for that to
turn into a midlayer of sorts and actually make things more difficult.

The bottom-line is that the vast majority of the code is really just a
skeleton driver, so it's not unlike any of the existing drivers.
Requiring this particular driver to be common for all "mobile" SoCs is a
little like saying that Radeon and Nouveau should share code because
they both use PCI as the transport.

> Also, can you explain why it's advantageous for the setup to appear as
> though it is a single device? i.e. what's wrong with just using
> nouveau as a render node or whatever? [The answer may be simple, but
> I'm very unfamiliar with a lot of that stuff, and perhaps others are
> in a similar predicament.]

There are two reasons. For one, pretty much every software out there
that runs on the "bare metal" (i.e. GBM) uses the same initialization
sequence and it doesn't involve opening two DRM devices. So in order to
support Tegra and other SoCs with a similar architecture, each of these
applications would need to be patched. Now typically a lot of the
applications would run under X or Wayland, so the number of applications
that need patching is somewhat reduced. However, it would still mean
that every Wayland compositor would need to be patched in order to
support this, and each of them would use a mostly identical copy of that
code.

The second reason derives from the first. One of the issues I ran into
when I prototyped the dual-fd code for kmscube was that the code to
share these buffers between GPU and display is in fact highly hardware-
specific. At least on Tegra it is, because we can take advantage of the
tight coupling between GPU and display by directly scanning out block-
linear buffers. For that to work we need to make assumptions and that
just doesn't work generically.

So we need to solve two problems: reduce code duplication and hide the
hardware specific details. The natural solution for these two problems
is to move the code into a library. But we already have that library:
Mesa/GBM.

> > diff --git a/src/gallium/winsys/tegra/drm/Makefile.am b/src/gallium/win=
sys/tegra/drm/Makefile.am
> > new file mode 100644
> > index 000000000000..8e3685ee20e8
> > --- /dev/null
> > +++ b/src/gallium/winsys/tegra/drm/Makefile.am
> > @@ -0,0 +1,11 @@
> > +include Makefile.sources
> > +include $(top_srcdir)/src/gallium/Automake.inc
> > +
> > +AM_CFLAGS =3D \
> > +       -I$(top_srcdir)/src/gallium/drivers \
> > +       $(GALLIUM_WINSYS_CFLAGS) \
> > +       $(FREEDRENO_CFLAGS)
>=20
> oops?

Yes, I wanted to make it obvious from where I copied. =3D) Good catch,
thanks.

Thierry

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUeD2TAAoJEN0jrNd/PrOhi50P/2YNBgCELluRSCYPoIHmRU2F
HguxsURg7RwX+JBHeTBEB9pTeBs61ju9ruduNQT75SSEwfq44MhltZvwDa5HPjbQ
38pGKgFF0K2P3Tlv+eXgPrkuL3hAespD2GP0qNZ3dM5E53HyLHrJf319UXIpH8Z4
KFou1qIksNBAd+kVpFXo6+SSZRoB5dsQi53sEYWPTxVznHvsa0oiCXeMljnOvztG
fR2JG507brdBuhFoyoX2/yIYoGJJZkVyv92tzp/+SAVVk0M6T7Ikz8Tr+0jMHdUA
GGsRzrZOauutSENRGe61YvG+5wl8HDJlnB1Ykn1DKj1pSwg+fUQHEldCM8tt2SoW
U4q/UMdbZZl6Wzy7245C886JKBuDI7Z+u5JHoOhmk8xuwE49o/3G9cIqNrUU5v1K
B6w23T7+brDs3nct7JmocELwcqbik6wfxZG4XRQeA/Gf6T3cBQYtJ/p+NbPf0+On
FITpk8bRZqigVvDwg3kBc4P1MZqbJQXNf/7vrPGJ6sIw2gl9eQhNuciW2PnsrTj/
Yie561/U0+ADFxoiR9eejqq4aoy98Z52nnbYJfTWy5nxOBblRsACQ+oa1PQBfJ/2
fWc1RkT6H2zdb5ZBPmmP5XDXgV46w9/9FBReHXhiartXt2uhrvJ2XoBkafmFuBBL
O1/HiAPcKSY2HbYSdKTg
=Qgnz
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--

--===============2113727577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbWVzYS1kZXYg
bWFpbGluZyBsaXN0Cm1lc2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbWVzYS1kZXYK

--===============2113727577==--
