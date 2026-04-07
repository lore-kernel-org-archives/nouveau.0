Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B278EFF5139
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 19:40:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 831CA10E4D1;
	Tue,  7 Apr 2026 19:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l+XKs1nT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5313D456E3;
	Tue,  7 Apr 2026 19:28:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775590106;
 b=hNbbkqTKRfknLGD4ELanS8m4C/yV6c0IO7IZfsu2PiTBPiiv+h0eOZ3+slWPTuveF+K7Q
 XuLJW7oNojPuVmw2XbBdQ/Tq59404vqYljoNZYSPakBwbqhOsI+dwmhEVgRmRHt0Er4SJwq
 se5lYsxT9pjXcOSYGPRLj/V7nh4mSsmyISTc05W/ymISoanTTNrcOO5QNfpB9dX17SrPlK5
 vEAIQ+YPn2vygXmqIianBkAhdqR3E16EHOhPF4kidvKHrwwY84Z6DfApjC7RhhAiNOyiwdz
 uJ7MMb/dSGRVNk7IY+uy6yzFCALvKMKR9ILxsEOgRZN4Rir5w49qmfzt4Y7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775590106; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nKylmw2JBa+9HQkKAnkeiRUOdPwH+QDE+to5+t37u6I=;
 b=O2czoqzGSgIE0+VdGjFFnkW5kCxOARl9WajB/s0loqWR5s7mTvv9+ghnaRgTguwcOEP80
 cFNRv8V5LpcYiA+UeHgaZ8eG8gphFmiX+UKbY+h1OAFXCSgEuRltnsI55udNsceNz+gOhYs
 fT0mHQyh7hN9vS+iKw8ycnohP6IKbMbeB4+gIdQq7AKYVlq6OVB3yBmzBvUJFmYVjJhfufm
 GfywT3LXefPH4mFqwfqPUTLW1CTELBIb58SxtFSRa+QAFHoVJAHFQz78jfjcwokTaP/GegM
 uU3l3NZxL3dsu+nIvlxNhX5PI7HnWQJAHYIN5jTgAj7iGxFKahEoYrQTKIrA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 33D4B456DE
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:28:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C75710E4C1;
	Tue,  7 Apr 2026 19:40:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2242B404AC;
	Tue,  7 Apr 2026 19:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7665FC19421;
	Tue,  7 Apr 2026 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775590800;
	bh=L3Rfg+8z09e8keiE7bpGEjenYKXFDv21kTEZM7E6AaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l+XKs1nTqXITUzVO9V7ZcgbUKwdnwTFr3L2FCLHY2KQo86k0Ffjt8OL1/JRtkSDa3
	 yNBwGPy69Qr91P26LAHEK1+rZfI5CToJT/zHAcNUCaWarkT5tjiCiRrgjcgleZ82i2
	 RAt0ogBD0uHApgE3oFsyhNUam/qX/iD1x6pRvm43Q4Iw5xWGX7cWXIJicOEm828y5B
	 55nqWXirst8RsbiNBuVI6dXtBatMxgvAUKG04HGQ8GcjMnE9vAOu2CBdQ4m7SQse8C
	 W1jYywMzoAaOGnuLv2xcDaPbBqhp+7vjf9ZKmdzFfBwerHgNt4NKfTHi12+fv/HkF7
	 JDYjm5yTda1Nw==
Date: Tue, 7 Apr 2026 21:38:32 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v2 25/33] docs: rust: quick-start: add Ubuntu 26.04 LTS
 and remove subsection title
Message-ID: <adVdOOTJ0Iku8A3g@levanger>
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
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	Tamir Duberstein <tamird@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-26-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405235309.418950-26-ojeda@kernel.org>
Message-ID-Hash: BBP6VO7IFMLPRTZQYOVZ7FW2YNTCRQHV
X-Message-ID-Hash: BBP6VO7IFMLPRTZQYOVZ7FW2YNTCRQHV
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
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Tamir Duberstein <tamird@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BBP6VO7IFMLPRTZQYOVZ7FW2YNTCRQHV/>
Archived-At: <https://lore.freedesktop.org/adVdOOTJ0Iku8A3g@levanger/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Apr 06, 2026 at 01:53:01AM +0200, Miguel Ojeda wrote:
> Ubuntu 26.04 LTS (Resolute Raccoon) is scheduled to be released in a few
> weeks [1], and it has a recent enough Rust toolchain, just like Ubuntu
> 25.10 has [2][3].
> 
> We could update the title and the paragraph, but to simplify and to
> make it more consistent with the other distributions' sections, let's
> instead just remove that title. It will also reduce the differences
> later on to keep it updated. Eventually, when we remove the remaining
> subsection for older LTSs, Ubuntu should be a small section like the
> other distributions.
> 
> Thus remove the title and add the mention of Ubuntu 26.04 LTS.
> 
> Link: https://documentation.ubuntu.com/release-notes/26.04/schedule/#resolute-raccoon-schedule [1]
> Link: https://packages.ubuntu.com/search?keywords=rustc&searchon=names&exact=1&suite=all&section=all [2]
> Link: https://packages.ubuntu.com/search?keywords=bindgen&searchon=names&exact=1&suite=all&section=all [3]
> Reviewed-by: Tamir Duberstein <tamird@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/rust/quick-start.rst | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
