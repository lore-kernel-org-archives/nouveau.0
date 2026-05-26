Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878BDCD5BC8
	for <nouveau@archiver.kernel.org>; Tue, 26 May 2026 20:54:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 091A510E576;
	Tue, 26 May 2026 20:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ISGwVXJZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EAE154645C;
	Tue, 26 May 2026 20:41:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779828088;
 b=fETyueQLngNiQmsMbA4D/TOXKqDS+HrVb4chRqDqFk6YSN/Nsr8Lw/O4ZgqAAaMV/4NLc
 NO9CLTH8i+dblD7jtQ7pH6WXH7SfyB9sn0QZp+2wojg5g4KzCfp4HptXHP+B9t2kwmN4pVC
 Iheh+u3mg2N4UH4UY1F9I02AsF9hZJmvF5hKBfjqbr5hdCS9ymHKdiV5Lf5299Y319c07j7
 fNLudU9080V9+SZMSfv9mLGCJuUmCJeyYy39HxEu9FL8ojUWkB4pQFcC6MnW/aMV6M/8oke
 H2VfJ/AY85AYu0dvxNYwjS2VYEj5gGRDHxzmOtBsedHFPyDsMrv/AlG5BNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779828088; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CTXkVWhfiCkPPMFCSefkBsAtfCVesv2uIIO2EqJJ/8Y=;
 b=S1GbsOr9+ra1KJVU9oTZT2oZjimKUmmP33PRPsEffcrbeTYyUN0bqqC9e7dvwu++GjR9q
 bQ702kGXgW86NdkWxqc9ZAmUHbzl6B6A1R6+Eydng1DbzAqYzHANj03frDoTO6jE89fIgUa
 8KOd1Z0wb/3ihmphh+Amqlf9V+XcoQkqdVaQCieJM8WUSN1i9irX/uU6LoejRgvbNTdQEP2
 wuBpy3GQJATS4F+ToymbA2Yjn+VW+iMeybl5ymhYWl2Rhs5JG/IESzsFNpl4953E1G2iRET
 3J6j89+x8fMb5joQUtFir/iANIkOVCUotdzq31uzaUu0qTJWIt5xgxvoJG0w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6E16B46423
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 20:41:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B38410E532
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 20:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779828888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTXkVWhfiCkPPMFCSefkBsAtfCVesv2uIIO2EqJJ/8Y=;
	b=ISGwVXJZn9ZEYB0P3cIIRKhElx3WZuL8W3hUXTSp2OHPpH/Jglhd3roaGnCosyx8dAmZ+Y
	90KNLRdqfpRj8aUg3fU5iRRBgTkakwIQd8PAdGPi14spI6Nl7ZZQyuRTOh+B4EARPW2Dah
	uPFwvMipBhXG93/Km+MYaqAY6wdlRf8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-Lu9AwNRWOHuA8Wdb23izvA-1; Tue,
 26 May 2026 16:54:39 -0400
X-MC-Unique: Lu9AwNRWOHuA8Wdb23izvA-1
X-Mimecast-MFC-AGG-ID: Lu9AwNRWOHuA8Wdb23izvA_1779828870
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 95900195609F;
	Tue, 26 May 2026 20:54:30 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AEE0D1685;
	Tue, 26 May 2026 20:54:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 1/2] rust: sync: lock: Add Lock::get_mut_pinned()
Date: Tue, 26 May 2026 16:41:33 -0400
Message-ID: <20260526205419.1055109-2-lyude@redhat.com>
In-Reply-To: <20260526205419.1055109-1-lyude@redhat.com>
References: <20260526205419.1055109-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: rvd1chP8n8Mdf98VOeSyvqXD2p4jEu-FVso3zMqFeCg_1779828870
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HUDQBFTQYRTTH5JSMVMABWJX3PHHGUIM
X-Message-ID-Hash: HUDQBFTQYRTTH5JSMVMABWJX3PHHGUIM
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Gary Guo <gary@garyguo.net>, Ingo Molnar <mingo@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Benno Lossin <lossin@kernel.org>, Will Deacon <will@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HUDQBFTQYRTTH5JSMVMABWJX3PHHGUIM/>
Archived-At: 
 <https://lore.freedesktop.org/20260526205419.1055109-2-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

These two functions are inspired by the Rust stdlib equivalent:

  https://doc.rust-lang.org/std/sync/struct.Mutex.html#method.get_mut()

The idea here is very simple - if the user has access to a Pin<&mut
Mutex<…>>, we can guarantee that no one else can look at the data protected
by the lock. Thus in such situations, locking the mutex isn't necessary to
access its contents. This can be useful in situations like `Drop`
implementations, where we may want to access the contents of a Mutex within
a struct before dropping it.

So to do this, we add `get_mut_pinned()` to `Lock` - which provides a
function to access the inner contents of a Mutex provided a Pin<&mut …>.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024f..5ca36baed34f5 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -190,6 +190,17 @@ pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // that `init` was called.
         unsafe { B::try_lock(self.state.get()).map(|state| Guard::new(self, state)) }
     }
+
+    /// Returns a pinned mutable reference to the underlying data.
+    ///
+    /// Because this borrows the lock mutably, no actual locking needs to take place - as the
+    /// mutable borrow statically guarantees no new locks can be acquired while this reference
+    /// exists.
+    #[inline(always)]
+    pub fn get_mut_pinned(self: Pin<&mut Self>) -> Pin<&mut T> {
+        // SAFETY: We return a pinned T, ensuring we don't move T.
+        unsafe { self.map_unchecked_mut(|data| data.data.get_mut()) }
+    }
 }
 
 /// A lock guard.
-- 
2.54.0

