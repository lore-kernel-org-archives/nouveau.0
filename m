Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FD5C88E75
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 00:43:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB9C10E312;
	Wed, 16 Sep 2026 00:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="b4jRgCuo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1FE3D480C8;
	Wed, 16 Sep 2026 00:25:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789518326;
 b=p7FfzXhFhglYuhbIv51ITBcm8Vt97hsN57SIQDqL1m1zDmrNpBK3Oi0cnFWTzbIokqtlB
 NRcv5a6apl3pqJLCwEknfGxXvXAHJ0I9rxYzUg5yWAWYKHALqnuAin8c9VN2HdpnGkuDGWN
 PlTV4jniEQPmpCE6Sn0Zp5zLBK+4bT4+kMuKymkhPEYqXlmU09Ahuu4/KWYtmq27laPbJR6
 EC1mbyoOtc/4LZ2oLqKHV68FmKZtwJh5tRdqFJkto7EQye/hBiMYt7i/8YlK5Cly30x5UAp
 hZdNm7Y/xK4q6ve1LoNQrmurGtnIIYPyfjqX+K8LqSKKmrs3lckLBuFb/1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789518326; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mGse0lGtGHSILpOr5QMAUERvmnhcCgoXhrGdKRPvFPo=;
 b=l2/ZqlqTpuZ0NGv7u1mlgWLN8bOmeUnx03+AG+K27UJtTbwVDuYh1Tqs+YoDqpTMzeR09
 ds+JoAsS6OLQjYc7KtNj85wpmUWygJAzP/Jm75GC3lpN+kwT4we7+bLMPszmuptvZPkUZsp
 /Q+ace4XJ0nqyy9H4KagQvbDKuo5uVHWdvfftKmEADekhpoJ3m3WnJDGbDqw+pgbJA714wy
 ipn1LhHs4q0OLxt3b6Cn0+AkQg9V2+h50hT85jFLKNsv3U+ub6SUMMukcUqixCKHP320SZv
 GCELTc0u+7NjKA5tFkaDMzpJaSY0sVOGNz+qlQiID5O1czdBTN1YmcygA8eA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 37A97480AB
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 00:25:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA29310E0CE
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 00:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789519376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGse0lGtGHSILpOr5QMAUERvmnhcCgoXhrGdKRPvFPo=;
	b=b4jRgCuom9XsjlQvWCzdOJJfsHBtv2U3qHesmFaRLVeCbAmNUSOPMCCFXja7qRvL7aGA68
	zJoYhbSuG1dwyVkeB/yXd2vDWWItQi0E9gWw7AsA8cAZHaPW9LaVMp9S2bSlbvaSE9GScT
	4I+kC4qozCXdsxvzt3WfGBHWYRwfpyQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-BO_gFYEjOH2N5MTGhQojTA-1; Tue, 15 Sep 2026 20:42:54 -0400
X-MC-Unique: BO_gFYEjOH2N5MTGhQojTA-1
X-Mimecast-MFC-AGG-ID: BO_gFYEjOH2N5MTGhQojTA_1789519374
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-395543dc382so6800021a91.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 15 Sep 2026 17:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519374; x=1790124174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGse0lGtGHSILpOr5QMAUERvmnhcCgoXhrGdKRPvFPo=;
        b=Ugg8h/06ASjmbEZ1gZG5tLZhdATSve9khkE9HEZTi2z0/BaUrfSUqnyIDyxcVaCH1/
         omFi1JMQ3owrhI7wahpwgrNgpTsLDyr+MYN9qg+PeVGwpj7UZTADcyMgHmZFK2dc7zQX
         ZeLFvW+zfbmbWtVRbnKhefdRGgWslosppPBDumXKemwb2qM7Dhq9y8x7dWEX6ECuOI6m
         TysDPwGuldUfiPx14K3LWV6GeKzT9LqKvvkV/phSGQNHBklrmI7P8UaFhaFN/MWNNQvd
         yU1zUfCKvUuobmLMxWts9J37VadY27tm1biw0gEMPeUWOlep7GoyZfakBgVYcN/PHNA0
         Udhw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdUta9Qb4LgWVIR1vsqOeuw8lDIj3pU2Lp8QYqjb3Rqyfzsdha5bGkcst8kVZQ+798U59SJ+DC@lists.freedesktop.org
X-Gm-Message-State: AFuF++lnyCuoKf7qIuZdy3PHrXX0kG8px9oW9ZsmtBq07v1d7WOIysx7
	akcr2UdYDE6XKz/J1/TGMM9dJ9bGoAOLiOYfTstNTHfaHKFSdiQPTjv488AcHfWteqkPC7+gVv6
	cyT/RUP/A55vAlmnvowRVKbFJHfpJWojIR17BEgjS9SjSjad5wyWfiKVfHGue0AIvpxJY01T5er
	QiO5K9T06gJUoGqjKuADUKJUrK24mEe4trlHZjicrlZw==
X-Gm-Gg: AYBFou1ENuZNrwvWVJS7grCCxgtVwnaaMJId22p8YJKtqKT/NhylOaxDwAgZ4APhjI9
	/ulUuV60zj8NbflMidyRV/K9nHRY1+g2nXhejgEDRVHyXkogq+vkkZez0y92srqUzFWP7TVt3Y5
	ATTB3OU2HE22ZQ7hzJ/FDgDB4f/2HkJS6qtTzdYzCFSudZFgYTEykHW87iyWRw5Q5HLnmpXP5af
	0znJI9oahFXG99M
