Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37843606A32C
	for <nouveau@archiver.kernel.org>; Tue,  3 Nov 2026 22:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vNHssJDq
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC0910E8BF;
	Tue,  3 Nov 2026 22:15:41 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 24BE248CFA;
	Tue,  3 Nov 2026 21:56:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793742979;
 b=eiquCjHTb6gK9PJ/rdWzjY187cw1fd5mPZcnhkXwW882cRI9MoWANsfEbrFa2Pwxoa7CW
 B9RU5pEos6a2FFV7RPrMY0tlnn0jT7dJpI546JMiN1ohJ7VWdr3vYaA0eJEi4DaLdoT6EJL
 np4yaoI5xCtZde9YNJ3jXleaJrE9V+RAF9TG9y2AtBn7McPtDkPw2oatJjXFKDny3TbWAvV
 noJzcmi9DZpDuLcwlKGWdMqG0UKLfTguh/Y9efTAVG/adnqv3lH6Sz0aqjp9lTcE+7H8Xdn
 /fXe4qlaClHqzyUKS/yOFfc/FlbiA8w+YFwaQUXoG0KhPi4MF42Cle7xF+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793742979; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=J2v88Y67fGvqGhiKg//IWeUpnVROIgGcFJFgELfIJIY=;
 b=sWyhf+VwmDXUoNzRQMDa9jO3JfgsQjWEpI+IoKV6yABq82Cva3ddeF/WoZMa4PbIrTOsV
 DV3TX7f3S9WjL45Yqa022ue58BCDHobj2zM1jw4Fu1sJ8+VgyoBehHF7E7YIZ7xii7ycenE
 wSa7SNDM6eDwI5wOPCzrcSKXzDmV58zIaelh0DyGVgJiRPetD8z1iJHLB29C2G0WRTYG+XR
 soKcuCa3Dxt/9o/srQXfKXtUBPbttoeHdICBh6cwJY/prshIxWHSXUo3V2ueii13p7Vs+BV
 MU/a1lnoVd5pU7MkOk40I18/6MfV+DsiUcBWycxoB/JzAtRnn0C2mOLCK30w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4AD2C48A90
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 21:56:15 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD8C10E357
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 22:15:32 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-8a06b436dffso46745b3a.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Nov 2026 14:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744131; x=1794348931;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J2v88Y67fGvqGhiKg//IWeUpnVROIgGcFJFgELfIJIY=;
        b=vNHssJDqlD+deeJKmXerxaZs1XLqk07QNPW2jqiBwEtOcHPquW8l0+s7olv/hJrtb8
         dB2KGQJjVKqOrPgl8zii+H17D6S8eu7u0B7L5HfW00SZOtL4wmrSubTKaKsc5j8/hHmN
         L+ouwL8Mdr4pTRaavArZWTjGjcKyIDLcFGtDVdueZ+gkTXI5BVjtOCP0Q0PZySO5Mbxs
         XKkKepe7fZiJVHaaI98UhqiXZZ5lI6apFKeorau9MaPAOntKG/bVzQh4YWTkn4779RjI
         /CHu8h2BQH834i8KNA4PfjVO6QrGxDmq3h6OR4xNghDBMZgQo/DcYxPAiU+QvlMIeaPZ
         0tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744131; x=1794348931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J2v88Y67fGvqGhiKg//IWeUpnVROIgGcFJFgELfIJIY=;
        b=zoxIaSZC8+BuJSapb08rnbmJ/c9vlDNgRIwTKVD5xsw7tUvGFOyRFraO4Zg1WDTPdn
         XCN9ikCIY5YLTTrO3uyLk7e01wTvPKN/RGK4WJJy+UzPCQ8g66UJb85KIG9A5piGF+Ok
         MwDq2Y894EhnFOAvo4Er63Sy1ElH1UwSl4aOVfhJ3+chEhMmN0Boa9udYNdBREnCxhgy
         Rqt8CI9bN5jtTJxUBA53Yriibtml1jdYLXgZGeOUiTrAwMTT4zIm/8fjFURSCd6FYf5/
         0Lvyo47Xgh0N306G57RbB8X0SZkeacVRm0IfbwXP04YGIlKpYhx4ePTso4OB07HcLSOF
         jMpA==
X-Gm-Message-State: APuU4Z+bcNnyMwafGA4iEQqThvD3MiVYA/nITFZZXqsMHEXAVM/zkrfL
	1+GVsPhKS6apGQU+8YkjqnW9k7NgER+EszFoI44WkluR4z62ttByVh92OqMj/Q==
