Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C6FF8D776
	for <nouveau@archiver.kernel.org>; Thu, 16 Apr 2026 20:12:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DCBC010E232;
	Thu, 16 Apr 2026 20:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="debfNVvt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9BBA5459B0;
	Thu, 16 Apr 2026 20:00:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776369657;
 b=M/emvnAE8KnKUjw9WXxkCZKEuJ9MThgJY0VtCX42FFx8gm+WUazfqbPdLvPX0Bs2AC3dS
 hTqq2pp/6cT3SCGz/wVtHzHLam7NWTogb6BLfcucQr0+Jh0JF4TPSwlAE1xIGfQSzVAQxhk
 GItTyP9ntZDwrVusbC6O/sz6KnAw8Pgi8i9sD//lzDsltjAqnf19WVQNXoOOMGRVqv7Y1pZ
 tGn35OFH/jHCUackNLYBCYv2dqazG6PJEdl0Ou88fF4N45BcDOLqGq/Q8Eh0aR+5DsYF+qx
 NVuSB/8MZ7O3aHSI/Whw30MPk0UFSg0HzPjrUThLieAL7MYxES2qHT5W5BOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776369657; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GCflqEGf85TMqrxZBuIMJdwsGyULtUSAezMpbRp3eBM=;
 b=NiYgFWPLL3SdtdFHEqAZI0KW5odBDwidJ30nOTpM9LNSP6VNjK//2ZeD8y36b35Dk451A
 udNMm6ryHmT9u88tYMf47d+WUVuovJyNV/TU6jaVIr7hGUe9FM4XwUwPFAYUYnPW/bezFHT
 +oXRQJ9U5KaKPPxKyVK1aURUo1+MHdDfdeWraudqr8uxUrcRPkP4A2ga4W6wQh6Zh7Y+ByU
 6EXPzWY6xdhWGmKcOx0x0/6OrsN6sp6CKerrvpF4Ke8B5wBDSRSV/YWashTuXlClqFDMpMv
 LnQ54AsZI82VhZSxWnjxAen09oh73c6CDpqSuwlbXeA81aP4QjyxQhN/nWtA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C7FD1456FC
	for <nouveau@lists.freedesktop.org>; Thu, 16 Apr 2026 20:00:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C71D510E22A;
	Thu, 16 Apr 2026 20:12:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDC8360127;
	Thu, 16 Apr 2026 20:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DE3C2BCAF;
	Thu, 16 Apr 2026 20:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776370369;
	bh=S7Lyz29vNQw7ueK8+j0MzNstO84GRnc9HJjuJmASNnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=debfNVvtb4NPryVMBdw8mklrNaILbPdWvd1TDjfPXVylWd6nkovkSm2x1+mqzaDlh
	 v1BHnjC8nGAhQNyOtjg+tax1WpWCrqmveTx8KtT9lsoIP2DfVvKox67loGjBJWdr58
	 z4wFCy1ot1jpHpi/BZttBHTiblowgTVKsgGsXb2W//75rrrlEhgNX2KgXITeM1DBya
	 agZosVrT5S4Ru1q4iIKCG206JksVTtsezjM/o5FWmmFdVV1NvSD9QyPC4g/FYfEPPM
	 ivYBxeCndOCK9OrWCChgKTsHU0w3Nv7kvmScQlP/QfkwamaOanOG8ex2ZncITEyqJs
	 OMUZiwjzzWJJg==
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH v2 1/2] drm/sched: Make drm_sched_entity_kill() a public
 function
Date: Thu, 16 Apr 2026 22:12:36 +0200
Message-ID: <20260416201236.13856-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415144956.272506-2-phasta@kernel.org>
References: <20260415144956.272506-2-phasta@kernel.org>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QX5YEAEDPF6XMRVSJJ2XZABI3MX2DOZV
X-Message-ID-Hash: QX5YEAEDPF6XMRVSJJ2XZABI3MX2DOZV
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QX5YEAEDPF6XMRVSJJ2XZABI3MX2DOZV/>
Archived-At: 
 <https://lore.freedesktop.org/20260416201236.13856-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 15 Apr 2026 16:49:56 +0200, Philipp Stanner wrote:
> [PATCH v2 1/2] drm/sched: Make drm_sched_entity_kill() a public function

Applied, thanks!

  Branch: drm-misc-next
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/2] drm/sched: Make drm_sched_entity_kill() a public function
      commit: 2f5f05633e22
[2/2] drm/nouveau: Fix double call to drm_sched_entity_fini()
      commit: cac96c8d93fa

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays.)

The patches is queued up for the upcoming merge window for the next major kernel
release.
