Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9E5C5B56A
	for <nouveau@archiver.kernel.org>; Wed, 12 Aug 2026 15:00:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8726210F05D;
	Wed, 12 Aug 2026 15:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mI0FnOKb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EFFD5476FE;
	Wed, 12 Aug 2026 14:44:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786545866;
 b=zE/vdh8RbDCkQ1tZLTsfNwsMLL2StsueOfN64/yR7pLTyVembXoIy+xWGxm5DfZ2TBx+A
 tsvo4LRCLR+6454X/S0MClrCwGpDo4oevny1lk+slIIGx0WcWA1iZ22s2NgBwctUzGJ3vBi
 AkHLqaNLSfqgfiVDHU3+HDw9QXROnXuDqWTO4vXkJsuGsPw43VIEEV1N6rPT1ZhG6ioRsV0
 s4ilKoD6Mh5Ll5Uzs1hbDkzaPi7ZkUiq09CLDp7s4vAIdoOEH5lc4m8xQp3fqhWPlfhEyEn
 BAqrjyZ6QC7kwx0kJ+MPqDGqGNXSNG/ejwimWSW9jh02iZsmYga3Q6ASl7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786545866; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gMOizgIP9BJQteM6A8h6tNJgWMELd3MPmjUznwQtZHY=;
 b=aHLJFHqxcC7S+wa0fIzExCMuxpFwz9dhSxDuTRBAwIM9btFy4W5ZfJ8eBVIStlX6xR8ab
 h4wRnvO3klNG976HfmQWRzR6Lp1D6loe1s2aRrZVcFHXOGO3sw2JqUn1mOA724XIoKyaHGw
 mQvfQIB/h6njNHOwKgm7vnXY4OQ4Zxy6kErq4dkh/joDTRUuoFnKjeZ2AFi/LJ3fEmGsyBD
 S7+tflyHaRIEtxzCg52Ep3QokUO7coMEQjRBmGr5kWRj5GtMIfHLm1NzxQrAV2S9JLu9WAj
 IZWSBxusCnWrGLIXlzN83Jac73pjERtOmFa7K5j4M99mnws7DMjfqc1zw2nw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CE60245261
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 14:44:24 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4542210F05D
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 15:00:42 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-38f620399a0so1065289a91.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 12 Aug 2026 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786546842; x=1787151642;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMOizgIP9BJQteM6A8h6tNJgWMELd3MPmjUznwQtZHY=;
        b=mI0FnOKbbxsW1oFWXBiz1MtSijmXwyf7IHgrNO1nP4Wgl9uG+fARnlA9+NNGqszwfs
         IiTo40/ne9q3Dwg6+5UosqF2QwJlY7v3DbRRALtYUYtObRPrr48sDu+B3TFJ8u0vk8VV
         +KEbqn+mrpTSR/LoLtT6nlPxvL9VRMKyelB7c9KgfUkLuMWueM2AX6jTf3rHdB14y2LP
         SyFRgfWlQiJMqz0H4HN/eL8gt66c2rlyLBCoFQySM0OUMDAd5UrDoJso24eGJ/ib11jY
         V2mXx/r+O4Ya5dJu2JJjg1Ac1mQP6gbZwapo5YdVLU5IWJegknYvdFx/m+mcZ3QFOE6P
         i+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546842; x=1787151642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMOizgIP9BJQteM6A8h6tNJgWMELd3MPmjUznwQtZHY=;
        b=RvaZkiBG+fDBXaocskrwKDO/6yJmKkbUe6cficZjdotsRfBZwUeT7G1TXYLNfoCZcT
         JbEzdel4GGhaRUAf50/anZR9lyukhDlDkrTdwJcrzylDiKXGASkz3bk7poGqhmRyh701
         IMcsS4VtTsg4XVVNcIWj3oAZNcnbEMV4zGjewSF0l7gt0Cf63zQy+D4isRJVgnPrf4nO
         gURY4JeXE5t7DiCyXyPJ7xYfFIO07wIz2zGG1NZb0JiD2ebjaXEmMofAsR68ID54ydP8
         XiY2wKoLnXtTbr+0Zfwh7Og6Oh/3BSC9vTykOcRML/aP2fwU7BjRRnx2P7LfDmgg4Bfs
         EVow==
