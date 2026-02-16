Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B67E83840
	for <nouveau@archiver.kernel.org>; Mon, 16 Feb 2026 22:15:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 289B410E3FE;
	Mon, 16 Feb 2026 22:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pElpAS1H";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C7D3340582;
	Mon, 16 Feb 2026 22:06:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771279571;
 b=xSZPLcXklCIZWxfb4NwhxgOUzgzY7ugBS775GFZ2IOEyzN2np2RibROdi+ZZp0ZvNGFoe
 MrvTYYkzkYT/36vdBfVKFUgpHKZpgQlVK/gR51+4imNeLJlaOF0QdN0Ng91wVYSUQe3UBFS
 SRrR9q7zB67rink4EODGE47tDVJiKlJnxPL5sS2WDDEyDU+9gxiMUDiO/vArmcUELhwWqIj
 CZxsFuJ8/rzJWTKSZ9BpuKmD3uHqWct4j+J5UxMVhsOqHD5ZZ5PcgE9SexBWYOjO42B0r5x
 Kgny4aD1vEwy5AA/13deG1jFE1Ezl9UeQQKINV+HhORBW9xhGc4KJGCOkC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771279571; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ktKlpr9epck2KbEjQy/EOpt6H/El8eNuAVvaEEIDlsA=;
 b=vBEsGtHBCnBEVJQD9SxQcYd6W5chIiUvE5W+PfSD5pDquvEKJOv0qjUFL2Op/PR03v3rd
 qtISdkuC1nkC/IVs0XIjt26mdg04jCaoCj/4+C2oqP8w9yfBGeRuuFPTEum8jRemHiOTsIb
 iCXtBcJ7DuXC5vmNaEsW2Fg/nJz2mj1+vu62yLkim3cCHJIwzYt66XTZY9rJTJsp8nxYxPL
 BlvntF8MHhaZV7hm0XSvNk0GG5FaByxGWPNJWZ/3MVMSdQtevuKgsp06sa7AhRRduLNW3fm
 CSIHxo8rrRCaeQwnnfG7ONeiO3XleR6eOe1amVfEI7i7ZJOa1yp769l9yG9Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F0A2040399
	for <nouveau@lists.freedesktop.org>; Mon, 16 Feb 2026 22:06:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 24EE410E3F6;
	Mon, 16 Feb 2026 22:15:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE6CD416F5;
	Mon, 16 Feb 2026 22:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B49C116C6;
	Mon, 16 Feb 2026 22:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771280153;
	bh=ktKlpr9epck2KbEjQy/EOpt6H/El8eNuAVvaEEIDlsA=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=pElpAS1HiklX7w3PWvkrdYLCrGzKiGPqEdOneYAqprY97nqSb3bmzHCvAaSedn1Vz
	 xXPcimOhmU3+C6ZEtnwu/+3oN2YBQlCa0vnelnrqODUHhjsUyKImGBiRsiWh0lVgFl
	 nvfmJBg868X3gq1bQ4oPt/1Az3MwzV8kT8ixyrtiZiwtTiCXf7j2tUZ5fCcK63/gNz
	 whpATMbYVLYhK7J955IlnuGlwQMWGuE5i24GT5XAMYqvKX+ERznrZ/tydiDLKDmVj8
	 fkd/HjGtf+4xVtODx8XFl8P4HeqTABMRyOg5vfq4hydZrpAgz4dRuLMlE1IcaFg7Ed
	 TGSWh3vf9DFRQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 23:15:51 +0100
Message-Id: <DGGQERY8LNX4.2B7KZJ6VLBSQQ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] nouveau/gsp: drop WARN_ON in ACPI probes
To: "Dave Airlie" <airlied@gmail.com>
References: <20241121014601.229391-1-airlied@gmail.com>
In-Reply-To: <20241121014601.229391-1-airlied@gmail.com>
Message-ID-Hash: AMIDB4MNL6GTIUZRQJAJT2ADAGMZCYMD
X-Message-ID-Hash: AMIDB4MNL6GTIUZRQJAJT2ADAGMZCYMD
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AMIDB4MNL6GTIUZRQJAJT2ADAGMZCYMD/>
Archived-At: 
 <https://lore.freedesktop.org/DGGQERY8LNX4.2B7KZJ6VLBSQQ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Nov 21, 2024 at 2:46 AM CET, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>
> These WARN_ONs seem to trigger a lot, and we don't seem to have a
> plan to fix them, so just drop them, as they are most likely
> harmless.
>
> Cc: stable@vger.kernel.org

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM"=
)

> Signed-off-by: Dave Airlie <airlied@redhat.com>

Applied to drm-misc-fixes, thanks!
