From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/3] drm/nouveau: Pre-G80 tiling support.
Date: Fri, 11 Dec 2009 22:28:07 +0100
Message-ID: <87iqcdnqu0.fsf@riseup.net>
References: <1260556404-13389-1-git-send-email-currojerez@riseup.net>
	<20091211151820.4f90ba2f@amd64linuxmsi.rentzhouse.lan>
	<87tyvxnrtp.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0246729457=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87tyvxnrtp.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> (Francisco Jerez's message of "Fri,
	11 Dec 2009 22:06:42 +0100")
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0246729457==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> writes:

> Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> On Fri, 11 Dec 2009 19:33:22 +0100
>>
>> Have you looked at 0xB000, 0xB004, 0xB008 by chance?
>> I noticed that nv uses these tiling regs (what looks like) on nv4a/nv4e =
(NV44 core) cards but not any others at startup.  I thought is was because =
0x406900 regs are missing.=20
>
> Yeah, I've seen the blob use those regs in some nv4a mmiotraces, but it
> seemed to work without them and they're outside PGRAPH/PFB or anything
> we currently exercise so I decided to leave them out.
>
>>
>> +#define NV40_PFB_TILE2(i)                                  (0x0000B000 =
+ (i*12))
>> +#define NV40_PFB_TILE__SIZE_2                              12
>> +#define NV40_PFB_TLIMIT2(i)                                (0x0000B004 =
+ (i*12))
>> +#define NV40_PFB_TSIZE2(i)                                 (0x0000B008 =
+ (i*12))

Sorry for not replying-to-all the first time...

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAksiuWcACgkQ196Zy2qEI5cwzwCffeV1L7GXQyzdpXR0OTH7Sdjp
n1MAoOEOgQoLFhNAPTPtfEdIyBhThdLa
=CNKH
-----END PGP SIGNATURE-----
--==-=-=--

--===============0246729457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0246729457==--
