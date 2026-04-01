Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B72D35177
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 12:25:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B71C410E345;
	Wed,  1 Apr 2026 12:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="O0cib2iU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 75C65453F8;
	Wed,  1 Apr 2026 12:13:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775045621;
 b=sOAw4Hka+25+748ikdiGC0Gkbq4op6ZZuHXVzSVecEZjXMw+dYy7sjonX0WEnppoL7SPg
 9ngoBavWJlpAfiQ3jJ3r0P2rQn0UMEYhYSSzFdwf61t+xzPsCNT9UTDOtvur6mv32t+AOnQ
 j6S+vaCpv/5JKLx1htEvUS0OPu0BX06HcBMlytr6LP9kERBK2DwvwEXrxpHQOfEAOV4tSXz
 I/C97Gpd/DJmGnQiZZcoI7/wRUKMwaWO840mUO/T2pnYkU+ADpYjawsceVkBG2frBf56qEI
 cKN9DzfjIaLgu2cxbbFB1N4GHhl6OyW9b5s2vbroJNGv4lXtYWTClOui8Zgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775045621; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Ycc6WMg7OLshR/yyfU2jpKKLPa+z0xOJ3hTWvecsxRM=;
 b=JyHH9aEDwwV3kAhPIaP6mA09qpSGEySP0qZmLgrVREJK3jFVqpr/WtGmLBuaM8SS38qbi
 WYc07Ql05O5M7ROssKoWURsDFLBeEmAVQmdqkGKG87LiVo5boec5Y8lmm76qIzifA1uSNaZ
 zRxb0yPwkI76TPcr0Rbt71UiFCr4ENl7PGwgq/DIZpohZNqhAoLjJugd0+D3k/USeNoUANc
 mkeEviIcm4413gHL+FnPdFRzhQd5LoNlX7eZzHmoyCvdC8MI03JFz09ABaBvcW/z5qmAcFu
 8RD4ZST9LMPBvaqTyWPye/GWKPzXkheT+LAzJC0R+rBRK0gazbIMXdqIdROA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 38DED453A8
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 12:13:37 +0000 (UTC)
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 407BC10E14E
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 12:24:59 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b9763bb6d44so525456966b.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 01 Apr 2026 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775046298; x=1775651098;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ycc6WMg7OLshR/yyfU2jpKKLPa+z0xOJ3hTWvecsxRM=;
        b=O0cib2iUns1i7aeALI3yM5HuCcMm9iAfsh4QTvG4hwHU7p16PPAqn9Ir23k3NDn1A2
         vdAM4Afuc0uVe8Kvx0nXpBsx/8TXk84DlAhcQ4Byj9dIYZHEpu5DmYkJNjAF5FwU39fJ
         85Rfjuqedxp1l3Q+bz95BSEsoQEIXpSI+cO9xRXYyJeNOLdQShw/jjmD3gu+cyMrxneA
         7JP7fKEzFFDGqFgbLf5uPO4acsSnLTdy83JLpsx8CGgqu/DGVd4o30QOa54SX7UBS5W4
         qoUpY32E2A18eQdwAk+47/nlQdfFXDe0yqNawflXUlhOzQL2L3Rtry0TRmu5R82V4DJs
         Ycug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775046298; x=1775651098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ycc6WMg7OLshR/yyfU2jpKKLPa+z0xOJ3hTWvecsxRM=;
        b=bHP2ilAC7W/Efq+xM11eyr0wCOGvGeuOaeKVV+FP9RG0zchNYUZ53CJcEob6PMIWw2
         HBspp1JJzDnq/1jWGoU+qXrnQl6WpjmMAcYx3eZpiZI84jjEiMZ8Gyb6xlaDa2yyb40S
         pIzUn4eObWh0UN8udGJTHjVqT9BNZ9LYFYu8PJI9eqTk16qoguUNGSGYyXMMAdT6ZClb
         j197y9r3seSrpyVqlDWYgjTfLNwcc7tfnbktQyktThC98bmG0Jicbk56i5lXv6RflORw
         YfKRoxl0tbhtp8TrF0sG99RcnJKb9v11G7KMO2hz5jnIHKiJfsIYhe2Tl3oEYc/B/rIh
         O2ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJb0+wc81ny0T98nTQJcjaWQbhtn2WRaS9wefMNPHn6JFAvzvdOow2KmzFpV9hQtJGkdiZib2t@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+lr8TwuvDuTVACrhBXFTQEOXc6h+nNYzJivz7ad2qCkkTlNUP
	6prC7Aj7lnAvaGpBrxNz3kotEC1ZKlnFDtT8/mODp5t58iIaDFWkOBkapZ61OJFvtjePI+FrN0n
	61YC2uh+yNDjk7g7s9A==
X-Received: from ejcbp3.prod.google.com ([2002:a17:907:26c3:b0:b9b:54ac:688a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c448:b0:b99:5f69:9ee2 with SMTP id
 a640c23a62f3a-b9c13cf93e8mr221111666b.52.1775046297024;
 Wed, 01 Apr 2026 05:24:57 -0700 (PDT)
Date: Wed, 1 Apr 2026 12:24:55 +0000
In-Reply-To: <20260401114540.30108-2-ojeda@kernel.org>
Mime-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-2-ojeda@kernel.org>
Message-ID: <ac0Ol1PaRTWNK6O9@google.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: JF6SUNUWALTBDHEAAV3LQBCHWZVBAEYD
X-Message-ID-Hash: JF6SUNUWALTBDHEAAV3LQBCHWZVBAEYD
X-MailFrom: 
 3mQ7NaQkKB0Acnkegt0jniqqing.eqopqwxgcwnkuvu.htggfgumvqr.qti@flex--aliceryhl.bounces.google.com
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
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JF6SUNUWALTBDHEAAV3LQBCHWZVBAEYD/>
Archived-At: <https://lore.freedesktop.org/ac0Ol1PaRTWNK6O9@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 01, 2026 at 01:45:08PM +0200, Miguel Ojeda wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
> 
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).

Debian really *should* pick up 1.85.1. It contains bugfixes serious
enough that the Rust team decided it was reasonble to release a point
release.

> Debian Trixie's release happened on 2025-08-09 [4], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
> 
> Thus bump the minimum to the new version.
> 
> Then, in later commits, clean up most of the workarounds and other bits
> that this upgrade of the minimum allows us.
> 
> pin-init was left as-is since the patches come from upstream. And the
> vendored crates are unmodified, since we do not want to change those.
> 
> Note that the minimum LLVM major version for Rust 1.85.0 is LLVM 18 (the
> Rust upstream binaries use LLVM 19.1.7), thus e.g. `RUSTC_LLVM_VERSION`
> tests can also be updated, but there are no suitable ones to simplify.
> 
> Ubuntu 25.10 also has a recent enough Rust toolchain [5], and they also
> provide versioned packages with a Rust 1.85.1 toolchain even back to
> Ubuntu 22.04 LTS [6].
> 
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.html#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://www.debian.org/releases/trixie/ [4]
> Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=rustc [5]
> Link: https://launchpad.net/ubuntu/+source/rustc-1.85 [6]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>

