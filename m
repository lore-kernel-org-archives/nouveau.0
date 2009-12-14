From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: use drm debug levels
Date: Mon, 14 Dec 2009 19:40:55 +0100
Message-ID: <6d4bc9fc0912141040m253ce88ajc623304402c423e1@mail.gmail.com>
References: <1260719783-3049-1-git-send-email-madman2003@gmail.com>
	<87k4wqmyw2.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87k4wqmyw2.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Dec 13, 2009 at 8:56 PM, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wr=
ote:
> Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> - Use driver level (0x2) for NV_DEBUG instead of all levels
>> - Create a NV_DEBUG_KMS for KMS level (04) and use them in modesetting c=
ode
>> - Remove a few odd NV_TRACE calls and replace with NV_DEBUG_KMS
>>
>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0drivers/gpu/drm/nouveau/nouveau_bios.c =A0 =A0 =A0| =A0 12 +++++-----
>> =A0drivers/gpu/drm/nouveau/nouveau_connector.c | =A0 =A08 +++---
>> =A0drivers/gpu/drm/nouveau/nouveau_dp.c =A0 =A0 =A0 =A0| =A0 28 ++++++++=
+++++-------------
>> =A0drivers/gpu/drm/nouveau/nouveau_drv.h =A0 =A0 =A0 | =A0 14 ++++++++++=
+-
>> =A0drivers/gpu/drm/nouveau/nouveau_fbcon.c =A0 =A0 | =A0 =A02 +-
>> =A0drivers/gpu/drm/nouveau/nv04_crtc.c =A0 =A0 =A0 =A0 | =A0 10 ++++----
>> =A0drivers/gpu/drm/nouveau/nv04_dac.c =A0 =A0 =A0 =A0 =A0| =A0 =A08 ++--=
--
>> =A0drivers/gpu/drm/nouveau/nv04_dfp.c =A0 =A0 =A0 =A0 =A0| =A0 =A08 ++++=
--
>> =A0drivers/gpu/drm/nouveau/nv04_display.c =A0 =A0 =A0| =A0 =A04 +-
>> =A0drivers/gpu/drm/nouveau/nv17_tv.c =A0 =A0 =A0 =A0 =A0 | =A0 =A04 +-
>> =A0drivers/gpu/drm/nouveau/nv50_crtc.c =A0 =A0 =A0 =A0 | =A0 22 ++++++++=
++----------
>> =A0drivers/gpu/drm/nouveau/nv50_cursor.c =A0 =A0 =A0 | =A0 =A08 +++---
>> =A0drivers/gpu/drm/nouveau/nv50_dac.c =A0 =A0 =A0 =A0 =A0| =A0 20 ++++++=
+++---------
>> =A0drivers/gpu/drm/nouveau/nv50_display.c =A0 =A0 =A0| =A0 20 +++++++++-=
--------
>> =A0drivers/gpu/drm/nouveau/nv50_sor.c =A0 =A0 =A0 =A0 =A0| =A0 16 ++++++=
+-------
>> =A015 files changed, 97 insertions(+), 87 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/no=
uveau/nouveau_bios.c
>> index 5eec5ed..62fadbb 100644
>>
>> [...]
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv04_dac.c b/drivers/gpu/drm/nouvea=
u/nv04_dac.c
>> index a5fa517..e6b690e 100644
>> --- a/drivers/gpu/drm/nouveau/nv04_dac.c
>> +++ b/drivers/gpu/drm/nouveau/nv04_dac.c
>> @@ -205,7 +205,7 @@ out:
>> =A0 =A0 =A0 NVWriteVgaSeq(dev, 0, NV_VIO_SR_CLOCK_INDEX, saved_seq1);
>>
>> =A0 =A0 =A0 if (blue =3D=3D 0x18) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 NV_TRACE(dev, "Load detected on head A\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG_KMS(dev, "Load detected on head A\n");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return connector_status_connected;
>> =A0 =A0 =A0 }
>
> This is a bit inconsistent with the other "Load detected" messages
> below (in nv17_dac_detect), which are NV_INFO.

Will change to NV_INFO.

>
>>
>> @@ -350,13 +350,11 @@ static void nv04_dac_mode_set(struct drm_encoder *=
encoder,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_displ=
ay_mode *mode,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_displ=
ay_mode *adjusted_mode)
>> =A0{
>> - =A0 =A0 struct nouveau_encoder *nv_encoder =3D nouveau_encoder(encoder=
);
>> =A0 =A0 =A0 struct drm_device *dev =3D encoder->dev;
>> =A0 =A0 =A0 struct drm_nouveau_private *dev_priv =3D dev->dev_private;
>> =A0 =A0 =A0 int head =3D nouveau_crtc(encoder->crtc)->index;
>>
>> - =A0 =A0 NV_TRACE(dev, "%s called for encoder %d\n", __func__,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_encoder->dcb->index);
>> + =A0 =A0 NV_DEBUG_KMS(dev, "Output mode on CRTC %d:\n", head);
>>
>
> I don't understand what that debugging message means, I guess you didn't
> mean to do that?

A bad attempt at making it consistent with nv04_dfp, which has
"drm_mode_debug_printmodeline(output_mode);" below it.
Will remove it as it is redundant(nv04_dac_commit gives plenty already).

>
>>
>> [...]
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv17_tv.c b/drivers/gpu/drm/nouveau=
/nv17_tv.c
>> index 46cfd9c..7c4d7c0 100644
>> --- a/drivers/gpu/drm/nouveau/nv17_tv.c
>> +++ b/drivers/gpu/drm/nouveau/nv17_tv.c
>> @@ -219,7 +219,7 @@ static void =A0nv17_tv_dpms(struct drm_encoder *enco=
der, int mode)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> =A0 =A0 =A0 nouveau_encoder(encoder)->last_dpms =3D mode;
>>
>> - =A0 =A0 NV_TRACE(dev, "Setting dpms mode %d on TV encoder (output %d)\=
n",
>> + =A0 =A0 NV_DEBUG_KMS(dev, "Setting dpms mode %d on TV encoder (output =
%d)\n",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mode, nouveau_encoder(encoder)->dcb->inde=
x);
>>
>> =A0 =A0 =A0 regs->ptv_200 &=3D ~1;
>
> This is inconsistent too with the DPMS messages in nv04_dfp/dac/tv.c,
> which are NV_INFO (I'm OK either way but IMHO it would be nice to keep
> all the DPMS messages at the same debug level).

Will change to NV_INFO.

>
>>
>> [...]
>>
>
