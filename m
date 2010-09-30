From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Fri, 01 Oct 2010 01:29:51 +0200
Message-ID: <87pqvuhksw.fsf@riseup.net>
References: <4C9E0167.8000507@pfu.pl>
	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi> <4CA1C6C0.1000709@pfu.pl>
	<20100928170227.00665f76@daedalus.pq.iki.fi> <4CA21515.4030903@pfu.pl>
	<20100929193136.644e0d68@daedalus.pq.iki.fi>
	<878w2jike0.fsf@riseup.net> <4CA4A934.4080109@pfu.pl>
	<87zkuzgqsv.fsf@riseup.net> <4CA4D199.8010403@pfu.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1160036549=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CA4D199.8010403-t9zbU3WrWHI@public.gmane.org> ("Grzesiek =?utf-8?Q?S=C3=B3jka=22'?=
	=?utf-8?Q?s?= message of "Thu, 30 Sep 2010 20:06:17 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Grzesiek =?utf-8?Q?S=C3=B3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1160036549==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Grzesiek S=C3=B3jka <pld-t9zbU3WrWHI@public.gmane.org> writes:

> On 09/30/10 18:05, Francisco Jerez wrote:
>> Does the following command help?
>> $ xrandr --output DVI-I-2 --set "scaling mode" "None"
> Yes! Now I have:
> xrandr --output DVI-I-1 --set "scaling mode" "None"
> xrandr --output DVI-I-2 --set "scaling mode" "None"
> in xinitrc. Both displays work fine when Xserver is running. But after I
> go back to the console the display #1 switches off and #2 starts to
> blink again. Is it possible to fix the console??
>
Do you need to tell the binary driver to do anything special to get it
working on those monitors? (e.g. manually specified timings or EDID)

> Regards.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkylHW8ACgkQg5k4nX1Sv1u0EAD+IXfsmmJ9l09+IEoX2B5aj04V
ImzrzpnGtPjjHWWzkFEA/3Dqx1y+jOzUwsii4JHeShaLFKvwmm/adNHHXfJfQ5Oq
=mPka
-----END PGP SIGNATURE-----
--==-=-=--

--===============1160036549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1160036549==--
