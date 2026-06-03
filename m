Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27CDCD6E57
	for <nouveau@archiver.kernel.org>; Wed,  3 Jun 2026 19:52:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 98C8F112318;
	Wed,  3 Jun 2026 19:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DSBJ4LW4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D2A5D4677A;
	Wed,  3 Jun 2026 19:38:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780515525;
 b=as69Iyc3WuvoV5tPiF6FhqSu19mZ7QJqeazxv9eDb7cZk/vFdPQm5/lukL0h38oZSwEIS
 3U3Jbn8+s9Kd+ZctLtpvBbLzOQdcG11O4xjFBbFYPZ7n8D9fAvhRCrRBvAfBoG6S2sX4Pam
 P0ikDbmz9wO20AqMnEnPYHfhIiTZaXzIyE1rLd4x6AvOMz7U1nryDRyh/hHlCmpagvbQe1F
 EbdUp4R9Ftizcvknksu35DN7son7c4YZEbIwLBO0stflIV8NwxAg3v4kcHwfDAaU4e7aX9s
 aTf51lxd9y0x3QkPBtUIOTrdXJ8bupfpQwGzbhIW6IqjjSO1QUxmQMvLdzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780515525; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vC0884TFGI8xcRTHrhisOj99/ctfzN8aXTcnfaQWb7c=;
 b=U1lmkUWfYpWc+b96eUvauc22XSCF00kb3Y2Ldc2VVyUjAtgUAoWiQo76050e4aWBkSiMw
 USuzLMIrhPz4KJAj+9SCbciufk/5IQ+KFvGz/plPWLBfVv6g3h+KkCWotjgMrxBd9RHN8+d
 Diz7izO37QA2/AFCdEVvZR91FJ1S2zt/ogr4z6dFJpvNKgw71uQcMwXflyIGWDWDDb2xbth
 8c+fibCb4N1Y162IvqYOUM35UFXa0/9Yec+4g+wijBzQF0vnlVZ+ZOVCQiPG8O5rtBvN929
 cxiq3ov5CVUSgIDpjNtB3F19GR40ebNgdBLYVgDz3f46FEv+y+5KvZkeG1bw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B4B1444C81
	for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2026 19:38:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2565E112310
	for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2026 19:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780516345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vC0884TFGI8xcRTHrhisOj99/ctfzN8aXTcnfaQWb7c=;
	b=DSBJ4LW4ALj6wkowUxuowL/jq5aIIwCCRlDSie/3E6+IEQT8IAn2RcpIsdqxw3GlM90fbS
	GoISXgUkTvmUSdDPv5BDnOyVikNk6NfeeefWVWW1xSQ4g6jE7nTW+8kb1gckPoPJ7vDtru
	mii9EiT3kwnVOxGhgojfUWF9TLqYMgM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-GFspQ-wiNgKsCPGLsbKKkw-1; Wed,
 03 Jun 2026 15:52:21 -0400
X-MC-Unique: GFspQ-wiNgKsCPGLsbKKkw-1
X-Mimecast-MFC-AGG-ID: GFspQ-wiNgKsCPGLsbKKkw_1780516338
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C2A5719560AA;
	Wed,  3 Jun 2026 19:52:17 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.203])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2697E180049F;
	Wed,  3 Jun 2026 19:52:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v17 0/6] Rust bindings for gem shmem
Date: Wed,  3 Jun 2026 15:42:29 -0400
Message-ID: <20260603195210.693856-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: VlLKSGni9PeR7ueM7u8NHSHtNuPNXHMqg6SdNHawheI_1780516338
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: IGWOU6WBZFDJ5HHTDYE6XGIW2Y5DL6ZV
X-Message-ID-Hash: IGWOU6WBZFDJ5HHTDYE6XGIW2Y5DL6ZV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IGWOU6WBZFDJ5HHTDYE6XGIW2Y5DL6ZV/>
Archived-At: 
 <https://lore.freedesktop.org/20260603195210.693856-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Most of this patch series has already been pushed upstream, this is just
the second half of the patch series that has not been pushed yet + some
additional changes which were required to implement changes requested by
the mailing list. This patch series is originally from Asahi, previously
posted by Daniel Almeida.

The previous version of the patch series can be found here:

	https://patchwork.freedesktop.org/series/164580/

Branch with patches applied available here:

	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem

This patch series applies on top of drm-rust-next

Patch-series wide changes since V15:
* Fix some major rebasing errors I somehow didn't notice :(
* Drop the dependency on LazyInit, use the trick that Alice suggested
  instead.
* Fix dependency ordering so that Tyr can get the vmap stuff first
  without the other bits.
Patch-series wide changes since V16:
* Fix ordering one more time (SetOnce::reset() doesn't need to come
  before adding vmap functions)
* Rebase against the latest DeviceContext changes from me that got
  pushed.

Lyude Paul (6):
  rust: drm: gem: shmem: Fix Default implementation for ObjectConfig
  rust: drm: gem: shmem: Add DmaResvGuard helper
  rust: drm: gem: shmem: Add vmap functions
  rust: faux: Allow retrieving a bound Device
  rust: sync: Add SetOnce::reset()
  rust: drm: gem: Introduce shmem::Object::sg_table()

 rust/kernel/drm/gem/shmem.rs | 518 ++++++++++++++++++++++++++++++++++-
 rust/kernel/faux.rs          |   7 +-
 rust/kernel/sync/set_once.rs |  60 +++-
 3 files changed, 563 insertions(+), 22 deletions(-)


base-commit: 723bd79ca9e492cc91850094a2892bde0345c51a
-- 
2.54.0

