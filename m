From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: use drm debug levels
Date: Sun, 13 Dec 2009 16:58:40 +0100
Message-ID: <6d4bc9fc0912130758l63983e84p984330700dc91041@mail.gmail.com>
References: <1260719783-3049-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260719783-3049-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Dec 13, 2009 at 4:56 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> - Use driver level (0x2) for NV_DEBUG instead of all levels
> - Create a NV_DEBUG_KMS for KMS level (04) and use them in modesetting co=
de

I just noticed this typo, replaced it with 0x4 in my local copy.

> - Remove a few odd NV_TRACE calls and replace with NV_DEBUG_KMS
>
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0drivers/gpu/drm/nouveau/nouveau_bios.c =A0 =A0 =A0| =A0 12 +++++-----
> =A0drivers/gpu/drm/nouveau/nouveau_connector.c | =A0 =A08 +++---
> =A0drivers/gpu/drm/nouveau/nouveau_dp.c =A0 =A0 =A0 =A0| =A0 28 +++++++++=
++++-------------
> =A0drivers/gpu/drm/nouveau/nouveau_drv.h =A0 =A0 =A0 | =A0 14 +++++++++++-
> =A0drivers/gpu/drm/nouveau/nouveau_fbcon.c =A0 =A0 | =A0 =A02 +-
> =A0drivers/gpu/drm/nouveau/nv04_crtc.c =A0 =A0 =A0 =A0 | =A0 10 ++++----
> =A0drivers/gpu/drm/nouveau/nv04_dac.c =A0 =A0 =A0 =A0 =A0| =A0 =A08 ++----
> =A0drivers/gpu/drm/nouveau/nv04_dfp.c =A0 =A0 =A0 =A0 =A0| =A0 =A08 ++++--
> =A0drivers/gpu/drm/nouveau/nv04_display.c =A0 =A0 =A0| =A0 =A04 +-
> =A0drivers/gpu/drm/nouveau/nv17_tv.c =A0 =A0 =A0 =A0 =A0 | =A0 =A04 +-
> =A0drivers/gpu/drm/nouveau/nv50_crtc.c =A0 =A0 =A0 =A0 | =A0 22 +++++++++=
+----------
> =A0drivers/gpu/drm/nouveau/nv50_cursor.c =A0 =A0 =A0 | =A0 =A08 +++---
> =A0drivers/gpu/drm/nouveau/nv50_dac.c =A0 =A0 =A0 =A0 =A0| =A0 20 +++++++=
++---------
> =A0drivers/gpu/drm/nouveau/nv50_display.c =A0 =A0 =A0| =A0 20 +++++++++--=
-------
> =A0drivers/gpu/drm/nouveau/nv50_sor.c =A0 =A0 =A0 =A0 =A0| =A0 16 +++++++=
-------
> =A015 files changed, 97 insertions(+), 87 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nou=
veau/nouveau_bios.c
> index 5eec5ed..62fadbb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -3854,7 +3854,7 @@ nouveau_bios_run_display_table(struct drm_device *d=
ev, struct dcb_entry *dcbent,
> =A0 =A0 =A0 =A0 * script tables is a pointer to the script to execute.
> =A0 =A0 =A0 =A0 */
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "Searching for output entry for %d %d %d\n",
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Searching for output entry for %d %d %d\=
n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dcbent->type, dcbent->loca=
tion, dcbent->or);
> =A0 =A0 =A0 =A0otable =3D bios_output_config_match(dev, dcbent, table[1] +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0bios->display.script_table_ptr,
> @@ -3884,7 +3884,7 @@ nouveau_bios_run_display_table(struct drm_device *d=
ev, struct dcb_entry *dcbent,
> =A0 =A0 =A0 =A0if (pxclk =3D=3D 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0script =3D ROM16(otable[6]);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!script) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "output scrip=
t 0 not found\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "output s=
cript 0 not found\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> @@ -3894,7 +3894,7 @@ nouveau_bios_run_display_table(struct drm_device *d=
ev, struct dcb_entry *dcbent,
> =A0 =A0 =A0 =A0if (pxclk =3D=3D -1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0script =3D ROM16(otable[8]);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!script) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "output scrip=
t 1 not found\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "output s=
cript 1 not found\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> @@ -3907,7 +3907,7 @@ nouveau_bios_run_display_table(struct drm_device *d=
ev, struct dcb_entry *dcbent,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0script =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!script) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "output scrip=
t 2 not found\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "output s=
cript 2 not found\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> @@ -3931,7 +3931,7 @@ nouveau_bios_run_display_table(struct drm_device *d=
ev, struct dcb_entry *dcbent,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (script)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0script =3D clkcmptable(bio=
s, script, -pxclk);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!script) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "clock script=
 1 not found\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "clock sc=
ript 1 not found\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> @@ -5234,7 +5234,7 @@ parse_dcb_connector_table(struct nvbios *bios)
> =A0 =A0 =A0 =A0int i;
>
> =A0 =A0 =A0 =A0if (!bios->bdcb.connector_table_ptr) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "No DCB connector table prese=
nt\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "No DCB connector table p=
resent\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0}
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index 032cf09..5a10deb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -86,7 +86,7 @@ nouveau_connector_destroy(struct drm_connector *drm_con=
nector)
> =A0 =A0 =A0 =A0struct nouveau_connector *connector =3D nouveau_connector(=
drm_connector);
> =A0 =A0 =A0 =A0struct drm_device *dev =3D connector->base.dev;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0if (!connector)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> @@ -420,7 +420,7 @@ nouveau_connector_native_mode(struct nouveau_connecto=
r *connector)
> =A0 =A0 =A0 =A0/* Use preferred mode if there is one.. */
> =A0 =A0 =A0 =A0list_for_each_entry(mode, &connector->base.probed_modes, h=
ead) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "native mode =
from preferred\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "native m=
ode from preferred\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return drm_mode_duplicate(=
dev, mode);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> @@ -445,7 +445,7 @@ nouveau_connector_native_mode(struct nouveau_connecto=
r *connector)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0largest =3D mode;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "native mode from largest: %dx%d@%d\n",
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "native mode from largest: %dx%d@%d\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0high_w, high_h, high_v);
> =A0 =A0 =A0 =A0return largest ? drm_mode_duplicate(dev, largest) : NULL;
> =A0}
> @@ -725,7 +725,7 @@ nouveau_connector_create(struct drm_device *dev, int =
index, int type)
> =A0 =A0 =A0 =A0struct drm_encoder *encoder;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0nv_connector =3D kzalloc(sizeof(*nv_connector), GFP_KERNEL=
);
> =A0 =A0 =A0 =A0if (!nv_connector)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouve=
au/nouveau_dp.c
> index de61f46..9e2926c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -187,7 +187,7 @@ nouveau_dp_link_train_adjust(struct drm_encoder *enco=
der, uint8_t *config)
> =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return false;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\t\tadjust 0x%02x 0x%02x\n", request[0], req=
uest[1]);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\t\tadjust 0x%02x 0x%02x\n", request[0],=
 request[1]);
