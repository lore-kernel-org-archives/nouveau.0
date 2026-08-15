Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25093C5AD5A
	for <nouveau@archiver.kernel.org>; Sat, 15 Aug 2026 19:54:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 73DCB10E617;
	Sat, 15 Aug 2026 19:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BgV51mD8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C0B5C4783F;
	Sat, 15 Aug 2026 19:38:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786822688;
 b=xr3xHNk0DtWecTtLnDiIUMYaksGI4+7pciYULR4ijba8o1rmIs19rX2/6xiUeYnpBGsuN
 dRheu7XU3OFlT1+6v+Ael23LpUR9pZ8rN62DMogyObZ3VoOQuGVy3L0yMU1nb31bKq0OQEj
 Rz7NcQpbQYPiYZHF9fc0DzapKgcViuHTzQ/r+qinqtJ3dMz4OI5Ym2fBURV7AWhcRuZmu9i
 aRbVgNoQ6EOAumHIB5KLfeg8hUfWe9XmeG3+a+vqBhR1wSdeOYP3pHf88NXUO4HRgIySuY/
 oRdlQK59iFJNdLEboEDHBqNVGzBgC7QhOX+y6Y5TXxRZ8qDXwvX4CFKXZqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786822688; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XxZBcoNm0rPU1Ur89x0ojWr5QvTqSdgFT80aSFgKz/A=;
 b=D3u0IhubE7FfAC+9ra8zglNN4PRWddu0l8G9nPOgdakazWYW6tmT3LP9OuVp3Z6R547EI
 ngD0+Ftlarxuex5YGyJlJJf/b24/EmEby3ot2jH36nFzruy16XSoVYUCX98uqHoBnoBtuFq
 dHHK2w8Vp+lV2pYi0NShc7TBYNtnKySOI8m3TssFpuTVN0FJhoZUT469oIPEUVbUdmOzXBq
 LJzybR/aMldUJhSVb53hs+AnE+eE3G4MMHGJybnFn1GL5bdwdZhZGZnBhe3W3+jGSO2IBWh
 s5F+AtgRH1Jnikn/IBNS4346mU9uOgqH0Jg4rbOwlZJm2bLgEIz5aAmogu6w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 23015477BA
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 19:38:05 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A4B9810E606
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 19:54:29 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47f502ff678so247191f8f.0
        for <nouveau@lists.freedesktop.org>;
 Sat, 15 Aug 2026 12:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786823668; x=1787428468;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxZBcoNm0rPU1Ur89x0ojWr5QvTqSdgFT80aSFgKz/A=;
        b=BgV51mD8/ce9yzqQno+LijQc8t9FUttI6NtvfYbBFVYF3UaohlHjxgb8KExnPdzvx2
         65wjXG0DFjODkCzj0FjROzHXS7jC5SNtmx8ZDaLI6Cn16DZ6KYvWD8KLclXr3Ty26U+I
         4mvkO169LA8gMfI3N7I6CVw7hvs3izIdByVLyJ2+D2qiXCQSoqi5G87fCqXN32IJZ0Jl
         sQ4g0SjEBI+jn5TY4MWvElVsObMyaBx0ji1U7s6W9KTibaOcgtPxwnUnuojFa119b0ig
         soAPA3L253Z0URofSknCLABGeVu7L15wDJW9QFKuoRj131SpseoeUa/KsyMd8gKSkhWq
         DUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786823668; x=1787428468;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxZBcoNm0rPU1Ur89x0ojWr5QvTqSdgFT80aSFgKz/A=;
        b=l7JKsyjH7yIvC7Dp5kw8RRy/mh7gtIGAeY5+L6otQ5brLseoLUYjluxZSWmncCoD5O
         mSJwpgzzjrcEHbMqA/VU7BvE4dPnpuXJC6K1wKoOiQvKiRyZYWr5WqRY+0Am44Bn0lqL
         HvWL891JApR3gLe5XRZtLisxcfA/Ttfqo51ewgY2oUIJVD65ZXOLZtt63y/WLsij5dx2
         zlK1MBtouTdr2hYWViVthH5QmQxa5VFm6ZvPUkdsqoIqk/5V4pdk5ds/W7eO6bbTc2m2
         2BoXJ6qowKDcFjdHNI1Us720pnq9LoEhdtVdz/HjFwBmGEdWwvs49QoErB60Lm08cXMA
         3VpA==