X-Gm-Gg: AYBFou3Zm4eoKZ2EXXx4xynBJZeixQ4brP1aw203m0d9YwUDMhG5kQrtKiIYE4KofpA
	v9HCpKdD+1clju2naqV8r2KDCg4kWP1bc1HQWlpL045hLUNqo7/Clre6FwZyUtFC2RozT/Ln5P5
	z9nBoC4hJFROVB1HlvZzRRywJBbk8Vf7QusMx1G87H84COY2TbCOdNhDmVxpA2EaTiEBKLeQ/7n
	5irXHgn203r7nYqebp1j8MGnOupgLJPaCXaJSjMbNUGb7p+OW6LUfUv8m8a2PwHu4kZsu92ZWlq
	fuGsQ8zkVur6KIdQ7TgpH/XUjPTAmGh6xi3GsAenZ6XxZfYfLhvj7wezwuCz3yp/fIa30GGS57z
	qvMTVjeVsR0ICesy5t/NnEdE5TCF7TZcLuThDGl56E+b3aVFfkU6Ti86vlu1lX6h7urvjXd9x55
	00Crhyzdz4rB+ART/TFczpCEVvgbxlzP6RnUCYYbtZU7JZu62AV6n8vsEREqK5shNBRD6sL/a4O
	mc7cyZ4vT/aT6n9A/7Ivj1s9sYNUNpI4SCDgA6jFABWJFfS0eZImD7fS+gFQXZ7X2FrSQbC7W0k
	/LdY734+c+5knLZhAj6ywKq1tPJ1aIJv5H55HK3NEkVIt6i5TAnt+TTnsx63xbl4gKJDusRKguq
	ZUpQww9Q1kF036oB+yAW8j9COTF5KvMKgGu650L3HTVArnKy82SxgLyYx8M6sO7tw3dnjcYrZ3H
	HPsQ==
X-Received: by 2002:a05:6a00:4395:b0:89d:a947:9d58 with SMTP id
 d2e1a72fcca58-8a9beb64f99mr10595946b3a.25.1793744131486;
        Tue, 03 Nov 2026 14:15:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8b097fe1076sm143036b3a.3.2026.11.03.14.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:15:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/fifo: map Kepler video engine contexts
 non-privileged
Date: Tue,  3 Nov 2026 14:15:29 -0800
Message-ID: <20261103221529.585436-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 53XU5P64Y46YVHEGECF2XUZTYCJZXJOD
X-Message-ID-Hash: 53XU5P64Y46YVHEGECF2XUZTYCJZXJOD
X-MailFrom: rosenp@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/53XU5P64Y46YVHEGECF2XUZTYCJZXJOD/>
Archived-At: 
 <https://lore.freedesktop.org/20261103221529.585436-1-rosenp@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the engine context rework, gk104_ectx_ctor() maps every engine
context into the channel's VMM as a privileged page.  The MSVLD,
MSPDEC and MSPPP falcons on Kepler fetch their context with
non-privileged requests, so the first method sent to any of them
faults and the channel is killed:

  fifo: fault 00 [READ] at 0000000001050000 engine 10 [MSVLD] client 0d [HUB/MSVLD] reason 05 [PRIV_VIOLATION] on channel 9
  fifo: fault 00 [READ] at 0000000001051000 engine 14 [MSPDEC] client 0b [HUB/MSPDEC] reason 05 [PRIV_VIOLATION] on channel 10
  fifo: fault 00 [READ] at 0000000001052000 engine 11 [MSPPP] client 0c [HUB/MSPPP] reason 05 [PRIV_VIOLATION] on channel 11

Before the rework, gk104_fifo_gpfifo_engine_ctor() mapped engine
contexts without the privileged bit.  Restore that for the three video
engines, and keep the privileged mapping for everything else.

Fixes: 8ab849d6dd4c ("drm/nouveau/fifo: add new engine context handling")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
index 5655eda52a7b..912eb6c3a13d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -180,6 +180,19 @@ gk104_ectx_ctor(struct nvkm_engn *engn, struct nvkm_vctx *vctx)
 	struct gf100_vmm_map_v0 args = { .priv = 1 };
 	int ret;
 
+	/* The video falcons access their context with non-privileged
+	 * requests, and fault with PRIV_VIOLATION on a privileged mapping.
+	 */
+	switch (engn->engine->subdev.type) {
+	case NVKM_ENGINE_MSVLD:
+	case NVKM_ENGINE_MSPDEC:
+	case NVKM_ENGINE_MSPPP:
+		args.priv = 0;
+		break;
+	default:
+		break;
+	}
+
 	ret = nvkm_vmm_get(vctx->vmm, 12, vctx->inst->size, &vctx->vma);
 	if (ret)
 		return ret;
-- 
2.56.0

