Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F8F606A31B
	for <nouveau@archiver.kernel.org>; Thu,  5 Nov 2026 21:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jmtvL6JN
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 916FD1124C1;
	Thu,  5 Nov 2026 21:32:43 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E5513490F1;
	Thu,  5 Nov 2026 21:13:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793913193;
 b=UCnelD5RPVefKjFzAPSsEoTodyljwAAmugiVmV+qSWKt3A3len2SfXoYPE7If7bkn1yy7
 qHqeodMbbCLPokWg7pvAZfRCVm2kV3pFG0qKAIQ28QCzXwMbHeSxsRRT8bXmySp6t/6Fctr
 YxAAsK2/KWTAa4E0aV6kMkFgF4NFxtOgBYTmH+qYF2xQE2Aaa7ctGY49UXobBrsjeWTSleJ
 tZPlSyJszqGoFHjZ0MkqhYDupMJ8d6BDkcpEIHhJN2oef1EWgazu8VgG1VpooTTihYIyHo/
 JhAtcs/IG2+2Lghzke2LEB3bXUs3CT2Txa2BOkZNThz0LfL2w3r/MBaE1CRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793913193; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SLxt8gL8S4bp8BkjrllqUrd84IP3TwVRmle+af4zaM8=;
 b=zE9szKStNgN0PAP9VWIh/4riBBA7WtzVVwhov8Z9Vlr74V5A3INPkc2Obc6Cs6PhE28ya
 QKJMI3hZTwFkAbPXW0fB/HlcU+SMoi37yyxiaf5eZQwOf2R1WiBIhNew5yGCD3+G1FUyYPg
 vuWYFyHCyRN8i8pegydqim2FFH8Y8WZijZM2q71X8I/jqzaEil2hP9RTryzOVBpvK5QZkw+
 SRjetGzG8Ueac55F+hqjOxHSYSOamN0alNYe9VOxiZQ76irWAnQgftdLrMPG+CU1JjRYnMF
 VHNaGZUGokoBydQLK7r9bTnOeFMMmZQtXZoqomH5tuZ3hw4kVEsktLpkxdMA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 734C541FF8;
	Thu,  5 Nov 2026 11:20:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7A0112372;
	Thu,  5 Nov 2026 11:40:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EAFDA61109;
	Thu,  5 Nov 2026 11:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C29F1F0093A;
	Thu,  5 Nov 2026 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793878812;
	bh=SLxt8gL8S4bp8BkjrllqUrd84IP3TwVRmle+af4zaM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jmtvL6JNx/LTuU5nwvdXJgdkdF729H39y+/gluqMOWtETW4wth76UGatWMf0UpmSL
	 KuzZP3d+OGyMwi1JkopR8sxmOk3Of7u10D1WZWJ2gOKPPKj1RyEa2MC/4Hy7vvoFyj
	 a2/wjrUg34AP+eF7GWAGrFmiJQUG1dgczg8FplZYSUrmw5ZFTGiTSTdGP6iWFawN7A
	 dICAFcjP/fVxrJAphmIGwXXYfOZiZVekEOSwLEtuVkseGkon+tOf2YsFOB3FbuDvfh
	 Ha/+C+wCHrw8KUcj/EeY3Tyq3ICLi0hwsYwYVzTcFzdOVjdIx6DIsB9NFCuCX8O6j/
	 DvUI7nvwy0POA==
From: Philipp Stanner <phasta@kernel.org>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
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
	Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Prike Liang <Prike.Liang@amd.com>,
	Vitaly Prosyak <vitaly.prosyak@amd.com>,
	Jesse Zhang <Jesse.Zhang@amd.com>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	David Rosca <david.rosca@amd.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
	Shixiong Ou <oushixiong@kylinos.cn>,
	=?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Sam Day <me@samcday.com>,
	Gabriel Prostitis <prostitisgabriel@gmail.com>
Subject: [PATCH 2/3] dma-buf: Port users of dma_fence_init64()
Date: Thu,  5 Nov 2026 12:35:29 +0100
Message-ID: <20261105113529.1989375-4-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105113529.1989375-2-phasta@kernel.org>
References: <20261105113529.1989375-2-phasta@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: phasta@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: PES4MHM273KAKRYSNHICV5IL6PYSEOIO
X-Message-ID-Hash: PES4MHM273KAKRYSNHICV5IL6PYSEOIO
X-Mailman-Approved-At: Thu, 05 Nov 2026 21:13:09 +0000
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 imagination@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.or
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PES4MHM273KAKRYSNHICV5IL6PYSEOIO/>
Archived-At: 
 <https://lore.freedesktop.org/20261105113529.1989375-4-phasta@kernel.org/>
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
index a588f55ea4d3..7d1495235577 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -261,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 			seqno = max(prev->seqno, seqno);
 	}
 
-	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
-			 context, seqno);
+	dma_fence_init(&chain->base, &dma_fence_chain_ops, NULL,
+		       context, seqno, BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
 
 	/*
 	 * dma_fence_chain_enable_signaling() is invoked while holding
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
index f8652fd0525d..2924f34da316 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
@@ -133,9 +133,10 @@ int amdgpu_evf_mgr_rearm(struct amdgpu_eviction_fence_mgr *evf_mgr,
 	ev_fence->evf_mgr = evf_mgr;
 	get_task_comm(ev_fence->timeline_name, current);
 	spin_lock_init(&ev_fence->lock);
-	dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
-			 &ev_fence->lock, evf_mgr->ev_fence_ctx,
-			 atomic_inc_return(&evf_mgr->ev_fence_seq));
+	dma_fence_init(&ev_fence->base, &amdgpu_eviction_fence_ops,
+		       &ev_fence->lock, evf_mgr->ev_fence_ctx,
+		       atomic_inc_return(&evf_mgr->ev_fence_seq),
+		       BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
 
 	/* Remember it for newly added BOs */
 	dma_fence_put(evf_mgr->ev_fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index c1257f530e9a..5329c13f4237 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -274,8 +274,9 @@ static void amdgpu_userq_fence_init(struct amdgpu_usermode_queue *userq,
 	bool signaled = false;
 
 	spin_lock_init(&fence->lock);
-	dma_fence_init64(&fence->base, &amdgpu_userq_fence_ops, &fence->lock,
-			 fence_drv->context, seq);
+	dma_fence_init(&fence->base, &amdgpu_userq_fence_ops, &fence->lock,
+		       fence_drv->context, seq,
+		       BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
 
 	/* Make sure the fence is visible to the hang detect worker */
 	dma_fence_put(userq->last_fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
index b0002c898386..f8cc258dcdef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
@@ -100,8 +100,9 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
 	INIT_WORK(&f->work, amdgpu_tlb_fence_work);
 	spin_lock_init(&f->lock);
 
-	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
-			 vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
+	dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
+		       vm->tlb_fence_context, atomic64_read(&vm->tlb_seq),
+		       BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
 
 	/* TODO: We probably need a separate wq here */
 	dma_fence_get(&f->base);
-- 
2.56.0

