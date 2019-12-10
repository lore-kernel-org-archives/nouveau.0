From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.4 143/350] drm/nouveau: Resume hotplug
 interrupts earlier
Date: Tue, 10 Dec 2019 16:29:54 -0500
Message-ID: <90e9126b9692ce6a1b0fcd85a4d0327bf818e58a.camel@redhat.com>
References: <20191210210735.9077-1-sashal@kernel.org>
         <20191210210735.9077-104-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191210210735.9077-104-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Juston Li <juston.li@intel.com>, Imre Deak <imre.deak@intel.com>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Harry Wentland <hwentlan@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

huh? Not sure how this got put in the stable queue, but this probably shoul=
d
be dropped. this was prepatory work for some MST functionality that got add=
ed
recently, not a fix.

On Tue, 2019-12-10 at 16:04 -0500, Sasha Levin wrote:
> From: Lyude Paul <lyude@redhat.com>
>=20
> [ Upstream commit ac0de16a38a9ec7026ca96132e3883c564497068 ]
>=20
> Currently, we enable hotplug detection only after we re-enable the
> display. However, this is too late if we're planning on sending sideband
> messages during the resume process - which we'll need to do in order to
> reprobe the topology on resume.
>=20
> So, enable hotplug events before reinitializing the display.
>=20
> Cc: Juston Li <juston.li@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Sean Paul <sean@poorly.run>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Link:=20
> https://patchwork.freedesktop.org/patch/msgid/20191022023641.8026-11-lyud=
e@redhat.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c
> b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 6f038511a03a9..53f9bceaf17a5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -407,6 +407,17 @@ nouveau_display_init(struct drm_device *dev, bool
> resume, bool runtime)
>  =09struct drm_connector_list_iter conn_iter;
>  =09int ret;
> =20
> +=09/*
> +=09 * Enable hotplug interrupts (done as early as possible, since we nee=
d
> +=09 * them for MST)
> +=09 */
> +=09drm_connector_list_iter_begin(dev, &conn_iter);
> +=09nouveau_for_each_non_mst_connector_iter(connector, &conn_iter) {
> +=09=09struct nouveau_connector *conn =3D nouveau_connector(connector);
> +=09=09nvif_notify_get(&conn->hpd);
> +=09}
> +=09drm_connector_list_iter_end(&conn_iter);
> +
>  =09ret =3D disp->init(dev, resume, runtime);
>  =09if (ret)
>  =09=09return ret;
> @@ -416,14 +427,6 @@ nouveau_display_init(struct drm_device *dev, bool
> resume, bool runtime)
>  =09 */
>  =09drm_kms_helper_poll_enable(dev);
> =20
> -=09/* enable hotplug interrupts */
> -=09drm_connector_list_iter_begin(dev, &conn_iter);
> -=09nouveau_for_each_non_mst_connector_iter(connector, &conn_iter) {
> -=09=09struct nouveau_connector *conn =3D nouveau_connector(connector);
> -=09=09nvif_notify_get(&conn->hpd);
> -=09}
> -=09drm_connector_list_iter_end(&conn_iter);
> -
>  =09return ret;
>  }
> =20
--=20
Cheers,
=09Lyude Paul
