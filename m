From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/nouveau: handle -EACCES runtime PM return code
Date: Mon, 10 Feb 2014 13:34:25 +0100
Message-ID: <20140210123424.GE20143@ulmo.nvidia.com>
References: <1392011892-4339-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1387779561=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1392011892-4339-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: gnurou@gmail.com, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org


--===============1387779561==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0H629O+sVkh21xTi"
Content-Disposition: inline


--0H629O+sVkh21xTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2014 at 02:58:12PM +0900, Alexandre Courbot wrote:
> pm_runtime_get*() may return -EACCESS to indicate a device does not have

s/-EACCESS/-EACCES/

> runtime PM enabled. This is the case when the nouveau.runpm parameter is
> set to 0, and is not an error in that context. Handle this case without
> failure.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c     | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c       | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

I'm not sure if the commit message is entirely accurate. Looking at the
various runtime power-management functions in nouveau_drm.c (such as
nouveau_pmops_runtime_suspend() for example), they seem to return
-EINVAL if the nouveau.runpm parameter is set to 0.

However it seems like -EACCES is indeed returned when runtime power-
management hasn't been enabled for a device. This is done automatically
for PCI devices, but not for platform devices. We don't support runtime
power-management on gk20a yet, therefore pm_runtime_enable() is never
called, causing disable_depth to remain at -1 and therefore runtime PM
helpers return -EACCES.

Thierry

--0H629O+sVkh21xTi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+MdQAAoJEN0jrNd/PrOhkkQP/jJqMml32+cKwH4jBvnRhFrr
FkmWJpLR9SyDK38304W7gccVfdiRfHZ83t0xxk1pJ4TIDqQgB8FpwDYRpVHaS/bL
ZL2y+5iXxt7lqjHUWz4Gp98iDe7WGPR8ISi07i2L/XH7mcZGrK6CxIoQIk0EYpOV
RDHt2zc4gDakP5bFc8SNpuStZTHIbUpOSwTr08ypEeWjid84FfNIvNGkl/NRhjsW
i8FL7zTplfjZCIfN587rROjFKRBtX1azEQBZD8onDW+rFrdGul/MEpGg/ItxLr8w
r4rNuOyLLHTJFbfh0hw6CsZp0DbRSz82giOnt3naIVqX7E8qT3yLf9PAVh3n94fk
epEzDssgjM4HarFXFE1xMhl2B1hnF73cBJ1jP5Ke1OWAhOv3FXMQmbB5QxB4g08Y
oqlwj7j/FpA6BDV8YGmesFvKZ+Qjvql1XL4BIful4EzLeTTMCEEyg9whM6JYA2Df
6VS2p6Bp0c3ewRWKA2cOs1LruC+WF3GGtyBm9fIB69Z9so2uz6JQd1kpRsL0m+d6
yooZEH6SLk2LawHdwGPoxWULZ6PVLonTq9CXHt9u4eQE2lCLsNMT2x9WWG19vWXa
py/0x8uDT8vb8GXhhEvwtChfuCq9IHRqTeFQ66+tuS+MV/cOUSfecZMj6uMbIjt9
yu2nkjb6hUAvgQZzRA80
=PAR3
-----END PGP SIGNATURE-----

--0H629O+sVkh21xTi--

--===============1387779561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1387779561==--
