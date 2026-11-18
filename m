Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7FD606A338
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UnAsgjRT
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E70C110FC94;
	Wed, 18 Nov 2026 13:45:55 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 934A749516;
	Wed, 18 Nov 2026 13:26:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795008361;
 b=yJNRQvXofdCZksyCYy1LYYFIgkPtuimT98Mm6A+JpgYkOFR+I/+6ip0wwPkUbGhowxRSA
 mIwxyQ23Z/1/bwm/Y/2TO25j+RMawAcdm4mH0xoSWMroVPEqSN+3mEIz18jmTa2BJWJCZy6
 trubyaMYYAwYcE7N/7a0bCZw3Nocp0c3b232rbgEbWYWb5nzoJ81U8xpLQDiuf9oNL/mWrq
 kbOc7HEBlw2OLUISxeNh7xOG2idLTajyRu6UaaaL7bVoI8sIHCtWqKqjknsNq9w4EGGEJyA
 6r6y8IhRSqI6MuCdsJqP/8pclFwEZtZYcPhu46TUVtIYW4hB30/KMYZdcqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795008361; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6cCL93ssdEirtEIN7IN1AXWvsFJlWDaYl18DuhqCOQs=;
 b=JZwj9Tl2ILAzGpaEKaXOJZhSQNK/Dt5d14d6gtbeWEN0mB+XEboqmyMwpbX90+IcjHdum
 LzCrUDWmTXYZ8rJUQBWthVBkZBiMa6DQGu6G/caO/Co8p2PyPsX+8iwyZu+YdqmQcNtEz+N
 XnztdRw7P/l/CGPFBNrR7r8z8BBerv6YNySbABYAjKAm/me4iPrAnl0Y004BBMyvlDN+PUg
 33E29OEoMApylyjlxezWqmT8q9L405jUqTySyGm0YEkV1Bu+WzY690MPEiaRYFV5aRg9xsi
 GaWmOhbMZMQT1gKbJc/HH5xvinxpBvD/fN40aNvvlgFDI2kv2aRENdNRPTog==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A1B7C4668B;
	Wed, 18 Nov 2026 13:25:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC1410FA50;
	Wed, 18 Nov 2026 13:45:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4193144E88;
	Wed, 18 Nov 2026 13:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337C41F000C5;
	Wed, 18 Nov 2026 13:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795009547;
	bh=6cCL93ssdEirtEIN7IN1AXWvsFJlWDaYl18DuhqCOQs=;
	h=From:To:Cc:Subject:Date;
	b=UnAsgjRTHy0X5p6+yQJK1J7Ig6nX5Irnk6nGzKNbeg36UPsZaYClq6NCtB6/N5WD4
	 k1P+gLlIbKTDTx0Dja5qIrmXbuB01KxoalS9L381uKEW4sjsbG9LWJWJF+6I0ewgb0
	 srQzRqHUN6vavVY9eU3eoednEHrkmEEMLcP4N45Qztet6mF+tPtjWkEfrXCkQb6kCe
	 skH45IXlffpjzwSPTOH6AeTFX/YVvTMlnRUUrLSWf3uy+5YDAZU6iMm9R85Sv2D5oy
	 PYCKr/ezc9EO8vagVPtUbzsWH2NigoK9xyJQF7nNXAELRH6UPxyNq/PcrYq5wJazuO
	 jwgYcnLh6RBYQ==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Vitaly Prosyak <vitaly.prosyak@amd.com>,
	Prike Liang <Prike.Liang@amd.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	David Rosca <david.rosca@amd.com>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] dma-buf: dma-fence: Remove dma_fence_init64()
Date: Wed, 18 Nov 2026 14:45:20 +0100
Message-ID: <20261118134522.1646892-2-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FFIIFDQRUZIFBI6DGVA7HHTHWMHJGOPI
X-Message-ID-Hash: FFIIFDQRUZIFBI6DGVA7HHTHWMHJGOPI
X-MailFrom: phasta@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FFIIFDQRUZIFBI6DGVA7HHTHWMHJGOPI/>
Archived-At: 
 <https://lore.freedesktop.org/20261118134522.1646892-2-phasta@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

