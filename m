From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 3/3] gpu: drm: drivers: Convert printk(KERN_<LEVEL> to
 pr_<level>
Date: Wed, 1 Mar 2017 09:18:57 +0200
Message-ID: <75667533-08d0-080d-a2be-340e55234e39@ti.com>
References: <cover.1488285953.git.joe@perches.com>
 <76355db47b31668bb64d996865ceee53bd66b11f.1488285953.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0380027654=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <76355db47b31668bb64d996865ceee53bd66b11f.1488285953.git.joe@perches.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Joe Perches <joe@perches.com>, Daniel Vetter <daniel.vetter@intel.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@redhat.com>, Rob Clark <robdclark@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Sinclair Yeh <syeh@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, freedreno@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============0380027654==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="2lJP1RoUT8CKBmGIej6FgDW5EOarh4gsP"

--2lJP1RoUT8CKBmGIej6FgDW5EOarh4gsP
Content-Type: multipart/mixed; boundary="4R10gBorKerF6KdUGbib0AsuAhNMNM6Ub";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Joe Perches <joe@perches.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@redhat.com>,
 Rob Clark <robdclark@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Sinclair Yeh <syeh@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Message-ID: <75667533-08d0-080d-a2be-340e55234e39@ti.com>
Subject: Re: [PATCH 3/3] gpu: drm: drivers: Convert printk(KERN_<LEVEL> to
 pr_<level>
References: <cover.1488285953.git.joe@perches.com>
 <76355db47b31668bb64d996865ceee53bd66b11f.1488285953.git.joe@perches.com>
In-Reply-To: <76355db47b31668bb64d996865ceee53bd66b11f.1488285953.git.joe@perches.com>

--4R10gBorKerF6KdUGbib0AsuAhNMNM6Ub
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28/02/17 14:55, Joe Perches wrote:
> Use a more common logging style.
>=20
> Miscellanea:
>=20
> o Coalesce formats and realign arguments
> o Neaten a few macros now using pr_<level>
>=20
> Signed-off-by: Joe Perches <joe@perches.com>

For omap:

Acked-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi


--4R10gBorKerF6KdUGbib0AsuAhNMNM6Ub--

--2lJP1RoUT8CKBmGIej6FgDW5EOarh4gsP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYtnXhAAoJEPo9qoy8lh71csoP/33VfaCEc7MgYfbKCAfhztwn
GEAJCOYM9LvzvucJvGBWq7/LcVqxtWC4OUIeqprva+3/yZaWDtszN/237+WmjC/h
KrdTXfzRHJb0/NOxM9aQskhInPaN2vQWOPPvwt5WbfHAFHuWUFCm/IherZgp3fet
r7gp9KXC5ZbR+h0Gzl7COpQQE+oz9dqfDvurco3jD71TDqW/4x6qcTSRJzImn4ZT
PNnmvEx42w+fBmPDJFcvTGzJ/BCM4/4kW352NfZywnpcu/9IJdUXsQTRUSK5yYnW
dkVTJZMKa42/6JC10lwmcmGhdYZ2vq5iiqiK1ktEkp5zevbbQuqmRAFc2HgL4zAq
TElW9GbXvleoJfn+mCzbc1N5ZAAoVIVCw0DODnDyp7/Eu/oSKYYiYQUg9mjGVbSx
b7iSyIqFZG3/jsXqx8lTxQP+Q6IAB34W0ec/aJZjDTXetJs90TQtIyvKdrzxYVh4
JfZHTVCsjY41/IQvziLTICGsNRohsJSWfXgFQKaAtEMyeM320bSKVJ3juwLt+uEf
CKiXhB8w3nIpMHqLFeZoq79rffXiwKjR/dNxfF1xMWIU9UQ8hQ433kq8NzJSRrxQ
YkrZtvBfJq9vadwOgsXUuobxgriXi9X9rm05DKPibOo7JbrQ9cog9U0mv5KDN0WZ
9ZX5nSh8FlI+8ipHj92c
=Um3f
-----END PGP SIGNATURE-----

--2lJP1RoUT8CKBmGIej6FgDW5EOarh4gsP--

--===============0380027654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0380027654==--
