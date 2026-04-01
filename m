Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FCE1112240
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2B72110EF1E;
	Wed,  1 Apr 2026 23:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jfQkTaxf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 00A28454C0;
	Wed,  1 Apr 2026 22:50:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083821;
 b=R7AJIS0zrnJJNYfn1KHMUh4/l2rLwfNqJfWaxrd5RBbZRd4vk3ZOeB72VbYeAVkfPxElF
 hzjPmiPzAI7zOke8adeKVgxETJD0uFmf4lNrx9s4pCRiMQRag59Rfy6FVZARmkmyF3iYHdp
 ismOjMQ3J/9a8OlQCJTx/bUXwim9+JrZL/rM4uJPGZRZxGFSTcUSlZnTFHA0PrxRgj95b0f
 IZNUsdoklemEBQOHUaKHoBrWUeA+Ks4vrghkrbjRvNuEy6U27ZgHp4scZEyNxMITs77xE8m
 vXKgmDYkjdq1lqHaXoWQLd+HHvOb785SGANYQU9YrM9YPutY0naQxWET7+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083821; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=p34P/N0htXMWyNgHvxgRP8tCusw1WyPfl4g4grmCwBM=;
 b=FqFYRmIElrDq8wdfKYis9trlNGTK70n5UIruZpiWTYmqr5lFNwMuhCjFtXiEc0fs0T/KN
 PVM/Mndsg73QPMoOFcH2TDcf7Asa2/wXDCpfV7C7Mby3MHXZ1a7dFzu1iahRLmG0mZ39YoC
 gjKbHwpLpo3uFqzmRDZQMokpPRmS7XWUPKibKj/dqa7HeSYiy+4/OSDhlJMX6mHckKsYzPf
 Z1z7u09GMkK0OE+LZbF0irpNeXDdTPdbs+xFJesjPH3QgeQA+Mth9xvBTtn8fCkbbQB9ZZF
 UK9+zPYY0PvCQSRY6ZtrqdntEVmnw/PYPl3Txk2lSpMI3TT9nho7QErrd3Rw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 23B9E45476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:50:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 15C0D10EEDA;
	Wed,  1 Apr 2026 23:01:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C2E660120;
	Wed,  1 Apr 2026 23:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE51C2BC9E;
	Wed,  1 Apr 2026 23:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084502;
	bh=Gkp7xZZSJnjNLA6k6/JP5dygiZIRCC7PAi3ux8OxhkE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=jfQkTaxfpKSFrtjDj4wnczInb5geAhQ2NuZC4j8sza8AlCVkY9hHmgdzVVY0yxijN
	 7EW6reI1bW+030I9qVO1zAZWx+TBGJpZq2WXPsyX988sOHkUOfvE5JFqjeS8LLGJDJ
	 sMBtfvAC1aWjcgdjQO4wCkz4llResctlvtQSOUTi/MQ4UERmNSZUez0osJLGfMr5EI
	 g24ohqM/3TlB/6le+jylXy3Co/4SrRTbHn7b+3FMiRVhLd0rshwI3jTt8Lnp+iaIbO
	 9TnizhTMXYNZRHkHYFSXlyA//fjj8hUx35vtyH7WnPpvnb2KJI9CQVhdR8cuHVfGAZ
	 Dx6iv3k7KPbJQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 28/33] docs: rust: quick-start: remove GDB/Binutils
 mention
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-29-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-29-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434470.73816.10527840819544688551.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=721; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Gkp7xZZSJnjNLA6k6/JP5dygiZIRCC7PAi3ux8OxhkE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7vWLzx8ca7ltK/c1jLRjOeETCKjKi1llmeceLZaM
 Eeobu+HjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFOt8ZDhn3G/2qInK/N5PgTvrNczbGrWTNn6eB5rvFXwgfbkN2m7pjD84fjhu3e
 73acXMn2zzllc+jYhUfrXFuEdU8Ny5T+nLj53iwkA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: HP5KKIJTS2USWSOWBFJQODGM5TXZKNPH
X-Message-ID-Hash: HP5KKIJTS2USWSOWBFJQODGM5TXZKNPH
X-MailFrom: tamird@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
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
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HP5KKIJTS2USWSOWBFJQODGM5TXZKNPH/>
Archived-At: 
 <https://lore.freedesktop.org/177508434470.73816.10527840819544688551.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:35 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> The versions provided nowadays by even a distribution like Debian Stable
> (and Debian Old Stable) are newer than those mentioned [1].
> 
> Thus remove the workaround.
> 
> Note that the minimum binutils version in the kernel is still 2.30, so
> one could argue part of the note is still relevant, but it is unlikely
> a kernel developer using such an old binutils is enabling Rust on a
> modern kernel, especially when using distribution toolchains, e.g. the
> Rust minimum version is not satisfied by Debian Old Stable.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
