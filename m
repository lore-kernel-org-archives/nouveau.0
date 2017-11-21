From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm: don't continue with anything after
 the GPU couldn't be woken up
Date: Tue, 21 Nov 2017 18:46:09 +0100
Message-ID: <20171121174609.GA28301@ulmo>
References: <20171121150116.24956-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0959845823=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20171121150116.24956-1-kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0959845823==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 04:01:16PM +0100, Karol Herbst wrote:
> This should make systems more stable where resuming the GPU fails. This
> can happen due to bad firmware or due to a bug within the kernel. The
> last thing which should happen in either case is an unusable system.
>=20
> v2: do the same in nouveau_pmops_resume
>=20
> Tested-by: Karl Hastings <kazen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drm/nouveau/nouveau_drm.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/drm/nouveau/nouveau_drm.c b/drm/nouveau/nouveau_drm.c
> index 8d4a5be3..6e4cb4f7 100644
> --- a/drm/nouveau/nouveau_drm.c
> +++ b/drm/nouveau/nouveau_drm.c
> @@ -792,6 +792,27 @@ nouveau_pmops_suspend(struct device *dev)
>  	return 0;
>  }
> =20
> +static int
> +nouveau_set_power_state_D0(struct pci_dev *pdev)
> +{
> +	struct nouveau_drm *drm =3D nouveau_drm(pci_get_drvdata(pdev));
> +	int ret;
> +
> +	pci_set_power_state(pdev, PCI_D0);
> +	/* abort if anything went wrong */
> +	if (pdev->current_state !=3D PCI_D0) {
> +		NV_ERROR(drm, "couldn't wake up GPU!\n");
> +		return -EBUSY;
> +	}

Looks to me like the more idiomatic way to do this is:

	ret =3D pci_set_power_state(pdev, PCI_D0);
	if (ret < 0 && ret !=3D -EIO)
		return ret;

> +	pci_restore_state(pdev);
> +	ret =3D pci_enable_device(pdev);
> +	if (ret)
> +		return ret;
> +
> +	pci_set_master(pdev);

Looking closer it also seems like pci_enable_device() will already set
the power state to D0 (via do_pci_enable_device()). Is the sequence
above really necessary because the hardware is quirky, or was it
cargo-culted?

Thierry

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloUZl0ACgkQ3SOs138+
s6HVXRAAk8HlWcC6QC0TP3nnRj8+DjPkmlAg87DJ6Ntxdh4Lx+n8DpsWQiMVZNw1
BxjE6Mj7zZjPS0LHVCfAsqbGODH9xvTYe+eEo71IY/ivajuh3dqcpiUSVRq8Jtb7
yu4cbyNrjOQ9yTR5AH9xdx1IBd0UgAVjhlSj0V7+lvzzwXINBEG+DALlVKqmojtK
RXS+w+fK+2Yf//kzVKOyL+2ge4+Kk9XouYXVySCkdq1L0I06FSxTI4ewoLF4sVcP
0FeI/TQZ5sXELw9d7iFh7F/STFuLl9tYntTqc/bhOFLEYfRBejILpCdRlyRNi6Af
qXs4aubrIckte0VreukWkoJPXd2d0g1hXC+IwGMZtuwL8He3Gk5d0ha0c6i/ovsi
Tbt7M6XKbqdpDem1/8Nj4+AVLqNdKzv8bvzg1s3V8mCqKhhh2eEawlrZCCXrkhG2
dEyL5TAPheoCgjcogjf3cpH6MpN706W/aNzLp1bfW2/2THMb6KeR6z7j9kFkYZzz
LNrozmU6WV0vnUKZ9MOEx1nAi9xza0c5SoDJ4zf8goKqzOCSHI9IefWTTFlrbz+d
WnuWcNPi3NacRCk4YVi3VeinW2sF+viGE1n812E95GgQZPS7JYWGjDbCtFHlb20S
GsbDT/BVVbMRj6hTeNGTgzIjWUeqQ3dlwXGdDK6BkYK0MPii9cI=
=ry+q
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--

--===============0959845823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0959845823==--
