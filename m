From: ~Stack~ <i.am.stack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Assistance in tracking a kernel/nouveau error
Date: Fri, 11 Apr 2014 17:27:16 -0500
Message-ID: <53486C44.8010501@gmail.com>
References: <5339EB75.1080109@gmail.com> <5341E03C.7020109@gmail.com>
 <CAKb7UvjLr4z50Kvh2FowJ+0_va53r1n+wa5hOC=_LOU_5P7QOg@mail.gmail.com>
 <5345CAE9.1080908@gmail.com> <53471642.8010802@gmail.com>
 <CAKb7UvgG=u9TCCwMC+UJMMmsa3G6qL0KrCzE5n2rxASN14XKfA@mail.gmail.com>
 <53475AAB.9070507@gmail.com>
 <CAKb7UviftzBgQrkThJwbGMb0KqqN2CpZigBHV_KAFo2uF8ShNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0869541222=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviftzBgQrkThJwbGMb0KqqN2CpZigBHV_KAFo2uF8ShNw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0869541222==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2HIGSHPGOWVPRBBRUVJJQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2HIGSHPGOWVPRBBRUVJJQ
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/10/2014 10:08 PM, Ilia Mirkin wrote:
> On Thu, Apr 10, 2014 at 10:59 PM, ~Stack~ <i.am.stack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:=

[snip]
>> Here is the lspci info. I will try and grab the kernel versions from t=
he
>> discs tomorrow (I left them at work).
> GF108 (NVC1) had some issues for a kernel release or two (3.11 and
> 3.12 iirc). The fix was backported to the -stable kernels, but who
> knows whether the livecd you're trying has the relevant fixes or not
> :(

Instead of trying to figure out which old versions of the kernel I had
that didn't work, I decided to pull the latest Fedora liveCD 20140407
running kernel 3.11.10-301-fc20.

It didn't work either. While earlier kernels made the screen completely
useless with lots of jumbled colors, F20 would at least show the
outlines of the desktops and menus with jumbled colors throughout the
monitor.

So whatever the bug, I think it is fairly safe to say it is also
upstream in Fedora. Unless someone else has another idea, I might try
pestering the Fedora guys.

Thanks!
~Stack~



------enig2HIGSHPGOWVPRBBRUVJJQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlNIbE0ACgkQ4OKTk6qYr2RfFACfdtWR9JNMBFWZ24QWIIXdwpHm
w7kAn3ZOisC4MXBchnPZZpRNlNx7kvjl
=agBD
-----END PGP SIGNATURE-----

------enig2HIGSHPGOWVPRBBRUVJJQ--

--===============0869541222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0869541222==--
