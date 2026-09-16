Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AD0C982CC
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 23:48:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DB45810E2DD;
	Wed, 16 Sep 2026 23:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hrvDZFF/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AC1B748170;
	Wed, 16 Sep 2026 23:31:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789601467;
 b=ypNNig9GC2xFcoXLY4So5Z+GQRCussC6+g1boZmSmDNGlxrhYrNT3r+DC2WFMcKPUCiNH
 fnsg17L+QrKg705LGUPnTKzQ/mRAEcfANf7E0qSHj78brF6FrugGASGIb0u4x8JoyZpRcNT
 ENl9zTVBWnAw80sn/+xFSa/OPnOloul15psDXtfJykCsbtYtMQKQghqGOqk9IisGLqYOTkt
 fX6cC63iS4bP8CFOuYgkhx+MoJzVoXsNiJ93A1kysm9CpijyvPG3pJWMNe/pN+ZOoCR7T42
 vgsIvab2RUUTQxsLpBgcS9RYrKWKpqJ2BuYSELAYMfiJs+rKq+YMgkQwkREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789601467; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xnxlhPopZDA9jrGnXRXH2XzZuWhm3/u3li0L+5ojL0Y=;
 b=OGdndgH+lgsvSpnSedHa3XqivGfQU+sdi/ZCIBB6QMrdG/2iBdgEoTwPVkZkwWaBD2vjc
 E2v0fOT2v6V5+tWOwCnbwaQqg9aNlzrCMF3/5v1xY2z9HWB8CykL5yZn2M/utWRjE1m5X+O
 WeyAyBGN0hI5Mm8ofT7hyvouTypnuOKq56Aorq+pw2Z43ltXexG8SHuYBg35Hm9gl6hhT8k
 D9uZhYrflNnpoQ2DEiv/rHgRlxPlg6W12ogsdvnTwj26GgMIpAo2IwmzhgzxS1bISSbaJIm
 XoTWt777qajua4RmUL1BJ2y1BXX9WP/5XwB6AO2oSYFC9BL0pbUiE1Ghgd3Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DDCAC480F6
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 23:31:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A530D10E13A
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 23:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789602519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnxlhPopZDA9jrGnXRXH2XzZuWhm3/u3li0L+5ojL0Y=;
	b=hrvDZFF/ZAJ5ojCk5+xeWIwSmCwHH3PYVnQP56wAYxRZOsRVLgMsLKKTPfbj//1CfDgw52
	MkrtAzboIamfzIZJOJx/+bk5avm6qMSg3CyCR8oNkS1W+vh/maPMWM06j6nb8mWXMD49yv
	9Pm8QglynB7l4QBlr2W0525KRyd0/5Y=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-vUm1QmvAMcCoaPqNH6csMg-1; Wed, 16 Sep 2026 19:48:36 -0400
X-MC-Unique: vUm1QmvAMcCoaPqNH6csMg-1
X-Mimecast-MFC-AGG-ID: vUm1QmvAMcCoaPqNH6csMg_1789602515
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-86917d18880so434129b3a.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 16 Sep 2026 16:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602515; x=1790207315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnxlhPopZDA9jrGnXRXH2XzZuWhm3/u3li0L+5ojL0Y=;
        b=rBoUd+KHywPIwqokIL+4wuD/dXjfTKIZSe+bXJ3bFqegKsJqHHPCwTRWn3Sia/wObr
         nZhAS5HFFwUBzfwm3oIG8g7ULuqYi7MU37mnBY+zXglw8ZkM5+fGHTmKhY9Q4L9dlzDd
         Bdaa/CRspm05a/+S0Ce6+J+KqWW3Lc6ELMDG5V7PGJu75Ezk7iebjHGO/YD/NdYP+Jwb
         opQERGbBVSvyymMP6N9+1T7J17lz6iduixMV4MWUu5b7mn6kfa4eYKDC4ygaJ093y3+X
         ogcVpCf8/+nraIC1Hi+BL8ACvDwFWpFUr6zb4MLzh79+8IQVaXyJ2GHGh2Chnq6U6ITH
         R7vA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1DRdYnxRFo4WGhtgahXUwIHOku43X76UDg2Lekr9lpSwBP3a/ugH/tOuTKv4adYU1NT4AY4MP@lists.freedesktop.org
