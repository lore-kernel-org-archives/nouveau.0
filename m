Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D89606A320
	for <nouveau@archiver.kernel.org>; Thu, 19 Nov 2026 21:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sx+XLhk7
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 00E17112682;
	Thu, 19 Nov 2026 21:26:49 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BE7864048C;
	Thu, 19 Nov 2026 21:26:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795123604;
 b=HbUOkldx35ck794kjaVjT2a3bVckH3kq3jf1JlfalRtTIwe4ITaKteN/rF0YbSaBQaaUR
 sof1tf638dV/4s8GQUsOMiPw3vaUoI8CU9aEEOanu7Pl+1b18ShK21th7ohympTAPhVporB
 OWoEqRGYwatLzpMUPR3hFnN+kUjfpsbfDURaMaytJjikFsdAEdRksQLBVFsjiyYddxfCQrZ
 TJlTKVkIii97/zVJSs7zMjqdNPrvICCgoNi8Wk/hMv1kWRK6Mxw5B8lLCcURUUv8yVv8jjC
 fKcuTr80PWEqF8Gtr5USNGt6qBAuGein4sHO/SDMWhRgHObWSGKbezQUMU1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795123604; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GpzYE3Jc1he50CMWHOLwrLBE02eLthVYkqvqGjNMGAg=;
 b=WoYtpQPvisEg9OraB9hcZzTh2zVqYU0QWkgONQ9KI1mbOw1fn3vffZi++CywogYdMxnym
 mIuRqnNEo6SsHLydnqAq31/vh998LtHSCKT1v2IHDgb1gnGDL301uV6FMeNyXvvRGOdJ/hL
 dP0TnYCvYGGjraozEqHRzAErTM7xanHJbB/nePMLjsQXr47Wim2pianZxIaxI6RSqEVIetm
 M18RCBeOQaapg8Zt1qeqvuDROTiZDraAgGiAIzr9ESHvGCZRpBjOGICh0gnFo87eJtEVCqo
 KzbqsugSQE+QPPOcfl5HNCL1dVAVQTvdgIFyVU3+T7gH0TVpnaocb2UnYTyA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
 arc=none;
 dmarc=pass header.from=gmail.com policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B5CE840404
	for <nouveau@lists.freedesktop.org>; Thu, 19 Nov 2026 21:26:40 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80410E214
	for <nouveau@lists.freedesktop.org>; Thu, 19 Nov 2026 21:26:35 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-8b0ca1ebc8bso2038247b3.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Nov 2026 13:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123594; x=1795728394;
 darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GpzYE3Jc1he50CMWHOLwrLBE02eLthVYkqvqGjNMGAg=;
        b=Sx+XLhk7HlCUMmEleLiUY8wo9TvdzX0q8AIGv52ZS3K5LtIl7o9YovzvQsNFbhqvcL
         2hXDync568ktPOYcne7/3kyqae7aAlK4YLH1zJ8h3Gt5eyoAl9gtfSKJOCV0GgCt6CR8
         SDmWfypq2RPChDY1DFHIF72DqekrAsLh9z0C6Xm4tyCj46gdp4sJ6Obly+HllKd1K6ti
         wmWgUx6aJiBKDQlvqqsLV7rlXh4TTT1TGUfaPjfLBSIZOCQDGKWrQ2WU6LPD9OxljMg2
         87DPsNKG+w/8RS8VyI+odHJfopBqcYCAH2hfbrI0t1t4gHDcjL4DPu2KBlp0z9a9rnF1
         tNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123594; x=1795728394;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GpzYE3Jc1he50CMWHOLwrLBE02eLthVYkqvqGjNMGAg=;
        b=DPWwwa2xzs4w724yAA2eNjKDRxMmqA9SyFirY9B/5TZYvB+C98Ydo+rfeRVwVp8TjE
         IRnyxoa1MaUh/iJYGzof7gy+EfovTg3Qs4GWNYNTqTPSHOiXTu428O/mQBIKRO+iUGRC
         MSYfe/vuISRvKn7sMRCtSsozsQ0VOAIsficVp9wIzf+JKapUeiAt4ZywK7k1FAxPXIIH
         mBTqKJORhbefu8uJDaBbr7kN5LGzyLr2XGQvQ4Ze70BFaDW3vq3uXxEicEsS/SRpvdKr
         x6VnmriD8+JWzrLtTYuU1N/Mn0dpzHk8JGCt6Tv8orgnnM+2qA8jvtRJOz9OQnmjM0hs
         5rXQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFqAlx6mUhUhZqMU4M4WW6deJjHe9IHATllGdou1Ir5Dh1AU9xFKTs4DCLQBGU9Zk3sw7icU+Wh@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+06/liS+8W44pPeXU6xAt4SxMBtsUpH4B0mGXVKtF2u7ES+8Yf
	Ppwt5sgIg1Z28rurWUKGEaG1LUxEM9B9+YBs5ZA91MwG/ZvuAPAfQajd
