Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D69BC433EF
	for <nouveau@archiver.kernel.org>; Mon,  6 Jun 2022 00:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECC110E3C3;
	Mon,  6 Jun 2022 00:57:28 +0000 (UTC)
X-Greylist: delayed 330 seconds by postgrey-1.36 at gabe;
 Tue, 31 May 2022 03:48:53 UTC
Received: from mail.meizu.com (edge07.meizu.com [112.91.151.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DBD110E680
 for <nouveau@lists.freedesktop.org>; Tue, 31 May 2022 03:48:52 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail11.meizu.com
 (172.16.1.15) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 31 May
 2022 09:38:04 +0800
Received: from [172.16.137.70] (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 31 May
 2022 09:38:03 +0800
Message-ID: <45fce6db-2e9d-0e0e-3a71-97575d7bb722@meizu.com>
Date: Tue, 31 May 2022 09:38:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>, "Daniel Vetter"
 <daniel@ffwll.ch>
References: <1653880246-23670-1-git-send-email-baihaowen@meizu.com>
From: baihaowen <baihaowen@meizu.com>
In-Reply-To: <1653880246-23670-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Mailman-Approved-At: Mon, 06 Jun 2022 00:57:27 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau/therm: Fix pointer dereferenced
 before checking
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


在 2022/5/30 上午11:10, Haowen Bai 写道:
> The fan->base is dereferencing before null checking, so move
> it after checking.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
> index 340f37a299dc..b13ba9b2f6be 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
> @@ -98,10 +98,10 @@ nvkm_fanpwm_create(struct nvkm_therm *therm, struct dcb_gpio_func *func)
>  		return -ENODEV;
>  
>  	fan = kzalloc(sizeof(*fan), GFP_KERNEL);
> -	therm->fan = &fan->base;
>  	if (!fan)
>  		return -ENOMEM;
>  
> +	therm->fan = &fan->base;
>  	fan->base.type = "PWM";
>  	fan->base.get = nvkm_fanpwm_get;
>  	fan->base.set = nvkm_fanpwm_set;
Sorry, plz ignore this patch.

fan->base is dereferenced, &fan->base is just a pointer math for pointer address offset, so it would not cause a bug(dereferencing null pointer).

 

-- 
Haowen Bai

