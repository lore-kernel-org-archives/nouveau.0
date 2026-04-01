Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2D21112243
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 003D710EECE;
	Wed,  1 Apr 2026 22:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EGRYhbV4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CD2E245484;
	Wed,  1 Apr 2026 22:48:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083703;
 b=j2oYWkI9qSxmyELNuwBNXQzEzD7wrRL02OpGMaFCu4qEkuI9FrweDLOgDzYaElnZoI3VS
 jDQ1KsJB3Mh/Uk+W2Ml9u+XegW7XF6ROW2z3HPC2YXlNSzyNxuVezrd8uyLTtdtATaMHzBl
 nLpFe+oEnyZUoHcb0eOAoww5Yrd6mZ4DUEp0/VC0qLeJ5J3EZ8BdCS9rvu32kv4j+QAagf9
 y2vJalXZZ0LtaaAnCnegoNJKf31ANEz+ZrKpsa3ag2eoJYgf7h8ddMeR9MmlkMXP8h2FDc+
 0vlBTGrxpzlSDEhtBUMQ854b90pB2PrfYlya+5DX3icFUWI7GHPEONP1g8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083703; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YEcJrPgZyc/UWW/p+aF/QXCo+fSirWWH6itFr3NT/78=;
 b=kdE1zYjTlQSZEIxiMBIFE1amim9MnzHikv9KWEF6xm3sMODCkJ5WxsirIp8Eje43rWdFZ
 8GbKbpIwxutrqv3K0W6cQo0dPuRSolfZTN3IR0PAWLUFzxF8fOOkgtyjcT1jWxbpw2QEg47
 sisgy9gfQgDU2ERMk9jKNcIdn8GvHkWK74ggeKRrQcQP491VAWwc0QVs+SjuZQe/7NfWEps
 KNDFpwAmhKtIi9je5BYyL+JkVFiHfDW74q/v6688wWlCXBJOAmUdMTW6/HisUn8BUnEKs7u
 krYz2p60/TiLgKd43iAhu1spIA2neqXqLKMWrxNuDnvl6yeVXVV+uZLptWEw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5B1864532E
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:48:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4C98010EEC5;
	Wed,  1 Apr 2026 22:59:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8BB96183C;
	Wed,  1 Apr 2026 22:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA88C4CEF7;
	Wed,  1 Apr 2026 22:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084383;
	bh=0MM8/3CTNZDnO2QJpUmaXqxHB1Rvcg/ziIyw641Wqc0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=EGRYhbV4HQSbzNtKzfTww5lA+Uerrsg7IL+49jk5/fWwiQGmws0MFMhs8KmPYz0bF
	 3hpRw9q7h5+2vsLnlgC8jieG/3JmIARlD8LqGGxCtDEsOdOBbWTv/En/Z/2cYLAJ/g
	 KFjsHZnFL9/lOaqiBVjiOUmt3S211fe3JvmErJhlpKeBwep4sg/58vKaN+T1X2ZJIj
	 IXfJxWhpfJRuYHAo5iZpPOMvh3OuelV4yFlkJ3iT397bKazKJdSXENYbbXIHAdGnHU
	 ada09pio/4900X3hmHEj0e1yW+yEOAoruxQR92rFOFjCm6P7F+vzIHw2KdG6BFCIQS
	 SUk7ZWvKLfHKg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 05/33] rust: remove `RUSTC_HAS_COERCE_POINTEE` and
 simplify code
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-6-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-6-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434436.73816.122481804122122631.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=534; i=tamird@kernel.org;
 h=from:subject:message-id; bh=0MM8/3CTNZDnO2QJpUmaXqxHB1Rvcg/ziIyw641Wqc0=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzsVnH0zxWC9R/ANvpJUecsms4XCUiWnE8NnXbaJM
 e9U1snrmMjCIMbFYCmmyJIoemhveurtPbKZ747DzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNX+LAx/uJbsjFg3f+LhiIYgi5c3D9v0XNCTe7U7u0BV8Zd9a8apLwz/K5gL3IJ
 uV04KNozfPuWL62X+Tw3F2+5yhDU41dklfM9lAAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: DYRQTQWT4PVVM6LAJFL2D7WSTMCQ2EZ6
X-Message-ID-Hash: DYRQTQWT4PVVM6LAJFL2D7WSTMCQ2EZ6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DYRQTQWT4PVVM6LAJFL2D7WSTMCQ2EZ6/>
Archived-At: 
 <https://lore.freedesktop.org/177508434436.73816.122481804122122631.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:12 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> With the Rust version bump in place, the `RUSTC_HAS_COERCE_POINTEE`
> Kconfig (automatic) option is always true.
> 
> Thus remove the option and simplify the code.
> 
> In particular, this includes removing our use of the predecessor unstable
> features we used with Rust < 1.84.0 (`coerce_unsized`, `dispatch_from_dyn`
> and `unsize`).
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
