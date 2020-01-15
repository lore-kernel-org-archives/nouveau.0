From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 01/23] drm: Add get_scanout_position() to
 struct drm_crtc_helper_funcs
Date: Wed, 15 Jan 2020 08:31:16 +0100
Message-ID: <fdef25cd-8784-c8b5-4cd0-1ffcf5e27695@suse.de>
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-2-tzimmermann@suse.de>
 <921ff745-0f2a-0bb6-c758-07174ac26e40@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1510913441=="
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <921ff745-0f2a-0bb6-c758-07174ac26e40-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Yannick FERTRE <yannick.fertre-qxv4g6HH51o@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "daniel-/w4YWyX8dFk@public.gmane.org" <daniel-/w4YWyX8dFk@public.gmane.org>, "alexander.deucher-5C7GfCeVMHo@public.gmane.org" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, "christian.koenig-5C7GfCeVMHo@public.gmane.org" <christian.koenig-5C7GfCeVMHo@public.gmane.org>, "David1.Zhou-5C7GfCeVMHo@public.gmane.org" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, "maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org" <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, "benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent ABRIOU <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>, "mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, "eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org" <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, "rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hamohammed.sa@gm>
Cc: "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1510913441==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dy8utQKQWBe6XuW8macqRBBoPSguKlppq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dy8utQKQWBe6XuW8macqRBBoPSguKlppq
Content-Type: multipart/mixed; boundary="SmewxxS8D8HCScoDniLEP9bGTKtCgtZAO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Yannick FERTRE <yannick.fertre-qxv4g6HH51o@public.gmane.org>,
 "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "daniel-/w4YWyX8dFk@public.gmane.org" <daniel-/w4YWyX8dFk@public.gmane.org>,
 "alexander.deucher-5C7GfCeVMHo@public.gmane.org" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>,
 "christian.koenig-5C7GfCeVMHo@public.gmane.org" <christian.koenig-5C7GfCeVMHo@public.gmane.org>,
 "David1.Zhou-5C7GfCeVMHo@public.gmane.org" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>,
 "maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>,
 "patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 "robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 "sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org" <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>,
 "benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>,
 Vincent ABRIOU <vincent.abriou-qxv4g6HH51o@public.gmane.org>,
 Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>,
 "mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, "eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org"
 <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>,
 "rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 "hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 "linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org"
 <linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>,
 "thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org" <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>,
 "bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>,
 "harry.wentland-5C7GfCeVMHo@public.gmane.org" <harry.wentland-5C7GfCeVMHo@public.gmane.org>,
 "sunpeng.li-5C7GfCeVMHo@public.gmane.org" <sunpeng.li-5C7GfCeVMHo@public.gmane.org>,
 "jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>,
 "joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>,
 "rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
 "intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 "freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Message-ID: <fdef25cd-8784-c8b5-4cd0-1ffcf5e27695-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 01/23] drm: Add get_scanout_position() to struct
 drm_crtc_helper_funcs
References: <20200110092127.27847-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20200110092127.27847-2-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <921ff745-0f2a-0bb6-c758-07174ac26e40-qxv4g6HH51o@public.gmane.org>
In-Reply-To: <921ff745-0f2a-0bb6-c758-07174ac26e40-qxv4g6HH51o@public.gmane.org>

--SmewxxS8D8HCScoDniLEP9bGTKtCgtZAO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.01.20 um 16:31 schrieb Yannick FERTRE:
> Thanks for the patch.
>=20
> Tested-by: Yannick Fertr=C3=A9 <yannick.fertre-qxv4g6HH51o@public.gmane.org>=20

Thanks for testing all these patches.

Best regards
Thomas

