Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E25CC43458
	for <nouveau@archiver.kernel.org>; Mon, 29 Jun 2026 08:44:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0478D10E77E;
	Mon, 29 Jun 2026 08:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.b="o6qezks8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 964E946D46;
	Mon, 29 Jun 2026 08:29:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782721777;
 b=BAEWflSZTDrSCarUeHYjjs4Yk5NmEcsahlN++MYbaM4NrTt7FnmiZKcBwYmTnrXY2Fcf/
 ynRFc/5gQTF+slSFQ8jV5xrIojSZRp824ApTua4e47VIbG2HqshZmoDld6Jk8a8xdBx3IB+
 VUyLqaiejSR33lAwKDAZkY1wX3XEM701LadJDxIGUgj0UxBNb0s7WZ4hg5ZXU4qk+RXz2de
 RuQKKTQWDAH5kSq4ePHnNQqec7yqXyg9s61Q9XD3i1JBEUc/u4mess8Donclz5GySUzkwjD
 MOqLZgoyW1eUErXaaEIQx8EQHzIQYPTALtY1hpr46vvCgF6zFBNPnc1PM3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782721777; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5JQhJVhtNqFuIOEBZ8hxWTPQkEbzMOEFkTIsOlM8mJ0=;
 b=IN+VD9CkCqECH8uusTHYvWlXzcVNJntnJMzxw1Nm4ZLBHEKZ5jIoczWM/kt5eugLijuq1
 95VJVpe4hg9M2xcjin9WbWLJvXjWhaTCqqxAFmkG99JpArlGP+JNyrwbOVQwRIfQil/qULR
 cdvJKEDln5tf6FOFG5xDRUWk+CycwNkYh8O+cMiJLPe+mN4iLcWjeLKOrEsKj6OSDvYmcOe
 v8rbKpE3xoqKXlZQXtJn9LFo/5yzxYWqRzZaBhBau63fJh0l+PLG3nCmldJJQH4nxuxiKP5
 sqXyg8W39TlRJcQuTz0Fl9YAiUKHIPmkEnG+G1emn/R57n8tRa23FKUVyy7g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=126.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=126.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=126.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=126.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 50A3145E30
	for <nouveau@lists.freedesktop.org>; Mon, 29 Jun 2026 08:29:34 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jun 2026 08:44:11 UTC
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B9C7A10E775;
	Mon, 29 Jun 2026 08:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=5JQhJVhtNqFuIOEBZ8hxWTPQkEbzMOEFkTIsOlM8mJ0=;
	b=o6qezks8HjLc4sgxAhwUvqx4Y5sY4eKoUcxWj/vOa7cptDXEzf7WY3URcOBsbh
	FzPh3nlaHMLunGHr1+ICAAEzs8HgifBtKrve3uCa6rtk0TV9wQXot+mQOT5j2GOB
	0HmYHmi8rmGJVuxSUeZqJO3OhYFjAi6MEVWZKXqW9tvYs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgB3KqmILkJqbhYxCA--.5715S2;
	Mon, 29 Jun 2026 16:36:26 +0800 (CST)
Message-ID: <6A422E7E.5030402@126.com>
Date: Mon, 29 Jun 2026 16:36:14 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: lyude@redhat.com, dakr@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, airlied@redhat.com, ttabi@nvidia.com,
 bskeggs@nvidia.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 0/5] nouveau/gsp: Clean up IS_ERR vs IS_ERR_OR_NULL
 usage
References: <1782119051179226.14296.seg@mailgw.kylinos.cn>
In-Reply-To: <1782119051179226.14296.seg@mailgw.kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PikvCgB3KqmILkJqbhYxCA--.5715S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxury8CF1kXr4DKw1fKry7Awb_yoW5GrW8pa
	18AFn0yr4jkrWSyFWIya18Zw1fZws3KFWxCF92gasxZw13AFWxAr4jqw1Y9a4UGw4fCa1U
	XrW7K3WYvr4UZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUBMNUUUUU=
X-Originating-IP: [112.64.161.44]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoQrYqWpCLooHGgAA3L
Message-ID-Hash: 3DOIZ57OMJZLWXBBSH6LNW5UKNNNXJQJ
X-Message-ID-Hash: 3DOIZ57OMJZLWXBBSH6LNW5UKNNNXJQJ
X-MailFrom: zhongling0719@126.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Hongling Zeng <zenghongling@kylinos.cn>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3DOIZ57OMJZLWXBBSH6LNW5UKNNNXJQJ/>
Archived-At: <https://lore.freedesktop.org/6A422E7E.5030402@126.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

  Hi

   Sorry for the noise. The v5 patch fully addresses all documentation 
issues and passes AI testing with no code changes. A similar fix 
"sunrpc: Fix error handling in
   rpc_sysfs_xprt_switch_add_xprt_store()" has already been accepted by 
the community.

   Please review when you have time.

   Thanks!

在 2026年06月22日 16:11, Hongling Zeng 写道:
> This series addresses feedback from Danilo Krummrich and Timur Tabi
> regarding the use of IS_ERR() vs IS_ERR_OR_NULL() in the nouveau
> GSP RPC code.
>
> The key insight is that we should align error checking with the actual
> return value contracts of each function:
> - Functions that never return NULL should use IS_ERR()
> - Functions that can return NULL should use IS_ERR_OR_NULL()
>
> This version adds documentation to clarify the return value contracts,
> making it easier for maintainers to validate future changes.
>
> Return Value Analysis
>
> After thorough code analysis, the RPC functions are categorized as:
>
> Never return NULL (use IS_ERR):**
> - r535_gsp_msgq_peek()
> - r535_gsp_msgq_recv_one_elem()
> - r535_gsp_rpc_get()
>
> CAN return NULL (use IS_ERR_OR_NULL):**
> - r535_gsp_msgq_recv() - returns NULL when RPC length is invalid
> - r535_gsp_msg_recv() - returns NULL when queue drained
> - r535_gsp_rpc_handle_reply() - returns NULL for NOWAIT/NOSEQ policies
> - r535_gsp_rpc_send() - can return NULL via handle_reply
> - r535_gsp_rpc_push() - can return NULL via handle_reply
>
> Changes in v2
>
> - Added kernel-doc comments documenting return value contracts for all
>    RPC functions
> - Cleaned up incorrect IS_ERR_OR_NULL() usage for functions that never
>    return NULL
> - Kept IS_ERR_OR_NULL() in places where NULL is actually possible
> - Added Fixes tags to all patches
>
> Testing
>
> This fixes the NULL pointer dereference oops that occurs during
> nouveau initialization on some systems.
>
> Patches
>
> Hongling Zeng (5):
>    nouveau/gsp/rpc: Document RPC function return value contracts
>    nouveau/gsp/rpc: Cleanup incorrect IS_ERR_OR_NULL in rpc.c
>    nouveau/gsp/rm/alloc: Cleanup IS_ERR_OR_NULL usage
>    nouveau/gsp/rm/bar: Cleanup IS_ERR_OR_NULL usage
>    nouveau/gsp: Cleanup IS_ERR_OR_NULL in nvkm_gsp_rpc_rd()
>
>   drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h   | 2 +-
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c | 2 +-
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c  | 2 +-
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  | 81 ++++++++++++++++++-
>   4 files changed, 81 insertions(+), 6 deletions(-)

