Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32788F01826
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 10:53:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6FC10ECEA;
	Fri,  6 Mar 2026 10:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cmx2wNdU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B132144F10;
	Fri,  6 Mar 2026 10:43:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772793810;
 b=Ij+mpNgysxsXXr1zcKPv0wBfxYx6cl1xqkvq7EYvPOYqOtm9CYB13PlCgbQ/jNZxVMUX1
 WaAMF9XbWEg837Mo0WKhTEimia80a/Q212zqTRsYd+1XodVhLVO8kpDLXqDz6YG3NbtSMkA
 laIcqagoJnPWNn50k9FWvDQoo0nEg24B8PVXDK6djH+UtSv6ynWad1fR4o7Ukt5DgLe9Age
 yiKFQbpqepCnJ7XbTeMJKRXIYgnc+c3RKAfa08MaxhYpEFvx+v6iZeHQOlvfVBWWXgXU5gg
 h8Qqu6JnaY5b1T5mVBmVFaKM/NOYzkOiuCsq39l5oWBvsXTzX1m+IqOzqUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772793810; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=W5DWBdOiyvafxk9d9NH1UgpT3RpF+bDfQMHmuU9ADuA=;
 b=QGZ7wJzGALQPxoNuwuxw/8O63Z/6S8Tm5rUNyby5/N6vpepp/Sfnsj7Iu3QmiWS6ioNIe
 RyenHbbx/ESa+6BJBlhObelR9bamij54JNCwXqBqDnAOlmeihfgDtF0Td5L+Pb/udn5ELG5
 rhZH25/txTY8ItZOkP4V6fbFcQlrHXRIiEvyxDmN6zthFOCwgIHziUwCmLMpshjkGGCkoH9
 gm4dBZY8nIs/YAcfCdfetvWUrVDJPlxr8Zmev7yvdfHS4J/K+mpeJ1vt2Be32E5qvAQYZ3G
 UgsAXvX//c/Ye1s/nDlya8AKXxyQIyK9b/x6fP/3vXjFoHbD6jDCv2sRpbYw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6858A404AB
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 10:43:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8A04710ECE5;
	Fri,  6 Mar 2026 10:53:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 709EF40029;
	Fri,  6 Mar 2026 10:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8CCC4CEF7;
	Fri,  6 Mar 2026 10:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772794431;
	bh=nhRdYKoFVBLMIadM+f8eRD+secw/nGDbxBmsZFHV2p0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cmx2wNdU+sGEBl+ZXlVU6V8ecY6bi4DkR+La67GrIIXRv3aQgkJMvap02ORqe6Xbi
	 rnx/GjKaBsJnJ71Z93zSBoG0cNFX1u3vJvMqWAVjx9wiL5urzKN0+LCci3IVqYI8Ys
	 5wqgHhksmDswoYIee9eiwSTddQLaPo4gDkniy9bVSNH8P28f7ArMiXH1g7jAHr0ju9
	 h+pmB5jEaYmu3Ny5QcTYBj5XXov72ZO0TNzXRiCQva7MFBU9LtgaLnJrKJ+CNEm/lY
	 ahULAbTEYBN0ZH10RmqISSHVyRl9sdDv6v/PG04UyHjnETtdW+ssXNTneOOt6kjyWD
	 nX+c4vVXFpsug==
Message-ID: <fbb1f03b-b87d-4f94-9be9-3dc53e4b1e11@kernel.org>
Date: Fri, 6 Mar 2026 11:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/10] gpu: nova-core: add Turing support
To: Alexandre Courbot <acourbot@nvidia.com>
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CB3X7I5Z6R7LRRMUBIVQWHPID5BE73RP
X-Message-ID-Hash: CB3X7I5Z6R7LRRMUBIVQWHPID5BE73RP
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CB3X7I5Z6R7LRRMUBIVQWHPID5BE73RP/>
Archived-At: 
 <https://lore.freedesktop.org/fbb1f03b-b87d-4f94-9be9-3dc53e4b1e11@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

> Alexandre Courbot (8):
>       gpu: nova-core: create falcon firmware DMA objects lazily

It would be nice to add a TODO that this should be followed up once we have
dma::CoherentInit (which I will most likely just name dma::CoherentBox instead).

>       gpu: nova-core: falcon: add constant for memory block alignment
>       gpu: nova-core: falcon: rename load parameters to reflect DMA dependency
>       gpu: nova-core: falcon: remove FalconFirmware's dependency on FalconDmaLoadable
>       gpu: nova-core: falcon: remove unwarranted safety check in dma_load
>       gpu: nova-core: move brom_params and boot_addr to FalconFirmware
>       gpu: nova-core: make Chipset::arch() const
>       gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder
> 
> Timur Tabi (2):
>       gpu: nova-core: add PIO support for loading firmware images
>       gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turing

Acked-by: Danilo Krummrich <dakr@kernel.org>
