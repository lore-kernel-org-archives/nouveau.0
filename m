Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9391C606A31E
	for <nouveau@archiver.kernel.org>; Thu, 26 Nov 2026 22:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzGnUyHJ
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A385112778;
	Thu, 26 Nov 2026 22:04:00 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C4E26404D9;
	Thu, 26 Nov 2026 22:03:59 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795730639;
 b=oRlNsNbVS9qojkt9ud7/aUS6Ll9cS8WxSQIAnx16DvSLG9AEwRM3jbhNbsrQr5lWJ5xpr
 my1CIP8dGJH1QNoheqFafGs0ZadBdOQhlcb/XIC97fq6SkPJ33xOMgoDCGlT3jxyqfirzUa
 u1Pb01311C/BGzkvFKXIxjxY+ZLJCM1yx8hjhPyhECxAkmRUaVEsWMGBnLj9XEiPf5TTdLO
 GY9uF/4UKiIKoIjbeH0tbWTwCTSH+pcdmDcIrNbAuQQGddOl45B2/rNlzze0pmeqP4nNBDA
 SkFY79bqgqFNb7kxzVwR8dOfEw5u9sV0fNraRYWlVupZZMMrMEh65dEMdEQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795730639; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IuRRg7o5Crk5KRLDhtoQ7ekunhWpm8sN3gL4hQuQRLw=;
 b=otNkE+excHRwPsaDU4598SsZ2vbEjBMRaNcPQoKqOnTPm8ppALXEURcQu2gGknxhv+nPJ
 qilnDhER+Nu6CRWgmUmoJrVVQF/7ZeSQUyxD2ZY4yTEJPt/xjPt/nDg8cAMqAfzsk1uU95B
 SwM3l03XjB3cHm+6709/EZ/xeTAZbZMAmM0Ba9vl+wwaoJSpNjeygxDXCREWxwH5SfW1OMf
 gxC1GODem5hB4BnM4binIGNi8Iq4/xZFPa2Q+rswWg/wqMvfyOMFaevAsIxtLT46OOwA6VA
 DKe5uT4e1PTnIYx4p46r2GsAO0bIBlK0GjKKQmsDwdxLhJ4GmxPPMUQcQqYw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass header.from=gmail.com policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3E4E040026
	for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2026 12:46:59 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3152410E75D
	for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2026 12:46:54 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6b87a1a2babso12051892a12.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 25 Nov 2026 04:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795610812; cv=none;
        d=google.com; s=arc-20260327;
        b=gLxBdZr7yawHI9I6ELvP8VFY04xk7d/ZdtiZux5pj0bG6aXXslYyf4cYr+r2J0MIs3
         SyFIxvvfpTys059yfNxF1LjxQNIt2BGr3jVpv5yFe0TTRRfvQtURCV0tl/3a4HZz2gwN
         NQ0Wpy+nD5DQ6xQ3puBrp1BT1e7PqaHD9Xi8bJ+FPD2gcUCVzAbJclOmuAhhjWdtE/Wr
         yyd7ofXKSvhZe2+8gB6qMYtUhpYAw3TJ7HPZuU2c31xH9w/wV1bQ0AxEIhNhl1x7I+Uu
         BMlTgI7TJYHUgG4URWzeRUBarZkI+W6+cxCCkqFzOcoymtpUnQu5W3s0TRDa8SJApt/R
         3IpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IuRRg7o5Crk5KRLDhtoQ7ekunhWpm8sN3gL4hQuQRLw=;
        fh=JpJMk8X+Z/MNa0jEKORUtxsqp3DU3fBSH7xyYhjx+SA=;
        b=c+9Z+H1ZaXLDIjh7EwTL1jiIMRQhnjkUL9iv20NplRRH4HlAclujGisAoY+qVFa75R
         j+7WtX0NfKkJB7r4jGOKrkd/Xp+hgobd24ccMHmcp6jpb7vw12J0hPwIxW398QdZR5XQ
         KIne/sJ/F9gojY/M46r9UDxHOUYFioZ4h2s8kDfSZl1wwg3nPyjJ4d573gyjEHnC+2zF
         Lv/0PAXFtXWxQBou4h8xc/JuYDP5pak/Yu/q58aWK9rHXaGz942v824GHpEDXmelVyt2
         KfUeXkZ5yRtcqfD90QaFe+wYn3XnPrXJedg8ljgX9//v+JGMIHxQJdietZ14EBwEA1c2
         epkA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610812; x=1796215612;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IuRRg7o5Crk5KRLDhtoQ7ekunhWpm8sN3gL4hQuQRLw=;
        b=dzGnUyHJ78bnuDj3psG08mFLgogGRa/nL4qRXMuNSLDOxC+wphBwKEFUo5+My/tDUz
         67KqSkb6jpPv9Y8ezRNYQytOhEeQyYW20J6icCmFSVDqtc/2vZMFGeEsuS5JqQj7edMT
         sD/ac3WU/91x2O4PAybFVHsjilNTwhkCpy6Oe3yct0zSi6r8B0S5UUAnKymu3r11s3QM
         sCG/ypI3ln3eZLNuQ6qD8hVBWiZka8yPRCgKKipk5g4HZVU5/GBFvoyoQP6UodbGfPav
         Qj3g+FhwkhHDc7Z/zRKZuLhQxZJTrmeS3WoGdHvTx6rlmUG3RJKqXHKbGDZfhGILQgv7
         eivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610812; x=1796215612;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IuRRg7o5Crk5KRLDhtoQ7ekunhWpm8sN3gL4hQuQRLw=;
        b=JIRIf/8557jGcDhVdmIuXMEwN6ZvwgbC/j3LHh6KgxReLKRsaDD8TXwOkvikrrNTtn
         DZLtno8yVzDG60WfSzbi/+p0OaKSxUhvtSi/Erz1LHiwStj7F5gcIObStqV6LVzmL6Sn
         +vL+2X8Eu3oGOlFDgCh2PuJO6yiTTmFsinJLd1QXGBbdu60XPERWLm4QQjBp3fILon4/
         /daZtirxdPAbD5bAzhCFORYTgH3jC2YkR1xq5RnvT3ZRfxyJknc2zIfcANo4gHfIJDkc
         XS34t57AT1Ev3OPy7y9Sfn4VJALI3poPbKIKCaGKTdvi4L8HXPe8ChxILQnLN+8d4SQR
         kTnQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFn5PzIj9nlYi31Axy9QYK3lag5jLrozCQBIoDAjmVvrv9wVk7Y2KV3xezkbr7BWlWtnC3DSyyX@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+ZroDX9+poq/OIxgWYTc5BYK05nXLkM/UYOSsHYFjXdbLr83kP
	Oe0j5qc761gtMqlbKfZsR+ehTzTQ6Hrbmk3jmocUVSAEPT3tM8wlGZc0w1OV+bRcCXyd2m5SP4A
	Qi2yH6c/mktbqpvRrmdemtZ70RtQoAVU=
