From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] gpu/nouveau/nouveau_acpi.c: Fix Type Mismatch
 ACPI warning
Date: Thu, 19 May 2016 11:49:15 +0200
Message-ID: <20160519094915.GA1759@Sovereign.localdomain>
References: <1463618578-5662-1-git-send-email-marcos.souza.org@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1870969505=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1463618578-5662-1-git-send-email-marcos.souza.org-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Marcos Paulo de Souza <marcos.souza.org-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, dvhart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1870969505==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Marcos,

I sent a serie a year ago to fix some of the ACPI handling in Nouveau and a=
dd
runtime pm support for laptops with an Apple GMUX (see [0], and especially =
[1]
and [2]). I was told that a more generic work for the runtime pm was in the
work, so I let the whole serie slip away. I was thinking of resubmitting the
serie without the runtime pm additions, to at least fix those warning/error
messages. I thought I had a patch to fix this issue in my serie, but going
through it again, it looks like I did not.
Note that even, though the spec says the 4th argument should be a package, =
some
old BIOSes expect a different type, like a buffer (see the comment above [5=
]; I
think there was also a comment about it in the spec, but I can=E2=80=99t fi=
nd it
anymore).

I added some comments below. I=E2=80=99ll test this patch tonight, to see h=
ow it works
on my laptop as I think it expects a buffer as 4th argument.

Thank you!

Regards,
Pierre


[0]: https://lists.freedesktop.org/archives/dri-devel/2015-May/083444.html
[1]: https://lists.freedesktop.org/archives/dri-devel/2015-May/083448.html
[2]: https://lists.freedesktop.org/archives/dri-devel/2015-May/083449.html

On 09:42 PM - May 18 2016, Marcos Paulo de Souza wrote:
> nouveau_optimus_dsm is using ACPI_TYPE_BUFFER, and this triggers warnings=
 on ACPI:
> [    7.730564] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
> [    7.730570] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (201509    30/nsargument=
s-95)
>=20
> To fix it, change ACPI_TYPE_BUFFER to ACPI_TYPE_PACKAGE, as the warning t=
ells to do.
>=20
> Signed-off-by: Marcos Paulo de Souza <marcos.souza.org-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>=20
> After booting my Asus Laptop, and after a suspend/resume too, dmesg shows=
 warnings:
> [    1.633361] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
> [    1.633434] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
> [    7.730176] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
> [    7.730564] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
> [    7.730570] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
> [   49.732059] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
> [   49.732424] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
> [   49.732430] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
> [   74.366300] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
> [   74.366657] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
> [   74.366663] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
> [  140.357789] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)
> [  140.358532] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
> [  140.358547] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-95)

Out of curiosity, which GPU(s) do you have in your laptop? I guess there is=
 at
least an NVIDIA one, but is it an Optimus configuration? And if so, does the
unused card go automatically to sleep after a few seconds?

>=20
> I don't know if this is the right thing to do, I just looked at intel_acp=
i.c to check how to use/check for ACPI Package.
> The patch below silenced the "type mismatch" warnings, and some of the "e=
valuated _DSM" ones.
>=20
> If this is not the right approach, please let me know how to fix it, I do=
n't have knowledge in ACPI, but I really want to help.
>=20
>  drivers/gpu/drm/nouveau/nouveau_acpi.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nou=
veau/nouveau_acpi.c
> index cdf5227..f04aef3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -73,22 +73,10 @@ static const char nouveau_op_dsm_muid[] =3D {
> =20
>  static int nouveau_optimus_dsm(acpi_handle handle, int func, int arg, ui=
nt32_t *result)
>  {
> -	int i;
>  	union acpi_object *obj;
> -	char args_buff[4];
> -	union acpi_object argv4 =3D {
> -		.buffer.type =3D ACPI_TYPE_BUFFER,
> -		.buffer.length =3D 4,
> -		.buffer.pointer =3D args_buff
> -	};
> -
> -	/* ACPI is little endian, AABBCCDD becomes {DD,CC,BB,AA} */
> -	for (i =3D 0; i < 4; i++)
> -		args_buff[i] =3D (arg >> i * 8) & 0xFF;
> -
>  	*result =3D 0;
>  	obj =3D acpi_evaluate_dsm_typed(handle, nouveau_op_dsm_muid, 0x00000100,
> -				      func, &argv4, ACPI_TYPE_BUFFER);
> +				      func, NULL, ACPI_TYPE_PACKAGE);

The last parameter you give to `acpi_evaluate_dsm_typed()` is the return ty=
pe
you expect (see [3]), which will be a buffer if func is 0, and is
implementation dependent otherwise (see section 9.14.1 _DSM of [4]). So you
don=E2=80=99t want to change it to ACPI_TYPE_PACKAGE. If you look at the im=
plementation
of `acpi_evaluate_dsm()` (which is called by `acpi_evaluate_dsm_typed()`), =
it
will automatically create a package for the 4th argument, if you pass it a =
NULL
pointer (see [5]).

[3]: https://github.com/torvalds/linux/blob/46c13450624e36302547a2ac3695f23=
50fe7ffc3/include/acpi/acpi_bus.h#L69
[4]: http://www.acpi.info/DOWNLOADS/ACPI_5_Errata%20A.pdf
[5]: https://github.com/torvalds/linux/blob/46c13450624e36302547a2ac3695f23=
50fe7ffc3/drivers/acpi/utils.c#L628

>  	if (!obj) {
>  		acpi_handle_info(handle, "failed to evaluate _DSM\n");
>  		return AE_ERROR;
> --=20
> 2.5.5
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXPYwRAAoJEI7uMhYTPh3wIeIP/j2bJ4vpQk3tJc8fx7XMR7o+
h8Nj3C3D5wfJQcIBq9nyhlJreKQrIhDj/ovz1B2CtVgP54qUnLsa/sr6eeMlyCe7
BFrR+sW7O2JwPRn5zPnUVPH8PTrLanIzm4JFi9m7fAv4OK9E9uOnm5fewhd33g6V
fjSjzpm+UGAdYQOnG7tyJkpuEd0J1hey3ARO/dL0rXqP0xga6eM+ZJ1jlgmXgY8M
Pf5I5IFmYk/gdnjcT+kuyjjlQn5gqIUrAru2Lx6ZOsnAbSTtjJ2/skhO4EJFUcfn
CR3jiUHycGs4DHbHimhqSvjGqZ+UT+HNtpe65pL2ff3RrB9qlMJBwilPJzRbopCG
FDjkhqVnsYpYIpdTowYy76bqSPKssYZW91XZUUDZhlJ6dTEZW42pLVVaSs2v02il
Vy/jcijByb2yYpu4Cmdcgfvm/VPfW/Co3C1PCJjdKURlCN2IdUqFwvE/c7xDXNKo
gIOdVILvgYRyyOeBkEQd/g03s1Pjwi/wzzM34UXXcwR9hR/1VtGOhaew1KtLQKIW
65E+u+lGOuIypCWadJh9Y2cef+w2FF3GjDEQ24JYUha5A11j5hkMHeE8fyBIUU+R
RJEOnj/67MFZKBy5x907flwtIdtN/gunTzut3fVBqPHanUI+46KA4/FU8McLrXj/
gJYTXXPpLMHXLL0JSFaO
=53SG
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--

--===============1870969505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1870969505==--
