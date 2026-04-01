Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9701112244
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:02:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 43C0310EFFF;
	Wed,  1 Apr 2026 23:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZXyGeWKi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1B45B454C9;
	Wed,  1 Apr 2026 22:50:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083841;
 b=a6Xz6m1TgE+BNZnbebgROWN3R1d8+i9N27q/wSx1d8o0ZMfkGxk5k7fXgegdzrYBJbre8
 UsMcd+WmUl0ii4mYZcLmWdC9nddBTGeMzvEhi5Gf6gVxf66LGu1LT1KbbSvfsHFEtqmtS35
 WqC5tXqsG33pc8PO4LcsEYFXdVC5jXiKuc3kDnd313eOsFSoryLKWp7uqkArvtD3V0cL5QB
 YzFrFlIvUIRrW0o4lOU/nO6Q6pJ0LxGfaDoZv7Pq5bYQO48IDHCrss+9VNFpzsf+HoIOvkg
 fMqJtpFdMP/FvB4vCS8xTMt2hsLJYJmpn5rTTT6SXXp1PJkFWZ0vAJZffgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083841; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LRry1b5PCaSUZ0UehPn1gur4WHq74MSPHuu9I8IdAKM=;
 b=lRkosxPvX6+UH0gR/890N0fi1gHm6M/Oq3vcw39InSm8ge+Dak4SeGbwHl0ludr/qzN5z
 gr4wFm6ZqX9NJKfvVlvD/bdc9RmsXnYMIUSEL3o2eBuhnbgWEqaBHQ8zyem5WYyuLBm1Pkf
 v5PvJwwmTNrE+7nWocth+iXpbfDsipV/Xg4lRttP541Ib6ZpNZ+gL/O2K7RFa2NX45QfhoI
 VyoJ5N1tfYaud2M/F5r8qMFebTZ6Jv1jMHrL2XN2TPeQ4bjZBZUxdu1w7IBPU1SB2im/TGn
 Ez8M2Lk3JEbw21pkDZKc4wkV7vl9CeWkMxoZpEnqDxYuoEeryQPk9qXt8JbQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 27C97454A4
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:50:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 31C1310EFFD;
	Wed,  1 Apr 2026 23:02:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02BF3443C9;
	Wed,  1 Apr 2026 23:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BBFC2BCB0;
	Wed,  1 Apr 2026 23:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084522;
	bh=mIoLqdGB6FEaivDOYbSVC5sMk8eFMcAZ8xp8MdTnV0k=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=ZXyGeWKi13Ct8X9D0547XxKoA9LfoDtpV+LhRj3iXOQd+bnjQ22veAr1KWQzEnIDA
	 kCTGsTKkVr/gscyEmrZwOvWOWJ7En260oBqHLZzHIzEAlkTuiEm6eUc5UILdqgZy+H
	 HXAequvu6ZpIY4U3LMW8wzpcshrEKczrtsPGEnHRqS7XkcXKcwcDDz47C4fWwDAXKO
	 OIQVKkdK/nf9H0jRFaReCDhlcyWz4+4QQtQPnKMye0CMmsL4cTMnrf7NbrpD+fnPzG
	 ktDfNcL8YfxyQiu9pd7SwNmlkrwL9bKsRyvSsH9EF8GOZzd/XyeyosIPxWhon0MbUH
	 E+D3sywT0mp+Q==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 33/33] rust: kbuild: allow `clippy::precedence` for
 Rust < 1.86.0
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-34-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-34-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434476.73816.11744805605122440072.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=490; i=tamird@kernel.org;
 h=from:subject:message-id; bh=mIoLqdGB6FEaivDOYbSVC5sMk8eFMcAZ8xp8MdTnV0k=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7s6hUfb+jyd9vbK0ZWKNtIml3vZzdZu5eWV+2r4r
 rMtuaq8YyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFSr3mdk+LXi1KaghwuXvXvryuIh3xizmzukzafohmvWRgutvqoD3IwMq9NSuvc
 +cVOd5nUvf9cfyV0no/Naz6wyyv7a/lP08aU4HgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: PUAY75CXISHVCXPKF4PDFI5PJXTFJUYR
X-Message-ID-Hash: PUAY75CXISHVCXPKF4PDFI5PJXTFJUYR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PUAY75CXISHVCXPKF4PDFI5PJXTFJUYR/>
Archived-At: 
 <https://lore.freedesktop.org/177508434476.73816.11744805605122440072.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:40 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> The Clippy `precedence` lint was extended in Rust 1.85.0 to include
> bitmasking and shift operations [1]. However, because it generated
> many hits, in Rust 1.86.0 it was split into a new `precedence_bits`
> lint which is not enabled by default [2].

Might be good to retain some of this in a code comment.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