X-Gm-Message-State: AFuF++nzGcmYQczWiwdPcUWrhBCV5ylOnLg43XfNCsm8nlvnfbzlY9rw
	trkF8e6eDwOZEpVfI2bUjAvCK6Dq52JArIkQAmDRLWYX0Tct9ZZTvDQermamcMjQMNGO3PO15xd
	8UuMC4TqPG19iNUZoG+m1d4rBsdgKe4E/rJkVh2q8y5jwlZHaLI1q2zdloCFtN+6F572JNl/Z6e
	R930qleMaAv+ozW9jJpY4SxE/DIl3w/6DdMs1qmX6Llw==
X-Gm-Gg: AYBFou0bOxfg4GvHlLnkeAXsb1LHRcXzfhu4xJ60dVozQJklecWrDveURgm6T7Hc60R
	bMAaQNP3i8h8xhALOdJdTS4qBJIPmvYR2kVs9krbEi8ki1blzdLUa0Fp7/f2ME7X3I9OsTvYzBg
	oPC6MOgxEIflW8o5Tvyz9qegun65bravw1UDtUcXsPTaHAiPO4MLIyLYNz138R042fXhYCfUs2f
	EYXgToFPBvp2G23
X-Received: by 2002:a05:6a21:6b10:b0:3da:1e7b:ea27 with SMTP id
 adf61e73a8af0-3dd5f6fcf23mr11578377637.21.1789602515347;
        Wed, 16 Sep 2026 16:48:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b10:b0:3da:1e7b:ea27 with SMTP id
 adf61e73a8af0-3dd5f6fcf23mr11578329637.21.1789602514925; Wed, 16 Sep 2026
 16:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260916223358.507351-1-lyude@redhat.com>
 <20260916223358.507351-2-lyude@redhat.com>
In-Reply-To: <20260916223358.507351-2-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Thu, 17 Sep 2026 09:48:22 +1000
X-Gm-Features: AcwNN1V8GFuFBGj8sz9eOODt6sJo4wkIs0f7lYVi3FbrfgfAjEUxRByMOdrQ3Zo
Message-ID: 
 <CAMwc25pFFJ5vL4QajybiYrvyS+Dd_iohvQNEHTFZVTLjzJe0VA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/nouveau/gsp/r535: Add support for
 INTERNAL_GCX_ENTRY_PREREQUISITE
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DCD_OhQBxSD1-V7nXexy7swvkLuSqSOfmsHC13Rlhqs_1789602515
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VHFDQRICDE7AXECIFVJUCJAPPEOEMX6U
X-Message-ID-Hash: VHFDQRICDE7AXECIFVJUCJAPPEOEMX6U
X-MailFrom: airlied@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VHFDQRICDE7AXECIFVJUCJAPPEOEMX6U/>
Archived-At: 
 <https://lore.freedesktop.org/CAMwc25pFFJ5vL4QajybiYrvyS+Dd_iohvQNEHTFZVTLjzJe0VA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Sep 17, 2026 at 8:35=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
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

>  static int
>  nvkm_gsp_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspen=
d)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/priv.h
> index 71b7203bef507..b07797813b049 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> @@ -93,6 +93,7 @@ void r535_gsp_dtor(struct nvkm_gsp *);
>  int r535_gsp_oneinit(struct nvkm_gsp *);
>  int r535_gsp_init(struct nvkm_gsp *);
>  int r535_gsp_fini(struct nvkm_gsp *, enum nvkm_suspend_state suspend);
> +int r535_gsp_gcx_ready(struct nvkm_gsp *gsp);
>
>  int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, en=
um nvkm_subdev_type, int,
>                   struct nvkm_gsp **);
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
> +
>  typedef union rpc_message_rpc_union_field_v03_00

you can drop this hunk if r535 doesn't have it.

Dave.