(Only adding vc4 and dma-fence folks to Cc to avoid noise)

Changes in v2:
  - Rebase due to conflict in drm/vc4
  - Change dma_fence_flags_invalid() to dma_fence_flags_valid()
    (Christian)

We recently had a discussion about reworking dma_fence init to close a
race-window [1].

The community agreement seems to have been that we can get rid of
dma_fence_init64(), so let's do that already. In the meantime we can
continue our discussions regarding the race in [1].

This also touches the Rust dma_fence, which actually should use 64-bit
seqnos (was forgotten so far). Rust fence has no users currently, so
needs no backporting, so I would like to address that in a distinct
patch.

Tested on Nouveau with and without the SEQNO64 flag. Nouveau also uses
the USER flag, so I hope we're fine.


P.

[1] https://lore.kernel.org/dri-devel/20261029095542.1526750-3-phasta@kernel.org/

Philipp Stanner (3):
  dma-buf: dma-fence: Add flags parameter to dma_fence_init()
  dma-buf: Port users of dma_fence_init64()
  dma-buf: dma-fence: Remove dma_fence_init64()

 drivers/accel/amdxdna/amdxdna_ctx.c           |  2 +-
 drivers/accel/ethosu/ethosu_job.c             |  2 +-
 drivers/accel/ivpu/ivpu_job.c                 |  2 +-
 drivers/accel/rocket/rocket_job.c             |  2 +-
 drivers/dma-buf/dma-fence-array.c             |  2 +-
 drivers/dma-buf/dma-fence-chain.c             |  4 +-
 drivers/dma-buf/dma-fence.c                   | 57 +++++++++----------
 drivers/dma-buf/st-dma-fence-chain.c          |  2 +-
 drivers/dma-buf/st-dma-fence-unwrap.c         |  2 +-
 drivers/dma-buf/st-dma-fence.c                |  2 +-
 drivers/dma-buf/st-dma-resv.c                 |  2 +-
 drivers/dma-buf/sw_sync.c                     |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |  2 +-
 .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c  |  5 +-
 drivers/gpu/drm/drm_crtc.c                    |  2 +-
 drivers/gpu/drm/drm_writeback.c               |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  2 +-
 drivers/gpu/drm/i915/i915_request.c           |  2 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.c     |  2 +-
 drivers/gpu/drm/i915/i915_vma_resource.c      |  2 +-
 .../gpu/drm/i915/selftests/i915_sw_fence.c    |  2 +-
 drivers/gpu/drm/imagination/pvr_ccb.c         |  2 +-
 drivers/gpu/drm/imagination/pvr_queue.c       |  2 +-
 drivers/gpu/drm/lima/lima_sched.c             |  2 +-
 drivers/gpu/drm/msm/msm_fence.c               |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  4 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c       |  2 +-
 drivers/gpu/drm/qxl/qxl_release.c             |  2 +-
 drivers/gpu/drm/radeon/radeon_fence.c         |  2 +-
 drivers/gpu/drm/scheduler/sched_fence.c       |  4 +-
 .../gpu/drm/scheduler/tests/mock_scheduler.c  |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  2 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  2 +-
 drivers/gpu/drm/v3d/v3d_fence.c               |  2 +-
 drivers/gpu/drm/vc4/vc4_gem.c                 |  2 +-
 drivers/gpu/drm/vgem/vgem_fence.c             |  2 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c        |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |  2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c              |  2 +-
 drivers/gpu/drm/xe/xe_oa.c                    |  2 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c         |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c             |  2 +-
 drivers/gpu/host1x/fence.c                    |  2 +-
 drivers/iio/industrialio-buffer.c             |  2 +-
 drivers/usb/gadget/function/f_fs.c            |  2 +-
 include/linux/dma-fence.h                     | 14 +++--
 rust/kernel/dma_buf/dma_fence.rs              |  2 +-
 52 files changed, 95 insertions(+), 93 deletions(-)


base-commit: 17a180572ca50c8d38f3aa47d6fc81ce7c5594da
-- 
2.56.0

