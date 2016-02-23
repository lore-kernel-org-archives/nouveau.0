From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: Dealing with opencl kernel parameters in nouveau now
 that RES support is gone
Date: Tue, 23 Feb 2016 13:12:25 +0100
Message-ID: <20160223121211.GA3402@Sovereign.cs.lth.se>
References: <56CB1870.4030606@redhat.com>
 <CAKb7Uvg0_3=BiV0rbgxiAhiQbT-3J7wiQY9C9Yr2WSCBPQY1=g@mail.gmail.com>
 <56CB2031.1050507@redhat.com>
 <CAKb7UvgjtVfYZR2hW_bttjmyVFa0kDGW7ZejS+j-MVsxcnwNoQ@mail.gmail.com>
 <56CB2E42.60905@redhat.com>
 <CAKb7Uvjd0zNyKLri+h4O-h2Wcb1pLc3_B27+MYz-VHgf3z+1Pg@mail.gmail.com>
 <CAKb7UviNRmhSQUOkKvQqDipcQFjxep8S2m-QRreRsWVWf8tHSg@mail.gmail.com>
 <56CB3C6F.7070907@redhat.com>
 <CAKb7UvhxMakSzgVzqgxSJ7J641_MaP=3nEqnX7xRANiv3M7FWg@mail.gmail.com>
 <56CC37EA.3030703@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0182542027=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <56CC37EA.3030703-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0182542027==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11:43 AM - Feb 23 2016, Hans de Goede wrote:
> Hi,
>=20

[snip]

>=20
> >You may have to add LOAD64/STORE64 for 64-bit
> >addresses though. Or we could decree that all addressing on global
> >memory shall be 64-bit (and thus read the .xy components of the
> >address source).
>=20
> I would prefer to keep LOAD / STORE semantics the same as with
> other LOAD / STORE -s to / from 1d buffers.
>=20
> I think that in the end the tgsi backend for llvm will get both
> a 32 bit and a 64 bit mode, like the nvptx backend already has.
>=20
> And then the 64 bit backend will use a new LOAD64 / STORE64
> also do not forget that keeping 64 bit pointers takes twice as
> much registers, so 32 bit will likely be optimal in a lot of
> cases. I guess since OpenCL does not give the user a way
> to select which mode to use we will end up with some sort
> of heuristic based on the amount of memory on the card or
> some such.
>=20
> After all using 64 bit pointers does not make a lot of sense
> on a card with only 1 GB of RAM (yes I know we're talking virtual
> address space here).
>=20
> Anyways this all really is too soon to tell. Maybe the performance
> impact of using 64 bit pointers is negligible. But I think it would
> be good (and consistent) to keep LOAD / STORE taking 32 bit addresses
> even for MEMORY and add a LOAD64 / STORE64 when I get around to
> implementing a 64 bit mode for the llvm tgsi backend (or when others
> need them).
>=20
> >>>Another way of looking at it is that instead of having the hacky
> >>>RES[12345] being hardcoded to mean something special, you now have a
> >>>dedicated file called 'MEMORY', which has identical semantics.
> >>
> >>
> >>I'm all for getting rid of the RES[12345] hack :)
> >>
> >>I guess where you write "you now have a dedicated file called 'MEMORY'"
> >>You mean up to X dedicated MEMORY[#] files, one for each of GLOBAL, SHA=
RED
> >>and LOCAL at least, and probably as discussed one for INPUT ?
> >>
> >>This all sounds good to me, as said my worry was that MEMORY would have
> >>an implied base address like BUFFER has, now that you've
> >>made clear that MEMORY does not have this I'm happy :)
> >
> >There's a bit of a wrinkle here, and it's questionable whether we want
> >to allow for this somehow, but... Tesla actually has no way to address
> >global memory. It's always done with a base offset (which can be set
> >to 0). The trick is that it can only address 32 bits at a time,
> >there's no 64-bit addressing. But it has *16* such "global" memory
> >spaces, i.e. which are each base + up to 32-bit offset [and ultimately
> >only 40 bits of addressability]. I don't know if OpenCL provides
> >something good for that, if it does we can use semantic indices on the
> >GLOBAL to make it like
> >
> >DCL MEMORY[0], GLOBAL[0]
> >DCL MEMORY[1], GLOBAL[1]
> >
> >etc. But again, this is pretty optional.
>=20
> I think that for Tesla we can just only support the tgsi32 target
> and not the tgsi64 target, at least that is how I envision things
> today, who knows what tomorrow will bring :)

Fermi is the first family supporting 64 bit addresses, on top of 32 bit
addresses, while Kepler can only do 64 bit IIRC (or is it Maxwell which dro=
pped
the 32 bit support?).

Regards,
Pierre

>=20
> Regards,
>=20
> Hans
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJWzEypAAoJEI7uMhYTPh3wSzMP/3jM2l8FlnZrtTjuM/Y4ig+v
juGAbQrIhD3Iv3w2wAU9vbYM0W/p7NMm42PSoGhg+eiss886mWHDG+KkYGoa1FIi
6wsyzVx8yPHKSdqx8uXfBSAJ2R5pypFEWJkITJCOuzXbukv5Ly4OoH9iQt650UVy
kJwloDzEZmKN5x9goGrKOfqYx73SFyywKrrHNk5FOnlouw8wVom3QpKbjLlAf4o0
iEp/zPlcgsOmtODCEDDt+LSepWF6is3gs0oyVUb0QsXPMUUqbm5hICdyzwemxZ+P
NHWWA3ohVO3eLUlrxFGD/Dwp41qP02jaXeDYrRiBsIRnyu8OcbI47jwDN0tjTRwQ
7sucCEiYekroko63HGGIdZYD5TkqRhXuwSKAbzXHerTd1x4dtDMSs5HEM6keB1ti
WhOoC1Ds83JcJoRnQnsoz1JsioWgkw+DWdc5AfrOf0oKCR1vDZ2aQlhDGsu0/Bv6
HC4WgsctfunlHH6GgforgJzOKYpV7UKtSjim2qC8sv+7Jcnhj1JeGx8tl6YWbGbQ
3AmXgopV7sX5OmtEx/z3YCDuaE3cFF+T2h9U2aFxIBH9LyRdszivPjxrHje7qm/m
cS8v7rCbEB2dwNQcp4ToRpCnBSlu/bVepqav9IULz6vqHXUzaCZ/up7+29w0HwJu
a4ms4YJq7JBiSrYJ/z+6
=5BfF
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--

--===============0182542027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0182542027==--