X-Received: by 2002:a17:90b:5281:b0:39d:f050:a010 with SMTP id
 98e67ed59e1d1-39e1e263d08mr1734205a91.1.1789519373682;
        Tue, 15 Sep 2026 17:42:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5281:b0:39d:f050:a010 with SMTP id
 98e67ed59e1d1-39e1e263d08mr1734159a91.1.1789519373138; Tue, 15 Sep 2026
 17:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260916001603.22394-1-lyude@redhat.com>
 <20260916001603.22394-2-lyude@redhat.com>
In-Reply-To: <20260916001603.22394-2-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Wed, 16 Sep 2026 10:42:41 +1000
X-Gm-Features: AcwNN1Vs8ufolmqLJX-ytdf5rJExuz1QFL1qUEVtr1TxWyGYdEA5LkZ7nRPeWL0
Message-ID: 
 <CAMwc25rP6u9=0PxN_OpYUs33cNqoiYYEFpwN4FKPQyHvNb+=Cg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] drm/nouveau/gsp/r535: Add support for
 INTERNAL_GCX_ENTRY_PREREQUISITE
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zDsZj7pABhh6d-vFJPb2YN0WHXx1wS3GVh8EuQN9SKI_1789519374
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: F4CYNVDGUN6GKOXPBGKEKIPNV42DWC7W
X-Message-ID-Hash: F4CYNVDGUN6GKOXPBGKEKIPNV42DWC7W
X-MailFrom: airlied@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F4CYNVDGUN6GKOXPBGKEKIPNV42DWC7W/>
Archived-At: 
 <https://lore.freedesktop.org/CAMwc25rP6u9=0PxN_OpYUs33cNqoiYYEFpwN4FKPQyHvNb+=Cg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Sep 16, 2026 at 10:22=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> OpenRM's runtime PM handling looks a bit different then nouveau's, one pa=
rt
> in particular that differs from us: OpenRM actually consults GSP to ask
> whether the GPU should be allowed to enter Gc6 and/or GcOff before runtim=
e
> suspending the GPU. In the event the card isn't ready, runtime suspend is
> simply delayed for a few seconds before retrying.
>
> Implement the command used for querying GSP about this,
> NV2080_CTRL_CMD_INTERNAL_GCX_ENTRY_PREREQUISITE, and check to ensure that
> the GPU is ready for runtime suspend in nouveau_pmops_runtime_suspend()
> using this query. If the GPU can't be runtime suspended, update the last
> busy counter of the device and then return -EBUSY from
> nouveau_pmops_runtime_suspend() - essentially delaying the runtime suspen=
d
> process by whatever autosuspend_delay_ms is set to.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---

>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/=
gpu/drm/nouveau/nvkm/engine/device/user.c
> index 23d11d8221cb6..c47d6daa9e5aa 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> @@ -27,6 +27,8 @@
>
>  #include <core/client.h>
>  #include <subdev/fb.h>
> +#include <subdev/gsp.h>
> +#include <subdev/gsp/priv.h>

Including a priv.h seems like a layering violation.

I think you should define a nvkm_gsp_gcx_ready and then call the r535
via a function pointer in nvkm_gsp_func.


>  #include <subdev/instmem.h>
>  #include <subdev/timer.h>
>
> @@ -189,6 +191,41 @@ nvkm_udevice_time(struct nvkm_udevice *udev, void *d=
ata, u32 size)
>         return ret;
>  }
>
> +static int
> +nvkm_udevice_gcx_ready(struct nvkm_udevice *udev, void *data, u32 size)
> +{
> +       struct nvkm_object *object =3D &udev->object;
> +       struct nvkm_device *device =3D udev->device;
> +       struct nvkm_gsp *gsp =3D device->gsp;
> +       union {
> +               struct nv_device_gcx_ready_v0 v0;
> +       } *args =3D data;
> +       int ret =3D -ENOSYS;
> +
> +       /* XXX: We don't know any way of performing this check outside of=
 GSP, so just assume
> +        * things are ready for non-GSP clients.
> +        */
> +       if (!gsp) {
> +               args->v0.ready =3D NV_DEVICE_GC6_READY | NV_DEVICE_GCOFF_=
READY;
> +               return 0;
> +       }
> +
> +       nvif_ioctl(object, "device gcx ready size %d\n", size);
> +       ret =3D nvif_unpack(ret, &data, &size, args->v0, 0, 0, false);
> +       if (!ret) {
> +               nvif_ioctl(object, "device gcx ready vers %d\n", args->v0=
.version);
> +
> +               ret =3D r535_gsp_gcx_ready(gsp);
> +               if (ret < 0)
> +                       return ret;
> +
> +               args->v0.ready =3D ret;
> +               ret =3D 0;
> +       }
> +
> +       return ret;
> +}
> +
>  static int
>  nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 =
size)
>  {
> @@ -199,6 +236,8 @@ nvkm_udevice_mthd(struct nvkm_object *object, u32 mth=
d, void *data, u32 size)
>                 return nvkm_udevice_info(udev, data, size);
>         case NV_DEVICE_V0_TIME:
>                 return nvkm_udevice_time(udev, data, size);
> +       case NV_DEVICE_V0_GCX_READY:
> +               return nvkm_udevice_gcx_ready(udev, data, size);
>         default:
>                 break;
>         }
> +       return ret;
> +}
> +
>  int
>  r535_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_suspend_state suspend)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h b=
/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> index b6683a5bf870c..fd1170037c030 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> @@ -782,6 +782,13 @@ typedef struct NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_=
TABLE_PARAMS {
>
>  #define GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE      ((48 << 10) * 2048)   /=
/ Support 2048 channels
>
> +#define NV2080_CTRL_CMD_INTERNAL_GCX_ENTRY_PREREQUISITE (0x2080a7d7)
> +
> +typedef struct NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS {
> +    NvBool bIsGC6Satisfied;
> +    NvBool bIsGCOFFSatisfied;
> +} NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS;

Have you confirmed this struct didn't change in r570,

Thanks,
Dave.

