Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C623AFD004B
	for <nouveau@archiver.kernel.org>; Sun,  1 Mar 2026 03:03:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 68DA110E3B9;
	Sun,  1 Mar 2026 03:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="EVspzjq7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 973FA44CFB;
	Sun,  1 Mar 2026 02:53:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772333601;
 b=qejcUREs8r6Opk6OuSxavOepu0iBwirFpF/l/HwU1glDUN9mvFaX3MncaGsrHPZIVn4my
 +swq70HJQrPRctlWwdFP52JHcuLGzq/mNt0nBOZ7vKijfMtxR+z1SDrXfjbgNne3n7sYL36
 iy3BRTuhiR46INqFwOaUU1uf3ALv6dmuPX8Lo7nd3N9ghYw0AMdxlU5/NXHsEmvXUaQ8WIt
 12RXLWe+1FBYht4lclGg0m0G9SMDf2QBJmsHSQTt8VMNOyBfzKrwqdvf/7g9GDNGx0o46Pp
 BllDvrIDflTpq7osmfRSF1PqG2P8HLCIHf5jVjVAgx2InxagUzrPotTvqwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772333601; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=O8AQRwkuen2J2VbPw4OAhdRbe8PeJJKYGBh2E6Vfdaw=;
 b=NhkbfZdYA+Z28v0+T+dx7be6mF3NB8JG+fbRIFhBqhuO7DzThhari8KinNlKdKxE5LAxL
 C4wq+4uXaANmJcfhn+1xv4+jrGlpIbvkjzxFCFk3t63/R3AfAxg/A4r37CG3Vw48LLyhxGM
 ARuF9sHB3Sx5WttMACamj1/8KvuouCtXO0rnTS2+ARmQAea2Av37VGPp1vKFzt5OFUiIUdm
 2nGe/JhrVYBTEh4efuCJERo4gy03diX/jEhVQnXGyLEXP3lfscCZztEyXIe5MID6U6VZTP9
 oQ5Q7Q92vlmqem5csCN7/BPZp2njas4hlAYQiP3+2wJBPQ0o4cM+3K0fqneg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=infradead.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=infradead.org; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 696BE4055F
	for <nouveau@lists.freedesktop.org>; Sun,  1 Mar 2026 02:53:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BE56810E0A9;
	Sun,  1 Mar 2026 03:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=O8AQRwkuen2J2VbPw4OAhdRbe8PeJJKYGBh2E6Vfdaw=; b=EVspzjq79oLNNa56WDjYtDF+JC
	Bx3WkOv204TCjyORd7t9CZ1ARwuH/0CbDO4cvHqrgZgLUguInBGr3Tvcqhg1wwGyeNCOYoy2j+anu
	sfLXNl2LfXr2/mfPKfQMxNdpKw+c6bRKcBm3jadrxHdRZWtkwrfQ11/L3THgbCeQPsGD2pvPZWEgJ
	Kz/m8G0g58CTreOxRBLno5q8+U9p5R3WjMxNkHAMstRpQWzkZ+V5hfmF/PakQUlYA8oLfZ4++Bpn7
	0a4ycPB2091dyXEsAtPSeDPUOU0ejKVVEaQE9qm0h496EmzyfMtnVbrbI6aa73zfYYs2dTtrZHnBX
	3GxXwK0w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwX5M-0000000AmD7-3feh;
	Sun, 01 Mar 2026 03:03:12 +0000
Message-ID: <2512c6a2-df8d-41d8-8d94-4c004cc60f86@infradead.org>
Date: Sat, 28 Feb 2026 19:03:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] gpu: nova-core: add initial driver stub
To: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch,
 corbet@lwn.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com,
 bskeggs@nvidia.com, acurrid@nvidia.com
References: <20250306222336.23482-1-dakr@kernel.org>
 <20250306222336.23482-5-dakr@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250306222336.23482-5-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4CVO4AGOGORCDTQH7WTONRU4PPXZQVZL
X-Message-ID-Hash: 4CVO4AGOGORCDTQH7WTONRU4PPXZQVZL
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4CVO4AGOGORCDTQH7WTONRU4PPXZQVZL/>
Archived-At: 
 <https://lore.freedesktop.org/2512c6a2-df8d-41d8-8d94-4c004cc60f86@infradead.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi,
Sorry for the delay. I just noticed this.

On 3/6/25 2:23 PM, Danilo Krummrich wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ca11a553d412..ede8abee210a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7450,6 +7450,16 @@ T:	git https://gitlab.freedesktop.org/drm/nouveau.git
>  F:	drivers/gpu/drm/nouveau/
>  F:	include/uapi/drm/nouveau_drm.h
>  
> +CORE DRIVER FOR NVIDIA GPUS [RUST]
> +M:	Danilo Krummrich <dakr@kernel.org>
> +L:	nouveau@lists.freedesktop.org
> +S:	Supported
> +Q:	https://patchwork.freedesktop.org/project/nouveau/
> +B:	https://gitlab.freedesktop.org/drm/nova/-/issues
> +C:	irc://irc.oftc.net/nouveau
> +T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
> +F:	drivers/gpu/nova-core/

This is merged as commit 54e6baf123fd.

Entries in the MAINTAINERS file are meant to be kept in alphabetical order.
"CORE DRIVER" is mislocated. Please correct it.

thanks.

-- 
~Randy

