Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C056F46C47
	for <nouveau@archiver.kernel.org>; Mon,  6 Apr 2026 14:29:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 005B510E265;
	Mon,  6 Apr 2026 14:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lwTzkeF2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8136C45661;
	Mon,  6 Apr 2026 14:17:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775485063;
 b=mo9m8PHtKWENu42w09Y9+SMsJMs/UEOmkLJy5kO5rmPOLivnvTIuCbNJ4B+fiW3u7/oFF
 N7Hfh0HVQ3Hby0vZkyQ7Vfr52gvwlnb0nyF1SiXY/di5NVZtJHKd4xFzoOIDX951Hf8ybrq
 z5QK0f/rPKvYlB5r3y0W9oyUlaFHp7JTaVYM04A8b0SW6F9bEKQnV4jfgj3zRTMdTjv7lCH
 MH3hKq+ZP8yBMsb4WQbe2HSRZqAE0+LHlhj3ZNTNhFhBZ23piKc1xT9iNd5FdBcYWwMptAi
 mEDLsgdQ6fc5NIzduNLRdAuprSCRb/GZC3j5nFU9k8P87bsTiWjwXbOB1UwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775485063; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=j3Gu+YDTUukNRmTFhOIJ7noDOCk1VkFhzyDhva8GTx0=;
 b=IIpxZ0IDxsT1AQR5PS03G2daH+/Zeqw7I62WXSg4TUbjPL7JfDM2yyXAclfTdeVBI/v0l
 VkEP30+Oe6JFdaAhuSJ3gt/bgyY9K3rJ8zG/raDNRKwaWvmBMwdsPOzXFDQ/Y3yC2ghsmb/
 Hq+wBUNi+p7cRtPprJq4cNvtRss82OHvL82qSsnR/xM79xHi4Z3x3wT4nY1Tp/VIqWqnwCl
 RIsrJD4x+/WvURrzjM+S1rA8TTdbQM1icjKIELFENg98zeTUsM6MBM6onA2/YaCMPz9zJQq
 dOqAgPaFpAljGii7TWWzQg0TE07Ar3rhBig+aqlA7YVVsMK/8S8ATDyG/zbA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AD04C45582
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 14:17:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BAF9C10E261;
	Mon,  6 Apr 2026 14:29:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0FCD60123;
	Mon,  6 Apr 2026 14:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2070BC4CEF7;
	Mon,  6 Apr 2026 14:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485752;
	bh=HnyXrN8Ze7oWN5RU90Xg4dEPZvkzNdPtLR2J7oWKONc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=lwTzkeF2x01R3fvgfnFiK7WfggVTtKgdI5PqAS3VuDqpIEjjdug3qWS7vtmd2KSdV
	 oTrDkT9uQ1/xp613yCRhmPXrgauzZR0SgdLw4cgb2Er+qKxCTR1UB18MekNP57ce2d
	 Dq+NCKPaveS/azu5fgX/lqg7329U84tez02UUqDJPJCyN8pddAgwpNDLQ0IkSpW1Jz
	 PtO3C6UpQrHPaXGREoTIC5FN/oFA5HuOyD8AMahOMQs/0AlImyQbF6YnkNDQHi8ivV
	 onmaDI0oyY05cOCK9W8+TufsXgVJdXN34et90aGjxYMba+57r4m5OtP1bI9SzohIux
	 tfdhwuQhJ5scQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 07/33] rust: allow globally
 `clippy::incompatible_msrv`
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-8-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-8-ojeda@kernel.org>
Date: Mon, 06 Apr 2026 10:28:56 -0400
Message-Id: <177548573697.95472.13544191227699996309.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=648; i=tamird@kernel.org;
 h=from:subject:message-id; bh=HnyXrN8Ze7oWN5RU90Xg4dEPZvkzNdPtLR2J7oWKONc=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJmXD+szR8md2/bwyZ1F0fYvj7t/r54Rzbf5hV3T8oV7h
 Q3jI+P3d0xkYRDjYrAUU2RJFD20Nz319h7ZzHfHYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdAx1jBi5OAZjqWT8Y/lmwJW9eJT3XMkOlYcLcExldDysMMzaVTNBntZYMfuz17zPD/3gXC6d
 lAllJAu0+OzxTQy8apMZvPH53ovG7oKmxvzfv4QUA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: D5N2D7ERIEQKHEG63T6NORVDXQ4YJ4SE
X-Message-ID-Hash: D5N2D7ERIEQKHEG63T6NORVDXQ4YJ4SE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D5N2D7ERIEQKHEG63T6NORVDXQ4YJ4SE/>
Archived-At: 
 <https://lore.freedesktop.org/177548573697.95472.13544191227699996309.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 06 Apr 2026 01:52:43 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> diff --git a/Makefile b/Makefile
> index a63684c36d60..78f5ee173eda 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -486,6 +486,7 @@ export rust_common_flags := --edition=2021 \
>  			    -Wclippy::as_underscore \
>  			    -Wclippy::cast_lossless \
>  			    -Wclippy::ignored_unit_patterns \
> +			    -Aclippy::incompatible_msrv \

Could you add a reference to the upstream bug report [0] here?

Link: https://github.com/rust-lang/rust-clippy/issues/14425 [0]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
