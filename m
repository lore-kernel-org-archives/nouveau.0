Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0ECFF5136
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 19:40:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF0310E4D7;
	Tue,  7 Apr 2026 19:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sDMsUKs1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D2FC5456E5;
	Tue,  7 Apr 2026 19:28:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775590110;
 b=jhm4w3ouVrHZ1tKqqZkUl8J37yfAX3YgwY4s8BcWcuJ1bQnVJgJob5mo8Umxj55cT2aEU
 1lIg7uSSkUsDiVPpTNjvpKD4TbJ8CRAlFSHxednHmvWPkonhyMzG3R/j2/eIffB7upwj7AH
 O2xf0H1v9daBZ/k56tW7ET78MuefdrXS7hBdtOmfnYsYPICSJf5Da+bajP7N7MaCHLeXc+s
 hcPrrfxuQ2U00Bgax1ZtJPZLREudp8+B8dRlK3opqYHKADRJLS25TW8vjhuNua2xMTqetoX
 OtnGu8CHLY4zmPJQxLaFcG/1SqEPrJJ4+grLRDSSxRjqr0p0jVePLqUGk4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775590110; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zfB2Vo9vdLlwf+b5CQXtw7Z//lquULPDQoRNbd6Zh9Y=;
 b=u+5wpIDG5p/Lw5wsZzjgZA6OpVpdJRmicnHHosMp27MlCW+DwvIV0SnFlORpeWEWu+H1E
 2f1o2PaYhe+9B0YP7mYP+cwT+/N5qvsPgpElzT5npGjgp/ttnLziX5JW4od8IVHMutA3jAi
 61Bv0uiLrxRCfEEbXEskDvNuH0iCyMr+87SlY7D6RX8gWtxEfp+/HVt9yyDaElIsQRD/a7Z
 Ez3mjkNMQfeJP/n8j9adyLeDqQQlwn/RJGGmSw9hV8OAsCS7m1A2NEaWxS3hJR6To0My5Os
 Xn8EQMRB4SLQjiCFk27eqjL0x4daDgB4CbOa0Y/+97YYEr6ZrjQr2trGooSQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DDC58456DE
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:28:27 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C76D810E4D5;
	Tue,  7 Apr 2026 19:40:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BB9C60139;
	Tue,  7 Apr 2026 19:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F94C2BC9E;
	Tue,  7 Apr 2026 19:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775590802;
	bh=G6kWDg5ZKjWvzVWKZlcYhQ5fam5iGV3sa+XLqVTs0uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDMsUKs11clmLqRSYOHdYemC/6eCCuTs/nd+pMdQ4HYBrZ2RMECvxE6SXi3Cq7Qt2
	 Vq2KJvfW5GfXXZgHejEo9PnFH8x8Op63ZSvbJ0vvCU+be1qdWGNKDkx6MVC2iXkJUM
	 qJwNyNeAg2v+RkrnDQoXDazkT2Endo1x/TFg5/uKx/qUeKnEug+ZIa1nMoI5aLlOEY
	 qeo71REji+J04wTIEZliW+iwogjU+a6RnJJQAR1UJJBmXx/1Uxx/C0aQtgyu1LZY3r
	 MsOztoq00b7hebIqtbESUzLc+vPI1CSIyx11Yg+4g+gy6/+6M0uFALPOC0AaMDWpzZ
	 Kfy0Fs+ExLZRQ==
Date: Tue, 7 Apr 2026 21:39:30 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v2 01/33] rust: kbuild: remove `--remap-path-prefix`
 workarounds
Message-ID: <adVdctvoln3uRnSH@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-2-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405235309.418950-2-ojeda@kernel.org>
Message-ID-Hash: O4MELSLODXFKFFNILU7HLHI7K54JQG65
X-Message-ID-Hash: O4MELSLODXFKFFNILU7HLHI7K54JQG65
X-MailFrom: nsc@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Nathan Chancellor <nathan@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O4MELSLODXFKFFNILU7HLHI7K54JQG65/>
Archived-At: <https://lore.freedesktop.org/adVdctvoln3uRnSH@levanger/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Apr 06, 2026 at 01:52:37AM +0200, Miguel Ojeda wrote:
> Commit 8cf5b3f83614 ("Revert "kbuild, rust: use -fremap-path-prefix
> to make paths relative"") removed `--remap-path-prefix` from the build
> system, so the workarounds are not needed anymore.
> 
> Thus remove them.
> 
> Note that the flag has landed again in parallel in this cycle in
> commit dda135077ecc ("rust: build: remap path to avoid absolute path"),
> together with `--remap-path-scope=macro` [1]. However, they are gated on
> `rustc-option-yn, --remap-path-scope=macro`, which means they are both
> only passed starting with Rust 1.95.0 [2]:
> 
>   `--remap-path-scope` is only stable in Rust 1.95, so use `rustc-option`
>   to detect its presence. This feature has been available as
>   `-Zremap-path-scope` for all versions that we support; however due to
>   bugs in the Rust compiler, it does not work reliably until 1.94. I opted
>   to not enable it for 1.94 as it's just a single version that we missed.
> 
> In turn, that means the workarounds removed here should not be needed
> again (even with the flag added again above), since:
> 
>   - `rustdoc` now recognizes the `--remap-path-prefix` flag since Rust
>     1.81.0 [3] (even if it is still an unstable feature [4]).
> 
>   - The Internal Compiler Error [5] that the comment mentions was fixed in
>     Rust 1.87.0 [6]. We tested that was the case in a previous version
>     of this series by making the workaround conditional [7][8].
> 
> ...which are both older versions than Rust 1.95.0.
> 
> We will still need to skip `--remap-path-scope` for `rustdoc` though,
> since `rustdoc` does not support that one yet [4].
> 
> Link: https://github.com/rust-lang/rust/issues/111540 [1]
> Link: https://github.com/rust-lang/rust/pull/147611 [2]
> Link: https://github.com/rust-lang/rust/pull/107099 [3]
> Link: https://doc.rust-lang.org/nightly/rustdoc/unstable-features.html#--remap-path-prefix-remap-source-code-paths-in-output [4]
> Link: https://github.com/rust-lang/rust/issues/138520 [5]
> Link: https://github.com/rust-lang/rust/pull/138556 [6]
> Link: https://lore.kernel.org/rust-for-linux/20260401114540.30108-9-ojeda@kernel.org/ [7]
> Link: https://lore.kernel.org/rust-for-linux/20260401114540.30108-10-ojeda@kernel.org/ [8]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 

Acked-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