>=20
> BR
> Yannick Fertr=C3=A9
>=20
>=20
> On 1/10/20 10:21 AM, Thomas Zimmermann wrote:
>> The new callback get_scanout_position() reads the current location of
>> the scanout process. The operation is currentyl located in struct
>> drm_driver, but really belongs to the CRTC. Drivers will be converted
>> in separate patches.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  drivers/gpu/drm/drm_vblank.c             | 24 ++++++++----
>>  include/drm/drm_drv.h                    |  7 +---
>>  include/drm/drm_modeset_helper_vtables.h | 47 +++++++++++++++++++++++=
+
>>  3 files changed, 65 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank=
=2Ec
>> index 1659b13b178c..c12f0b333e14 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -30,6 +30,7 @@
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_framebuffer.h>
>> +#include <drm/drm_modeset_helper_vtables.h>
>>  #include <drm/drm_print.h>
>>  #include <drm/drm_vblank.h>
>> =20
>> @@ -590,7 +591,7 @@ EXPORT_SYMBOL(drm_calc_timestamping_constants);
>>   * Implements calculation of exact vblank timestamps from given drm_d=
isplay_mode
>>   * timings and current video scanout position of a CRTC. This can be =
directly
>>   * used as the &drm_driver.get_vblank_timestamp implementation of a k=
ms driver
>> - * if &drm_driver.get_scanout_position is implemented.
>> + * if &drm_crtc_helper_funcs.get_scanout_position is implemented.
>>   *
>>   * The current implementation only handles standard video modes. For =
double scan
>>   * and interlaced modes the driver is supposed to adjust the hardware=
 mode
