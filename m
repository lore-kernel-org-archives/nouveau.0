Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286F21112243
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E9C8510EEDA;
	Wed,  1 Apr 2026 23:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c3Yd6ysn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B76EB45494;
	Wed,  1 Apr 2026 22:48:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083718;
 b=Wguw2KlBmZeJVU8ft+rW9+DJLlchyA+fTAMmK/00g1LrXOM8MmX/drFLYebfZOFpkTkfu
 IgPeyWydxecA3GIotOiNTSk0ryHnR6kb14i3g7W0I3fgWXEReAIE50k5YCGDRwZuoEAl1In
 ZjMOp7eAR1wjrCc9M56XFodZx+agvY2sJqOhQV6su+mWypUdmwgWb1ft8BvgliVZ68CSPtR
 Bmp7ajaN3wcOHQStJhzg7oalXbxbhKhMPGOBAAZbl5ta8Ld8VXA53tQJBAiBnTBeeDCMhBI
 Klvq4EkhhG9aHawZlpdGHi6psbdnXW9DdSOBe4tW6jIENi715JyvF9HuIvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083718; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YZ75aXwbDi6PBlcGyy2PAZzqBBuT3ANXdVnCDScRx2M=;
 b=gU05CPrX98W6iHpK/T6ibOJbjnwksP+CrdPV59AB1NLTo3llSN9YaBHIWv7fM7lLDgi3t
 BxS92USkobFo07BiXgDQyOUeE82PPVcoSxndzJ80xbfl0iapWoz6zImUydtLHYQRW68J9lf
 4XSdyGugLyqY+BqJFct79zbG8EjT9Zk+H32qpB4iPK7aOsmlh0fjMyx+SRtzeFZHjjDcK1t
 h/yCIiUTCSKefd5BhmuxD4qHF+bmc+zgTHFTE3Up/WRFwlObLF4Z6Yp9t0mlOUebAQIiXJU
 nGrx0Ysn6MwAlLb0qvEzCGobgY6dTsu2CWDMoAKwmPS2Q49eiz8fs3kRLwtg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D3F2F4532E
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:48:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DC90C10EEDA;
	Wed,  1 Apr 2026 22:59:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C26E2401BF;
	Wed,  1 Apr 2026 22:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D93C116C6;
	Wed,  1 Apr 2026 22:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084398;
	bh=fqu7rrOs0OL/Tb+VSqQKqwQjSGQycaS8iS2//8/RxF0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=c3Yd6ysnQsGvROMtiSG+i3keeAySaiEerx1F2TBjnnkbqAXThe8bhBC5TmfGTw9Ll
	 iM81wVmrttBVfy5JGtlkpYWTB5ilbanIlMhp0u4XLelpZ54ZBP9JGO7PEfdS98oppP
	 y1H/3B42flzzuBQD0t+C6ViMRYVYqRKw6ppF4wNedlfutWkS1yja1IkZ7vaakl9Efo
	 IKyM2ubpcSiV/tFrD+PTVckV9ziEPjgOBuaWD4QFRsvbkk4PqOy2XpnWUC1wi9waM7
	 +yybB8tYYyxCkeQF+HluEUtULU29DO+VEutqMf9F51Xq320twioy0N0OMyWPyHHuGK
	 7JSnJjlMo5Dpw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 08/33] rust: kbuild: simplify `--remap-path-prefix`
 workaround
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-9-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-9-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434440.73816.18221552058190562777.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068; i=tamird@kernel.org;
 h=from:subject:message-id; bh=fqu7rrOs0OL/Tb+VSqQKqwQjSGQycaS8iS2//8/RxF0=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFztxvDld6+gaffHc/FPfFslrHQpc18Fd91tnQkf8u
 4NCctUdHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKY6aQXDb9Y/z4KOTNn7TGbrdYcmuYmuSobSbdGFPlXr2/x/qzq8V2Nk+HB8ce+
 j1zZzz6+zOelcOtmmT6rvz1aj+a/nK5UETLn5jAUA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: EBQO7NNNCRXVG5L4YFGO3Z3L3W3FAZYS
X-Message-ID-Hash: EBQO7NNNCRXVG5L4YFGO3Z3L3W3FAZYS
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EBQO7NNNCRXVG5L4YFGO3Z3L3W3FAZYS/>
Archived-At: 
 <https://lore.freedesktop.org/177508434440.73816.18221552058190562777.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:15 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:

Does this simplify the workaround, or just remove one instance of it?

> [...]
> 
> Note that commit dda135077ecc ("rust: build: remap path to avoid
> absolute path") re-landed the `--remap-path-prefix` flag (together with
> `--remap-path-scope`), so we keep the workaround, i.e. an alternative
> could have been to simply delete the skip entirely, but since we still
> have it and it will be needed when this gets merged, let's keep it.

The use of "re-landed" is confusing without a mention of commit
8cf5b3f83614 ("Revert "kbuild, rust: use -fremap-path-prefix to make
paths relative""). Though this whole thing might be clearer without a
mention of that history; the important part is that there's no
conditional use of `--remap-path-scope` in the base commit but there
will be when dda135077ecc is merged (the use of "this" in "this gets
merged" is also ambiguous).

>
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 193cf06eea64..708530ee3613 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -142,10 +142,9 @@ rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-a
>  # Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
>  doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
>  
> -# `rustc` recognizes `--remap-path-prefix` since 1.26.0, but `rustdoc` only
> -# since Rust 1.81.0. Moreover, `rustdoc` ICEs on out-of-tree builds since Rust
> -# 1.82.0 (https://github.com/rust-lang/rust/issues/138520). Thus workaround both
> -# issues skipping the flag. The former also applies to `RUSTDOC TK`.
> +# `rustdoc` ICEs on out-of-tree builds in Rust < 1.87.0
> +# (https://github.com/rust-lang/rust/issues/138520). Thus workaround the
> +# issue skipping the flag.

_by_ skipping the flag? this is preexisting, though.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
