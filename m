From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Nouveau] [RFC] tegra: Initial support
Date: Fri, 28 Nov 2014 10:19:35 +0100
Message-ID: <20141128091934.GE5978@ulmo>
References: <1417106361-705-1-git-send-email-thierry.reding@gmail.com>
 <547804B0.4020603@nvidia.com> <20141128084819.GB5978@ulmo>
 <CAAVeFu+j9q4sG6gT+16-=vD1E2hBJw6zy5n2GGhP3kshn2Y2Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0772855334=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAAVeFu+j9q4sG6gT+16-=vD1E2hBJw6zy5n2GGhP3kshn2Y2Hw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: mesa-dev@lists.freedesktop.org, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org


--===============0772855334==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Content-Disposition: inline


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2014 at 05:52:26PM +0900, Alexandre Courbot wrote:
> On Fri, Nov 28, 2014 at 5:48 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Fri, Nov 28, 2014 at 02:14:24PM +0900, Alexandre Courbot wrote:
> >> On 11/28/2014 01:39 AM, Thierry Reding wrote:
> >> >Tegra K1 and later use a GPU that can be driven by the Nouveau driver.
> >> >But the GPU is a pure render node and has no display engine, hence the
> >> >scanout needs to happen on the Tegra display hardware. The GPU and the
> >> >display engine each have a separate DRM device node exposed by the
> >> >kernel.
> >> >
> >> >To make the setup appear as a single device, this driver instantiates
> >> >a Nouveau screen with each instance of a Tegra screen and forwards GPU
> >> >requests to the Nouveau screen. For purposes of scanout it will import
> >> >buffers created on the GPU into the display driver. Handles that
> >> >userspace requests are those of the display driver so that they can be
> >> >used to create framebuffers.
> >> >
> >> >This has been tested with some GBM test programs, as well as kmscube =
and
> >> >weston. All of those run without modifications, but I'm sure there is=
 a
> >> >lot that can be improved.
> >>
> >> Tested with kmscube and Weston and I can confirm this works. However, =
EGL
> >> clients inside Weston have their window filled with garbage (they seem=
 to
> >> run fine otherwise). Do you also experience this?
> >
> > To be honest, that wasn't part of my set of test cases. I had assumed
> > that since Weston could composite buffers into a final scan out buffer
> > everything else would just work as well. Do you have any particular
> > demos that aren't working?
>=20
> Anything using EGL under Wayland - the simplest case would be
> weston-simple-egl. glmark2 also displays a broken window, but then
> crashes shortly after. With weston-simpe-egl I get the framerate
> feedback and can see the GPU performance counters moving as expected,
> indicating that the app is rendering correctly but that Weston gets
> the wrong buffer to display.

Okay, I'll need to look into this more closely. Thanks for reporting.

Thierry

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUeD4mAAoJEN0jrNd/PrOhu50P/imbX1kypbRWkqhlCMvq7Kkc
24dbiuBhGFeSNTXQRVudQIIhuYYamhrLdK5fC3U1NvZN9DrlsafEtQX+58/xIjI8
SfMbdutGMdcUfyLBDBkF3nJtJCyBF5vbj0TUij3zHVY3mM3gZtKhMZkICsWv4dAM
dnKcfHDBNm0vn0akqCI3lR3KhbEj0qodC2+uwJyNcx43KQrTrG64DUeiS7HYh2AA
zGYhz7LFInC6jrGl3DGsEyW9vAoZxgs0FY2ulpobpZBFVCjvGR6urUfsxwNyDIKr
zpKFcXH+Zz3UO3DYMJCTlfV1ooFc5WphqSQLABaW4+Nefa3pJVHdKN4cDcU0PKJH
rzowqrKXUgusGqKGTwgo1h/C35zIuUl7HkRXHKT5u/YKb9MDRVQoIiHN/SzpGWe0
ei+G1K65tGI07YPi3kd4d6iALErvKu68SQoOo29ck8ruP09K46qcOGZnDqJsTeuX
+JKdi4sd1fqIoetJZZ7MJCqSZL4DkzjwiGZuo5nxSBqLP3FfKoCYuXjuqiFl6hO7
QS12d2ehzUfrZRdN1Gso9eD5lL4Xma+36IGigc6UhDdW7ThYj8h4sDQoZ1eUlNLC
T5IraZUR/4Hz5RLKqxjtueds8Icg+oVEeOMAY4YcCRMX2988MTKse8yYFsdsijIG
JM3siPVIIaFn+omDpQ+Z
=UWfc
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--

--===============0772855334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbWVzYS1kZXYg
bWFpbGluZyBsaXN0Cm1lc2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbWVzYS1kZXYK

--===============0772855334==--
