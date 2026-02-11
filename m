Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124CCEA8125
	for <nouveau@archiver.kernel.org>; Wed, 11 Feb 2026 10:07:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E020910E369;
	Wed, 11 Feb 2026 10:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FwLidsnV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CFFEB41E87;
	Wed, 11 Feb 2026 09:57:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770803854;
 b=iIcs2B0ggPPDwBvw9+Piv19MeQGOxO5BWiv/BPHHEomj4wTcf1WF6kkGdiGPJl8oqukff
 2naRIYVseP/kX4Flh+BXLith6kqHzviBQ9IezWJsMSa5SJcLvkPsCaA48YhnBncjvaC3F47
 Axtfr/yOTgKNwTNnzFxv11/1BnhBAfeFBiYf4szpFXWjSjUyW0WI5bNGooYTea/bMr8zp0e
 L9NCsDlZXeVOZqCY8h7P51NeSo/cx3oNPwn/9xu0xQVoXrnNVYtmR9XhJ04qqYE8PqGio03
 TkgkKtT6QY1UkSJjdafFRjuaM+MCZhskYDPwBJ9uk8mmx2IjQlsWcuyme08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770803854; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=n1e+NhXHGXQPurM4og1LWmiGUlOZfxglivmcxzI+eE4=;
 b=NtSmjVCumzujkMBbd/xzMQ6AMhgtisTh5+Atk74ddAtkOFfj+E+zDB55ovvPnEe6bYPaj
 WwHV9hvufxIZiAHrwqXnJwUKVQxDC06B5mdDJt19HccCAxkBe5gbTTDdGXBOcCWbvvf1RU9
 nlUQfgrmAaECbhYrTqg6ZtWqEnad+9F/xn5ffz7VEMZtc0j4oSX2wrQAaUYMgZvcUbvtufq
 oezK16wdlLdrX/3ulqS/aWBgQxi4S0jIbf4UJkzsmSZWgDySOCWdwK5sYLmHbHzzr8C1npc
 Q4NTNF/DLqed0tVgLuklS/83PVq4zwUS5r48JU48kea5tuywYgUSd2ywsLmQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E2B0C4053B
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 09:57:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C6BBB10E36A
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 10:07:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DB0243AAC;
	Wed, 11 Feb 2026 10:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E66C4CEF7;
	Wed, 11 Feb 2026 10:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770804424;
	bh=n1e+NhXHGXQPurM4og1LWmiGUlOZfxglivmcxzI+eE4=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=FwLidsnV2eYHmBOUnVNn2+2FVKwhEH0K34koWvCFEUKtIBOKt8H6wwZVY4Z2O5iLD
	 skNQ9BAL3tAmTx3QK4Bqg1y8XFbiQOkmxLZbuHmJLfUHirghwnbeIdCaiFZ60Sn9p8
	 ayR0MihgmA3rnotvpGU5SppcLvRjJDmd0y436f9xtUQPymuqhRToPZOGKr0FIZ2eeb
	 VIsAFR3kz55mF5xSddwIyMX6t/rLvZtWiT0lGtx1mJioVh2FEpiazustN6Nnflrggv
	 rTap23Z4v+6rdDZKV3lg2QffgppknfB00OBLHFfP+J9OLc4GP3By0MnAYFyL4zomwX
	 EPDoMN4jfCMxg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 11:06:58 +0100
Message-Id: <DGC1RZKMETA7.1O3XLC1N090G8@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 01/33] gpu: nova-core: pass pdev directly to dev_*
 logging macros
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-2-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-2-jhubbard@nvidia.com>
Message-ID-Hash: PLNJ7DOK3ZWVZMVL5OUQ5D6WPASLXMBD
X-Message-ID-Hash: PLNJ7DOK3ZWVZMVL5OUQ5D6WPASLXMBD
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PLNJ7DOK3ZWVZMVL5OUQ5D6WPASLXMBD/>
Archived-At: 
 <https://lore.freedesktop.org/DGC1RZKMETA7.1O3XLC1N090G8@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> The dev_dbg!, dev_info!, dev_err!, and dev_warn! macros now accept
> pci::Device directly without requiring an explicit .as_ref()
> conversion to device::Device, thanks to commit a38cd1fea989
> ("rust: device: support `dev_printk` on all devices").
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

There is already [1], which I queued up for when v7.0-rc1 is out.

[1] https://lore.kernel.org/all/20260123175854.176735-7-gary@kernel.org/