X-Gm-Gg: AZFdTZeeDyTNhSV70Q254eV8SUm4c5XyY4KkytgTgpAtjSJ+OquPaDAAE9E4fM0cx4t
	XpBSO0DMQhzDoP7z4ICD91tGp4GyMlHyMogfeHdna+L3b49GpomXCWQjkrIatyBZUfRK4frKhoq
	KJhMiBiyAlKlrIGBGULXFa3/4cOHkhjcm5Q+emMQcKE5fZh6buEMZ2Bg2s7E3kUqZAY5GLqnWZS
	UidlkVsLf7sUNn0r0aYJiFTTZ9cFA3vKMOK2DTapPkzpGtAbX9Ap2bfDYwYyYI791w2CmIwl3U/
	d6C29ZQTUZgKg1MCYQeJWwav/py14zmLiR1gMhE+/4amdKJk1Rq7/+1dIsqN1Ja2or3//nT56As
	d3le3qEb7MWT0DAU0bd1hDbU4GackTli27gEOEk9ozSoxIKv2r2zcz5zYqrUlJ8Zkbtw=
X-Received: by 2002:a17:907:82a4:b0:c51:37e6:e036 with SMTP id
 a640c23a62f3a-c513a86d2d9mr981007666b.16.1795610812360; Wed, 25 Nov 2026
 04:46:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260514174008.4515-1-ms.bulatov7@gmail.com>
In-Reply-To: <20260514174008.4515-1-ms.bulatov7@gmail.com>
From: =?UTF-8?B?0JzQsNGA0Log0JHRg9C70LDRgtC+0LI=?= <ms.bulatov7@gmail.com>
Date: Wed, 25 Nov 2026 15:46:40 +0300
X-Gm-Features: Aa3M54raFHFC1wO72gQwKLcaw9Cis1_IurPLDhyy4bIilG0T4ZS0DTaSVjpcl5w
Message-ID: 
 <CAEyM3Y1QBGHedKixcW7o+9F=p7wQfDow6p2vzaK3fS4ZWP5Fxg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: handle nouveau_hw_get_clock() return value
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: ms.bulatov7@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
Message-ID-Hash: NTOGRRYUA7MALEPTVTDEPEVJNI6EOR7W
X-Message-ID-Hash: NTOGRRYUA7MALEPTVTDEPEVJNI6EOR7W
X-Mailman-Approved-At: Thu, 26 Nov 2026 22:03:58 +0000
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NTOGRRYUA7MALEPTVTDEPEVJNI6EOR7W/>
Archived-At: 
 <https://lore.freedesktop.org/CAEyM3Y1QBGHedKixcW7o+9F=p7wQfDow6p2vzaK3fS4ZWP5Fxg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Gentle ping on this patch. Please let me know if any changes or further
information are needed.
Thanks,
Mark.


On Thu, 14 May 2026 at 20:41, Bulatov Mark <ms.bulatov7@gmail.com> wrote:
>
> From: Mark Bulatov <ms.bulatov7@gmail.com>
>
> In the nv04_update_arb() function, MClk and NVClk are passed to
> nv04_calc_arb() or nv10_calc_arb(), where they are used as divisors.
> MClk and NVClk are calculated using nouveau_hw_get_clock(), which, via
> nouveau_hw_pllvals_to_clk(), can return 0, resulting in division by 0.
>
> The result of nouveau_hw_get_pllvals() in the nouveau_hw_get_clock()
> function can also return -ENOENT, which is not checked anywhere.
>
> Fix all this by adding a check.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
> Signed-off-by: Mark Bulatov <ms.bulatov7@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> index 1d3542d6006b..2f59b8739fc1 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> @@ -202,6 +202,9 @@ nv04_update_arb(struct drm_device *dev, int VClk, int bpp,
>         uint32_t cfg1 = nvif_rd32(device, NV04_PFB_CFG1);
>         struct pci_dev *pdev = to_pci_dev(dev->dev);
>
> +       if (MClk <= 0 || NVClk <= 0)
> +               return;
> +
>         sim_data.pclk_khz = VClk;
>         sim_data.mclk_khz = MClk;
>         sim_data.nvclk_khz = NVClk;
> --
> 2.39.5
>
