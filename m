Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B429FCD5BB1
	for <nouveau@archiver.kernel.org>; Tue, 26 May 2026 20:54:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5755F10E544;
	Tue, 26 May 2026 20:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WvjueyJl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4141C46451;
	Tue, 26 May 2026 20:41:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779828070;
 b=U6tIl1/wv962tZxRf7DUQy7qV1Kh4kmsMUbzo8TfEkSCGUZkJRRpp2hMSxgzgiQBj1XI6
 cyXFMdNUPEcNipUyNUINoMHHcSfwwsdzAiGTx4rfsmUDH7N0yadOMEBcVXmDfkXvZQI8kKc
 sX6X4wO8ccIQR0FLNA7UHXCOwPo0Nfqjtv3iOYiKrPTnkpmZiag2an4BAt4bXkyXnTeFrZd
 QuSwj9hyet/hM7RJBR1GlXE/NDdYqrJ/8tAvCQGDreEsv9xqgk1L/+9+HAm9Zi0F0qUuGS8
 cGX3UpqGYCudTC9c8S+vAqNGBxpNxtZLF6DHqRsGoqi0wEYx7/E6dFrV+CBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779828070; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dS/ZL01Q5UiuDS3rO1Ng20MqodzQcdZW0zFHe5xf9VU=;
 b=cj1EjM7K6Udxk5mNxgroIuZMKHj+vp2Os46SWtVLTeL9FpCR78lahHE4kDSxDPtItfdJq
 M7nu9uV4orNo9ZnFx/fB+p+4MMMUWjr5BCOntvIfGCrdpBL+vfBXGmadh0Fx7avPZ16dACj
 VkH8e2+JXWiTssF65+5u7theNfK7IzA2roCFie6fail8FQpQZCqyIyA0L+3rkIxv28X5oqw
 V9cfL8yEi6ByHGPUhAwJEh/lTiA12DBI5+y0482kbzDSgr+dhVXKMKBzeVpcjm2vox0sEtI
 H6Jlc+0gXmMUSwF5z8zF1e+c+yTlX9U8ABlO+QKGB+cf9KQ+vhyLrHLN/UKQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CC63046423
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 20:41:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 933BC10E505
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 20:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779828871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dS/ZL01Q5UiuDS3rO1Ng20MqodzQcdZW0zFHe5xf9VU=;
	b=WvjueyJlSsv0BXP21epaozgflDfCnYK2j0Hhi9vyQTAb7b4Xdx3Tc07tAropbBPP74YMJj
	aWqlNcWVKJ6ZGATT5YrsRHedPLQ8m4y0AFyfVJNZTseA6hH5VLxrcpqDTOvTYGilaoOruB
	RQwDn0scr5zPf30C4GVjluSViOPniDE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-3Vb_iM1QOv6AXI0eKHKezQ-1; Tue,
 26 May 2026 16:54:27 -0400
X-MC-Unique: 3Vb_iM1QOv6AXI0eKHKezQ-1
X-Mimecast-MFC-AGG-ID: 3Vb_iM1QOv6AXI0eKHKezQ_1779828865
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3980D19560A6;
	Tue, 26 May 2026 20:54:25 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E526D1681;
	Tue, 26 May 2026 20:54:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 0/2] rust: sync: Introduce LazyInit
Date: Tue, 26 May 2026 16:41:32 -0400
Message-ID: <20260526205419.1055109-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: 9Z6-mN25wgKOKixDWKYW94sK3KQbc4zEgFz5dwP9n_I_1779828865
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LICNCRYR3TFXX7O5W5QYKLGEEIIWTZ2M
X-Message-ID-Hash: LICNCRYR3TFXX7O5W5QYKLGEEIIWTZ2M
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Gary Guo <gary@garyguo.net>, Ingo Molnar <mingo@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Benno Lossin <lossin@kernel.org>,
 Will Deacon <will@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LICNCRYR3TFXX7O5W5QYKLGEEIIWTZ2M/>
Archived-At: 
 <https://lore.freedesktop.org/20260526205419.1055109-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

While trying to write up some SGTable bindings for the GEM shmem
helpers, I discovered that SetOnce is actually quite difficult to make
use of in a number of situations.

For one: there is (upstream) currently no way to use it with fallible
initializers. Even with some of the work being done to add support for
this from Gary Guo and Alvin Sun:

  https://lore.kernel.org/rust-for-linux/20260326-b4-tyr-debugfs-v1-1-074badd18716@linux.dev/

We're still left with the issue that if two callers race on trying to
call init(), there's no actual way for either of them to block until the
thread they raced with is done initializing the contents of the
container.

LazyInit is my proposed solution to this issue. It provides a container
which protects the initialization of its contents, without protecting
access to its contents (implying of course, that its contents have to
provide their own thread synchronization).

Lyude Paul (2):
  rust: sync: lock: Add Lock::get_mut_pinned()
  rust: sync: Introduce LazyInit

 rust/kernel/sync.rs           |   2 +
 rust/kernel/sync/lazy_init.rs | 354 ++++++++++++++++++++++++++++++++++
 rust/kernel/sync/lock.rs      |  11 ++
 3 files changed, 367 insertions(+)
 create mode 100644 rust/kernel/sync/lazy_init.rs

-- 
2.54.0

