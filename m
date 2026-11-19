Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D93606A324
	for <nouveau@archiver.kernel.org>; Thu, 19 Nov 2026 17:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dE2bLvck
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DC16111267B;
	Thu, 19 Nov 2026 17:04:26 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 601E74051D;
	Thu, 19 Nov 2026 17:04:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795107859;
 b=GubU0tcGj0gkuUnyhIDPgKJINsUxr5nuUjy5NqDXwBH17Rfcvdgc7d+uHPbdM2RAT9lQ0
 f+ZEn673uw0QkiidOT9zVFFoDoLQ86dm5Y0595ydHkHuylVD3zvOcaXHtjwiYbnlqXTS/tx
 ggeTSXzDsJJ4yNErRaeE6o7CoY10y055nlJ04RiRrv55/z30eEL/iSilp5bMt4aMOPQ5MrB
 4+coUzGDVjTMF1sasDPgSoZQnkGoBe2PFSzJKuTAisSFn061rfxDrZQwdEInuAA6Qg9iXtL
 84INcyrlSIwuDCH7Z6elsh5ChNfsLz6ay3P73JF/sAp7JVHgDVVZsZXnF9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795107859; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WHGlKM/TYaoTSSlrFQblz+QKKasbM+5dQbEhB2u9x0w=;
 b=Ey6m4eMdFghGz6awSA+i7xtj18icljKc3us7OXqrR6zg3llXuSWw06Cu+lokz+L35WfxK
 7kKiyfKiE6IBQseAnmok6TAaCQN7PVUy2wFqthNhdSGok2AhZUqnC5sEdGTXqCT4d6LzPT7
 r2+bBuwFFqIAGkK5qCFUukp/Nin5qUBEcCZuPKAh6UhqY0EzU07Tj9N3h2qNCzzJHqqHaZ6
 bzQYZjbObAIFG0ZTWyGHhCUBXifhfdYQAIlGTN3vxhH8Yg/ukOCU3IQFurEqs2kvKMHJls6
 BXHET1LhR+vzB+MaC7aqZ/eUWioGbZmfWhg4e5eJwIM1rc4Cm/SI9emDWobg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
 arc=none;
 dmarc=pass header.from=google.com policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 186D540401
	for <nouveau@lists.freedesktop.org>; Thu, 19 Nov 2026 17:04:16 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C96210F081
	for <nouveau@lists.freedesktop.org>; Thu, 19 Nov 2026 17:04:11 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-5735cd94235so42998b6e.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Nov 2026 09:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107850; x=1795712650;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHGlKM/TYaoTSSlrFQblz+QKKasbM+5dQbEhB2u9x0w=;
        b=dE2bLvck20Doz8NsF8LRMNEyMgs8Pb19LQo47Y6emBjYN15VO0J8NJ2BHJOcZeAP7x
         QYoyijZE1EnxEA6U4U0ZVs59aYGwGNm8QizZJ/Zvva7El1yk2w8FPZqnMz/19YwVatd+
         4H6HSoMWzwGalS8Rtmc2hhyZe1qhXMO7duA/w0b4UtcYFkno0RVMlCBAwOCJiGKm6/Kp
         XCOZWzjgfxQvH1WoFZCg9QFeKKQHaw8v3PmEc9npDoYMcuR1jN3KieyHq/qI2ACUTqsB
         yxrd1ptyj6zhsPu889/8+rqurQztdFGRHEjE4Dk3iJoD9vbfJAvS7tN5ZGtqv0T7HbPz
         K+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107850; x=1795712650;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHGlKM/TYaoTSSlrFQblz+QKKasbM+5dQbEhB2u9x0w=;
        b=2sP40BieBnBJ9t2arqAdHJAlfRUs243B3nFA7VLb1um1Zb4UvKIxLXU2k+oeJ8Xdsl
         cE+xT0PjSXCDAczJAk/wDTCepvMzfdsr3xk+qoqSFtsvcabiDIcWXEvKYMuXSlJtdFsp
         3ohG64BOaRHvQ104NT60cCNkLclAuJc+IyY0bq2zCc7z3ViAVTVRythMIVbUcdO6cXUj
         kNr+wJ363wKEkc++GbVpfd1sgaEF6DWPZueSvGTX0s78UALs9MmDenX1aUZw2H6FBlB8
         NTPBghfb45oK+SIjYxiOXbcaCmbDqxTJ7Z3Oq4VGgqgbQkG4oR+S/VVKk2b4WyBcbVoG
         cR4A==
X-Forwarded-Encrypted: i=1;
 AL+hErEuWuBOIi0Op/S95tdzJxR4t+rdQd0ezZHSkwurwb7FBcB/4/qe7Wki7H5tSJtSby/GRXR4iqCu@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/wRnGJNX5rJufhLBe9j3k9ftxw5/JoltTYv6vACsAeG7Iyaa5A
	D0BwE5Vmbowmgz57vZOEANpBEeYGeeUZTn05yLvBzczfau1H8YADK6NKxn765Ntax9+CbrUFRK2
	qF7MAIDg9YA==
X-Received: from ilbdx25-n2.prod.google.com
 ([2002:a05:6e02:4219:20b0:51a:af50:87cd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:23c2:b0:53c:8f0e:ee3e
 with SMTP id 5614622812f47-57a0b34690bmr545790b6e.36.1795107849735; Thu, 19
 Nov 2026 09:04:09 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:58 -0800
In-Reply-To: <cover.1795106937.git.irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <cover.1795106937.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: 
 <8b8db80fa775d701fc94bf9e4aa4b0cc577febf3.1795106937.git.irogers@google.com>
Subject: [PATCH 2/2] drm/nouveau/kms: Initialize primary_crc for RG CRC
 capture on GB20x
From: Ian Rogers <irogers@google.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: QD73UEV7VEYBU4NW62AUIEM2CK4UCBT6
X-Message-ID-Hash: QD73UEV7VEYBU4NW62AUIEM2CK4UCBT6
X-MailFrom: 
 3CSz_agcKB7wktqigtuiqqing.eqopqwxgcwnkuvu.htggfgumvqr.qti@flex--irogers.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QD73UEV7VEYBU4NW62AUIEM2CK4UCBT6/>
Archived-At: 
 <https://lore.freedesktop.org/8b8db80fa775d701fc94bf9e4aa4b0cc577febf3.1795106937.git.irogers@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In crcca7d_set_src(), selecting the "rg" CRC source passes
NV50_CRC_SOURCE_TYPE_RG, hitting the default case without initializing
primary_crc before packing it into HEAD_SET_CRC_CONTROL's PRIMARY_CRC
field.

Initialize primary_crc to NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_NONE
in the default branch, matching crcc37d_set_src() where RG CRC capture
leaves PRIMARY_CRC set to NONE.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/gpu/drm/nouveau/dispnv50/crcca7d.o
with LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on NVIDIA Blackwell (GB20x) hardware.

Fixes: 6cc6e08d4542 ("drm/nouveau/kms: add support for GB20x")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c b/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
index 912f59aebe87..02db81e5c8a3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
@@ -65,6 +65,7 @@ crcca7d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 		primary_crc = NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SF;
 		break;
 	default:
+		primary_crc = NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_NONE;
 		break;
 	}
 
-- 
2.56.1.708.g77570a6a1d-goog