X-Forwarded-Encrypted: i=1;
 AHgh+RqLmWsvLpEhsUrYcr9QwY5n1Q78r22xHgMv0wlEHWySatUNBPQILHQYiDplDGOZ7szChdy9SJHU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyewdNe2FQ7GhK3q7FuTZXF2eSu5ZFgEIzUEZstnrBs9m+sAfij
	73diHBVHt7C6LcnTDlaF3LqdXdirZWbzcxUIklAPQSqoG5Cw/d7uY2fi
X-Gm-Gg: AR+sD105wdapoAfK3Dc2qIq0bOA5OxYX4bH9l8UMWKY2TXWVkw5TDBrgIQyGOVrD/7E
	DYlHqffImTXo3i7Tj58+MqX9TBFDkdQZmOFYtwvCUOkL6ZIgy3AjwOnWO3+zO2I0vCUWXLxubLe
	+BVmh8NC3xYRA2qnecIAJG8ysYfFKxWpvLSoJwA2TGCZhIN0wVGuxNtys5/6PmIsP/wXv3z8ASh
	rKo+tY4PxVoTTzdOp9lGTwucHgOadyp1R0TKieqWe5BFVkx5i08sus2vjssZE/NCTv2i1pYc811
	7595vi03edp2sr7AeAuQdzP4sQB5TFIqkK2N8aoMVEBdX/tRvcq21uA0tCE5dSnZ43Fvxy1KqC5
	7zfbkU26WwGmTv5L7HDftAYaJ6oAQr13LOPI5m8kKV4PANc2baZIzHBjvW/tu3GQXdv6ZLC8Qsa
	EyvIhSMsLSOlipKPesMM5amnVzLqZZJb7Rg9cNnj7QYC1pTSyNnQmxsZ3BW6o=
X-Received: by 2002:a17:90a:dfce:b0:38e:c7b0:84ad with SMTP id
 98e67ed59e1d1-39300fe8cb7mr6781997a91.0.1786546841182;
        Wed, 12 Aug 2026 08:00:41 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-392f935f73csm3896491a91.6.2026.08.12.08.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:00:40 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Wed, 12 Aug 2026 23:00:05 +0800
Subject: [PATCH 2/2] drm/nouveau: prevent NULL deref of gr in
 GETPARAM_GRAPH_UNITS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-2-7e057f6aeba0@gmail.com>
References: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com>
In-Reply-To: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786546828; l=1659;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=DHIfdikRkZ3mKShlh/+V7tgkqvRSlEckIAj2mwx7osQ=;
 b=HXxJzWcsyd2sKVHR1T+erLcdLCL/gkjA+9ra5ROLCdEp3ElbPtmAtHX0Jsk42Eej69Bbe3s1z
 JWrY3tlQYitDwdc3sM1wMfPD79z2pvggbmWqZhaxh2KZjHZR0tFAaXe
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
Message-ID-Hash: D5YQWWQFDMLL2RHCVKHOFASS3TTK3YK2
X-Message-ID-Hash: D5YQWWQFDMLL2RHCVKHOFASS3TTK3YK2
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D5YQWWQFDMLL2RHCVKHOFASS3TTK3YK2/>
Archived-At: 
 <https://lore.freedesktop.org/20260812-nouveau-nvkm-absent-subdev-null-deref-v1-2-7e057f6aeba0@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_abi16_ioctl_getparam() fetches the graphics engine with
gr = nvxx_gr(drm) (i.e. drm->nvkm->gr) and, for the
NOUVEAU_GETPARAM_GRAPH_UNITS parameter, passes it straight to
nvkm_gr_units(), which dereferences gr->func with no NULL check.

When graphics-engine construction returns -ENODEV, NVKM treats it as an
optional absent engine: the NVKM_LAYOUT_ONCE device constructor deletes
the subdevice, leaves device->gr == NULL and continues probing, and
Nouveau still registers a render node. An unprivileged client holding a
/dev/dri/renderD* fd can then issue DRM_IOCTL_NOUVEAU_GETPARAM with
NOUVEAU_GETPARAM_GRAPH_UNITS and oops the kernel on the NULL gr.

Report 0 units when gr is absent. This matches nvkm_gr_units() itself,
which already returns 0 when the engine exposes no units callback.

Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 291203121f0c..dd3f8d386377 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -306,7 +306,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 		getparam->value = 1;
 		break;
 	case NOUVEAU_GETPARAM_GRAPH_UNITS:
-		getparam->value = nvkm_gr_units(gr);
+		getparam->value = gr ? nvkm_gr_units(gr) : 0;
 		break;
 	case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
 		int ib_max = getparam_dma_ib_max(device);

-- 
2.34.1

