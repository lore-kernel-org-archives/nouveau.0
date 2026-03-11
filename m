Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690DD1125876
	for <nouveau@archiver.kernel.org>; Wed, 11 Mar 2026 19:29:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BBE3610E911;
	Wed, 11 Mar 2026 19:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aDblnM3i";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 788FF45097;
	Wed, 11 Mar 2026 19:18:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773256721;
 b=Rmf1zXrU5ZkXaH1/QH/b/CW3uAo903bKXbMek99FMcXLd9TZgQHuBMTLcoZKSuUG/m65E
 Fm+WeNTr16VwLWc67ADXiXdvVY80FQvhaqHfPv+HKQyBB0Xl4CKeyA9S9MmKQjqn6eGXc6l
 c9rLYJY8+A7yAKbKtfoHSD2bTPD/mQ65rwrHx6Sexa9oxuQgrMt5PS/pUcV6nHcnSxPPG64
 /yQmXYPDjZb9ZtR0YzlFYpbcr2U6VLtHdT+2/7wPkj0Q2QqJj+8n06u8kVxjswIXUG/K+rv
 M85cOcbDx+3Xejp9WxgYkV5Nt78gzykzu9IxJJIXM/AhHsmViOWMNwBzDFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773256721; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Z7ojrvyt28C4ofySMX+W+lKgPJmVwUUI3phiKMfX7Kc=;
 b=cr04GPAYnXpWclSa5RuB9XOckiw1EQlWmUeDbWyQMfMmemGqpagEJutpPmsbyM6MrnFL0
 2w4CyBJXhuLNnmJ4DMskaxrPj1vYZfIlzSgsEzBPPZVW4Z2jxjiRHYY2kHx4xdR5bYsEms3
 TSXbJF0+sq4fsOddeAcbXEBGkYBig/GaI+ndP0KJLTsz+E4qeS8iXH8S4Ys/379mItb0WIb
 fChe+JEPTJuFA1V021uI5Ze5Am8FRifw3OB0pNql6pixugDHiF3YlvI/EOQyLMXzy1lxeKW
 w7s6hPeFjnWRTYJptTjpfdg6uiSlyINW3k0Vaq6Ij4lmEgVNEHxDUORQXohA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B05E342BB3
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 19:18:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C021310E3EE;
	Wed, 11 Mar 2026 19:29:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 545BE43CBC;
	Wed, 11 Mar 2026 19:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4140C4CEF7;
	Wed, 11 Mar 2026 19:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773257354;
	bh=di+E7MXWh/g25iMk/3f4KHldNwtUxHoHuLkUNpN1VAQ=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=aDblnM3iK8uybcluW+/jD87KEQs943D8NsRWUtIspKT+HJWyByWH4UagLsF5B305c
	 YKfVR7+1EiKHS8gXTF1LNxEkVvSYE0S3Uim/wqePTyRf3W4dw3ciiaXtrezmeJOrht
	 fy9fU5dC83OZnbwQa/5UMYdeftwAfR08QjxNDYIm4KGyomUdJPiCWSvxPFGqRHYDr+
	 L7k5CgnEd5nLhtYD3BbGUhP42kNkOx9d+v1W079L1JgQR45vg0QW9hMGBWYqto9w3u
	 cnJoVz0/lfwkzJv9pYvn8gW1vB73fa8+TTebkHxkv2IDP+Kl3c33Jzf8ZNpy960i55
	 e4YJO9CCsEr4A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 20:29:11 +0100
Message-Id: <DH079P4ZTAJ7.OSA93E7REMVU@kernel.org>
To: <acourbot@nvidia.com>, <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
References: <20260309225408.27714-1-dakr@kernel.org>
In-Reply-To: <20260309225408.27714-1-dakr@kernel.org>
Message-ID-Hash: 3ZD7NKPU37GML7RDWK2CPVCMPXL5KD45
X-Message-ID-Hash: 3ZD7NKPU37GML7RDWK2CPVCMPXL5KD45
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3ZD7NKPU37GML7RDWK2CPVCMPXL5KD45/>
Archived-At: 
 <https://lore.freedesktop.org/DH079P4ZTAJ7.OSA93E7REMVU@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 9, 2026 at 11:53 PM CET, Danilo Krummrich wrote:

Applied to drm-rust-fixes, thanks!

--- commit ---

commit 0073a17b466684413ac87cf8ff6c19560db44e7a
Author: Danilo Krummrich <dakr@kernel.org>
Date:   Mon Mar 9 23:53:24 2026 +0100

    gpu: nova-core: gsp: fix UB in DmaGspMem pointer accessors

    The DmaGspMem pointer accessor methods (gsp_write_ptr, gsp_read_ptr,
    cpu_read_ptr, cpu_write_ptr, advance_cpu_read_ptr,
    advance_cpu_write_ptr) dereference a raw pointer to DMA memory, creatin=
g
    an intermediate reference before calling volatile read/write methods.

    This is undefined behavior since DMA memory can be concurrently modifie=
d
    by the device.

    Fix this by moving the implementations into a gsp_mem module in fw.rs
    that uses the dma_read!() / dma_write!() macros, making the original
    methods on DmaGspMem thin forwarding wrappers.

    An alternative approach would have been to wrap the shared memory in
    Opaque, but that would have required even more unsafe code.

    Since the gsp_mem module lives in fw.rs (to access firmware-specific
    binding field names), GspMem, Msgq and their relevant fields are
    temporarily widened to pub(super). This will be reverted once IoView
    projections are available.

    Cc: Gary Guo <gary@garyguo.net>
    Closes: https://lore.kernel.org/nouveau/DGUT14ILG35P.1UMNRKU93JUM1@kern=
el.org/
    Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindin=
gs and handling")
    Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
    Link: https://patch.msgid.link/20260309225408.27714-1-dakr@kernel.org
    [ Use pub(super) where possible; replace bitwise-and with modulo
      operator analogous to [1]. - Danilo ]
    Link: https://lore.kernel.org/all/20260129-nova-core-cmdq1-v3-1-2ede854=
93a27@nvidia.com/ [1]
    Signed-off-by: Danilo Krummrich <dakr@kernel.org>
