Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC38E9A048
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 10:09:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C34E10E687;
	Thu, 19 Feb 2026 10:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QTUIZPLo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3FDDF4341F;
	Thu, 19 Feb 2026 10:00:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771495201;
 b=0DSak8P9nkmRlwTMTufYKRnSRLambJXcqGZgReNrluwM4kylmefuCdOYWk/ljBw+g3PO4
 VE/EgTT2qyB8Er1DzuLygtkUup2KmC/43V2PaX3MbyMGxMsBySI0HlLcqOCpxKr4nu0wuqz
 rcS3Q1ZcnS7rYhMA9BKlS0I2SXfezuXp9u9uy8JtRQlQZW8tyNkRcc0qLtzwpRcJPNTEk7Q
 X867/9PQjt8nmroWfpFqLrJ4GSPpiR2gm/PdrFeHa9rHF6H4YmHLvvyzrkhkQTAjxCQy6zu
 iRB715RqAw4HSzz4k8OwLJTMCQ//xPuQx7THjJecI+AmtACBgAIKnnFVypSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771495201; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=q1/kcsmRETp7wspynddOCV7OlvJ+YvFQsBqiIrIMRr4=;
 b=uYQxd7KQG+u57J7dtx5j4Ldwqz8n0SCxRTnCod3dQ4vKIWMW8HqANavDGCNEML4eijp4X
 z0n1FQSHsQrI1c5whgc4KKN/tuSWBlf1q5nlGGlEHHqSaKjgeT2C29l3NKygXKCxy2Hup7p
 ROET/OlwkrtdPHj6XCkOfCKi8Im3/h8sC1fiks4DrHLgiBrZ4A91Qd1cM4e2lpnYU0BDq31
 05ffDt5VPnFiPDvOVjjpB6XOWWxkbr75jXFcpZuH/OJLpbow576sgXYmwJzHHLGcvOpKov3
 7ZulEw8HHPfgqaVTQc7gimFW3kvP4UffxBYEh8Hkt/X7zenHd/sVn+yc/4RA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D164B430BD
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 09:59:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 76D0510E23C;
	Thu, 19 Feb 2026 10:09:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B76060054;
	Thu, 19 Feb 2026 10:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EDFC4CEF7;
	Thu, 19 Feb 2026 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771495787;
	bh=q1/kcsmRETp7wspynddOCV7OlvJ+YvFQsBqiIrIMRr4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=QTUIZPLoWDtllOmleDtmudvrTyW+aH6DHEaB39eE9nhw9OfqYWDoOUx1LcX3Iq/s/
	 /07ir+pL485oJZgPmPrVVqdFgKQxU6nR9eN8MEMZr8CBihxbLJiu8g3cxyyumNXss6
	 xTtZZeTGXUqaYTstOwP9xuqAbK6VIjF+8YiSFH4FeNP0PCCCxLW/v/uRwatJSl94pN
	 4IIXd/+d3o1hWP7ZwukN3Wd41o+2HxBT3TR/rb7y5yVgrxiZqiZinv8Xm+olshjBAR
	 Wa18gcI0xWgtVeWSPOd1PYI1wFtiq5zOjzXXZy74VAt8B2hh7ZbFTWz3Dp0sHgJUgN
	 Rsf2sSPGAPLKw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 11:09:42 +0100
Message-Id: <DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org>
Subject: Re: [PATCH v10 3/8] gpu: Fix uninitialized buddy for built-in
 drivers
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-4-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-4-joelagnelf@nvidia.com>
Message-ID-Hash: TGVMRQ5WETG5ZIQOBDXAW4GA2LB3AAUQ
X-Message-ID-Hash: TGVMRQ5WETG5ZIQOBDXAW4GA2LB3AAUQ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TGVMRQ5WETG5ZIQOBDXAW4GA2LB3AAUQ/>
Archived-At: 
 <https://lore.freedesktop.org/DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
> From: Koen Koning <koen.koning@linux.intel.com>
>
> Use subsys_initcall instead of module_init for the GPU buddy allocator,
> so its initialization code runs before any gpu drivers.
> Otherwise, a built-in driver that tries to use the buddy allocator will
> run into a kernel NULL pointer dereference because slab_blocks is
> uninitialized.
>
> Specifically, this fixes drm/xe (as built-in) running into a kernel
> panic during boot, because it uses buddy during device probe.
>
> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part tw=
o)")

This Fixes: tag seems wrong. How is this code move related to this problem?

This should rather be:

Fixes: 6387a3c4b0c4 ("drm: move the buddy allocator from i915 into common d=
rm")

Also, please add:

Cc: stable@vger.kernel.org

> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

I also think this patch should be sent separately and go through drm-misc-f=
ixes.