>> @@ -632,8 +633,9 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct =
drm_device *dev,
>>  	}
>> =20
>>  	/* Scanout position query not supported? Should not happen. */
>> -	if (!dev->driver->get_scanout_position) {
>> -		DRM_ERROR("Called from driver w/o get_scanout_position()!?\n");
>> +	if (!dev->driver->get_scanout_position ||
>> +	    !crtc->helper_private->get_scanout_position) {
>> +		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
>>  		return false;
>>  	}
>> =20
>> @@ -664,11 +666,17 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struc=
t drm_device *dev,
>>  		 * Get vertical and horizontal scanout position vpos, hpos,
>>  		 * and bounding timestamps stime, etime, pre/post query.
>>  		 */
>> -		vbl_status =3D dev->driver->get_scanout_position(dev, pipe,
>> -							       in_vblank_irq,
>> -							       &vpos, &hpos,
>> -							       &stime, &etime,
>> -							       mode);
>> +		if (crtc->helper_private->get_scanout_position) {
>> +			vbl_status =3D
>> +				crtc->helper_private->get_scanout_position(
>> +					crtc, in_vblank_irq, &vpos, &hpos,
>> +					&stime, &etime, mode);
>> +		} else {
>> +			vbl_status =3D
>> +				dev->driver->get_scanout_position(
>> +					dev, pipe, in_vblank_irq, &vpos,
>> +					&hpos, &stime, &etime, mode);
>> +		}
>> =20
>>  		/* Return as no-op if scanout query unsupported or failed. */
>>  		if (!vbl_status) {
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index cf13470810a5..d0049e5786fc 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -362,11 +362,8 @@ struct drm_driver {
>>  	 * True on success, false if a reliable scanout position counter cou=
ld
>>  	 * not be read out.
>>  	 *
>> -	 * FIXME:
>> -	 *
>> -	 * Since this is a helper to implement @get_vblank_timestamp, we sho=
uld
>> -	 * move it to &struct drm_crtc_helper_funcs, like all the other
>> -	 * helper-internal hooks.
>> +	 * This is deprecated and should not be used by new drivers.
>> +	 * Use &drm_crtc_helper_funcs.get_scanout_position instead.
>>  	 */
>>  	bool (*get_scanout_position) (struct drm_device *dev, unsigned int p=
ipe,
>>  				      bool in_vblank_irq, int *vpos, int *hpos,
>> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/dr=
m_modeset_helper_vtables.h
>> index 5a87f1bd7a3f..e398512bfd5f 100644
>> --- a/include/drm/drm_modeset_helper_vtables.h
>> +++ b/include/drm/drm_modeset_helper_vtables.h
>> @@ -450,6 +450,53 @@ struct drm_crtc_helper_funcs {
>>  	 */
>>  	void (*atomic_disable)(struct drm_crtc *crtc,
>>  			       struct drm_crtc_state *old_crtc_state);
>> +
>> +	/**
>> +	 * @get_scanout_position:
>> +	 *
>> +	 * Called by vblank timestamping code.
>> +	 *
>> +	 * Returns the current display scanout position from a CRTC and an
>> +	 * optional accurate ktime_get() timestamp of when the position was
>> +	 * measured. Note that this is a helper callback which is only used
>> +	 * if a driver uses drm_calc_vbltimestamp_from_scanoutpos() for the
>> +	 * @drm_driver.get_vblank_timestamp callback.
>> +	 *
>> +	 * Parameters:
>> +	 *
>> +	 * crtc:
>> +	 *     The CRTC.
>> +	 * in_vblank_irq:
>> +	 *     True when called from drm_crtc_handle_vblank(). Some drivers
>> +	 *     need to apply some workarounds for gpu-specific vblank irq
>> +	 *     quirks if the flag is set.
>> +	 * vpos:
>> +	 *     Target location for current vertical scanout position.
>> +	 * hpos:
>> +	 *     Target location for current horizontal scanout position.
>> +	 * stime:
>> +	 *     Target location for timestamp taken immediately before
>> +	 *     scanout position query. Can be NULL to skip timestamp.
>> +	 * etime:
>> +	 *     Target location for timestamp taken immediately after
>> +	 *     scanout position query. Can be NULL to skip timestamp.
>> +	 * mode:
>> +	 *     Current display timings.
>> +	 *
>> +	 * Returns vpos as a positive number while in active scanout area.
>> +	 * Returns vpos as a negative number inside vblank, counting the num=
ber
>> +	 * of scanlines to go until end of vblank, e.g., -1 means "one scanl=
ine
>> +	 * until start of active scanout / end of vblank."
>> +	 *
>> +	 * Returns:
>> +	 *
>> +	 * True on success, false if a reliable scanout position counter cou=
ld
>> +	 * not be read out.
>> +	 */
>> +	bool (*get_scanout_position)(struct drm_crtc *crtc,
>> +				     bool in_vblank_irq, int *vpos, int *hpos,
>> +				     ktime_t *stime, ktime_t *etime,
>> +				     const struct drm_display_mode *mode);
>>  };
>> =20
>>  /**
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--SmewxxS8D8HCScoDniLEP9bGTKtCgtZAO--

--dy8utQKQWBe6XuW8macqRBBoPSguKlppq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4ev8cACgkQaA3BHVML
eiPQPAgAhNBXxz0tZEzNlLqbwwfpcEJrCLZf/o7JVn07uUaHaDDU/MOgY7tyis90
qcfe1ZSVJsNiKyd81M5WVhxnzywTZbhJOlifgzdF0QJV8j+oPYSoNyUf2FkFdI25
Z0qCKYBW/07bNezPyl8OWD4teGOvMmQFCM7u6ZmaWL7O0kXgAb18zp2d8gZ47Cua
eoVZ6Dkz339eNR/o+N13BcSQH0G5WY736lmO/NI3jAkPpdv09v1L1HzNjrbkEGqb
E5WzMu+rDk0N7MHxa16XNSv9a9WCmLRfeqnQTxmCJ5B/CH5l/OXGFjytPMC9vAjp
SFw+EjFt/J9IAV9D/CxaWttoRrzadg==
=NncW
-----END PGP SIGNATURE-----

--dy8utQKQWBe6XuW8macqRBBoPSguKlppq--

--===============1510913441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Freedreno mailing list
Freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

--===============1510913441==--