X-Gm-Message-State: AOJu0Ywfg0UCA0txYqPPfhBy37vopRtylu0g7kTtsgOFi9gwgv+SMWxG
	iWkGOVwJAyM9JlGf7IgqE8LibZiCUdWGOFKsj634QscQ6DxsaNSfaSfGWjDJ4xBu
X-Gm-Gg: AR+sD10P/ZpxYZqIDy+E9e04+p9NpMqwLkh/S5QSkKanbmjtTlMexAsXT2zgLj3wmMm
	WEUjiQf0aDr1LW75hoLbu7pZgGEQjhLeLCFrFXdDFhh90/wB0xLPnwwyjWLry0mUmdDaEZqSrWC
	kFqGFc+Qsirx+e+/ffxkkTp/PbhbJSv2XyfnOCsQ4L0eLDd8p8gyrghmlX0PIHehyhNYHiOFg49
	PeD4h8KjWLWKVlJaVfVlnnIPrXP+iTzUN6OGdvkgZ+z9TTEHK2IouT+y8QuPBi3jSVCpXxThpHT
	5dHHgurcZ5M4RrG9gyv/B8QwIph4uUoWh9BnDCSJ+4smJkLftpEzCVWh0k8pY+6my4e3W65zEcY
	BmzfSaiTIqA30XtM6VC+3hZV4FlWcT3Vc4zNKZu0HqzkcWLrMULVMA7vZUBUwkN1Ijstlxt1w8e
	2qvGmHQuE0blCawB0WV+1qEqZ30fniMxRA58RtdJomt3CTa5Ee7c1+L0ydGwYCtj/lU73Q8b7tD
	8rxo/o/9rpeKLaL6jjqfDc+Fj8UAbpNnChr6Skxaw==
X-Received: by 2002:a05:600c:1385:b0:496:c249:ddb1 with SMTP id
 5b1f17b1804b1-499879759bbmr105883175e9.4.1786823667999;
        Sat, 15 Aug 2026 12:54:27 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899bff2csm133743775e9.7.2026.08.15.12.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 12:54:27 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: 
 [PATCH 2/3] drm/nouveau: cancel the DP IRQ work before freeing the connector
Date: Sat, 15 Aug 2026 21:54:20 +0200
Message-ID: <178682366002.3748010.4096452389040554615@gmail.com>
X-Mailer: python-smtplib
In-Reply-To: <178682366001.3748010.7798811159846779765@gmail.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID-Hash: 54K7K7SJC4GEHFRR2OXGX5WNWVQARB4N
X-Message-ID-Hash: 54K7K7SJC4GEHFRR2OXGX5WNWVQARB4N
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/54K7K7SJC4GEHFRR2OXGX5WNWVQARB4N/>
Archived-At: 
 <https://lore.freedesktop.org/178682366002.3748010.4096452389040554615@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

nouveau_connector_destroy() tears the two nvif events down and then
frees the connector, but never cancels the work the IRQ event queues:

	nvif_event_dtor(&nv_connector->irq);
	nvif_event_dtor(&nv_connector->hpd);
	kfree(nv_connector->edid);
	...
	kfree(connector);

nouveau_connector_irq() queues that work unconditionally:

	schedule_work(&nv_connector->irq_work);
	return NVIF_EVENT_KEEP;

A DP IRQ arriving just before nvif_event_dtor() therefore leaves
nv_connector->irq_work on the system queue past the kfree(). When it
runs, nouveau_dp_irq() derives both nv_connector and connector from the
work_struct and dereferences them, and goes on to take
outp->dp.hpd_irq_lock.

There is no cancel_work_sync() for irq_work anywhere in the driver, so
nothing else covers this. Add it after the event teardown, where no
further work can be queued, and before anything is freed.

Reported by the Sashiko review bot as a pre-existing issue, in its review
of an earlier nv04 FIFO series of mine, and confirmed against the source.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260812231330.705425-1-mczernohous@gmail.com?part=1
Fixes: 773eb04d14a1 ("drm/nouveau/disp: expose conn event class")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index b0b0ad9a0c24..e49dcaa6d210 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -397,6 +397,7 @@ nouveau_connector_destroy(struct drm_connector *connector)
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	nvif_event_dtor(&nv_connector->irq);
 	nvif_event_dtor(&nv_connector->hpd);
+	cancel_work_sync(&nv_connector->irq_work);
 	kfree(nv_connector->edid);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
-- 
2.54.0