X-Gm-Gg: AZFdTZeMiEQgHS4snpxQgfa81JZPO8GEpEfMBFg80TbrjKaZVh4xsVKzK6qoYQ5YDdL
	StBMlCWPr2VGOv/yhUnSuoUeukPJDoANtTw1Pg4ta5lcJUU0ufuZExRAA+pPDrajYEYz7R92K20
	gfaudllc4zkOX3AUJB5bUPSHtuhTQH7pj7JF+7vK/lPaWkLhcKtoakcBYMO1J6Q6HzVa8T5ZJxa
	RKoN/zcJldnAFs0y4ONQQLdwVyjPPVK8+6p0KCWXisnSF2XvST1IGcURsL4zV3l6CmgZrIy7u4w
	kaBhazlYsFzzuRToR1+BNlzJ2SDlliVdNwoEZg3Squ9bxRiy3j6euw/O9ZIS3Uwk8yo/EPGY6Cj
	dSGDuK+2FvFXy3ES0FpnxaeRy+6nDoFglg1ZNRfup/gAkhCfwp6MLdXDGYDVpv9su3dJN3nLdEC
	sNkgSv0pwnpW9UaKnWATK2DztScmUwAceKGss2S0CrfhAPf3sflOLe3zBGVv/2M+CZnyRdR2/It
	RsfnIbQKUINsjdaNVLfrPaUGO4VjnvToV7gGxL5VbeOU/zaCvx5kQeYcjN0wKRqALYw3MBj8C2S
	QW+tJOtOj7h0oAq2yEbwmP58tcKceR/rpBggbMvifyr+Ls6SqZF2jff/DSWBJFP+HdXBCZpeCz5
	kR4mkqCoRT7s0W5eIRzAmSQmwjblYlTvB/Bywt8IDjQ==
X-Received: by 2002:a05:690c:3707:b0:8b4:e17f:f7f3 with SMTP id
 00721157ae682-8b52045732fmr5288457b3.22.1795123594166;
        Thu, 19 Nov 2026 13:26:34 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b5202bef08sm5583527b3.20.2026.11.19.13.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:26:33 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/2] drm/nouveau/dispnv04: Support PMU sleep on the iMac G4
Date: Thu, 19 Nov 2026 16:26:31 -0500
Message-Id: <20261119-nouveau-pmac-sleep-v1-0-360c08654a25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MOwqAMBBF0a3I1A6Y4AfdiljE+NQBjSFBEcS9G
 yxPce9DEUEQqcseCrgkyuESVJ6RXY1bwDIlky50rZRq2R3nBXOy343luAGebVWiqPVoNRpKoQ+
 Y5f6n/fC+H4tE3q1kAAAA
X-Change-ID: 20261119-nouveau-pmac-sleep-c54e062bc2e7
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=H47g+gZOtNzRvfYRZiTfxTdPkEiWb/7zemgBeHo4gRg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+Z3Y8nmwbZhz84vhDxks6a7K7SmJ+C61dciotVzqw3
 vTCbh6hjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmpD8jw8Gwt5anuo
 /u9fhurCLupPTiZugO7YmvNdgOf/x8ePX1h/8YGe5e/zZ52d/b52c1JTn7LWo7wy+wRUlhFY/kz
 mMzPF/NvMsEAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A
Message-ID-Hash: V6MMDGKSNWGD6UBIQTJGP46LPLDSRM4O
X-Message-ID-Hash: V6MMDGKSNWGD6UBIQTJGP46LPLDSRM4O
X-MailFrom: mattst88@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Matt Turner <mattst88@gmail.com>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V6MMDGKSNWGD6UBIQTJGP46LPLDSRM4O/>
Archived-At: 
 <https://lore.freedesktop.org/20261119-nouveau-pmac-sleep-v1-0-360c08654a25@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With nouveau, the iMac G4 (PowerMac6,1, NV34M) only offers s2idle, and
when PMU sleep is forced on, the panel stays dark after resume.

The dark panel happens because the VBIOS init tables, which nouveau
runs on every resume, reset the backlight PWM that Open Firmware set
up. Patch 1 saves and restores it.

PMU sleep is missing because boards flagged PMAC_MB_MAY_SLEEP need the
video driver to call PMAC_FTR_DEVICE_CAN_WAKE, as radeonfb and
aty128fb do. Patch 2 makes that call for the NV34M.

With CONFIG_STRICT_KERNEL_RWX=y, PMU sleep also needs "powerpc/powermac:
Fix low_sleep_handler with STRICT_KERNEL_RWX", which goes through the
powerpc tree. The testing here included it.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (2):
      drm/nouveau/dispnv04: Restore Apple backlight PWM on resume
      drm/nouveau/dispnv04: Allow PMU sleep on iMac G4 with NV34M

 drivers/gpu/drm/nouveau/dispnv04/dfp.c  |  6 +----
 drivers/gpu/drm/nouveau/dispnv04/disp.c | 41 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv04/disp.h |  2 ++
 3 files changed, 44 insertions(+), 5 deletions(-)
---
base-commit: 8e2afcd2b57990465f132367fd8fdc2e55c1adad
change-id: 20261119-nouveau-pmac-sleep-c54e062bc2e7

Best regards,
--  
Matt Turner <mattst88@gmail.com>

