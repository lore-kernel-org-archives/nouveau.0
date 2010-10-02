From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Sat, 02 Oct 2010 15:31:45 +0200
Message-ID: <871v88hgam.fsf@riseup.net>
References: <4C9E0167.8000507@pfu.pl>
	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi> <4CA1C6C0.1000709@pfu.pl>
	<20100928170227.00665f76@daedalus.pq.iki.fi> <4CA21515.4030903@pfu.pl>
	<20100929193136.644e0d68@daedalus.pq.iki.fi>
	<878w2jike0.fsf@riseup.net> <4CA4A934.4080109@pfu.pl>
	<87zkuzgqsv.fsf@riseup.net> <4CA4D199.8010403@pfu.pl>
	<87pqvuhksw.fsf@riseup.net> <4CA5B64D.8000608@pfu.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0359167571=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CA5B64D.8000608-t9zbU3WrWHI@public.gmane.org> ("Grzesiek =?utf-8?Q?S=C3=B3jka=22'?=
	=?utf-8?Q?s?= message of "Fri, 01 Oct 2010 12:22:05 +0200")
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

--===============0359167571==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Grzesiek S=C3=B3jka <pld-t9zbU3WrWHI@public.gmane.org> writes:

> On 10/01/10 01:29, Francisco Jerez wrote:
>> Grzesiek S=C3=B3jka<pld-t9zbU3WrWHI@public.gmane.org>  writes:
>>
>>> On 09/30/10 18:05, Francisco Jerez wrote:
>>>> Does the following command help?
>>>> $ xrandr --output DVI-I-2 --set "scaling mode" "None"
>>> Yes! Now I have:
>>> xrandr --output DVI-I-1 --set "scaling mode" "None"
>>> xrandr --output DVI-I-2 --set "scaling mode" "None"
>>> in xinitrc. Both displays work fine when Xserver is running. But after I
>>> go back to the console the display #1 switches off and #2 starts to
>>> blink again. Is it possible to fix the console??
>>>
>> Do you need to tell the binary driver to do anything special to get it
>> working on those monitors? (e.g. manually specified timings or EDID)
> No, binary driver works fine without any extra settings. The version I
> used was 173.14.22. With nouveau drivers I'm forced to use the
> following
>
> Modeline "1600x1200_def" 144  1600 1628 1788 1920  1200 1201 1204 1250
>
> Without it the displays (both) are blinking. Remember that binary
> nvidia claims that the MaxPixClk is 135MHz and nouveau says that it is
> 175MHz. According to the spec it should be 162MHz. I'm not sure but I
> think that this high rate works only with D-SUB. Actually I have 3
> monitors and the third one is connected with the ancient Matrox
> Millennium II card using the D-SUB cable and it uses the modeline with
> the 162MHz PixClk.

Ah, I think you're hitting the bandwidth limitation of the nv34
integrated TMDS transmitter. The attached patch should help with the
console modesetting problem, but you'll still need to set the modelines
manually (and force panel rescaling) if you want to go up to 1600x1200,
because your GPU *cannot* handle the video mode your monitor is asking
for.

>
> PS. By the way - I was force to install Win7 and it works with my LCD
> without any drivers installed.


--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment; filename=nouveau_tmds_bandwidth.patch
Content-Transfer-Encoding: quoted-printable

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/=
nouveau/nouveau_connector.c
index 0871495..6208eed 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -641,11 +641,28 @@ nouveau_connector_get_modes(struct drm_connector *con=
nector)
 	return ret;
 }
=20
+static unsigned
+get_tmds_link_bandwidth(struct drm_connector *connector)
+{
+	struct nouveau_connector *nv_connector =3D nouveau_connector(connector);
+	struct drm_nouveau_private *dev_priv =3D connector->dev->dev_private;
+	struct dcb_entry *dcb =3D nv_connector->detected_encoder->dcb;
+
+	if (dcb->location !=3D DCB_LOC_ON_CHIP ||
+	    dev_priv->chipset >=3D 0x46)
+		return 165000;
+	else if (dev_priv->chipset >=3D 0x40)
+		return 155000;
+	else if (dev_priv->chipset >=3D 0x18)
+		return 135000;
+	else
+		return 112000;
+}
+
 static int
 nouveau_connector_mode_valid(struct drm_connector *connector,
 			     struct drm_display_mode *mode)
 {
=2D	struct drm_nouveau_private *dev_priv =3D connector->dev->dev_private;
 	struct nouveau_connector *nv_connector =3D nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder =3D nv_connector->detected_encoder;
 	struct drm_encoder *encoder =3D to_drm_encoder(nv_encoder);
@@ -663,11 +680,9 @@ nouveau_connector_mode_valid(struct drm_connector *con=
nector,
 		max_clock =3D 400000;
 		break;
 	case OUTPUT_TMDS:
=2D		if ((dev_priv->card_type >=3D NV_50 && !nouveau_duallink) ||
=2D		    !nv_encoder->dcb->duallink_possible)
=2D			max_clock =3D 165000;
=2D		else
=2D			max_clock =3D 330000;
+		max_clock =3D get_tmds_link_bandwidth(connector);
+		if (nouveau_duallink && nv_encoder->dcb->duallink_possible)
+			max_clock *=3D 2;
 		break;
 	case OUTPUT_ANALOG:
 		max_clock =3D nv_encoder->dcb->crtconf.maxfreq;

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkynNEIACgkQg5k4nX1Sv1t7ogD8CHmUbzmTrwSDPwyWea/RL/wM
xNsmYdKAgywJetP+J1AA/30sMqZDnOSaNkqLgTwrSREWNqbeWNFGbUk1HDHrpNR+
=Tm05
-----END PGP SIGNATURE-----
--==-=-=--

--===============0359167571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0359167571==--
