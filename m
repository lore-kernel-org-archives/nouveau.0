Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046E4CD4F3D
	for <nouveau@archiver.kernel.org>; Thu, 21 May 2026 14:04:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B151610F335;
	Thu, 21 May 2026 14:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ndpLNb9V";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5299246133;
	Thu, 21 May 2026 13:51:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779371487;
 b=FR99lG1PjI8qmEtgD0nhXOfa+uN9a/LHooIj9Au/V41vDOOaMPTv3C+HObZB6PTrDqoRi
 dWq5433FwSeX9/xcLjeAAyxCKla3gWo7OBghNq7koMhFqCfdYMwAkfY290lQtvD8jxmzAbA
 HNh2MXBq6fEoTtpKL/xBfPIJFNJ5vL3HudNqXkcC5EnpE8XRQlCkoH4keprOphrfXjBsR2H
 oliFFJwWwtI1xgtmWqHeRj0KVpa6qCLa33g/ruO98llGMVXHg9cgKHRyxOImVm6/u6ATNZH
 cGXaGFLrucwrdIXwvpkmS8WukasubF+3qZVf3kjNNQtobffXXq1VOXiyvUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779371487; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FWH/NGzx2LGqb08RC7u+pA/G/lGYe9fGPgpUL1yfjKg=;
 b=kBZ4gA7QTyVoXJua/qR4J+59vwtV0utofENyuGLllNnmi7buYgcNhB4hqU3laSk7ObHST
 bPctgvOV38cfku9kQXMOSMscxt8+8jyG1Qh3wuXXmJNTrrT8mybLeUJkN5JotisYuf8L82R
 XGnND1FFPLa2Ikatod/7YQb9//95Ux45DsvZMkcGIGifhnuEuV8ean7ktHn0tDNwxq2FCrj
 kFk8KaG8u3NLHPB7N2OwT278RA9/5T75xltb2ItQNBypoZE7bBbGr9MOxWmiJEoQ+uXhUmb
 vRZwSjaX24PkA4J8x19oTx+HomnBvUwclWELQYAKq4kSkhBzxel+xlj7kgmw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 67280460BB
	for <nouveau@lists.freedesktop.org>; Thu, 21 May 2026 13:51:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F397010E4E5;
	Thu, 21 May 2026 14:04:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8DD4437A0;
	Thu, 21 May 2026 14:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC561F000E9;
	Thu, 21 May 2026 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779372275;
	bh=FWH/NGzx2LGqb08RC7u+pA/G/lGYe9fGPgpUL1yfjKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ndpLNb9V31MDOCE51O07TD0paBjDV8FdPPZQ+IHalbYt8bq8rT9j/AHMbdxgOtraC
	 7BrZ435+uFru4pZ4iNvPoVLnSTxlZROImDvan6wJVdHRGjojciQd15bS4sJ8jDfMvN
	 Aa7Ae91gv7DHSrsu5X1IN2gY91aNR/WkC0vKKIS+wAnnGILLEL12ssqhhK1R0Asixq
	 5LGHrO/gsSNJUYbZyz/aQbW0iSduIb9+nH+/NSq3K6o0wJH3Kup1y//wStU1gXUN4V
	 paZs57YiA7PIjomPJ7SgHp+wJ6CzQWec8M5ytY4Mp8lGz9RiQqC7wt0Vjn4g1acY4v
	 bIZE+MsooL2Hw==
Message-ID: <f08c6164-78d4-4c79-b4d9-d7e883e5a0c0@kernel.org>
Date: Thu, 21 May 2026 16:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance
 to use
To: Thierry Reding <thierry.reding@gmail.com>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-2-a6de5da7216b@nvidia.com> <ag67dmFtSDBC6aPK@orome>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <ag67dmFtSDBC6aPK@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: T277HKSMGGCUF55IECQZNLPDJTX3ZXGI
X-Message-ID-Hash: T277HKSMGGCUF55IECQZNLPDJTX3ZXGI
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-ide@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/T277HKSMGGCUF55IECQZNLPDJTX3ZXGI/>
Archived-At: 
 <https://lore.freedesktop.org/f08c6164-78d4-4c79-b4d9-d7e883e5a0c0@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 5/21/26 10:00 AM, Thierry Reding wrote:
> would any of you mind giving an Acked-by so I can pick this up into the
> Tegra tree with the rest of the series?
Sorry, I thought I already replied to this.

Acked-by: Danilo Krummrich <dakr@kernel.org>
