Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0898B107BCE1
	for <nouveau@archiver.kernel.org>; Fri, 13 Mar 2026 19:32:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E9FDB10E43C;
	Fri, 13 Mar 2026 19:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="LOBh1++9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 401FA450EA;
	Fri, 13 Mar 2026 19:21:20 +0000 (UTC)
ARC-Seal: i=2; cv=fail; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773429680;
 b=b8OYXxHwfs6vvu8fiZCXNci4cD74FbOkymCG+QHGDqdYckKiPhy3ZnpzzSphfN8ShPI6I
 tVMZGgl6BOPFohd5KpMjR6IK5+9Jk1YnBeIe7UOZ57IazaoIvGdofk3Bu7WJeogXz49ulEQ
 qTN/zi9aJjWf+VGvoaJxHvbLR4XbFxXLMgujKeSHWG6h5a1fWbnm1MlfIk6Tf+Fnbf+biEe
 swnnMa6WPpy0a1fX7V6TMcmkTzURXMFkg89aR8xi7ZtNCj0xjrVWER8dhyhbYwGdQUUEmIX
 QrP8Dd2r+SOnguO8DSinILCe5GsXC17DCnOa8ShCxCcbiS+zmUrHvR/9KRWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773429680; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=j8NYgTjqm5J8YGPNrQsUQ8qlvCL3SU/ajcRLywCawTY=;
 b=acx/BkdRL9MVCCGUPzi3/g4R7ctkJ4TldH0UUUuWOSVTjSNpb6SmIzZlhMo9RWIiq0rNB
 P+z6DgnWLq67fS35KxzW70/VwCS1dik45syf16gkjAw5qrHiZZ9waIKHH3v8yAFHB643yAp
 TAP6yXfJQV3XjLeeBYDQ31bKamp1NPKw4I4IHHinO7g0wE9rZKHE3wwPIkpX7tdQk644sTe
 aodVO+xSN4EnpZazH3CTMhrqHT+jLgHh8jGwztHbI09Y6lhMNckj7yB+CC/gBUYjYgRuNAa
 WhTNoS1C2ttqMo6AeSFLEmq5tMTRxt9YcLV1yANpn6MZz7M9KKh9Z5Wf4ecw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com;
  arc=fail (Most recent ARC-Message-Signature did not validate);
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com;
 arc=fail (Most recent ARC-Message-Signature did not validate);
 dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7BFA944DDC
	for <nouveau@lists.freedesktop.org>; Fri, 13 Mar 2026 19:21:17 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EA1A310E43A
	for <nouveau@lists.freedesktop.org>; Fri, 13 Mar 2026 19:31:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1773430314; cv=none;
	d=zohomail.com; s=zohoarc;
	b=dCtUpA72DgbuIKL9O7k3iED2EbGaiPwO9BxA6LdOfoB/F97l94vVIP0Id7M+943c29i9x5tMSjBTYiMlZY3tJXMrh39avPYcC6lBxbwKcSjfpRhNM/tHuHyeTFl7JdxVhU4Niz0NdigkWg2GKklugebiRHyDSGEv2B962Trl1IA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1773430314;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=j8NYgTjqm5J8YGPNrQsUQ8qlvCL3SU/ajcRLywCawTY=;
	b=mF7bg6oiim1URAFIUb6sIoHVXdrQ1AABGBm7LtkZVqne5KMq8E3vs49jB2vHYxJQOdelqVQfAqOxScOfgMbYZ4wnrGnN2ITQ48/efPdpevgjXIECf+9dLJA8lNrZxmv+MEjw4znCEo2lAxySf1VMWN6+SIOQUnbIhfdZSx46b6A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773430314;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=j8NYgTjqm5J8YGPNrQsUQ8qlvCL3SU/ajcRLywCawTY=;
	b=LOBh1++932WGWkRuCEzr5sH0ch8ZTY8I10e8moTY16JCJ7VRSV5oSTmJXiQqpree
	FOuxZ4IjYelwsAI0I+c3G8VuqC0QshLGRwqBUG2U4inOSqDIyGxZI9T1k0x2PcRNZjW
	JroBwAFRsvXcGLxRTgKaPkjB7AeG1G5PYn+E6UZk=
Received: by mx.zohomail.com with SMTPS id 1773430313153333.71971598965956;
	Fri, 13 Mar 2026 12:31:53 -0700 (PDT)
Date: Fri, 13 Mar 2026 12:31:52 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v8 0/7] Rust bindings for gem shmem + iosys_map
Message-ID: <abRmKGUFas8rC_w6@um790>
References: <20260311195246.2439593-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311195246.2439593-1-lyude@redhat.com>
Message-ID-Hash: P4TAHXRYDFB44DW2OWO334TRIQBBWKM4
X-Message-ID-Hash: P4TAHXRYDFB44DW2OWO334TRIQBBWKM4
X-MailFrom: deborah.brouwer@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P4TAHXRYDFB44DW2OWO334TRIQBBWKM4/>
Archived-At: <https://lore.freedesktop.org/abRmKGUFas8rC_w6@um790/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Mar 11, 2026 at 03:52:39PM -0400, Lyude Paul wrote:
> This is the next version of the shmem backed GEM objects series
> originally from Asahi, previously posted by Daniel Almeida.
> 
> One of the major changes in this patch series is a much better interface
> around vmaps, which we achieve by introducing a new set of rust bindings
> for iosys_map.
> 
> The previous version of the patch series can be found here:
> 
> https://patchwork.freedesktop.org/series/156093/
> 
> This patch series may be applied on top of the
> driver-core/driver-core-testing branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/log/?h=driver-core-testing

Hi Lyude,
I rebased the tyr firmware boot series on v8 of this series and it
works without issue. Thanks for this!

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>

> 
> Changelogs are per-patch
> 
> Asahi Lina (2):
>   rust: helpers: Add bindings/wrappers for dma_resv_lock
>   rust: drm: gem: shmem: Add DRM shmem helper abstraction
> 
> Lyude Paul (5):
>   rust: drm: Add gem::impl_aref_for_gem_obj!
>   rust: drm: gem: Add raw_dma_resv() function
>   rust: gem: Introduce DriverObject::Args
>   rust: drm: gem: Introduce shmem::SGTable
>   rust: drm/gem: Add vmap functions to shmem bindings
> 
>  drivers/gpu/drm/nova/gem.rs     |   5 +-
>  drivers/gpu/drm/tyr/gem.rs      |   3 +-
>  rust/bindings/bindings_helper.h |   3 +
>  rust/helpers/dma-resv.c         |  13 +
>  rust/helpers/drm.c              |  56 +++-
>  rust/helpers/helpers.c          |   1 +
>  rust/kernel/drm/gem/mod.rs      |  79 +++--
>  rust/kernel/drm/gem/shmem.rs    | 529 ++++++++++++++++++++++++++++++++
>  8 files changed, 667 insertions(+), 22 deletions(-)
>  create mode 100644 rust/helpers/dma-resv.c
>  create mode 100644 rust/kernel/drm/gem/shmem.rs
> 
> -- 
> 2.53.0
> 
