Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDC41112243
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA3B210EEBF;
	Wed,  1 Apr 2026 22:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SpxQlYzd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 931034547E;
	Wed,  1 Apr 2026 22:48:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083698;
 b=zrtPSXZ1q2t/TrIboQbRJBXmIRZTOQ9kar5aeYBfoN+/BXXkUkOqyNIv/JjQNR77AdNCb
 HcbyL8KQUQQ+Xa1Z16k18cZfL0ojMU2CJhZo/RrWwU5TKYAXK78E1fLUqtvPgtbm1qyR4St
 UrXFqtb8nQaIdwzMdqDvoNmFREjPi8qHTRYAvwV0HhV9wOInPMQvm7yX/16bWD2lkX7lf/E
 6Z/8JMHUqVVf0p2hwjMEZPf1sumifCSV4f+1BP4FUy60ybyRAT1vKKAe7JgmFy8ZwN0BmV3
 fbTDrG16YoDdJQG35NK5dusmBLvEZNachkl0ePaO6dIfOGFtrC/vJqFgD/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083698; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qEfVtKe2dtJy7va4j9UwEbQQ4Lq6WN20hysSgq/MgJo=;
 b=qo8SWBRVkXuKWKuX5seyDxprWasiV3djzMgbKTtduHenfJjRxL4A4IozZLIa3FFjDY1wU
 3GCkgZZx3YAskWunxZeE3xr7WCyaiA28nTMiFHQjx+2RDfJEm1lVpJUQvwjlZhdAlnO7f7R
 gGHjCZ7XjYLfMCOLhZBiVzTzD6rJ5eRPStkeWCQBEBwq2IXd/iYbOovoQ3B7LP2QbAwGeEM
 nsw2mSXAzlEp/IOs8ptaxVgDkbBY6Yp+3O8hF69c+N0zpaBSHE5p7rIIwORTV8+DYFfWGrG
 PrFXKRVgkBH8eaUPLJ57L688P9AYlJvfcU4TdYbQ2/rKMCr20yAqTa5M7uZQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9E43B4532E
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:48:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A6F5610EE60;
	Wed,  1 Apr 2026 22:59:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6896B440FA;
	Wed,  1 Apr 2026 22:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8A9C116C6;
	Wed,  1 Apr 2026 22:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084378;
	bh=kNWPNZPv5AJZXsbuPes0ElScqifYmuQXsRJThydCrms=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=SpxQlYzd4uQJCDoo3G1uLsZbGWv+MIW76Y01oAor/ISn8VhAzL8ca8LVPPgm5wJ7k
	 1IYnRaDxl6TCtaogMicQwqVu7t6a3KtRtWMRwk3Z3UF1PihJzRQvVHikJNsU6/8BLF
	 N2f3V437pqOD0OyYPS1JBD6eSIuqHQyNGr0yfJ/NRWdtzqXHnXADkmhAzYJGTOXadZ
	 oFSgKCzeUx0R3N30L0LXacIoJjkcRCSUKJLk/krBOBS4njzvdxSOEArxX/zs9G8Z4S
	 PcS7uUCx73rsiwR7sv0/kZgJQF/7hZETY3nE7bJFU9unkvdaW6MtX/vDRJ0IcCFGEn
	 mdj7JT6ErlYwg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 04/33] rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and
 simplify code
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-5-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-5-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434435.73816.12811715375635165629.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=532; i=tamird@kernel.org;
 h=from:subject:message-id; bh=kNWPNZPv5AJZXsbuPes0ElScqifYmuQXsRJThydCrms=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzttDbkgadD08O8m0yXvWGMrZpq9En74+dEvzrtLE
 43n3bq0v2MiC4MYF4OlmCJLouihvempt/fIZr47DjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOgYM3BxCsBUW7UyMjxtd/0svceDyUvuQs3pRdufG7m33rbc+6V4s6KZhq1voDkjw09uhYk
 nbhzsP8oqPW9PSdojxgrtssiDOicvCrqdmD0xjAcA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: 7PNTSKNAMUVOUGWH2YUXQ6ISOHOVATRR
X-Message-ID-Hash: 7PNTSKNAMUVOUGWH2YUXQ6ISOHOVATRR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7PNTSKNAMUVOUGWH2YUXQ6ISOHOVATRR/>
Archived-At: 
 <https://lore.freedesktop.org/177508434435.73816.12811715375635165629.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:11 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> With the Rust version bump in place, the `RUSTC_HAS_SLICE_AS_FLATTENED`
> Kconfig (automatic) option is always true.
> 
> Thus remove the option and simplify the code.
> 
> In particular, this includes removing the `slice` module which contained
> the temporary slice helpers, i.e. the `AsFlattened` extension trait and
> its `impl`s.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
