Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB8BE9A048
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 13:18:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C49110E6E5;
	Thu, 19 Feb 2026 13:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c9E/cBVh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2B5E743421;
	Thu, 19 Feb 2026 13:08:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771506529;
 b=pKxVfM/lJiyFZFKkjDV3zh/RIK9UdsuqAIWS5pbWPbhFs+qHcE2lOb+h/lEqO+7SQx4rf
 Yx5xZ1sY9MaWAZkQWERGevauoe7E9kizBv5XDeCnEqCpgyOxHk3EOz/Aswry9vStzsHwdHR
 Kag9NlgIQPm4mJK5BWYtPiBhu4jBRqWiv9gaPWZev5FtTif8x/3BOIKKUmW9WEFXOPNqlxq
 Z3BAFOxX+Xo6P5jnkh3Bfya5fGXwi2wX2gV7LhSkMeCjmqUPPzIbWlQmeHdm60P48Fex3TP
 ZsS/bABqJ7blh16yfxZADcxo4zLlAFrYpzeFDPmMJywbuNtB3fRQSxNW1iMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771506529; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3YIXB6F54AE0ihQ9V9JVrO/ZPv0+mXz2KjRiR/19JOU=;
 b=WkfES4LPiUA6L+rrP4Q7qtaICEAx63alYldESeQWOAn8A9UgmQnAixv9lEeQAYkZwgWxx
 cLp6EGj5QWJY5ERK1LjWrmac5O8LEBIo24aJ5WsWKLRL3XmH8nt9Lr5h3lgi+HALwOLgIhy
 w0W8GhbcMc58RuBMfCI6lpV6FaOZhebPB72cU8ccV8VsF1mQOg9ZbfXAxXOAat9DlAWfcr8
 jrv3FRXTlVdkjPFWc1C7Tv1GvFUBXuuzqZphMy5g8jI3BEF1ZVbMcvyfN3LHFLMK3c/N9T3
 66KHgyGuV2kz/ggVd0NfrhmL05ZdrE/CFFTtaH5Bxja+Vv/9GIlaiyzZuScA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9216B433C1
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 13:08:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 82BFD10E2FC;
	Thu, 19 Feb 2026 13:18:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B19F161118;
	Thu, 19 Feb 2026 13:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA169C4CEF7;
	Thu, 19 Feb 2026 13:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771507116;
	bh=3YIXB6F54AE0ihQ9V9JVrO/ZPv0+mXz2KjRiR/19JOU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=c9E/cBVhsP2yha8dGzGPDi1mCeRt+oOpNODKVRwDVcAxv4yMa07AGROPkPd6uO4Pf
	 ATJx5se7Ti7u/knhh6g8chHcHUD+lbooNUQrwe8kJPhHc21d5p6VA3qT7e7ni+jRD/
	 ofwsv2DoVaHKDP087DSBQzG+I2bn85QA0WFjYczdszN9BP6zerRNRpF5vKs5I/pRku
	 6ET2QaRVYKen7kEulN4wHwBB+1rnnSX45KNPlRqAIrWGejm1hcHIv0a5wh01GZxbSn
	 beem1yZjVmArIhedHCRO7s8hY4F9Kx96vVFDL5EWbFeJ01GOxMgG8tdzHO0zW0vJKf
	 mvzBlf83cWlYQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 14:18:31 +0100
Message-Id: <DGIYV00H7ZJJ.36FJ8MINCQ004@kernel.org>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-7-joelagnelf@nvidia.com>
Message-ID-Hash: 3ET3J7EBAYPD75JGGLOXRH7KW3Q42UIN
X-Message-ID-Hash: 3ET3J7EBAYPD75JGGLOXRH7KW3Q42UIN
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3ET3J7EBAYPD75JGGLOXRH7KW3Q42UIN/>
Archived-At: 
 <https://lore.freedesktop.org/DGIYV00H7ZJJ.36FJ8MINCQ004@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(Cc: Arun, Christian)

On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
> Add safe Rust abstractions over the Linux kernel's GPU buddy
> allocator for physical memory management. The GPU buddy allocator
> implements a binary buddy system useful for GPU physical memory
> allocation. nova-core will use it for physical memory allocation.
>
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

The patch should also update the MAINTAINERS file accordingly.

(I will go through the code later on.)
