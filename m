Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614731112242
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D69010EEDA;
	Wed,  1 Apr 2026 22:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lj4nBT0e";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 13EFA45487;
	Wed,  1 Apr 2026 22:48:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083708;
 b=iLeC7dhPraRNyPMx9TY11Y80DzfsE2SRokC7PYVzHrt8DxWFZ5Ij8NgTTeagMvqktNEuc
 WCGrBZo3D98UyrZfqy1iDS1Xeae0MWeFbz186KoJLSx50HPM7QMjUjoDXDWY0a3l0wYiid9
 olt0MC4Et39n/7KCpI+Zer0x2TPdEawjh4nYKYzKNJQXwhlOONtnejyOnQicLEU4mb5v9no
 S5FfNw5B7CtlE+bPAUUMbysunhPGDlLsvg0tT8u6tXs8C7REIM//KbmLZ/r4kHcIRoPMq4S
 /WRmujk7h501C9GbaE07oQxQZewLBAHaIVXK+To342FDNZqjMBrqjV4823Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083708; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=F4nabxfxAmha9CykPMBvBECWSowf26F/Gtc9IW33mAY=;
 b=v3zvw8TU9441MRWcQ9LKjYXqe16GvhvEjgZIX4l6xRyHQTHHHKGCCuFERS5Kcwfs7ouUd
 msaTuoBXc3EdrWuYpK4j3RWOwdZxYJFmfffGPC8oqDsnWXWE5GUHepkof20WBqUuWvNU2m7
 oMT86us+6/3LkubwVoUFTsjCLx0PPDHbiDb4DABeuyEU9VQQCMbap/WvnwecEVmZ4mQaARw
 +O4q+cm7NJOYjBYoYzqnFsRCur40cPxY7KnWNfZB9opro6PTpcDwbt/Ri0Kr+j5H34Ox9Zd
 V+x2lkK7ZbzUceimoxKCxPvjtBD0jM/konD9fJoq4+M+TjWDgI9U4ueEbmFw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 571064532E
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:48:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 482B410EED9;
	Wed,  1 Apr 2026 22:59:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BED7760120;
	Wed,  1 Apr 2026 22:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A034AC2BCB0;
	Wed,  1 Apr 2026 22:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084388;
	bh=WZ5qlOiZ6DtdReWxkBeDsr3wuo/Bvi7L1yh3PtqlfGM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=lj4nBT0evc7OrDUu1Sj5pkvDmswJqxEKepIZIBO1UHRNy+tyNRi0vMBV8ZZQo5u9K
	 zkZwz7JRQC3e7zWKVrxTkRvM6UpJExohp8FMDOwBtRLaCvDN8SeZbiBLsCDevcX8Ul
	 6NlNNBwShlnIwtwf8Zd866rDCnrkFis4xJGCPjt9mEA0AFxN7KK1edKbNndIrNfJwh
	 U8aXZsRecZpgmnNQpJeqrLXLyxzsJ6ViMkCj4XCLPZHq8E07HU6hZou56/6D9D3gOS
	 ghFil1DcIXuZYVoeidWghi82IqoEOW2AFWEHetEpT7AKJJcQJ9H4tPUoE4cXqMxYFk
	 A6teV82CTXgAg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 06/33] rust: kbuild: remove skipping of
 `-Wrustdoc::unescaped_backticks`
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-7-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-7-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434437.73816.5644451547890468339.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=408; i=tamird@kernel.org;
 h=from:subject:message-id; bh=WZ5qlOiZ6DtdReWxkBeDsr3wuo/Bvi7L1yh3PtqlfGM=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFztdX5tp0KRwJ2PVmq5Hcku55gruzdjM0eW5uV1bX
 FJ05YXGjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFPtbMPw38l7nuwEDWEbr/48+WV+R59qr/vZJJXZ+pHv3jZh/achkYwMd50PyAR
 9fSXtYTpN0bRg+44XD7qnrzt/66mfYkT4lm/MLAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: XNIJT3GHMBWXOUYWZ3SG4H7VHTG6NPBS
X-Message-ID-Hash: XNIJT3GHMBWXOUYWZ3SG4H7VHTG6NPBS
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XNIJT3GHMBWXOUYWZ3SG4H7VHTG6NPBS/>
Archived-At: 
 <https://lore.freedesktop.org/177508434437.73816.5644451547890468339.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:13 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Back in Rust 1.82.0, I cleaned the `rustdoc::unescaped_backticks` lint in
> upstream Rust and added tests so that hopefully it would not regress [1].
> 
> Thus we can remove it from our side given the Rust minimum version bump.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
