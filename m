Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9198CF94CB8
	for <nouveau@archiver.kernel.org>; Tue, 21 Apr 2026 23:43:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEA510EDD1;
	Tue, 21 Apr 2026 23:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XexBQ4Ed";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9319345AB0;
	Tue, 21 Apr 2026 23:30:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776814253;
 b=xNGKLgqo9O1TG1boHqs/448K9Ss8BJQSH+52sKZeIz59GU1b5aO0Kh3ftyKlb2sAdHkGR
 f+LbW206ddeBSZnfaFXEffh6loq00lfbuErw3YA6TOXp8UO6fsnVRnuAXyNFkVaIxQ852JG
 +palTMWViem+5EOTeI6QZazJjl9y+mr3FexZLsVylCkF+LWULV+DT4O1ZuMZ7bQEe1BKL2a
 CBdlG1ILFF/OOrigNLxk9qQu6GWnd7uprSKYJfPug5I5uGttqeZEUvO7EycmMSXcAlEZusc
 SD5qKViJaEwv+d34fiBhaGGkifh/SdVp+dOMfqGfbRIVNmtaEWvwz/JeKPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776814253; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Jpiw4NbDlnr2VDVswPGwDPVhLnXvWCUe2RwuNRF/TFk=;
 b=pSMxNF9KWtfzrOrHbPd8USen2YF8d7wlDtsvb8oeQA2HjuE4+BzuBPUxSmAeFPY3VLW03
 VitrLzFd9mWdhYdtskrAq8j88f2YNb4lv6RFC5J6h60PsqxdcFpqSBXxynlLKfbY4j1TKJR
 gohyJL2Q6+VQMRxXspzWm/s3JKmJj35L7pMpk9m4Mo7pxaBSUkZbHbzFx+aGVaYVGXW2skS
 TnRNm27W5lzP+9v80GrEQbet9HC+mpsQ55vkIgDe7pimab/O6OoQPKBTIquLVvXRi0CLWi1
 kZIjcyWY+XOcUeMD6uxdgpGgg6JpOHP7OFoyELI/9chlZT5EHlfr3vnTTArQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1B17A45AA5
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 23:30:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6D95C10E23E
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 23:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776814977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jpiw4NbDlnr2VDVswPGwDPVhLnXvWCUe2RwuNRF/TFk=;
	b=XexBQ4Ed9u0nX6Fw5pTlJ1PUHRRGaEQ8G1hZRwAtcrYNvHa+khxxAHcM9ezY9zBSN+RXFd
	Bnx/Mf3ELxMHoRkXZQYQJ8hg6aLLBvAtPoHaN1sodKlYToKaMTd0cbuoHuPhbcpqv21DnV
	uqK9N0nQOpDrpAIAjNyl4nCDycTtYSw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-376-O_rB290LNym1inC3GixdfA-1; Tue,
 21 Apr 2026 19:42:55 -0400
X-MC-Unique: O_rB290LNym1inC3GixdfA-1
X-Mimecast-MFC-AGG-ID: O_rB290LNym1inC3GixdfA_1776814972
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B792B1800367;
	Tue, 21 Apr 2026 23:42:52 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.14])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2D004180045E;
	Tue, 21 Apr 2026 23:42:48 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 2/5] drm/gem/shmem: Introduce
 __drm_gem_shmem_free_sgt_locked()
Date: Tue, 21 Apr 2026 19:40:38 -0400
Message-ID: <20260421234234.638503-3-lyude@redhat.com>
In-Reply-To: <20260421234234.638503-1-lyude@redhat.com>
References: <20260421234234.638503-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: hfQdveA4fKTjkiPwgJmCJXaFP2B0z0tFdLvCFyRRYeM_1776814972
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: JUKHXB75VG5JSGT6QO3RFVKGSEGGHKNN
X-Message-ID-Hash: JUKHXB75VG5JSGT6QO3RFVKGSEGGHKNN
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JUKHXB75VG5JSGT6QO3RFVKGSEGGHKNN/>
Archived-At: 
 <https://lore.freedesktop.org/20260421234234.638503-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

One of the complications of trying to use the shmem helpers to create a
scatterlist for shmem objects is that we need to be able to provide a
guarantee that the driver cannot be unbound for the lifetime of the
scatterlist.

The easiest way of handling this seems to be just hooking up an unmap
operation to devres the first time we create a scatterlist, which allows us
to still take advantage of gem shmem facilities without breaking that
guarantee. To allow for this, we extract __drm_gem_shmem_free_sgt_locked()
- which allows a caller (e.g. the rust bindings) to manually unmap the sgt
for a gem object as needed.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

---
V10:
* Fix incorrect function name in documentation for
  __drm_gem_shmem_release_sgt_locked()

 drivers/gpu/drm/drm_gem_shmem_helper.c | 32 +++++++++++++++++++++-----
 include/drm/drm_gem_shmem_helper.h     |  1 +
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4500deef41278..d2c34a0e573a1 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -158,6 +158,30 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
+/**
+ * __drm_gem_shmem_release_sgt_locked - Unpin and DMA unmap pages, and release the
+ * cached scatter/gather table for an shmem GEM object.
+ * @shmem: shmem GEM object
+ *
+ * If the passed shmem object has an active scatter/gather table for driver
+ * usage, this function will unmap it and release the memory associated with it.
+ * It is the responsibility of the caller to ensure it holds the dma_resv_lock
+ * for this object.
+ *
+ * Drivers should not need to call this function themselves, it is mainly
+ * intended for usage in the Rust shmem bindings.
+ */
+void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object *shmem)
+{
+	dma_resv_assert_held(shmem->base.resv);
+
+	dma_unmap_sgtable(shmem->base.dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	sg_free_table(shmem->sgt);
+	kfree(shmem->sgt);
+	shmem->sgt = NULL;
+}
+EXPORT_SYMBOL_GPL(__drm_gem_shmem_free_sgt_locked);
+
 /**
  * drm_gem_shmem_release - Release resources associated with a shmem GEM object.
  * @shmem: shmem GEM object
@@ -176,12 +200,8 @@ void drm_gem_shmem_release(struct drm_gem_shmem_object *shmem)
 
 		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
 
-		if (shmem->sgt) {
-			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
-					  DMA_BIDIRECTIONAL, 0);
-			sg_free_table(shmem->sgt);
-			kfree(shmem->sgt);
-		}
+		if (shmem->sgt)
+			__drm_gem_shmem_free_sgt_locked(shmem);
 		if (shmem->pages)
 			drm_gem_shmem_put_pages_locked(shmem);
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 5ccdae21b94a9..b2c23af628e1a 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -111,6 +111,7 @@ int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shme
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 void drm_gem_shmem_release(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
+void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object *shmem);
 
 void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
-- 
2.53.0

