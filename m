Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75677C61DFD
	for <nouveau@archiver.kernel.org>; Wed,  2 Sep 2026 05:01:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E42C10EFDC;
	Wed,  2 Sep 2026 05:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SpXqayWN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 82E7447DED;
	Wed,  2 Sep 2026 04:44:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1788324240;
 b=tOMTO0ZB2K6JfIkWHKIy8qjpc2zFbh47qpok37qRIj7HKyXnPnBisLVxAi8VPBlEAVswV
 qDaJrATsFvjyWNnBBremDnAYTmVy9WarOzBNPhQY6bcN3b82mwUD9wYFDPM43HLYuBuqq03
 TvlhqOSW+y1uLl1pVXsX6cjzzjRv/2dhRQ2pzbCNyaX36NGd+EVD55ybSsbQ5nEFY39GBni
 eG9Q89z8HCtfgA/8/p6aWTiVIg8lwHzChZG+znnovy0K9isj7gJa63UrfmA9DgSqMhDspyL
 O+1VCIsa5N07bA+VkC/nBLrF06pPMBReuwjbBtY0qPpM/bzzg9Htj330G6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1788324240; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dOFHe9qy1FZ9AF7sT7V/8hJAwDE8aQjo4Sa9CzpQyek=;
 b=JN8PnAd83HOoAZKl5xMRjps9nW9x0/dfh0H664Gj86muGXxxYhKrjbbiQdg5SvUkLbEgO
 rHa3x5DfgSN/ZjDEJ9Sh/ZoEt+ExIvy+sVWV4X7yQ2UL/fJm7K1YMDQnZcZtwB43NkyUhR1
 34pAKvIgrNDtVZPKBwQhGFL55UX1ixdtH74c2G4SZMY/MUIm880F2t/Wo3qdTr4Nne6KCaB
 h0YmqEQLd9TdaAu2SCl62cAJ5PZdspfhu/oHEf2ZAcFwxwv64VIDUdfx5NW6lUcxRSAAyNM
 DkKJ9xRRijK2B63FF6UGv5hQHiVmGi/9Gus5cBC/+VDMrWwd0/MWWuE5g8Jg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3C87747DDD
	for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2026 04:43:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C4C3710ED0D;
	Tue,  1 Sep 2026 14:07:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B89741A73;
	Tue,  1 Sep 2026 14:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6C51F000E9;
	Tue,  1 Sep 2026 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788271677;
	bh=dOFHe9qy1FZ9AF7sT7V/8hJAwDE8aQjo4Sa9CzpQyek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SpXqayWNt+PO/X6NDg09ZCcJ7lHRUQ/2K46HBjqYSObsNhAQptkcFYcbB6YEvLbFF
	 kNK6Ci3Ls4HI8VXFRbDxa/TL7v4SKF4170GWynJ7a+Idu7Ofz+tioACRnAQlMtKrxX
	 pdEPo6Vikx4ZKHGsXA4h6RcG1vyoDFl6LAwpSdw9ghO/GBDZNNdMQPCNd0SrPCfR2C
	 soWF9BoDtgFC+7RKtccvM4lG2iWvCWV6JdHvVqUtsf+QvN9QJK2vxFlnyI5Anmhfu1
	 WiybX0lRfZSAeoFgTHjDphX/6qLBX9Z6jrgspOGZpPBxDnDSaIp5Fo1DDddItnjOjT
	 0owUZHSaKERJQ==
Message-ID: <8cb96c08-2d1e-459e-b356-c6fd97ef869e@kernel.org>
Date: Tue, 1 Sep 2026 16:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: Use write-combined maps for coherent
To: webgeek1234@gmail.com
References: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: K7AAJKXZ7OGWKTYPKWA3HFTMJPVEZNHY
X-Message-ID-Hash: K7AAJKXZ7OGWKTYPKWA3HFTMJPVEZNHY
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Faith Ekstrand <faith.ekstrand@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K7AAJKXZ7OGWKTYPKWA3HFTMJPVEZNHY/>
Archived-At: 
 <https://lore.freedesktop.org/8cb96c08-2d1e-459e-b356-c6fd97ef869e@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 8/22/26 6:42 AM, Aaron Kling via B4 Relay wrote:
> From: Faith Ekstrand <faith.ekstrand@collabora.com>
> 
> On Tegra devices, uncached maps traslate to device memory, causing
> unaligned accesses by userspace resulting in a SIGBUS. Instead, use
> write-combined maps to ensure proper access.
> 
> This would also affect discrete cards on any Arm device. It was
> determined that discrete cards regardless of cpu arch should use
> write-combined maps for coherent anyways. Thus this change is made for
> all gpu types.
> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
Can you please provide a Fixes: tag? Also, please remember to Cc: stable if necessary.

Thanks,
Danilo
