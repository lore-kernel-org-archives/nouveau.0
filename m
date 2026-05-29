Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3E3CD6E4A
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 18:37:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3524F1123E2;
	Fri, 29 May 2026 18:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a+54vc9j";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AB6D7466DA;
	Fri, 29 May 2026 18:24:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780079052;
 b=G5jp++vf9+fyaYglS0D4z6oHopVj+Le/wHQiHvHxru7rbjSXMCQqNQh3D3z6dnpQUgusS
 yllpcpzJSn8qjEhTvbLf9SRWTzdb1nBGgV/N6vU8eJXOoA6lcYP67QZdXeFlmwgZcsdSWTy
 vYvS1ev8y8auIox1wgj6Crg+y8c6N4BOpdfabBFmJbmOpynjge7miZmp4zy4xBpAg876SHZ
 flg1phkLWPWK60V/3RIvrXOH5QA7lM/EG9fw+o81pUQ41yO6agiQ6kE9Vg69kJOVXkFdSYI
 uiGwMvg20DzZOAb0tOFdFAx2Q75zEDJIFxuSQKDYx8giy7lKLuvuH/XJsNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780079052; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FW4muBq04eUEQ5DPUv/MIH2aGLX2hNQSawY7hFA7cfc=;
 b=FW88bhf7dhcFZ5ofUlm2ecC7X5h2mMWXvZKsQdDytUANDAHPzxJmyups5gFDbBj425gTd
 irffQY5Ga55kKJPxVCbAivIKbYcSL4vd5e4HonpDv5digTL4sKAZDKj10uyQsR+ibGTKFwO
 OaEH7RMu/TW5Aj1wKAMnzBxBgFZY6ohfTMarMD2EHdmPBX2NBYmnsh6nJHh51nP6VqP2Jj2
 ljbQKPUdP3pcNaxZPgN6RuU+zP5tYJdCT+VogE+fMh5bpxtyToQNtWSrCkJokc4zrL8mNUd
 pZHDHcdmf/eM5YnPuxtxlfUFvQNyVtLzPy7hUpr99aOUnm2FWh6aiH4rJQmg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8AC3742910
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 18:24:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA3831123D1
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 18:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780079860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FW4muBq04eUEQ5DPUv/MIH2aGLX2hNQSawY7hFA7cfc=;
	b=a+54vc9jch21uzkXnxthlk5YkONnm9uJ39NNS8VNG2Y3g7RZkRSGBjbA8kAnDNzMpj3ldA
	T/JNjpfaiyVx9q5PUBCtvs++Ngiu7gSHx9wKr7XfAdqT1LgpKh8/k/BvLD1wvOF76fblsK
	dLYgUIlVJ1o4/YT9QBUs7udfD57aYrQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-297-kMqJ3efKP_6-3Cyqrp-ceg-1; Fri,
 29 May 2026 14:37:34 -0400
X-MC-Unique: kMqJ3efKP_6-3Cyqrp-ceg-1
X-Mimecast-MFC-AGG-ID: kMqJ3efKP_6-3Cyqrp-ceg_1780079851
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 25A85195608B;
	Fri, 29 May 2026 18:37:31 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.101])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0DCF21776;
	Fri, 29 May 2026 18:37:27 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v15 6/6] rust: drm: gem: Introduce shmem::Object::sg_table()
Date: Fri, 29 May 2026 14:34:04 -0400
Message-ID: <20260529183702.677677-7-lyude@redhat.com>
In-Reply-To: <20260529183702.677677-1-lyude@redhat.com>
References: <20260529183702.677677-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: PewBrmMwK745LnMquNAlkJEyagVL5gOdLSChNLHaOlg_1780079851
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: JPGQ2OHLDSUFOZGYBXKMLFSPIOJUKRKP
X-Message-ID-Hash: JPGQ2OHLDSUFOZGYBXKMLFSPIOJUKRKP
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JPGQ2OHLDSUFOZGYBXKMLFSPIOJUKRKP/>
Archived-At: 
 <https://lore.freedesktop.org/20260529183702.677677-7-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

