Return-Path: <SRS0=NGGM=HH=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00163C433DB
	for <nouveau@archiver.kernel.org>; Fri,  5 Feb 2021 13:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3914964FC0
	for <nouveau@archiver.kernel.org>; Fri,  5 Feb 2021 13:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3914964FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=spliet.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979626E3CE;
	Fri,  5 Feb 2021 13:28:49 +0000 (UTC)
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 757246E3CE
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 13:28:48 +0000 (UTC)
Received: from [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda] (unknown
 [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda])
 by Neelix.spliet.org (Postfix) with ESMTPSA id 791A16003C
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 13:28:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org 791A16003C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1612531723;
 bh=traCTwy/JAhlfkq/LXGOmmZBI+gmUifdVl2UrFgO2sU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=XrJUkQwMty/ZRUK9l465ReyBeX0gYmw6oGfPHNhZ05vFNvUmPGwaCVQm/TXapepJJ
 eK7O1Z2GtjUvvrUNHQhRL1qzbIY8GLX+XtauaWV/bgKJ9Z7vJD5Kfd+F5Tmb4wfreZ
 q9ZNa4NObSUJknQrW2ZRvNMZqzbmq/PstnreSrxE=
To: nouveau@lists.freedesktop.org
References: <20210205130502.1440514-1-unixbhaskar@gmail.com>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <51687b2a-db0a-09dd-944e-5fb575a22522@spliet.org>
Date: Fri, 5 Feb 2021 13:28:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205130502.1440514-1-unixbhaskar@gmail.com>
Content-Language: en-GB
X-Virus-Scanned: clamav-milter 0.103.0 at Neelix
X-Virus-Status: Clean
Subject: Re: [Nouveau] [PATCH] drivers: drm: nouveau: nvkm: Replace a word
 with a better phonetic word in the file macros.fuc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Op 05-02-2021 om 13:05 schreef Bhaskar Chowdhury:
> 
> 
> s/fuck/heck/
> 
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
> index 3737bd27f74e..1407a1b16d95 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
> @@ -46,7 +46,7 @@
>   #define NV_PPWR_INTR_EN_SET_SUBINTR                                  0x00000800
>   #define NV_PPWR_INTR_EN_SET_WATCHDOG                                 0x00000002
>   #define NV_PPWR_INTR_EN_CLR                                              0x0014
> -#define NV_PPWR_INTR_EN_CLR_MASK                    /* fuck i hate envyas */ -1
> +#define NV_PPWR_INTR_EN_CLR_MASK                    /* heck, i hate envyas */ -1

Please make sure that the values remain properly right-justified when 
proposing such changes.
Best,

Roy

>   #define NV_PPWR_INTR_ROUTE                                               0x001c
>   #define NV_PPWR_TIMER_LOW                                                0x002c
>   #define NV_PPWR_WATCHDOG_TIME                                            0x0034
> --
> 2.30.0
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
