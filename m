Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F56CD98CF
	for <nouveau@archiver.kernel.org>; Fri, 12 Jun 2026 19:45:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3906110F67C;
	Fri, 12 Jun 2026 19:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gkkYCuZM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7991846AC1;
	Fri, 12 Jun 2026 19:31:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781292667;
 b=sE6JD7I8ha1JpSJtHmrezrQL/RStwgEgvMsHYG/wykTdx3XNy6k0O+ZJHtiWsRGO+W3Pe
 TcjH6M/Rp11GqTuLrQ27qhorWGh8U8ZMgCKnFct4oP6yLt+T38Ki7MEbaM8NZAu+DT6wiQV
 U6AEhBpmR/sxD5x2vohumvdjmyYR+26Jw8eAsa4ShIqFqOw76Kr6nQaOLl6yoSNRLg0qiqn
 IjUi0riGpwfx1gEwcKXeWBi8SQHwqhWJm50Bjp9AmFP9J+zr5B7VWmMrz1+nqr83J3R+Xn0
 xQCPh7nkbrgEjpPQW+pxxYsC5+63cL4RT85uLK8KJqThZZ3xGNZnHaZBDlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781292667; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7b8BfvuRiy4Pcy82h5os3g4dxiw9VsvNdGsH4ELAsj4=;
 b=SYalv//buFJ5Zu33UmH3St7XI9gysE0PqLw8hXWWw69f77ubzGTR8FMVGlwqJfntxdddA
 pHi6bsghjpyQb53n7Adf/s98mEJQSe2I7L2YsWZap5kOH4X7YFSy/l7tHPjn2EQUc3585Cb
 L/ulBKe7jSBNt0ynCgtGbEYed4+I/Q1xuDwn1EoQO33CoH0BrsLYJ/UhW8kvmJSbjMYB0xr
 6OOkoPMNEb+29HjBFv477+MxCkQ5IaCfo2j/u7QqTa1U9V7xVDA7G4g81gIKm7U5d4tU8jQ
 yuU8kpMb6BSno99yIQ4ypXKzoQtrGDbW5dKXvQ3ycyR7055cyPtUczkQ44iA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 02235460F9
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 19:31:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D15A10EB38
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781293506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7b8BfvuRiy4Pcy82h5os3g4dxiw9VsvNdGsH4ELAsj4=;
	b=gkkYCuZM9hPu6K9gBUpj5qiu23Ud3ktRC828mG1Vk9UVlWidFWb2k+Dr/8cJcIuYkPk7IY
	51YNiyRK/PHbqn626gLesh2YnuRKCex2jzklIL4RByOUOmdJ6FqZ3zcZjSVFYdBbI9Myel
	RTCCAs+oq5wziaHZrRk6jpWSfVDPODA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-192hq6shMfulbFCjN5AYqw-1; Fri,
 12 Jun 2026 15:45:00 -0400
X-MC-Unique: 192hq6shMfulbFCjN5AYqw-1
X-Mimecast-MFC-AGG-ID: 192hq6shMfulbFCjN5AYqw_1781293496
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 857911805C29;
	Fri, 12 Jun 2026 19:44:55 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.21])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D41B1404;
	Fri, 12 Jun 2026 19:44:51 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v21 0/4] Rust bindings for gem shmem
Date: Fri, 12 Jun 2026 15:43:32 -0400
Message-ID: <20260612194436.585385-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: nqDX1N3z798f14QIcSlXHQoqC3XNxPfW7QOWKtZncPQ_1781293496
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: NLJ5HYRPVVWRFWU4VG643DJO7A64LQD6
X-Message-ID-Hash: NLJ5HYRPVVWRFWU4VG643DJO7A64LQD6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NLJ5HYRPVVWRFWU4VG643DJO7A64LQD6/>
Archived-At: 
 <https://lore.freedesktop.org/20260612194436.585385-1-lyude@redhat.com/>
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
Patch-series wide changes since V20:
* Lots of Sashiko fixes, excluding the comments that I couldn't prove
  weren't just bogus.

Lyude Paul (4):
  rust: drm: gem: shmem: Add DmaResvGuard helper
  rust: drm: gem: shmem: Add vmap functions
  rust: faux: Allow retrieving a bound Device
  rust: drm: gem: Introduce shmem::Object::sg_table()

 rust/kernel/drm/gem/shmem.rs | 547 ++++++++++++++++++++++++++++++++++-
 rust/kernel/faux.rs          |  18 +-
 2 files changed, 549 insertions(+), 16 deletions(-)


base-commit: 550dc7536644db2d67c6f8cf525bba682fba08d9
-- 
2.54.0