>
> =A0 =A0 =A0 =A0/* Keep all lanes at the same level.. */
> =A0 =A0 =A0 =A0for (i =3D 0; i < nv_encoder->dp.link_nr; i++) {
> @@ -228,7 +228,7 @@ nouveau_dp_link_train_commit(struct drm_encoder *enco=
der, uint8_t *config)
> =A0 =A0 =A0 =A0int or =3D nv_encoder->or, link =3D !(nv_encoder->dcb->sor=
conf.link & 1);
> =A0 =A0 =A0 =A0int dpe_headerlen, ret, i;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\t\tconfig 0x%02x 0x%02x 0x%02x 0x%02x\n",
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\t\tconfig 0x%02x 0x%02x 0x%02x 0x%02x\n=
",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 config[0], config[1], config[2], config[3=
]);
>
> =A0 =A0 =A0 =A0dpe =3D nouveau_bios_dp_table(dev, nv_encoder->dcb, &dpe_h=
eaderlen);
> @@ -276,12 +276,12 @@ nouveau_dp_link_train(struct drm_encoder *encoder)
> =A0 =A0 =A0 =A0bool cr_done, cr_max_vs, eq_done;
> =A0 =A0 =A0 =A0int ret =3D 0, i, tries, voltage;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "link training!!\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "link training!!\n");
> =A0train:
> =A0 =A0 =A0 =A0cr_done =3D eq_done =3D false;
>
> =A0 =A0 =A0 =A0/* set link configuration */
> - =A0 =A0 =A0 NV_DEBUG(dev, "\tbegin train: bw %d, lanes %d\n",
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\tbegin train: bw %d, lanes %d\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_encoder->dp.link_bw, nv_encoder->dp.li=
nk_nr);
>
> =A0 =A0 =A0 =A0ret =3D nouveau_dp_link_bw_set(encoder, nv_encoder->dp.lin=
k_bw);
> @@ -297,7 +297,7 @@ train:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return false;
>
> =A0 =A0 =A0 =A0/* clock recovery */
> - =A0 =A0 =A0 NV_DEBUG(dev, "\tbegin cr\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\tbegin cr\n");
> =A0 =A0 =A0 =A0ret =3D nouveau_dp_link_train_set(encoder, DP_TRAINING_PAT=
TERN_1);
> =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto stop;
> @@ -314,7 +314,7 @@ train:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D auxch_rd(encoder, DP_LANE0_1_STATU=
S, status, 2);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "\t\tstatus: 0x%02x 0x%02x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\t\tstatus: 0x%02x 0x%02=
x\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status[0], status[1]);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cr_done =3D true;
> @@ -346,7 +346,7 @@ train:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto stop;
>
> =A0 =A0 =A0 =A0/* channel equalisation */
> - =A0 =A0 =A0 NV_DEBUG(dev, "\tbegin eq\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\tbegin eq\n");
> =A0 =A0 =A0 =A0ret =3D nouveau_dp_link_train_set(encoder, DP_TRAINING_PAT=
TERN_2);
> =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto stop;
> @@ -357,7 +357,7 @@ train:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D auxch_rd(encoder, DP_LANE0_1_STATU=
S, status, 3);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "\t\tstatus: 0x%02x 0x%02x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\t\tstatus: 0x%02x 0x%02=
x\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status[0], status[1]);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0eq_done =3D true;
> @@ -395,9 +395,9 @@ stop:
>
> =A0 =A0 =A0 =A0/* retry at a lower setting, if possible */
> =A0 =A0 =A0 =A0if (!ret && !(eq_done && cr_done)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "\twe failed\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\twe failed\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (nv_encoder->dp.link_bw !=3D DP_LINK_BW=
_1_62) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "retry link t=
raining at low rate\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "retry li=
nk training at low rate\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv_encoder->dp.link_bw =3D=
 DP_LINK_BW_1_62;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto train;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> @@ -418,7 +418,7 @@ nouveau_dp_detect(struct drm_encoder *encoder)
> =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return false;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "encoder: link_bw %d, link_nr %d\n"
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "encoder: link_bw %d, link_nr %d\n"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"display: link_bw %d, link_nr =
%d version 0x%02x\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_encoder->dcb->dpconf.link_bw,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_encoder->dcb->dpconf.link_nr,
> @@ -446,7 +446,7 @@ nouveau_dp_auxch(struct nouveau_i2c_chan *auxch, int =
cmd, int addr,
> =A0 =A0 =A0 =A0uint32_t tmp, ctrl, stat =3D 0, data32[4] =3D {};
> =A0 =A0 =A0 =A0int ret =3D 0, i, index =3D auxch->rd;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "ch %d cmd %d addr 0x%x len %d\n", index, cmd=
, addr, data_nr);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "ch %d cmd %d addr 0x%x len %d\n", index,=
 cmd, addr, data_nr);
