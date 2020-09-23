From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] drm/nouveau: Support sync FDs and sync
 objects
Date: Wed, 23 Sep 2020 11:18:53 +0200
Message-ID: <20200923091853.GA1229032@ulmo>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0685386601=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200828104016.1672195-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0685386601==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2020 at 12:40:10PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Hi,
>=20
> This series implements a new IOCTL to submit push buffers that can
> optionally return a sync FD or sync object to userspace. This is useful
> in cases where userspace wants to synchronize operations between the GPU
> and another driver (such as KMS for display). Among other things this
> allows extensions such as eglDupNativeFenceFDANDROID to be implemented.
>=20
> Note that patch 4 modifies the ABI introduced in patch 3 by allowing DRM
> sync objects to be passed rather than only sync FDs. It also allows any
> number of sync FDs/objects to be passed in or emitted. I think those are
> useful features, but I left them in a separate patch in case everybody
> else thinks that this won't be needed. If we decide to merge the new ABI
> then patch 4 should be squashed into patch 3.
>=20
> The corresponding userspace changes can be found here:
>=20
>   libdrm: https://gitlab.freedesktop.org/tagr/drm/-/commits/nouveau-sync-=
fd-v2/
>   mesa: https://gitlab.freedesktop.org/tagr/mesa/-/commits/nouveau-sync-f=
d/
>=20
> I've verified that this works with kmscube's --atomic mode and Weston.

Hi Ben,

any thoughts on this series? I realize that this is somewhat suboptimal
because we're effectively adding a duplicate of the existing IOCTL with
only the "minor" extension of adding sync FDs/objects, but at the same
time I don't have any good ideas on what else to add to make this more
appealing or if you have any plans of your own to address this in the
future.

Thierry

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9rEvoACgkQ3SOs138+
s6HANw/5Af6khLOcxfr4yRVZaj3+ruBonBkoGTps2QoXCAs4V0iKyFS4kqU3k4Pb
Q9cdMYhOcNTMA4IJ3EkVafROmPXp3zcTS7u5KClEZksYjp3qj89hjsxqq2pHqA2S
ESj3Vo11Kp0DwWzj2fTKbm6s3KjCZTWt9wY4Fl3/QD6s+OcjQUNlI0pTg3m8IBrz
nmZoX+tN5N3HmkJLxISG7Ejg4Qt+ked9az14v6YKMHIDejIDm5uqu2bbIMHrDI5G
Sokcxur7WWeCus3uoEbZc8sgotQQr74WEhUpTJnRbIK7jAodGBgbrtvW+Ti1icc5
S4Wc1EaZMfySCzxLJzRGX0gXKxyLAUT/VMWmRQRj1KvjZNdKm84LSZOce1Yg95+t
QgUUoJlLKREG3iq5Xb1wtxu9fxmlztmFSI1BX+tDEog3UmUt8R070+FlDM4GCVb3
7BLJ+/Lcn6wcm68n764gKAdiA8Hya86iSrpScGP599zFRaBro6ZaLBoMg2uqA1PL
oQLL9YsEusCWkOTPgR4Z5/oOKmrYUJy0W0bl/924NCuq8QMcYvyaEu7tLrlFVbM5
c3KtbSbwCzjdRX7rhqeHCBZahP5dZ5s3qt5urcBmNQGWS8PlBKPVlICFkBzGsKiV
IgO3S3wV5+HilEAM838z9eGpxtHx48Sl52r0ru+VfaO7jLI0VQ8=
=loRU
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--

--===============0685386601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0685386601==--
