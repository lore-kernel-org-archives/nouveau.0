Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF16FD35179
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 12:28:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C69110EFAA;
	Wed,  1 Apr 2026 12:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QoxKM2E0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4BBE64540F;
	Wed,  1 Apr 2026 12:17:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775045854;
 b=hqTfztdrKAqRiIVfE7u4gD/brE3yAJQdXEShiqsm3usu8mFLklP0baSyNfz82/1/2P9CC
 UxtbJygerLoYJLJGoAQK0xxHVMPX+LRjHDivLAys8Neh/fbHZ4kTrvkubyH78NkohdT+Qa8
 NlqvyeiftGG2YSRAW6p9KnXcVnRqhlFnVdu4AOgmMYmfYsa6lV7hLwfdG6aPZmduXNKwVSl
 SRzCNEwPZbGsWM8LaiM0kSG3rPwOC7L3bhxoJJtZOXfySTecx9gBydquc2ECY9SHRu9RyDC
 IMsN1ba1kTrb1E7ZvY71HK1+An3Nk6ZjG4iI8xY1mUJgHTllZMHbZUYgUcfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775045854; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=w4X2oTeHPwofjcCjXVHAsGKLZH0M7KYtRRJFptC0o0k=;
 b=YCb+Ug0YO/XkZ+SCwSlvqTL8mfeFWlFiEueYIN8nkCglGRNCIjY7GzTXgO9f14HY/+dw1
 Aaf6LwysEC1hHsmiWEm3PYRfDM0Q0/76KQ61LbwWGWUWqxMmRAkcqIbxwikfRmemWCqYbhG
 HN8Sm5ABwn/xUVYaYFG2qsOH9OH2wzx5J3WSqOi5lAzEIFNt++k9KSETWGne35s3EWIqKNG
 VlgnCDZ2oBR0Da7uFMc1WnnDJqq9qr+PeH+e6rbExiRHPsVvPBM+KAy04PydDDCvMBvB38S
 S9cMVnosHr0+GHgdD+bJiBnBGi9HcxcNxQjp3ykA19c6S2jhFuZCanr0H36g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6AB5A453C9
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 12:17:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B75B10EF6C;
	Wed,  1 Apr 2026 12:28:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 608BD40426;
	Wed,  1 Apr 2026 12:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95ACFC4CEF7;
	Wed,  1 Apr 2026 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775046533;
	bh=w4X2oTeHPwofjcCjXVHAsGKLZH0M7KYtRRJFptC0o0k=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=QoxKM2E0FznBdrqLUroXBUcpq++H3iETgkbmtxPbXWli73gy45BOAXwReJ/pysLlZ
	 lKricJ+MGB/je7Up+zjdR1v7MbSKYe+J8pxIsHFtRYGKQC3bNMA9MS5+08WJnT+rPL
	 Ppgb3GqnQ6Z4U40uUKY3432VB123kqZR2ipI3hyansbPOK/WflsxTnOw3P6NtIPZXB
	 C7nm+qDrzc9a2bt+DauoTSRBJAUYKKLtIJco/Gpp0HcTHg8dmMZTp63NzuR0FalLbT
	 LZqlCyaZSk/UZmt3ZMGDtbvzj3qlFotttWsAtv5+RJzGW4DzcH9QKBm8deTyqcVdRT
	 0jKh6asjo9NUw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:28:42 +0200
Message-Id: <DHHTH79TJEDH.137G03BC8HHM7@kernel.org>
Subject: Re: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now
 that it is stable
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-12-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-12-ojeda@kernel.org>
Message-ID-Hash: OIRJRRNZ4XXNTVOV3KHIP7N5M6HALE3D
X-Message-ID-Hash: OIRJRRNZ4XXNTVOV3KHIP7N5M6HALE3D
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OIRJRRNZ4XXNTVOV3KHIP7N5M6HALE3D/>
Archived-At: 
 <https://lore.freedesktop.org/DHHTH79TJEDH.137G03BC8HHM7@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Apr 1, 2026 at 1:45 PM CEST, Miguel Ojeda wrote:
> Currently we need to go through raw pointers and then re-create the
> `NonNull` from the result of offsetting the raw pointer.
>
> Thus, now that we bump the Rust minimum version, simplify using
> `NonNull::add()` and clean the TODO note.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>