>
> =A0 =A0 =A0 =A0tmp =3D nv_rd32(dev, NV50_AUXCH_CTRL(auxch->rd));
> =A0 =A0 =A0 =A0nv_wr32(dev, NV50_AUXCH_CTRL(auxch->rd), tmp | 0x00100000);
> @@ -472,7 +472,7 @@ nouveau_dp_auxch(struct nouveau_i2c_chan *auxch, int =
cmd, int addr,
> =A0 =A0 =A0 =A0if (!(cmd & 1)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy(data32, data, data_nr);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < 4; i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "wr %d: 0x%08=
x\n", i, data32[i]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "wr %d: 0=
x%08x\n", i, data32[i]);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv_wr32(dev, NV50_AUXCH_DA=
TA_OUT(index, i), data32[i]);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> @@ -504,7 +504,7 @@ nouveau_dp_auxch(struct nouveau_i2c_chan *auxch, int =
cmd, int addr,
> =A0 =A0 =A0 =A0if (cmd & 1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < 4; i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data32[i] =3D nv_rd32(dev,=
 NV50_AUXCH_DATA_IN(index, i));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "rd %d: 0x%08=
x\n", i, data32[i]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "rd %d: 0=
x%08x\n", i, data32[i]);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy(data, data32, data_nr);
> =A0 =A0 =A0 =A0}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index 88b4c7b..bc6ffa5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -1207,14 +1207,24 @@ static inline void nv_wo32(struct drm_device *dev=
, struct nouveau_gpuobj *obj,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0pci_name(d->pdev), ##arg)
> =A0#ifndef NV_DEBUG_NOTRACE
> =A0#define NV_DEBUG(d, fmt, arg...) do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> - =A0 =A0 =A0 if (drm_debug) { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 if (drm_debug & DRM_UT_DRIVER) { =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_PRINTK(KERN_DEBUG, d, "%s:%d - " fmt, __=
func__, =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __LINE__, ##arg); =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 } =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0\
> +} while (0)
> +#define NV_DEBUG_KMS(d, fmt, arg...) do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 if (drm_debug & DRM_UT_KMS) { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV_PRINTK(KERN_DEBUG, d, "%s:%d - " fmt, _=
_func__, =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__LINE__, ##arg); =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0\
> =A0} while (0)
> =A0#else
> =A0#define NV_DEBUG(d, fmt, arg...) do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> - =A0 =A0 =A0 if (drm_debug) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 if (drm_debug & DRM_UT_DRIVER) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_PRINTK(KERN_DEBUG, d, fmt, ##arg); =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> +} while (0)
> +#define NV_DEBUG_KMS(d, fmt, arg...) do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 if (drm_debug & DRM_UT_KMS) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV_PRINTK(KERN_DEBUG, d, fmt, ##arg); =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0} while (0)
> =A0#endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/no=
uveau/nouveau_fbcon.c
> index 36e8c5e..489d492 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> @@ -347,7 +347,7 @@ out:
> =A0int
> =A0nouveau_fbcon_probe(struct drm_device *dev)
> =A0{
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0return drm_fb_helper_single_fb_probe(dev, 32, nouveau_fbco=
n_create);
> =A0}
> diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouvea=
u/nv04_crtc.c
> index b913636..d2f143e 100644
> --- a/drivers/gpu/drm/nouveau/nv04_crtc.c
> +++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
> @@ -143,10 +143,10 @@ static void nv_crtc_calc_state_ext(struct drm_crtc =
*crtc, struct drm_display_mod
> =A0 =A0 =A0 =A0state->pllsel |=3D nv_crtc->index ? PLLSEL_VPLL2_MASK : PL=
LSEL_VPLL1_MASK;
>
> =A0 =A0 =A0 =A0if (pv->NM2)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_TRACE(dev, "vpll: n1 %d n2 %d m1 %d m2 %=
d log2p %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "vpll: n1 %d n2 %d m1 %d =
m2 %d log2p %d\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pv->N1, pv->N2, pv->M1, p=
v->M2, pv->log2P);
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_TRACE(dev, "vpll: n %d m %d log2p %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "vpll: n %d m %d log2p %d=
\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pv->N1, pv->M1, pv->log2P=
);
>
> =A0 =A0 =A0 =A0nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.offset=
);
> @@ -160,7 +160,7 @@ nv_crtc_dpms(struct drm_crtc *crtc, int mode)
> =A0 =A0 =A0 =A0unsigned char seq1 =3D 0, crtc17 =3D 0;
> =A0 =A0 =A0 =A0unsigned char crtc1A;
>
> - =A0 =A0 =A0 NV_TRACE(dev, "Setting dpms mode %d on CRTC %d\n", mode,
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Setting dpms mode %d on CRTC %d\n", mode,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv_crtc->index);
>
> =A0 =A0 =A0 =A0if (nv_crtc->last_dpms =3D=3D mode) /* Don't do unnecesary=
 mode changes. */
> @@ -603,7 +603,7 @@ nv_crtc_mode_set(struct drm_crtc *crtc, struct drm_di=
splay_mode *mode,
> =A0 =A0 =A0 =A0struct nouveau_crtc *nv_crtc =3D nouveau_crtc(crtc);
> =A0 =A0 =A0 =A0struct drm_nouveau_private *dev_priv =3D dev->dev_private;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "CTRC mode on CRTC %d:\n", nv_crtc->index);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "CTRC mode on CRTC %d:\n", nv_crtc->index=
);
> =A0 =A0 =A0 =A0drm_mode_debug_printmodeline(adjusted_mode);
>
> =A0 =A0 =A0 =A0/* unlock must come after turning off FP_TG_CONTROL in out=
put_prepare */
> @@ -703,7 +703,7 @@ static void nv_crtc_destroy(struct drm_crtc *crtc)
> =A0{
> =A0 =A0 =A0 =A0struct nouveau_crtc *nv_crtc =3D nouveau_crtc(crtc);
>
> - =A0 =A0 =A0 NV_DEBUG(crtc->dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(crtc->dev, "\n");
>
> =A0 =A0 =A0 =A0if (!nv_crtc)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> diff --git a/drivers/gpu/drm/nouveau/nv04_dac.c b/drivers/gpu/drm/nouveau=
/nv04_dac.c
> index a5fa517..e6b690e 100644
> --- a/drivers/gpu/drm/nouveau/nv04_dac.c
> +++ b/drivers/gpu/drm/nouveau/nv04_dac.c
> @@ -205,7 +205,7 @@ out:
> =A0 =A0 =A0 =A0NVWriteVgaSeq(dev, 0, NV_VIO_SR_CLOCK_INDEX, saved_seq1);
>
> =A0 =A0 =A0 =A0if (blue =3D=3D 0x18) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_TRACE(dev, "Load detected on head A\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Load detected on head A\=
n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return connector_status_connected;
> =A0 =A0 =A0 =A0}
>
> @@ -350,13 +350,11 @@ static void nv04_dac_mode_set(struct drm_encoder *e=
ncoder,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_dis=
play_mode *mode,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_dis=
play_mode *adjusted_mode)
> =A0{
> - =A0 =A0 =A0 struct nouveau_encoder *nv_encoder =3D nouveau_encoder(enco=
der);
> =A0 =A0 =A0 =A0struct drm_device *dev =3D encoder->dev;
> =A0 =A0 =A0 =A0struct drm_nouveau_private *dev_priv =3D dev->dev_private;
> =A0 =A0 =A0 =A0int head =3D nouveau_crtc(encoder->crtc)->index;
>
> - =A0 =A0 =A0 NV_TRACE(dev, "%s called for encoder %d\n", __func__,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_encoder->dcb->index);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Output mode on CRTC %d:\n", head);
>
> =A0 =A0 =A0 =A0if (nv_gf4_disp_arch(dev)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_encoder *rebind;
> @@ -466,7 +464,7 @@ static void nv04_dac_destroy(struct drm_encoder *enco=
der)
> =A0{
> =A0 =A0 =A0 =A0struct nouveau_encoder *nv_encoder =3D nouveau_encoder(enc=
oder);
>
> - =A0 =A0 =A0 NV_DEBUG(encoder->dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(encoder->dev, "\n");
>
> =A0 =A0 =A0 =A0drm_encoder_cleanup(encoder);
> =A0 =A0 =A0 =A0kfree(nv_encoder);
> diff --git a/drivers/gpu/drm/nouveau/nv04_dfp.c b/drivers/gpu/drm/nouveau=
/nv04_dfp.c
> index e5b3333..483f875 100644
> --- a/drivers/gpu/drm/nouveau/nv04_dfp.c
> +++ b/drivers/gpu/drm/nouveau/nv04_dfp.c
> @@ -261,7 +261,7 @@ static void nv04_dfp_mode_set(struct drm_encoder *enc=
oder,
> =A0 =A0 =A0 =A0struct drm_display_mode *output_mode =3D &nv_encoder->mode;
> =A0 =A0 =A0 =A0uint32_t mode_ratio, panel_ratio;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "Output mode on CRTC %d:\n", nv_crtc->index);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Output mode on CRTC %d:\n", nv_crtc->ind=
ex);
> =A0 =A0 =A0 =A0drm_mode_debug_printmodeline(output_mode);
>
> =A0 =A0 =A0 =A0/* Initialize the FP registers in this CRTC. */
> @@ -413,7 +413,9 @@ static void nv04_dfp_commit(struct drm_encoder *encod=
er)
> =A0 =A0 =A0 =A0struct dcb_entry *dcbe =3D nv_encoder->dcb;
> =A0 =A0 =A0 =A0int head =3D nouveau_crtc(encoder->crtc)->index;
>
> - =A0 =A0 =A0 NV_TRACE(dev, "%s called for encoder %d\n", __func__, nv_en=
coder->dcb->index);
> + =A0 =A0 =A0 NV_INFO(dev, "Output %s is running on CRTC %d using output =
%c\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 drm_get_connector_name(&nouveau_encoder_con=
nector_get(nv_encoder)->base),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_crtc->index, '@' + ffs(nv_encoder->dcb->=
or));
>
> =A0 =A0 =A0 =A0if (dcbe->type =3D=3D OUTPUT_TMDS)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0run_tmds_table(dev, dcbe, head, nv_encoder=
->mode.clock);
> @@ -550,7 +552,7 @@ static void nv04_dfp_destroy(struct drm_encoder *enco=
der)
> =A0{
> =A0 =A0 =A0 =A0struct nouveau_encoder *nv_encoder =3D nouveau_encoder(enc=
oder);
>
> - =A0 =A0 =A0 NV_DEBUG(encoder->dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(encoder->dev, "\n");
>
> =A0 =A0 =A0 =A0drm_encoder_cleanup(encoder);
> =A0 =A0 =A0 =A0kfree(nv_encoder);
> diff --git a/drivers/gpu/drm/nouveau/nv04_display.c b/drivers/gpu/drm/nou=
veau/nv04_display.c
> index b47c757..2c561bd 100644
> --- a/drivers/gpu/drm/nouveau/nv04_display.c
> +++ b/drivers/gpu/drm/nouveau/nv04_display.c
> @@ -99,7 +99,7 @@ nv04_display_create(struct drm_device *dev)
> =A0 =A0 =A0 =A0uint16_t connector[16] =3D { 0 };
> =A0 =A0 =A0 =A0int i, ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0if (nv_two_heads(dev))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv04_display_store_initial_head_owner(dev);
> @@ -223,7 +223,7 @@ nv04_display_destroy(struct drm_device *dev)
> =A0 =A0 =A0 =A0struct drm_encoder *encoder;
> =A0 =A0 =A0 =A0struct drm_crtc *crtc;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0/* Turn every CRTC off. */
> =A0 =A0 =A0 =A0list_for_each_entry(crtc, &dev->mode_config.crtc_list, hea=
d) {
> diff --git a/drivers/gpu/drm/nouveau/nv17_tv.c b/drivers/gpu/drm/nouveau/=
nv17_tv.c
> index 46cfd9c..7c4d7c0 100644
> --- a/drivers/gpu/drm/nouveau/nv17_tv.c
> +++ b/drivers/gpu/drm/nouveau/nv17_tv.c
> @@ -219,7 +219,7 @@ static void =A0nv17_tv_dpms(struct drm_encoder *encod=
er, int mode)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0nouveau_encoder(encoder)->last_dpms =3D mode;
>
> - =A0 =A0 =A0 NV_TRACE(dev, "Setting dpms mode %d on TV encoder (output %=
d)\n",
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Setting dpms mode %d on TV encoder (outp=
ut %d)\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode, nouveau_encoder(encoder)->dcb->inde=
x);
>
> =A0 =A0 =A0 =A0regs->ptv_200 &=3D ~1;
> @@ -619,7 +619,7 @@ static void nv17_tv_destroy(struct drm_encoder *encod=
er)
> =A0{
> =A0 =A0 =A0 =A0struct nv17_tv_encoder *tv_enc =3D to_tv_enc(encoder);
>
> - =A0 =A0 =A0 NV_DEBUG(encoder->dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(encoder->dev, "\n");
>
> =A0 =A0 =A0 =A0drm_encoder_cleanup(encoder);
> =A0 =A0 =A0 =A0kfree(tv_enc);
> diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouvea=
u/nv50_crtc.c
> index f8e28a1..118d328 100644
> --- a/drivers/gpu/drm/nouveau/nv50_crtc.c
> +++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
> @@ -45,7 +45,7 @@ nv50_crtc_lut_load(struct drm_crtc *crtc)
> =A0 =A0 =A0 =A0void __iomem *lut =3D nvbo_kmap_obj_iovirtual(nv_crtc->lut=
.nvbo);
> =A0 =A0 =A0 =A0int i;
>
> - =A0 =A0 =A0 NV_DEBUG(crtc->dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(crtc->dev, "\n");
>
> =A0 =A0 =A0 =A0for (i =3D 0; i < 256; i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0writew(nv_crtc->lut.r[i] >> 2, lut + 8*i +=
 0);
> @@ -68,8 +68,8 @@ nv50_crtc_blank(struct nouveau_crtc *nv_crtc, bool blan=
ked)
> =A0 =A0 =A0 =A0struct nouveau_channel *evo =3D dev_priv->evo;
> =A0 =A0 =A0 =A0int index =3D nv_crtc->index, ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "index %d\n", nv_crtc->index);
> - =A0 =A0 =A0 NV_DEBUG(dev, "%s\n", blanked ? "blanked" : "unblanked");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "%s\n", blanked ? "blanked" : "unblanked"=
);
>
> =A0 =A0 =A0 =A0if (blanked) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv_crtc->cursor.hide(nv_crtc, false);
> @@ -139,7 +139,7 @@ nv50_crtc_set_dither(struct nouveau_crtc *nv_crtc, bo=
ol on, bool update)
> =A0 =A0 =A0 =A0struct nouveau_channel *evo =3D dev_priv->evo;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0ret =3D RING_SPACE(evo, 2 + (update ? 2 : 0));
> =A0 =A0 =A0 =A0if (ret) {
> @@ -193,7 +193,7 @@ nv50_crtc_set_scale(struct nouveau_crtc *nv_crtc, int=
 scaling_mode, bool update)
> =A0 =A0 =A0 =A0uint32_t outX, outY, horiz, vert;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0switch (scaling_mode) {
> =A0 =A0 =A0 =A0case DRM_MODE_SCALE_NONE:
> @@ -301,7 +301,7 @@ nv50_crtc_destroy(struct drm_crtc *crtc)
> =A0 =A0 =A0 =A0struct drm_device *dev =3D crtc->dev;
> =A0 =A0 =A0 =A0struct nouveau_crtc *nv_crtc =3D nouveau_crtc(crtc);
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0if (!crtc)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> @@ -433,7 +433,7 @@ nv50_crtc_prepare(struct drm_crtc *crtc)
> =A0 =A0 =A0 =A0struct drm_device *dev =3D crtc->dev;
> =A0 =A0 =A0 =A0struct drm_encoder *encoder;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "index %d\n", nv_crtc->index);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
>
> =A0 =A0 =A0 =A0/* Disconnect all unused encoders. */
> =A0 =A0 =A0 =A0list_for_each_entry(encoder, &dev->mode_config.encoder_lis=
t, head) {
> @@ -458,7 +458,7 @@ nv50_crtc_commit(struct drm_crtc *crtc)
> =A0 =A0 =A0 =A0struct nouveau_crtc *nv_crtc =3D nouveau_crtc(crtc);
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "index %d\n", nv_crtc->index);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
>
> =A0 =A0 =A0 =A0nv50_crtc_blank(nv_crtc, false);
>
> @@ -497,7 +497,7 @@ nv50_crtc_do_mode_set_base(struct drm_crtc *crtc, int=
 x, int y,
> =A0 =A0 =A0 =A0struct nouveau_framebuffer *fb =3D nouveau_framebuffer(drm=
_fb);
> =A0 =A0 =A0 =A0int ret, format;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "index %d\n", nv_crtc->index);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
>
> =A0 =A0 =A0 =A0switch (drm_fb->depth) {
> =A0 =A0 =A0 =A0case =A08:
> @@ -612,7 +612,7 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_=
display_mode *mode,
>
> =A0 =A0 =A0 =A0*nv_crtc->mode =3D *adjusted_mode;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "index %d\n", nv_crtc->index);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
>
> =A0 =A0 =A0 =A0hsync_dur =3D adjusted_mode->hsync_end - adjusted_mode->hs=
ync_start;
> =A0 =A0 =A0 =A0vsync_dur =3D adjusted_mode->vsync_end - adjusted_mode->vs=
ync_start;
> @@ -706,7 +706,7 @@ nv50_crtc_create(struct drm_device *dev, int index)
> =A0 =A0 =A0 =A0struct nouveau_crtc *nv_crtc =3D NULL;
> =A0 =A0 =A0 =A0int ret, i;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0nv_crtc =3D kzalloc(sizeof(*nv_crtc), GFP_KERNEL);
> =A0 =A0 =A0 =A0if (!nv_crtc)
> diff --git a/drivers/gpu/drm/nouveau/nv50_cursor.c b/drivers/gpu/drm/nouv=
eau/nv50_cursor.c
> index e2e79a8..753e723 100644
> --- a/drivers/gpu/drm/nouveau/nv50_cursor.c
> +++ b/drivers/gpu/drm/nouveau/nv50_cursor.c
> @@ -41,7 +41,7 @@ nv50_cursor_show(struct nouveau_crtc *nv_crtc, bool upd=
ate)
> =A0 =A0 =A0 =A0struct drm_device *dev =3D nv_crtc->base.dev;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0if (update && nv_crtc->cursor.visible)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> @@ -76,7 +76,7 @@ nv50_cursor_hide(struct nouveau_crtc *nv_crtc, bool upd=
ate)
> =A0 =A0 =A0 =A0struct drm_device *dev =3D nv_crtc->base.dev;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0if (update && !nv_crtc->cursor.visible)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> @@ -116,7 +116,7 @@ nv50_cursor_set_pos(struct nouveau_crtc *nv_crtc, int=
 x, int y)
> =A0static void
> =A0nv50_cursor_set_offset(struct nouveau_crtc *nv_crtc, uint32_t offset)
> =A0{
> - =A0 =A0 =A0 NV_DEBUG(nv_crtc->base.dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(nv_crtc->base.dev, "\n");
> =A0 =A0 =A0 =A0if (offset =3D=3D nv_crtc->cursor.offset)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
> @@ -143,7 +143,7 @@ nv50_cursor_fini(struct nouveau_crtc *nv_crtc)
> =A0 =A0 =A0 =A0struct drm_device *dev =3D nv_crtc->base.dev;
> =A0 =A0 =A0 =A0int idx =3D nv_crtc->index;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0nv_wr32(dev, NV50_PDISPLAY_CURSOR_CURSOR_CTRL2(idx), 0);
> =A0 =A0 =A0 =A0if (!nv_wait(NV50_PDISPLAY_CURSOR_CURSOR_CTRL2(idx),
> diff --git a/drivers/gpu/drm/nouveau/nv50_dac.c b/drivers/gpu/drm/nouveau=
/nv50_dac.c
> index fb5838e..f08f042 100644
> --- a/drivers/gpu/drm/nouveau/nv50_dac.c
> +++ b/drivers/gpu/drm/nouveau/nv50_dac.c
> @@ -44,7 +44,7 @@ nv50_dac_disconnect(struct nouveau_encoder *nv_encoder)
> =A0 =A0 =A0 =A0struct nouveau_channel *evo =3D dev_priv->evo;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "Disconnecting DAC %d\n", nv_encoder->or);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Disconnecting DAC %d\n", nv_encoder->or);
>
> =A0 =A0 =A0 =A0ret =3D RING_SPACE(evo, 2);
> =A0 =A0 =A0 =A0if (ret) {
> @@ -81,11 +81,11 @@ nv50_dac_detect(struct drm_encoder *encoder, struct d=
rm_connector *connector)
> =A0 =A0 =A0 =A0/* Use bios provided value if possible. */
> =A0 =A0 =A0 =A0if (dev_priv->vbios->dactestval) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0load_pattern =3D dev_priv->vbios->dactestv=
al;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "Using bios provided load_pat=
tern of %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Using bios provided load=
_pattern of %d\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0load_pattern);
> =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0load_pattern =3D 340;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "Using default load_pattern o=
f %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Using default load_patte=
rn of %d\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 load_pattern);
> =A0 =A0 =A0 =A0}
>
> @@ -103,9 +103,9 @@ nv50_dac_detect(struct drm_encoder *encoder, struct d=
rm_connector *connector)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0status =3D connector_status_connected;
>
> =A0 =A0 =A0 =A0if (status =3D=3D connector_status_connected)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "Load was detected on output =
with or %d\n", or);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Load was detected on out=
put with or %d\n", or);
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "Load was not detected on out=
put with or %d\n", or);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Load was not detected on=
 output with or %d\n", or);
>
> =A0 =A0 =A0 =A0return status;
> =A0}
> @@ -118,7 +118,7 @@ nv50_dac_dpms(struct drm_encoder *encoder, int mode)
> =A0 =A0 =A0 =A0uint32_t val;
> =A0 =A0 =A0 =A0int or =3D nv_encoder->or;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "or %d mode %d\n", or, mode);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "or %d mode %d\n", or, mode);
>
> =A0 =A0 =A0 =A0/* wait for it to be done */
> =A0 =A0 =A0 =A0if (!nv_wait(NV50_PDISPLAY_DAC_DPMS_CTRL(or),
> @@ -173,7 +173,7 @@ nv50_dac_mode_fixup(struct drm_encoder *encoder, stru=
ct drm_display_mode *mode,
> =A0 =A0 =A0 =A0struct nouveau_encoder *nv_encoder =3D nouveau_encoder(enc=
oder);
> =A0 =A0 =A0 =A0struct nouveau_connector *connector;
>
> - =A0 =A0 =A0 NV_DEBUG(encoder->dev, "or %d\n", nv_encoder->or);
> + =A0 =A0 =A0 NV_DEBUG_KMS(encoder->dev, "or %d\n", nv_encoder->or);
>
> =A0 =A0 =A0 =A0connector =3D nouveau_encoder_connector_get(nv_encoder);
> =A0 =A0 =A0 =A0if (!connector) {
> @@ -213,7 +213,7 @@ nv50_dac_mode_set(struct drm_encoder *encoder, struct=
 drm_display_mode *mode,
> =A0 =A0 =A0 =A0uint32_t mode_ctl =3D 0, mode_ctl2 =3D 0;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "or %d\n", nv_encoder->or);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "or %d\n", nv_encoder->or);
>
> =A0 =A0 =A0 =A0nv50_dac_dpms(encoder, DRM_MODE_DPMS_ON);
>
> @@ -264,7 +264,7 @@ nv50_dac_destroy(struct drm_encoder *encoder)
> =A0 =A0 =A0 =A0if (!encoder)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
> - =A0 =A0 =A0 NV_DEBUG(encoder->dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(encoder->dev, "\n");
>
> =A0 =A0 =A0 =A0drm_encoder_cleanup(encoder);
> =A0 =A0 =A0 =A0kfree(nv_encoder);
> @@ -280,7 +280,7 @@ nv50_dac_create(struct drm_device *dev, struct dcb_en=
try *entry)
> =A0 =A0 =A0 =A0struct nouveau_encoder *nv_encoder;
> =A0 =A0 =A0 =A0struct drm_encoder *encoder;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
> =A0 =A0 =A0 =A0NV_INFO(dev, "Detected a DAC output\n");
>
> =A0 =A0 =A0 =A0nv_encoder =3D kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nou=
veau/nv50_display.c
> index 12c5ee6..a9263d9 100644
> --- a/drivers/gpu/drm/nouveau/nv50_display.c
> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
> @@ -188,7 +188,7 @@ nv50_display_init(struct drm_device *dev)
> =A0 =A0 =A0 =A0uint64_t start;
> =A0 =A0 =A0 =A0int ret, i;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0nv_wr32(dev, 0x00610184, nv_rd32(dev, 0x00614004));
> =A0 =A0 =A0 =A0/*
> @@ -232,7 +232,7 @@ nv50_display_init(struct drm_device *dev)
> =A0 =A0 =A0 =A0nv_wr32(dev, NV50_PDISPLAY_UNK_380, 0);
> =A0 =A0 =A0 =A0/* RAM is clamped to 256 MiB. */
> =A0 =A0 =A0 =A0ram_amount =3D nouveau_mem_fb_amount(dev);
> - =A0 =A0 =A0 NV_DEBUG(dev, "ram_amount %d\n", ram_amount);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "ram_amount %d\n", ram_amount);
> =A0 =A0 =A0 =A0if (ram_amount > 256*1024*1024)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ram_amount =3D 256*1024*1024;
> =A0 =A0 =A0 =A0nv_wr32(dev, NV50_PDISPLAY_RAM_AMOUNT, ram_amount - 1);
> @@ -398,7 +398,7 @@ static int nv50_display_disable(struct drm_device *de=
v)
> =A0 =A0 =A0 =A0struct drm_crtc *drm_crtc;
> =A0 =A0 =A0 =A0int ret, i;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0list_for_each_entry(drm_crtc, &dev->mode_config.crtc_list,=
 head) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nouveau_crtc *crtc =3D nouveau_crtc=
(drm_crtc);
> @@ -469,7 +469,7 @@ int nv50_display_create(struct drm_device *dev)
> =A0 =A0 =A0 =A0uint32_t connector[16] =3D {};
> =A0 =A0 =A0 =A0int ret, i;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0/* init basic kernel modesetting */
> =A0 =A0 =A0 =A0drm_mode_config_init(dev);
> @@ -573,7 +573,7 @@ int nv50_display_destroy(struct drm_device *dev)
> =A0{
> =A0 =A0 =A0 =A0struct drm_nouveau_private *dev_priv =3D dev->dev_private;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0drm_mode_config_cleanup(dev);
>
> @@ -617,7 +617,7 @@ nv50_display_irq_head(struct drm_device *dev, int *ph=
ead,
> =A0 =A0 =A0 =A0 * CRTC separately, and submission will be blocked by the =
GPU
> =A0 =A0 =A0 =A0 * until we handle each in turn.
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 NV_DEBUG(dev, "0x610030: 0x%08x\n", unk30);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "0x610030: 0x%08x\n", unk30);
> =A0 =A0 =A0 =A0head =3D ffs((unk30 >> 9) & 3) - 1;
> =A0 =A0 =A0 =A0if (head < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> @@ -661,7 +661,7 @@ nv50_display_irq_head(struct drm_device *dev, int *ph=
ead,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0or =3D i;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "type %d, or %d\n", type, or);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "type %d, or %d\n", type, or);
> =A0 =A0 =A0 =A0if (type =3D=3D OUTPUT_ANY) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV_ERROR(dev, "unknown encoder!!\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;
> @@ -811,7 +811,7 @@ nv50_display_unk20_handler(struct drm_device *dev)
> =A0 =A0 =A0 =A0pclk =3D nv_rd32(dev, NV50_PDISPLAY_CRTC_P(head, CLOCK)) &=
 0x3fffff;
> =A0 =A0 =A0 =A0script =3D nv50_display_script_select(dev, dcbent, pclk);
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "head %d pxclk: %dKHz\n", head, pclk);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "head %d pxclk: %dKHz\n", head, pclk);
>
> =A0 =A0 =A0 =A0if (dcbent->type !=3D OUTPUT_DP)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nouveau_bios_run_display_table(dev, dcbent=
, 0, -2);
> @@ -870,7 +870,7 @@ nv50_display_irq_handler_bh(struct work_struct *work)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t intr0 =3D nv_rd32(dev, NV50_PDISP=
LAY_INTR_0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t intr1 =3D nv_rd32(dev, NV50_PDISP=
LAY_INTR_1);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "PDISPLAY_INTR_BH 0x%08x 0x%0=
8x\n", intr0, intr1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "PDISPLAY_INTR_BH 0x%08x =
0x%08x\n", intr0, intr1);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (intr1 & NV50_PDISPLAY_INTR_1_CLK_UNK10)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_display_unk10_handler=
(dev);
> @@ -974,7 +974,7 @@ nv50_display_irq_handler(struct drm_device *dev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t intr1 =3D nv_rd32(dev, NV50_PDISP=
LAY_INTR_1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t clock;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "PDISPLAY_INTR 0x%08x 0x%08x\=
n", intr0, intr1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "PDISPLAY_INTR 0x%08x 0x%=
08x\n", intr0, intr1);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!intr0 && !(intr1 & ~delayed))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> diff --git a/drivers/gpu/drm/nouveau/nv50_sor.c b/drivers/gpu/drm/nouveau=
/nv50_sor.c
> index 8c28046..e395c16 100644
> --- a/drivers/gpu/drm/nouveau/nv50_sor.c
> +++ b/drivers/gpu/drm/nouveau/nv50_sor.c
> @@ -44,7 +44,7 @@ nv50_sor_disconnect(struct nouveau_encoder *nv_encoder)
> =A0 =A0 =A0 =A0struct nouveau_channel *evo =3D dev_priv->evo;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "Disconnecting SOR %d\n", nv_encoder->or);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Disconnecting SOR %d\n", nv_encoder->or);
>
> =A0 =A0 =A0 =A0ret =3D RING_SPACE(evo, 2);
> =A0 =A0 =A0 =A0if (ret) {
> @@ -70,7 +70,7 @@ nv50_sor_dp_link_train(struct drm_encoder *encoder)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (dpe->script0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "SOR-%d: running DP script 0\=
n", nv_encoder->or);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "SOR-%d: running DP scrip=
t 0\n", nv_encoder->or);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nouveau_bios_run_init_table(dev, le16_to_c=
pu(dpe->script0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0nv_encoder->dcb);
> =A0 =A0 =A0 =A0}
> @@ -79,7 +79,7 @@ nv50_sor_dp_link_train(struct drm_encoder *encoder)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV_ERROR(dev, "SOR-%d: link training faile=
d\n", nv_encoder->or);
>
> =A0 =A0 =A0 =A0if (dpe->script1) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(dev, "SOR-%d: running DP script 1\=
n", nv_encoder->or);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "SOR-%d: running DP scrip=
t 1\n", nv_encoder->or);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nouveau_bios_run_init_table(dev, le16_to_c=
pu(dpe->script1),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0nv_encoder->dcb);
> =A0 =A0 =A0 =A0}
> @@ -93,7 +93,7 @@ nv50_sor_dpms(struct drm_encoder *encoder, int mode)
> =A0 =A0 =A0 =A0uint32_t val;
> =A0 =A0 =A0 =A0int or =3D nv_encoder->or;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "or %d mode %d\n", or, mode);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "or %d mode %d\n", or, mode);
>
> =A0 =A0 =A0 =A0/* wait for it to be done */
> =A0 =A0 =A0 =A0if (!nv_wait(NV50_PDISPLAY_SOR_DPMS_CTRL(or),
> @@ -142,7 +142,7 @@ nv50_sor_mode_fixup(struct drm_encoder *encoder, stru=
ct drm_display_mode *mode,
> =A0 =A0 =A0 =A0struct nouveau_encoder *nv_encoder =3D nouveau_encoder(enc=
oder);
> =A0 =A0 =A0 =A0struct nouveau_connector *connector;
>
> - =A0 =A0 =A0 NV_DEBUG(encoder->dev, "or %d\n", nv_encoder->or);
> + =A0 =A0 =A0 NV_DEBUG_KMS(encoder->dev, "or %d\n", nv_encoder->or);
>
> =A0 =A0 =A0 =A0connector =3D nouveau_encoder_connector_get(nv_encoder);
> =A0 =A0 =A0 =A0if (!connector) {
> @@ -182,7 +182,7 @@ nv50_sor_mode_set(struct drm_encoder *encoder, struct=
 drm_display_mode *mode,
> =A0 =A0 =A0 =A0uint32_t mode_ctl =3D 0;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "or %d\n", nv_encoder->or);
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "or %d\n", nv_encoder->or);
>
> =A0 =A0 =A0 =A0nv50_sor_dpms(encoder, DRM_MODE_DPMS_ON);
>
> @@ -246,7 +246,7 @@ nv50_sor_destroy(struct drm_encoder *encoder)
> =A0 =A0 =A0 =A0if (!encoder)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
> - =A0 =A0 =A0 NV_DEBUG(encoder->dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(encoder->dev, "\n");
>
> =A0 =A0 =A0 =A0drm_encoder_cleanup(encoder);
>
> @@ -265,7 +265,7 @@ nv50_sor_create(struct drm_device *dev, struct dcb_en=
try *entry)
> =A0 =A0 =A0 =A0bool dum;
> =A0 =A0 =A0 =A0int type;
>
> - =A0 =A0 =A0 NV_DEBUG(dev, "\n");
> + =A0 =A0 =A0 NV_DEBUG_KMS(dev, "\n");
>
> =A0 =A0 =A0 =A0switch (entry->type) {
> =A0 =A0 =A0 =A0case OUTPUT_TMDS:
> --
> 1.6.5.4
>
>
