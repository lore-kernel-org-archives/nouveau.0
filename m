From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: 4.9-rc7 nouveau fails on arm64 64k page kernel but
 works with 4k
Date: Thu, 8 Dec 2016 07:19:14 +1000
Message-ID: <529f04c4-bc84-cf93-2e07-5499558f8905@gmail.com>
References: <042c54f3-e52b-6658-18c7-9c19492485a4@arm.com>
 <CAKb7Uvhewyhnrnd=fw9QrdEDLecG_VMZ8Wfuh-LyCgeW6X_wCw@mail.gmail.com>
 <CAKb7UvgZLafVmC3N0R-dfm4FDtCxUO3fC-4zLwsKauAj=hx=tw@mail.gmail.com>
 <CAKb7UvgW331K53x3wub5o+6LOqeLN5PqgiiJG6WXi+WJDVDzDg@mail.gmail.com>
 <CAAVeFuJc5y8M4Koj-Ge0XpK3PXVS-fnjrpUyD13skeBM1y_K1w@mail.gmail.com>
 <d196c0c8-f429-4275-6246-a4e817b4bdf9@daenzer.net>
 <CAAVeFuKfo3sZL84wTiR6ur=PVsPhcaU62ggTwy9r1aQEOq2HZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1274932049=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuKfo3sZL84wTiR6ur=PVsPhcaU62ggTwy9r1aQEOq2HZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1274932049==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gQ1IkFM2GK5dDmPHAStqEALQCtIt7COjR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gQ1IkFM2GK5dDmPHAStqEALQCtIt7COjR
Content-Type: multipart/mixed; boundary="DQc6wTvunb7ovNtphnCHkxEKVskK4KlSK"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <529f04c4-bc84-cf93-2e07-5499558f8905-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] 4.9-rc7 nouveau fails on arm64 64k page kernel but
 works with 4k
References: <042c54f3-e52b-6658-18c7-9c19492485a4-5wv7dgnIgG8@public.gmane.org>
 <CAKb7Uvhewyhnrnd=fw9QrdEDLecG_VMZ8Wfuh-LyCgeW6X_wCw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 <CAKb7UvgZLafVmC3N0R-dfm4FDtCxUO3fC-4zLwsKauAj=hx=tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 <CAKb7UvgW331K53x3wub5o+6LOqeLN5PqgiiJG6WXi+WJDVDzDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 <CAAVeFuJc5y8M4Koj-Ge0XpK3PXVS-fnjrpUyD13skeBM1y_K1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 <d196c0c8-f429-4275-6246-a4e817b4bdf9-otUistvHUpPR7s880joybQ@public.gmane.org>
 <CAAVeFuKfo3sZL84wTiR6ur=PVsPhcaU62ggTwy9r1aQEOq2HZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <CAAVeFuKfo3sZL84wTiR6ur=PVsPhcaU62ggTwy9r1aQEOq2HZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

--DQc6wTvunb7ovNtphnCHkxEKVskK4KlSK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/07/2016 07:57 PM, Alexandre Courbot wrote:
> On Wed, Dec 7, 2016 at 6:53 PM, Michel D=C3=A4nzer <michel-otUistvHUpPR7s880joybQ@public.gmane.org>=
 wrote:
>> On 07/12/16 06:39 PM, Alexandre Courbot wrote:
>>> On Fri, Dec 2, 2016 at 12:23 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> w=
rote:
>>>> That's right -- nouveau currently requires 4k page sizes to work. Th=
is is a
>>>> software limitation, not a hardware one though.
>>>
>>> Looking at the trace I wonder - is the limitation in Nouveau or in TT=
M?
>>
>> Nouveau. Non-4K page sizes work fine with radeon (and presumably amdgp=
u).
>=20
> Thanks for the precision. I will check if Tegra iGPUs are also
> affected by this - if they are then it gives me a good excuse to take
> care of this bug.
I *should* have this fixed with a large chunk of MMU work I have pending
(I had to drop it temporarily to work on atomic/mst support, but it'll
be picked up, rebased, and finished in the near future).  I haven't
actually tested on 64KiB pages yet, but, I plan to before releasing it.

> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>=20


--DQc6wTvunb7ovNtphnCHkxEKVskK4KlSK--

--gQ1IkFM2GK5dDmPHAStqEALQCtIt7COjR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAlhIfNIACgkQdgucYlCS
kfvRkBAAmZ0wGtfHNAqgG4OyO0rsP11FpNU4EvR7firYVr2AilG2UiDYiM9j84mU
vHbm9SOLSoP92kgnKQGBFzUOg0PN4z+6F2PA7r3OwvWLSS9xYr8BwPlB0inuYg28
NG8GFQeOcEanfJysi34A46Y/pEg+urVReqghPy7ExFO0jYckNBEAjlfTpQI5RCjx
n9i7TDcmB4vKC11oSyFZApS+yZhXeJgek/65yNNzAZXtEaQDd0/CxOm/KbhxorFR
0Zz9gQZ0cZQHXjYH2f69ZWKOmDUVGA4CZcB/nj6BV64+8+v14A+6fW9q87VfIj/P
dOHv4OUq0wibQCHp1sKvbvUIhXnTY2fy25b62D3e3ttBL2yUItzza7OQBJDUBuko
uQpH2DeEkW0t6mU3KQjjeS90GxzerYQSNNIF0LzNufT8KxjDY41DCTrd6km5BnZE
npgnkwleIfVaBfoTjmYFSsphtZrftr5PG6+VEixoLiWsL72XyGLugjcsgFDRmDHD
BCOuqfs37x9rPMcF6opYJo0k/q0lFaK845TeyR5QxrdgWDwBWdQmhqbF9vlotUjs
e/xxMTTSeTkXShiEMT7+w4mZ2wjZNeVU14GFX5YZkdLXYZ/aIlp59qJjQK+OyALk
+2DYDiouv7tJdKP5haFTp3M/8krbWque2tday2Mp8kjHYmW9CcI=
=LTyl
-----END PGP SIGNATURE-----

--gQ1IkFM2GK5dDmPHAStqEALQCtIt7COjR--

--===============1274932049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1274932049==--
