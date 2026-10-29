Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE53D606A31E
	for <nouveau@archiver.kernel.org>; Thu, 29 Oct 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a1/C2J+K
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFC4112199;
	Thu, 29 Oct 2026 09:59:45 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CB5E148BD9;
	Thu, 29 Oct 2026 09:40:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793266835;
 b=xwxbIfjnuA4oxf0cgE4Tp1qN5y5QH1sATZjFTWyM+SEISIl4QQ12xzs3sa7dP8ZLP+F6M
 ARtGh+mYKPbVDTgIUo87sQc4oETzfgSBJAv5qGrWm0ezFF5cTK/bIc+Y39onotwPKMZp8pl
 5zshmbCmYQ2euiSMrFH/1ClZv1ptcuYPk9acXn5Fjaqy4qjtFRM27n/2N9UQLMjIGhHTWAh
 w228pF8728BVEr/hjhPJb7o72N/cy/4n8bGQ5aWGrrZIaIJf86SfPi+t5U+B+S+oxsbQgYH
 w2aR2HiwvwiGlhb5N5z+euLLYKdp+gYU/9B2OzfQurNnspTLIycerOTbAwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793266835; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IJs4QQIZ91S3U36erLUuV7NVKYoD0Sonhzo5oA3JROw=;
 b=eflQGfUea57CtbsIq0ed7YBNyGXxAtq90ca1SXxnoW+nMnNFbJfLFd20eEVENadsrSfrz
 dLu+h6PE+IGI1unO+c/Ckyo67Olz6AGoz3wVB/HWMfYE60RsFLEPKncF1fHLmov3Dxlw/mX
 vPgmKNE305+S7rviQdH7CbHgMZVnALchUxGULTykM8HTf2/4rUgXoBq1O//3OoQ6ln55BOO
 z+dt+ty1jInsM5Kh4AP6ytdq6OLUm0xtd1PbPcq9hzNT3pzHWTapPAwTSJW9zzkqsCUBV1C
 3rUrJNVM6AYtQRut5Mr+JO4MrxEIdf1GCOhMMlgY2EYzdPvI4NLptPy1vEjA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6DCB746BCB;
	Thu, 29 Oct 2026 09:40:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0378311215D;
	Thu, 29 Oct 2026 09:59:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C776640E3D;
	Thu, 29 Oct 2026 09:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CED1F01828;
	Thu, 29 Oct 2026 09:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793267976;
	bh=IJs4QQIZ91S3U36erLUuV7NVKYoD0Sonhzo5oA3JROw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a1/C2J+KHqCjKWwVlX/OgeWHD4/i2QFD+UZubRymThh5X7BYWAo+E2CJRJcpseUY6
	 CSy8IUeXftwAKaPBe6i6yZJcSzmfGwXuBr8BlziukQod4q2yvxUjI+lOd9vG+xOeuC
	 LtlT7irolbaHY/+qVr6jmKGuFUM6eJm1OwlO7CjL1Efwi5bpU7Jw2DsHDK/3cMK8gT
	 ONYNR4Y/Ev5CB4M2bHDLe133fQq9agvre0uGIaivEhlL8pSjS6blPVlnLhYKaOMPjC
	 /RKJIGFCuxwqDjUQGYMKlMF5/61G6kuioOWd4gxQT3gOhfLtF2RcGjH9yZxoWM0XNk
	 j0+ZKE9xZjTfw==
From: Philipp Stanner <phasta@kernel.org>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Qiang Yu <yuq825@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Kees Cook <kees@kernel.org>,
	Jesse Zhang <jesse.zhang@amd.com>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Kexin Sun <kexinsun@smail.nju.edu.cn>,
	Prike Liang <Prike.Liang@amd.com>,
	David Rosca <david.rosca@amd.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Shixiong Ou <oushixiong@kylinos.cn>,
	=?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Neill Kapron <nkapron@google.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Sam Day <me@samcday.com>,
	Gabriel Prostitis <prostitisgabriel@gmail.com>
Subject: [RFC PATCH 3/6] dma-buf: Port users of dma_fence_init64()
Date: Thu, 29 Oct 2026 10:55:40 +0100
Message-ID: <20261029095542.1526750-6-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029095542.1526750-3-phasta@kernel.org>
References: <20261029095542.1526750-3-phasta@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MRRGQVWV577Z4IVDPG6P2DEPHOIGIC22
X-Message-ID-Hash: MRRGQVWV577Z4IVDPG6P2DEPHOIGIC22
X-MailFrom: phasta@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 imagination@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MRRGQVWV577Z4IVDPG6P2DEPHOIGIC22/>
Archived-At: 
 <https://lore.freedesktop.org/20261029095542.1526750-6-phasta@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

dma_fence_init() now natively allows for selecting 64-bit seqno support.
Port all users of dma_fence_init64() to this unified method.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence-chain.c                  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c | 7 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    | 5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c   | 5 +++--
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a588f55ea4d3..706e1f5e3a23 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -261,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 			seqno = max(prev->seqno, seqno);
 	}
 
-	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
-			 context, seqno);
+	dma_fence_init(&chain->base, &dma_fence_chain_ops, NULL,
+		       context, seqno, BIT(DMA_FENCE_INIT_FLAG_SEQNO64));
 
 	/*
 	 * dma_fence_chain_enable_signaling() is invoked while holding
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
index f6b7522c3c82..1337f7f4195f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
@@ -130,9 +130,10 @@ int amdgpu_evf_mgr_rearm(struct amdgpu_eviction_fence_mgr *evf_mgr,
 	ev_fence->evf_mgr = evf_mgr;
 	get_task_comm(ev_fence->timeline_name, current);
 	spin_lock_init(&ev_fence->lock);
-	dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
-			 &ev_fence->lock, evf_mgr->ev_fence_ctx,
-			 atomic_inc_return(&evf_mgr->ev_fence_seq));
+	dma_fence_init(&ev_fence->base, &amdgpu_eviction_fence_ops,
+		       &ev_fence->lock, evf_mgr->ev_fence_ctx,
+		       atomic_inc_return(&evf_mgr->ev_fence_seq),
+		       BIT(DMA_FENCE_INIT_FLAG_SEQNO64));
 
 	/* Remember it for newly added BOs */
 	dma_fence_put(evf_mgr->ev_fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 6f1dc813ec5b..199cc1835448 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -274,8 +274,9 @@ static void amdgpu_userq_fence_init(struct amdgpu_usermode_queue *userq,
 	bool signaled = false;
 
 	spin_lock_init(&fence->lock);
-	dma_fence_init64(&fence->base, &amdgpu_userq_fence_ops, &fence->lock,
-			 fence_drv->context, seq);
+	dma_fence_init(&fence->base, &amdgpu_userq_fence_ops, &fence->lock,
+		       fence_drv->context, seq,
+		       BIT(DMA_FENCE_INIT_FLAG_SEQNO64));
 
 	/* Make sure the fence is visible to the hang detect worker */
 	dma_fence_put(userq->last_fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
index b0002c898386..8b9b9368956f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
@@ -100,8 +100,9 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
 	INIT_WORK(&f->work, amdgpu_tlb_fence_work);
 	spin_lock_init(&f->lock);
 
-	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
-			 vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
+	dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
+		       vm->tlb_fence_context, atomic64_read(&vm->tlb_seq),
+		       BIT(DMA_FENCE_INIT_FLAG_SEQNO64));
 
 	/* TODO: We probably need a separate wq here */
 	dma_fence_get(&f->base);
-- 
2.56.0

