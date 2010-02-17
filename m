From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix pramdac_table range checking
Date: Wed, 17 Feb 2010 19:36:06 +0100
Message-ID: <87vddvyajt.fsf@riseup.net>
References: <20100215124046.GB18821@bicker> <20100215222041.GA2823@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2126670666=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100215222041.GA2823-OI9uyE9O0yo@public.gmane.org> (Marcin Slusarz's message of
	"Mon, 15 Feb 2010 23:20:41 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2126670666==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Mon, Feb 15, 2010 at 03:40:56PM +0300, Dan Carpenter wrote:
>> This is the results from:
>>     make C=3D1 CHECK=3D"/path/to/smatch -p=3Dkernel" bzImage modules | t=
ee warns.txt
>>     grep -w overflow warns.txt | uniq -f 3 | tee err-list
>>=20
>> I hacked on the buffer overflow check last weekend and these are the=20
>> results.  It has way more false positives than the other bug lists=20
>> I've posted, but it's still kinda neat.
>>=20
>> It works like this:
>>=20
>> lib/zlib_inflate/inftrees.c
>>    112      for (min =3D 1; min <=3D MAXBITS; min++)
>>    113          if (count[min] !=3D 0) break;
>>    114      if (root < min) root =3D min;
>> smatch thinks "min" can be MAXBITS here.
>>=20
>> One bad thing is that if you have code like:
>>         if (foo =3D=3D 42)
>> 		frob();
>> Smatch thinks that "foo" can be 43 after the if statement.
>>=20
>> The format is:
>> file.c +<line> function(<lines into function>) warning 'array_name' <arr=
ay size> <=3D <offset>
>>=20
>> regards,
>> dan carpenter
>>=20
>> Previous bug lists:
>> * Putting too much data on the stack
>>   http://lkml.indiana.edu/hypermail/linux/kernel/1002.1/01252.html
>>=20
>> * Assigning negative values to unsigned variables
>>   http://lkml.indiana.edu/hypermail/linux/kernel/1001.3/01222.html
>>=20
>> * Doing dma on the stack
>>   http://lkml.indiana.edu/hypermail/linux/kernel/1001.3/01231.html
>>=20
>> * Dereferencing variables before verifying they are not null
>>   http://lkml.indiana.edu/hypermail/linux/kernel/1001.3/01980.html
>>=20
>> (...)
>> drivers/gpu/drm/nouveau/nouveau_bios.c +770 get_tmds_index_reg(36) error=
: buffer overflow 'pramdac_table' 4 <=3D 4
>> (...)
>
> ---
> From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Subject: [PATCH] drm/nouveau: fix pramdac_table range checking
>
> get_tmds_index_reg reads some value from stack when mlv happens
> to be equal to size of pramdac_table array. Fix it.
>
> Reported-by: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bios.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nou=
veau/nouveau_bios.c
> index 2cd0fad..e7be506 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -762,7 +762,7 @@ static uint32_t get_tmds_index_reg(struct drm_device =
*dev, uint8_t mlv)
>  			dacoffset ^=3D 8;
>  		return 0x6808b0 + dacoffset;
>  	} else {
> -		if (mlv > ARRAY_SIZE(pramdac_table)) {
> +		if (mlv >=3D ARRAY_SIZE(pramdac_table)) {
>  			NV_ERROR(dev, "Magic Lookup Value too big (%02X)\n",
>  									mlv);
>  			return 0;

Thanks. I've pushed all the three patches.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkt8NxcACgkQ196Zy2qEI5duawCfT6eVIiqH2BcJqELkpPO732mc
J9MAn3ZlSTF1MLoeDjxLee21WFmokZbN
=RGjB
-----END PGP SIGNATURE-----
--==-=-=--

--===============2126670666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2126670666==--