In order to do this, we need to be careful to ensure that any interface we
expose for scatterlists ensures that any mappings created from one are
destroyed on driver-unbind. To do this, we introduce a Devres resource into
shmem::Object that we use in order to ensure that we release any SGTable
mappings on driver-unbind.

There's some other slightly unfortunate caveats of this:

* Drivers don't have explicit control at the moment over when unmapping
  happens (which is exactly the same as the C side atm, so it might not be
  a problem).
* We can't just return `SGTableMap` to the user through an Arc to attempt
  to fix the last caveat - because that implies the gem object would need
  to hold a reference count to the scatterlist mapping, which just leaves
  us with the same problem.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Rename OwnedSGTable to shmem::SGTable. Since the current version of the
  SGTable abstractions now has a `Owned` and `Borrowed` variant, I think
  renaming this to shmem::SGTable makes things less confusing.
  We do however, keep the name of owned_sg_table() as-is.
V4:
* Clarify safety comments for SGTable to explain why the object is
  thread-safe.
* Rename from SGTableRef to SGTable
V10:
* Use Devres in order to ensure that SGTables are revocable, and are
  unmapped on driver-unbind.
V11:
* s/create_sg_table()/get_sg_table()
* Get rid of extraneous `ret = ` in shmem::Object::get_sg_table()
V12:
* Actually move sgt_res in this patch and not the next one
V13:
* Use DmaResvGuard suggestion from Alexander
* Use Alexander's (much better) solution for get_sg_table()
* Use SetOnce instead of UnsafeCell
* s/SGTableRef/SGTableMap
* Fix typo in SGTableMap documentation
* Create fallible constructor for SGTableMap
* Don't reuse dma_resv lock for protecting Object contents, just use Mutex
  + SetOnce
* Drop use of drm_gem_shmem_get_pages_sgt_locked(), since we don't need to
  hold the dma_resv lock ourselves for anything but this function.
* Check that the device we receive in the bounds for sg_table() and
  owned_sg_table() that said Device is in fact, the correct device.
* Remove redundant docs in owned_sg_table(), just point it back to
  sg_table().
* Implement Deborah's suggestion to fix double-free in
  free_callback()
* Restore original order of Object<T>
* Fix doc typo for SGTableMap
V14:
* Use new InitOnce container over the Mutex/SetOnce horror show we had
  before.
* Start using LazyInit container for storing Devres for sgt unmap
* Add some kunit tests for sg_table (not sure why I didn't do this before)
  using some of the boilerplate code leftover from the vmap bindings
* Get rid of the owned SGTable variant for now, we'll add it back in a
  future patch if people actually need it.
* Use new LazyInit container from me to get rid of the horrid
  Mutex<SetOnce<>> mess.
* Add the best we can do for unit tests w/r/t SGTable at the moment

 rust/kernel/drm/gem/shmem.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 494e0d0d8d0d6..5655c2a1ae8fb 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -664,4 +664,28 @@ fn vmap_io() -> Result {
 
         Ok(())
     }
+
+    // TODO: I would love to actually test the success paths of sg_table(), but that would require
+    // also implementing dummy dma_ops so that trying to create a mapping doesn't explode. So, leave
+    // that for someone else.
+
+    // Ensures that passing the wrong device to sg_table() fails as we expect, and also ensure it
+    // skips initializing `sgt_res` since we could otherwise create `sgt_res` with the wrong device
+    // bound to it.
+    #[test]
+    fn fail_sg_table_on_wrong_dev() -> Result {
+        let (_dev, drm) = create_drm_dev()?;
+        let wrong_dev = faux::Registration::new(c"EvilKunit", None)?;
+
+        let obj = Object::<KunitObject>::new(&drm, PAGE_SIZE, ObjectConfig::default(), ())?;
+
+        assert_eq!(obj.sg_table(wrong_dev.as_ref()).err().unwrap(), EINVAL);
+
+        // If sgt_res was not initialized mistakenly with the wrong device, this should still fail.
+        assert_eq!(obj.sg_table(wrong_dev.as_ref()).err().unwrap(), EINVAL);
+
+        // TODO: Someday, we should test that creating an sg_table here still succeeds.
+
+        Ok(())
+    }
 }
-- 
2.54.0

