Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33BFCD342C
	for <nouveau@archiver.kernel.org>; Wed,  6 May 2026 13:54:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19C7210EDBA;
	Wed,  6 May 2026 13:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EztVb4Ma";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0754B45DF4;
	Wed,  6 May 2026 13:41:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778074890;
 b=TEg6lzOcy5EO8rNHGf+/SW5C7+AsTqygrOQj7a4nhStseRrpXP4C3aB9S1OSECVmdkoIq
 Wu+ApvXqK/zn22VMJCPdA0vmHClgmB1yNAkC4XSuiR755lvgICESfcG2Xe1JHAGX+WP6QRT
 sdiUGUDCDD5KrM5wbpfHRzweM48VE/poYKnuAzUiErXhnJ4zCNb1v33G25x5segr01ltIWt
 RUXsFN5B2wWJL2pkKj79JwW0tJuPpQMpz+1wVIKZVUXWA8mhhDmBJ6EMk4Pr94SQOUxtcfJ
 /ESUF5RlYeKBW/ghQVn2mK3Jgu+Vi0QQeaLmv+mMymgkLWas/PVHx4kFSJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778074890; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=anogzW8WFSULikUai57bbBawT0NPDNcAYQERips/7dM=;
 b=FNPBoYcb8183XP+1DdeEeKvI3wsWB/Tr26zLq07H3cSNTSdaatFkKqmUQWy44P/MKbOxr
 JZOgF+UvmcoMResfertaND+G5d0zpqY/V74kZuIFJouBwegzVYWJ12BsCLUdPbxZ+yRsJki
 oxK/PTT2kLeBDQ5/x+EVLweUP0P2bsF+cmktu1pRLydaSm0QiD7NOiEZ3mrvn8fc6s62Opz
 s1FzfKY7lLzq0g//6Riho/OFcP+K/flJZKICSaoM0JMKNsIhLkziP+appGKM4n4h34KgHas
 Gyt5AobOK/ebTOBS9FeSt/b17LEnQgQtmn3SIUeEAYQf8SiVMUxUyXE54MJg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A425D459AA
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 13:41:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6590B10EDAC;
	Wed,  6 May 2026 13:54:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3421C436D6;
	Wed,  6 May 2026 13:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134EFC2BCB2;
	Wed,  6 May 2026 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778075648;
	bh=NoI8j3F1YW25tR0zL0cDFy/lvZ5oPDxPYyIFiIeRMtE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EztVb4MarZed7S8kuN33gAfdyd2gdT1d8RmOJSSFKQBihDeycyARB7Zhi+PL+C9yq
	 R/+vcTzXRksxQ4zwZpvTD6wqftzB10Ga7gpdTM7GQ4zQrRzw55F+U/Nk3g+BS7rxAe
	 yJCHf5Cgg2KVl/CRkbJt8CbMzRcsR7MngJkPDmLw+woqflg8wXWdWsAFF/dbk7Qj8z
	 UAQfxxezNET+jbe/+3m39trZkzCd7adVhIZWKuPKj14mUbK2McYqK0Hc7M8eFXdL36
	 HmN2psbcmeCn0x/fBlXNQFIMyKyq79uNEbKjV+Z+dYpIXcyygxbfPThvTvfgp9jFDM
	 +nsbDI3QOR8xw==
Message-ID: <758ab729-dc5a-4837-b255-9462aaa6b0a3@kernel.org>
Date: Wed, 6 May 2026 15:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] ata: ahci_tegra: Explicitly specify PMC instance to
 use
To: Thierry Reding <thierry.reding@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-1-a6de5da7216b@nvidia.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260506-pmc-v1-1-a6de5da7216b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TAFRF7ZSHHCDX4HZNUMSYMLP25LO5YRT
X-Message-ID-Hash: TAFRF7ZSHHCDX4HZNUMSYMLP25LO5YRT
X-MailFrom: dlemoal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TAFRF7ZSHHCDX4HZNUMSYMLP25LO5YRT/>
Archived-At: 
 <https://lore.freedesktop.org/758ab729-dc5a-4837-b255-9462aaa6b0a3@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2026/05/06 15:41, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Damien Le Moal <dlemoal@kernel.org>

Applying this through the Tegra tree is fine with me.


-- 
Damien Le Moal
Western Digital Research
