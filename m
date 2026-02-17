Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CABE909D4
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 16:28:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4D410E517;
	Tue, 17 Feb 2026 16:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NZdr1k9f";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5672E4339A;
	Tue, 17 Feb 2026 16:18:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771345120;
 b=wFzsuKOYiC/UH70Zf232v7TqFBwWeeJEUO7GI0JBpohqthihOu9rvLdUSEPpPlZe4Rqko
 /iuaCFKh02D0ACwWdIXU+JK0c9JRn0PcP9982qRMSmjDhgiwOAhkO9NZCMgGAgeVmm0k+Ch
 lgCfiblVBBIWxU6H5CwGynFQNpLj/T8XDlZ2fvdOu5gbzXDzBx7D4XpabUMTORKKL1REAKP
 sNpEYlcrQqZH19PPV1+gfTOdTUN8i+3hHImRFFDoyxDLl+7crye7ZXnjMl7Ig6JkJBU35UN
 uGYTEtIE+rxHNe1e1WJvyGdWdfVo4AMM9kUDjtV0MViEVDNDlb3+rUKmwlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771345120; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2cJEwbFmO9+dcxsNdELVhjEXSJZnSAor96eMR789Sf8=;
 b=Rg4i4TJDgv4SSln0huRxFLkS02+L4HYr0AUxKp/1x1SOcmTqiqMrl54tLdNnAwtzHRRi+
 o57OXuymzVHL6bKFvwcgNbxyvLim6Sobns4hX4aUPzWwoeaDkJJcwjqXxHAj2XEcqd7GrNh
 ZgRr1sgoeOCHhkAhZ0C6w5/6i+S+qH7E11SsM6Fa5Mf8BN1+njUBfG+pTlIgWwYHPkn7lz3
 czlz3Xayneejgu9z+VPoFiXXS7gUYGCMzQbss0AZaMhwRe6O59xL2Mk8rOxu2y5HafFzvzL
 PDNJ0RSxaE8UUD/B3y6UtzWQ/cjQZyhIdB8fZz0KZRCdKwz/0/Pz98hcwZUQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 34736403B4
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 16:18:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 125E810E512
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 16:28:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C29FC417B3;
	Tue, 17 Feb 2026 16:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88192C4CEF7;
	Tue, 17 Feb 2026 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771345703;
	bh=6PvgjXW4CK6uLIKsOzCgma+voC7GuRWa6mJGTyCrq24=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=NZdr1k9fyYnjBxCBYlvFugVLfQeqd+lHn8xlavv+HvLnJXmw3fCgz14k/STRzFSzP
	 Pqahzy6zLvG3pbO4CQWIRCD94/GKPRha3K3/LfXig8T7SdsbBWIbaj6KQcf0apk2bf
	 UX5Ov8icGguhB7rP7WUFO2dv8b+lV2tmotGiXCWZmuufSh06kB1rZCPBg4gZi0SkoZ
	 szmdZpMHId4iS0XcX0jG/6vw6EagDSUPMopeNC8g4Cv51F551YVajc10ZwYgthQA/u
	 +QSdgerZrDUuNykuL5KuBd0S0Q7dcVXTuAGZPCH0nMFIiurFnc4OsINRrqL4tAmYx1
	 Nyyey1AH6cUtQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 17:28:17 +0100
Message-Id: <DGHDN7RWDOYF.1XZHUXB3WBOHI@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 18/33] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-19-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-19-jhubbard@nvidia.com>
Message-ID-Hash: 6LK3RXDN6X6UH7QISAPGESYI6ESY3YOK
X-Message-ID-Hash: 6LK3RXDN6X6UH7QISAPGESYI6ESY3YOK
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6LK3RXDN6X6UH7QISAPGESYI6ESY3YOK/>
Archived-At: 
 <https://lore.freedesktop.org/DGHDN7RWDOYF.1XZHUXB3WBOHI@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
> +    pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
> +    pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: u=
size) -> Result<usize> {

Just a quick note, since I just reminded myself on this: We should keep in =
mind
that at some point we have to replace most (if not all) &Bar0 usages with
&Mmio<SIZE> as nova-core will also support platform devices.

I think Tegra chips with GSP-based GPU IPs have a compatible register layou=
t,
right?

(I will prepare a patch to address this for the existing codebase.)
