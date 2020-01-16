From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Intel-gfx] [PATCH v2 02/21] drm: Evaluate struct
 drm_device.vblank_disable_immediate on each use
Date: Thu, 16 Jan 2020 09:03:38 +0100
Message-ID: <646e4236-ff5e-acd0-32f2-e6d33cba70e3@suse.de>
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-3-tzimmermann@suse.de>
 <20200115143757.GZ13686@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3eAvSttXZQZFdMeghjaqeDuI1UsRNq3sn"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20200115143757.GZ13686@intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com, robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.fre
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3eAvSttXZQZFdMeghjaqeDuI1UsRNq3sn
Content-Type: multipart/mixed; boundary="IDhA7LRVBgaf9BIUqPyHk8du8qIhBJ2s0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
 robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Message-ID: <646e4236-ff5e-acd0-32f2-e6d33cba70e3@suse.de>
Subject: Re: [Intel-gfx] [PATCH v2 02/21] drm: Evaluate struct
 drm_device.vblank_disable_immediate on each use
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-3-tzimmermann@suse.de>
 <20200115143757.GZ13686@intel.com>
In-Reply-To: <20200115143757.GZ13686@intel.com>

--IDhA7LRVBgaf9BIUqPyHk8du8qIhBJ2s0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.01.20 um 15:37 schrieb Ville Syrj=C3=A4l=C3=A4:
> On Wed, Jan 15, 2020 at 01:16:33PM +0100, Thomas Zimmermann wrote:
>> VBLANK interrupts can be disabled immediately or with a delay, where t=
he
>> latter is the default. The former option can be selected by setting
>> get_vblank_timestamp, and enabling vblank_disable_immediate in struct
>> drm_device.
>>
>> The setup is only evaluated once when DRM initializes VBLANKs. Evaluat=
ing
>> the settings on each use of vblank_disable_immediate will allow for ea=
sy
>> integration of CRTC VBLANK functions.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_vblank.c | 31 ++++++++++++++-----------------
>>  1 file changed, 14 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank=
=2Ec
>> index 3f1dd54cc8bb..abb085c67d82 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -481,19 +481,6 @@ int drm_vblank_init(struct drm_device *dev, unsig=
ned int num_crtcs)
>> =20
>>  	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");=

>> =20
>> -	/* Driver specific high-precision vblank timestamping supported? */
>> -	if (dev->driver->get_vblank_timestamp)
>> -		DRM_INFO("Driver supports precise vblank timestamp query.\n");
>> -	else
>> -		DRM_INFO("No driver support for vblank timestamp query.\n");
>> -
>> -	/* Must have precise timestamping for reliable vblank instant disabl=
e */
>> -	if (dev->vblank_disable_immediate && !dev->driver->get_vblank_timest=
amp) {
>> -		dev->vblank_disable_immediate =3D false;
>> -		DRM_INFO("Setting vblank_disable_immediate to false because "
>> -			 "get_vblank_timestamp =3D=3D NULL\n");
>> -	}
>=20
> Which drivers are so broken they set vblank_disable_immediate to true
> without having the vfunc specified? IMO this code should just go away
> (or converted to a WARN).

It's probably not a problem in practice. I'll put WARN_ON around the
condition.

Best regards
Thomas

>=20
>> -
>>  	return 0;
>> =20
>>  err:
>> @@ -1070,6 +1057,15 @@ int drm_crtc_vblank_get(struct drm_crtc *crtc)
>>  }
>>  EXPORT_SYMBOL(drm_crtc_vblank_get);
>> =20
>> +static bool __vblank_disable_immediate(struct drm_device *dev, unsign=
ed int pipe)
>> +{
>> +	if (!dev->vblank_disable_immediate)
>> +		return false;
>> +	if (!dev->driver->get_vblank_timestamp)
>> +		return false;
>> +	return true;
>> +}
>> +
>>  static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)=

>>  {
>>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
>> @@ -1086,7 +1082,7 @@ static void drm_vblank_put(struct drm_device *de=
v, unsigned int pipe)
>>  			return;
>>  		else if (drm_vblank_offdelay < 0)
>>  			vblank_disable_fn(&vblank->disable_timer);
>> -		else if (!dev->vblank_disable_immediate)
>> +		else if (__vblank_disable_immediate(dev, pipe))
>>  			mod_timer(&vblank->disable_timer,
>>  				  jiffies + ((drm_vblank_offdelay * HZ)/1000));
>>  	}
>> @@ -1663,7 +1659,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev=
, void *data,
>>  	/* If the counter is currently enabled and accurate, short-circuit
>>  	 * queries to return the cached timestamp of the last vblank.
>>  	 */
>> -	if (dev->vblank_disable_immediate &&
>> +	if (__vblank_disable_immediate(dev, pipe) &&
>>  	    drm_wait_vblank_is_query(vblwait) &&
>>  	    READ_ONCE(vblank->enabled)) {
>>  		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
>> @@ -1820,7 +1816,7 @@ bool drm_handle_vblank(struct drm_device *dev, u=
nsigned int pipe)
>>  	 * been signaled. The disable has to be last (after
>>  	 * drm_handle_vblank_events) so that the timestamp is always accurat=
e.
>>  	 */
>> -	disable_irq =3D (dev->vblank_disable_immediate &&
>> +	disable_irq =3D (__vblank_disable_immediate(dev, pipe) &&
>>  		       drm_vblank_offdelay > 0 &&
>>  		       !atomic_read(&vblank->refcount));
>> =20
>> @@ -1893,7 +1889,8 @@ int drm_crtc_get_sequence_ioctl(struct drm_devic=
e *dev, void *data,
>>  	pipe =3D drm_crtc_index(crtc);
>> =20
>>  	vblank =3D &dev->vblank[pipe];
>> -	vblank_enabled =3D dev->vblank_disable_immediate && READ_ONCE(vblank=
->enabled);
>> +	vblank_enabled =3D __vblank_disable_immediate(dev, pipe) &&
>> +			 READ_ONCE(vblank->enabled);
>> =20
>>  	if (!vblank_enabled) {
>>  		ret =3D drm_crtc_vblank_get(crtc);
>> --=20
>> 2.24.1
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--IDhA7LRVBgaf9BIUqPyHk8du8qIhBJ2s0--

--3eAvSttXZQZFdMeghjaqeDuI1UsRNq3sn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4gGNoACgkQaA3BHVML
eiNPFgf/b563UWPp0EQB+KhHbYFGNwBE93tVR9rTSpEC68YSAq0sKTzsWZs/jY3R
mUdR9mw1M4FQ100hBNlBMYuy9IcCPVTZrCQx1fWG4Dq2z8LIgKQ+LTibOoV9uHjx
5UjyTv7ewlYhBtJf6Jxd3M3mnhJmA5MMn4/FTxvTwHBvSD/eaIFhMCiJSVTqhbG7
ITyKWyxaAgqjB0Vqdt5Vnf5P4F0zYD4ucI3qBGIz/9ucGY5UqZV9HDDofG5qvRD+
hjaD2rUB4UuK/Pn+O6CkxjrdY+pTn1RVepXnlNmfoDAPlL1JGaZbCUN0pOL9TOCT
NHm/tc5uOXP9Kvk30ipDAftWo99msA==
=42jk
-----END PGP SIGNATURE-----

--3eAvSttXZQZFdMeghjaqeDuI1UsRNq3sn--
