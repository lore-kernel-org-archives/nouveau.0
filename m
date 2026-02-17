Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BA2E9A03E
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 20:10:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B44010E51A;
	Tue, 17 Feb 2026 20:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eo5O0/fo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A260F433AD;
	Tue, 17 Feb 2026 20:00:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771358457;
 b=cVDQSYmXwF7RJKvOtdyyYYQRqttyB8DPuGjIlYRM1lFLppSONdNDZmGL4rsAJa+RJhkK1
 FaojU5Hz6I58l4d3wIK41x2ct6OQ4sCEEUQQyoKeR4eiUOYmx2z+YbALGtOLexpV+xuaWRv
 /0bKJBNpWRLRTY7kiYGKUOP4i2TRB2V/UQFH0pV16XkSlGDcVbLJaiN9lVlxoNIRrfl6+dK
 oLAgSB+ObAYLIcXWQ6tcAs5PZUvTfnqHmARXkAt52Hv5jVufcvXtsi4OBglhb8m+tlYy2C2
 vGN1rE8pTBB+0wmUOLMVS396b6fQS0ExTbTuZx5YYvla5vq1JMe8wTqpETtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771358457; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=spSDOwA/jePRC5ZblHluXUbkjP0oschg9xBLGN3kFOk=;
 b=BcNWSTxx9tD1GAuox6mW4ZHFQQKCkSBfnuvMifne/JdMZgO/0GnMWE90CqVEacIqXArPH
 gcqvDNVfygkXu/+Gto6UJzUfMwq0e+l720cIBEF5wVkzbyVPpH3gpSRdiwUDGIMIYSV5vAQ
 zfTfBY+IfXAJqdOywx3kh9l447UJ8hwHdPNsssX+CcVMYhRR7yVBwCLiTiz5IR844ryLifg
 +RjFcqP7bgtlNJv/1cJctf3362tnz4h5C8xTuAL+QwBRf6tAPL2AhkbZmxnNGRuWOYtDVBn
 xRnAERmcrnPH+mMQSdspYuQiRAXr4ptCnJpP2QGd6Yw74jSIkilsNXqhEr6w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 017B1403B4
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 20:00:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE5A10E4E5
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 20:10:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E982643CC3;
	Tue, 17 Feb 2026 20:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87FBC19421;
	Tue, 17 Feb 2026 20:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771359041;
	bh=hhJyxdITsuAc8HGC+58wCKGZpudvl+qghZAFN0MeYLs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=eo5O0/foh6J8gcreiJcZzKO/jN6p2mDW9f5JJTvRPlZRv+Jnqsbq1maQnR9E+XDPl
	 WwDsaLKlPp8Lq77wEYEzfYRhPn0V5bUSRO//feyay0ExncysMnLRIoewjWP5BLGKnb
	 F4vNdfT3/27/bHovlSCDJ5BC4JAc1e2+p3zRyWXqlOgg+6ufNDg5MKQCoiDgggCPK5
	 9t4cgvXSf429OOhGlBnUlyRYxVUJ+PTt8XD0pSwvMCBbzjqUccZN8c998pGy4nEMxA
	 Mz+/lGwD1cDD4u6VVyLU9Uw67fWR5yqKk8y5K6EyGAGT3aE8oNn89dIYvlxeutB8OR
	 rVYKvkQTVfBow==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 21:10:36 +0100
Message-Id: <DGHIDF706REU.3PF025P56DMS2@kernel.org>
Subject: Re: [PATCH v4 27/33] gpu: nova-core: Hopper/Blackwell: larger WPR2
 (GSP) heap
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-28-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-28-jhubbard@nvidia.com>
Message-ID-Hash: YUM4MMXS5D6F55Q7OKOVMTO2C6ER3QJF
X-Message-ID-Hash: YUM4MMXS5D6F55Q7OKOVMTO2C6ER3QJF
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YUM4MMXS5D6F55Q7OKOVMTO2C6ER3QJF/>
Archived-At: 
 <https://lore.freedesktop.org/DGHIDF706REU.3PF025P56DMS2@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> @@ -74,7 +94,7 @@ fn management_overhead(fb_size: u64) -> u64 {
>          u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
>              .saturating_mul(fb_size_gb)
>              .align_up(GSP_HEAP_ALIGNMENT)
> -            .unwrap_or(u64::MAX)
> +            .expect("management_overhead alignment overflow")

Ultimately, the relevant value for this calculation (fb_size) comes from th=
e
hardware through a register read if I'm not mistaken, we shouldn't panic on
that, but rather handle is as an error if the read value is not plausible.
