Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821331125876
	for <nouveau@archiver.kernel.org>; Wed, 11 Mar 2026 19:53:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 811AA10E906;
	Wed, 11 Mar 2026 19:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="grtfgG4P";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 374EB45098;
	Wed, 11 Mar 2026 19:42:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773258159;
 b=Et+Hx6d4jzqTvDJXQXD+0fNSG3XpVYeWUnU7k20dwFt5hCSmIYvE24v2lhrlLkTKRwGkC
 iV32uSR+2vcruxH+8OzLNHZ3JUTClj6dZEeVE+ILV985wIYMkkW7KoYtoXZ/gScXR0EFo94
 NS/C+jlFmrvFJ0T5ozCDAmPnp7OgWodudnTJlsETW+BgG0HnMlfgCKRXtrjz03ROBo+12rE
 M62CFdYLNtZpGoBOMJ7cm+aTP620WX/4cI9pUmvJwELxy4mfixxcNa9YguBD77+whPmYVld
 IoEcWHXaR+HQMEF9p+9sLGazZDfaNjuH8pzsuZu5Yeg20bUgmkIS1SHoj6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773258159; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Cs7bLtTBbYmL95yXvFnRiSueazNnWtAyWdEJ3cgm1SY=;
 b=xV84NmXRf4UO1cLf2FZ8/G8jf6QRYwxV4+3vTTteQSWP6mNrtzLKdF/JhM7teuiqJpUtm
 c86jv7vfhlSBFGvAX7LHGJiBycw4ZDRylftHDD2UbYO0+OpAPOWcJ5l4xUpjlYyfi/pXdMT
 MtcuJwdBK2GdrhFjuQg2CgkTIBJq4t4x7VsQlagOtr2SLVPWKH6YBUp4WBRU2/WcccUgzOQ
 pWtWS014yqizXmNQnfWwXkd/q/QT6iDKsuTCM3Diecyx8+0GCTsJUMXHVejEH2Lmi7UvsBI
 uvmrmMwCovY4uLjbvp9eYoD7Xwm/FzeN9vkRihObN1rK/mwVHylALHnvjVLg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9331140696
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 19:42:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 324B010E2C8
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773258789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cs7bLtTBbYmL95yXvFnRiSueazNnWtAyWdEJ3cgm1SY=;
	b=grtfgG4P7kTFbA1BygEs7uEDt54BpGGO/Ylh1cY1Z5zyGhvzaV+6DkfBnUc6wd8Vvmp8MM
	o7z5xvixaXnXzNbu7NYkwlbHlOXdCCGyN+c6qd6Y7tFztwm2s2UXcq52SY+XDhzjZLmlsk
	rU1rwfSbihaIwRBh4WOXB0IasJrJp1k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-CnHhYyvtMMqBe7-M2RCZhw-1; Wed,
 11 Mar 2026 15:53:06 -0400
X-MC-Unique: CnHhYyvtMMqBe7-M2RCZhw-1
X-Mimecast-MFC-AGG-ID: CnHhYyvtMMqBe7-M2RCZhw_1773258783
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BF55D19560A7;
	Wed, 11 Mar 2026 19:53:02 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.81.64])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2769A30030E9;
	Wed, 11 Mar 2026 19:52:57 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v8 0/7] Rust bindings for gem shmem + iosys_map
Date: Wed, 11 Mar 2026 15:52:39 -0400
Message-ID: <20260311195246.2439593-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: jpxkK6E50tjmwe7xgXzjgfVuE_UzASy9PVZ5r_wUA8o_1773258783
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ELPWBIG5ESHT2CSO2ZDGIDXXNMYIHB5G
X-Message-ID-Hash: ELPWBIG5ESHT2CSO2ZDGIDXXNMYIHB5G
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ELPWBIG5ESHT2CSO2ZDGIDXXNMYIHB5G/>
Archived-At: 
 <https://lore.freedesktop.org/20260311195246.2439593-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is the next version of the shmem backed GEM objects series
originally from Asahi, previously posted by Daniel Almeida.

One of the major changes in this patch series is a much better interface
around vmaps, which we achieve by introducing a new set of rust bindings
for iosys_map.

The previous version of the patch series can be found here:

https://patchwork.freedesktop.org/series/156093/

This patch series may be applied on top of the
driver-core/driver-core-testing branch:

https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/log/?h=driver-core-testing

Changelogs are per-patch

Asahi Lina (2):
  rust: helpers: Add bindings/wrappers for dma_resv_lock
  rust: drm: gem: shmem: Add DRM shmem helper abstraction

Lyude Paul (5):
  rust: drm: Add gem::impl_aref_for_gem_obj!
  rust: drm: gem: Add raw_dma_resv() function
  rust: gem: Introduce DriverObject::Args
  rust: drm: gem: Introduce shmem::SGTable
  rust: drm/gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/nova/gem.rs     |   5 +-
 drivers/gpu/drm/tyr/gem.rs      |   3 +-
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/dma-resv.c         |  13 +
 rust/helpers/drm.c              |  56 +++-
 rust/helpers/helpers.c          |   1 +
 rust/kernel/drm/gem/mod.rs      |  79 +++--
 rust/kernel/drm/gem/shmem.rs    | 529 ++++++++++++++++++++++++++++++++
 8 files changed, 667 insertions(+), 22 deletions(-)
 create mode 100644 rust/helpers/dma-resv.c
 create mode 100644 rust/kernel/drm/gem/shmem.rs

-- 
2.53.0

