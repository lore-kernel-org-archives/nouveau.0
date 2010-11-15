From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: GeForce FX 5200: no kms
Date: Mon, 15 Nov 2010 17:25:49 +0100
Message-ID: <87oc9qwo36.fsf@riseup.net>
References: <20101114001107.GA2771@joi.lan>
	<599238.49669.qm@web28305.mail.ukl.yahoo.com>
	<20101114122837.GA2660@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0194693716=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101114122837.GA2660-OI9uyE9O0yo@public.gmane.org> (Marcin Slusarz's message of
	"Sun, 14 Nov 2010 13:28:37 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Paolo Milani <paolomilani-ur4TIblo6goN+BqQ9rBEUg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0194693716==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Sun, Nov 14, 2010 at 10:18:10AM +0000, Paolo Milani wrote:
>> --- Dom 14/11/10, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > It should work. Please post your kernel logs from a failed
>> > boot (they are somewhere in /var/log).
>>=20
>> when boot fails (and system crashes), it write nothing in /var/log: ther=
e are only logs of the previous successful boot (with nomodeset option).
>>=20
>> my procedure:
>> 1- boot without nomodeset: system crashes.
>> 2- boot with another linux distribution, then I mount partition of point=
 1, but in /mnt/var/log there are no logs of failed boot. It wrote nothing.
>>=20
>> So, I don't know how get logs from a failed boot. If there is a guide, I=
'm eager to read it. Many thanks.
>>=20
>
> http://nouveau.freedesktop.org/wiki/HangDiagnosis
> The most successful method is netconsole.
>
If you don't feel like setting up a netconsole, at least show us the
output from "dmesg", Xorg.0.log and "lspci -vv" after a successful
boot. That alone may tell us something (no guarantees, if you really
want to find out what's going on netconsole is your best bet).

> Marcin
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkzhXw0ACgkQg5k4nX1Sv1u4BAD9EdD8aI8LX7s0ilQcq4P2hoer
uMU3EyCgPcg9kbM1fS8A/j0k5DEDcvtloRfnmCKwE/q3WuoqajtupA+U5HxyuN9d
=zhw/
-----END PGP SIGNATURE-----
--==-=-=--

--===============0194693716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0194693716==--
