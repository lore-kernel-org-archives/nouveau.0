From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Thu, 30 Sep 2010 18:05:36 +0200
Message-ID: <87zkuzgqsv.fsf@riseup.net>
References: <4C9E0167.8000507@pfu.pl>
	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi> <4CA1C6C0.1000709@pfu.pl>
	<20100928170227.00665f76@daedalus.pq.iki.fi> <4CA21515.4030903@pfu.pl>
	<20100929193136.644e0d68@daedalus.pq.iki.fi>
	<878w2jike0.fsf@riseup.net> <4CA4A934.4080109@pfu.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0573174456=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CA4A934.4080109-t9zbU3WrWHI@public.gmane.org> ("Grzesiek =?utf-8?Q?S=C3=B3jka=22'?=
	=?utf-8?Q?s?= message of "Thu, 30 Sep 2010 17:13:56 +0200")
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

--===============0573174456==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Grzesiek S=C3=B3jka <pld-t9zbU3WrWHI@public.gmane.org> writes:

> I did download new sources and applied the amd-agp patch but no change.
> I get the some problems. Here is the dmesg without modeset:
> http://yen.ipipan.waw.pl/~gs159090/tmp/txt.gz
> Then I added following modeline to the file drm_edid_modes.h
>
> /* 1600x1200@50Hz */
> { DRM_MODE("1600x1200", DRM_MODE_TYPE_DRIVER, 135000, 1600, 1664,
>   1856, 2160, 0, 1200, 1201, 1204, 1250, 0,
>   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
>
> and tried to force the mode by setting video=3DDVI-I-[12]:1600x1200-15@50.
> No luck, here you have the dmesg:
> http://yen.ipipan.waw.pl/~gs159090/tmp/txt2.gz
>
> I also did some test with the xorg:
> http://yen.ipipan.waw.pl/~gs159090/tmp/Xorg.0.log.gz
> http://yen.ipipan.waw.pl/~gs159090/tmp/xorg.conf.gz
>
> The interesting thing is that according to the dmesg the xorgs tries to
> set the mode:
> Modeline 58:"1600x1200_def" 0 144000 1600 1628 1788 1920 1200 1201 1204
> 1250 0x0 0x0
> but just after the mode is used:
> Modeline 75:"1600x1200" 0 162000 1600 1664 1856 2160 1200 1201 1204 1250
> 0x48 0x5
> Here is the xrandr --verbose output:
> http://yen.ipipan.waw.pl/~gs159090/tmp/xrandr.nouveau.gz
>
Does the following command help?
$ xrandr --output DVI-I-2 --set "scaling mode" "None"

> Just in case I also recorded the xrandr output in the case of the Nvidia
> binary driver:
> http://yen.ipipan.waw.pl/~gs159090/tmp/xrandr.nvidia.gz
> I was really surprised because the xrandr claims that the refresh rate
> is 50Hz but at the OSD there is an information that the refresh rate is
> 60Hz. What to think?? Next thing is that the refresh rate of 50Hz is out
> of the monitor range: VertRefresh 56 - 75. So the Xserver should not to
> set it to 50.

Don't worry about that, IIRC it's just a hack nvidia did to
differentiate between "meta-modes" with the same resolution but a
different set of enabled outputs, instead of switching to RandR12.

>
> All the time (when using nouveau.ko) the monitor #1 is switched off and
> #2 is blinking. It does not mater if Xserver is running or not.
>
> Please let me know if you need any more data.
>
> Thanks for any help in advance.
>
> Regards

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkyktVAACgkQg5k4nX1Sv1s63wEAjwOKt/A7/5c+uLeKW4zbxVYT
N61eOhCwtPjOZYkW5CEA/0kfkYQXaTHxCixqCkRHwYX5uXzkcyreToXxhNDnKFto
=Ua/E
-----END PGP SIGNATURE-----
--==-=-=--

--===============0573174456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0573174456==--
