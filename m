From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Thu, 30 Sep 2010 12:41:10 +0200
Message-ID: <878w2jike0.fsf@riseup.net>
References: <4C9E0167.8000507@pfu.pl>
	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi> <4CA1C6C0.1000709@pfu.pl>
	<20100928170227.00665f76@daedalus.pq.iki.fi> <4CA21515.4030903@pfu.pl>
	<20100929193136.644e0d68@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1820714629=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100929193136.644e0d68-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org> (Pekka Paalanen's
	message of "Wed, 29 Sep 2010 19:31:36 +0300")
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

--===============1820714629==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> writes:

> On Tue, 28 Sep 2010 18:17:25 +0200
> Grzesiek S=C3=B3jka <pld-t9zbU3WrWHI@public.gmane.org> wrote:
>
>> I'm completely lost at the moment so let me start from the
>> beginning. First thing is that everything works fine with Nvidia
>> binary drivers, which means that hardware is rather OK. After
>> loading of the nouveau.ko the monitor connected to DVI-I-1 goes
>> to the standby mode. I do not know if the head is turned of or
>> maybe some kind of rates are too high/low. I was trying to play
>> with video=3DDVI-I-1: with different modes and switches (M/R/D/e)
>> and nothing. At the some time (after loading nouveau.ko) the
>> monitor connected with the DVI-I-2 starts to blink. And again I
>> was playing with the video=3DDVI-I-2:??? and nothing. I thought
>> that maybe after starting the xorg I will get the proper image at
>> both monitor. Unfortunately - no success. According to the Xorg
>> log file (Option "ModeDebug" "true") all the refresh rates are
>> ok. Moreover I was trying to use different ModeLines and nothing.
>> The X server claims that there are two monitor connected and
>> working but the first one is in standby mode and the second is
>> blinking. Any ideas?? If you need some more information please
>> let me know.
>
> Yes, the complete kernel and X logs, like I have requested twice before.
> That is the minimum before anyone will seriously start looking into it.
>
Before doing that, can you try latest git again? I pushed a patch
yesterday that may help with it.

> Preferrably, use the simplest setup that fails:
> - only one monitor physically connected
> - the following xorg.conf:
And use "drm.debug=3D4" in your kernel command line, that should tell you
what timings are being used exactly.

>
> Section "Device"
> Identifier "n"
> Driver "nouveau"
> Option "ModeDebug" "true"
> EndSection
>
>
> Thanks.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkykaUcACgkQg5k4nX1Sv1uvOgD+Pw5/uNSrap81xnfHWKMf7bTl
xkqg/d46rdPH22Z8SX8A/2qdCzMj79df9tnHoTuql83+MHMc61Bek42YA7wqhYpH
=OAap
-----END PGP SIGNATURE-----
--==-=-=--

--===============1820714629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1820714629==--
