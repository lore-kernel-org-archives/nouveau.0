From: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] x86/mm/kmmio: correctly handle kzalloc return
Date: Tue, 20 Oct 2020 12:34:30 +0300
Message-ID: <20201020123430.44968cb4@eldfell>
References: <20201020084345.96823-1-dmugil2000@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kNxw96BEn+M0PYEUFx6pYAH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20201020084345.96823-1-dmugil2000@gmail.com>
To: Mugilraj Dhavachelvan <dmugil2000@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>, Karol Herbst <karolherbst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--Sig_/kNxw96BEn+M0PYEUFx6pYAH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2020 14:13:44 +0530
Mugilraj Dhavachelvan <dmugil2000@gmail.com> wrote:

> Replacing return value -1 to error code
>=20
> Signed-off-by: Mugilraj Dhavachelvan <dmugil2000@gmail.com>
> ---
>  arch/x86/mm/kmmio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
> index be020a7bc414..15430520c232 100644
> --- a/arch/x86/mm/kmmio.c
> +++ b/arch/x86/mm/kmmio.c
> @@ -386,7 +386,7 @@ static int add_kmmio_fault_page(unsigned long addr)
> =20
>  	f =3D kzalloc(sizeof(*f), GFP_ATOMIC);
>  	if (!f)
> -		return -1;
> +		return -ENOMEN;
> =20
>  	f->count =3D 1;
>  	f->addr =3D addr;

Hi,

did you even build-test this?

Why did you write this patch? What does it achieve?


Thanks,
pq

--Sig_/kNxw96BEn+M0PYEUFx6pYAH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+OryYACgkQI1/ltBGq
qqeYBA//XVRjP/OgzYv+hLE7Dv4qtIQH3SuKcWS9kLcK2mVxoo12wErFrVjY+hfu
03qjkW2k9JU6WfwlusYHHpkgW4lb1ucUeev5uZPBn8mi5mRGp79GgLDdkqUe9bZi
dSyNNiZDYfSKDgM9E3F5wYZmEUBj83l0dIh6FTPGdO4KKW0X1tc+/FTqByGBpuH7
tuawXLtBGIi3HG1l/VmWwVQ/X2TlqPP3EmJntjjBXvKOV/53xAZ8Z+2e2Ce/EAK3
l+UozLCLKxEH1NmSurV4aeb/6PiZiEsitUzqiitjUQjPdnUvwWk1zUfUbBkl6zwU
5Vdjub2eKGE2vx79eBq/mIXN9btzH7Bzd8bZPu/BDfyKO3DD1W9dOKH/o3BiXlbD
K7fkW8o7oDf9jSIEUmm3hQNA3XkVrfWunDQ0oQPHHn2O06YD+8CCz97zlVmBBNK3
l7JoXB3/kIBAlCSXXWSvL7AkoHJdJp+dMuK1IQycwSs3OAPBt/SiDutSjMq0veKn
/mT2mxh0pkm7FN9hupj0G9N5+EmafdksuyWXLGSAk1Z5WTMG711xB+rMeb+E7DAd
uQGZkFcq4j6RW1dQY4Z86mzlKDovCxL4KwMBJS0lR4Df9gBct23eQ9Z6LK34RTw1
e0qDXwXqkpXJ44SttdB8bOm0bIpzL/CsK/wZmkTMA085/8zhTKc=
=yGB5
-----END PGP SIGNATURE-----

--Sig_/kNxw96BEn+M0PYEUFx6pYAH--
