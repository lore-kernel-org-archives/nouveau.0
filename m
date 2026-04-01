Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4858BD6AAF9
	for <nouveau@archiver.kernel.org>; Thu,  2 Apr 2026 19:05:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B87310F290;
	Thu,  2 Apr 2026 19:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mUKes+mM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 69A5F4553A;
	Thu,  2 Apr 2026 18:54:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775156041;
 b=IBC4KogWfwy6rpHpjozwwzAjOZWuIIoyDmjAFpWF5QIsuu68BZ6QyJEbIimKdl2d2fYhb
 hMweXpcbSHmLIZFMvxeHo9qqensGDBjQSjCfdn/r4PafdGbjlw4jOITLbeiFXcUKdF1MaPk
 ZE3T2fnCIrGFo39Wh1tDtg1rQwrjcHWDlmrFZ74q4tmM2gev2dYSnIbcsmNZZPEyowMJSVH
 ivUB5AtpDUDdDb9dGSBC9WQY/xLPnvqElazkoHFQLelhtV3hyddHLhrUU5yTPFLobm/8+Xz
 S5PLwXMzrioqQEro1QUol+RFkbh3coyxPapvbPtuDR3NXP0nzK7W9tVkMqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775156041; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=08+HF169tzom4TGvVoXRoMnpukSRm4ySOp8JpJoHgb4=;
 b=Kz3lQlMBY8Ep1bRWJ6pmr3qB1FwoeZnZC40fpa2LN4Mln9HBG6f3OpBpwiyBVBGHcNvY2
 k3Frk/KhENEWRIoB8G9F3DmxK0MsBsB8V0M8kvUb+FtwBjt3c/pkT+vdvUXfcvW1chhoH8V
 /4aVCk30iZBeYCsUY8jUSv8v3nUcPIZWf26rGhq81/z5f570fHmqDLL+ojrpFwtquDzAQI7
 um9S0zrO6R6VrP6y+vIQHycaN+JW33JsdbiH8KT1dmKMhPSPdcuw9sxM0fvZ2rDMZgRVFb6
 y4Ic33lhhawD0kmUZ19j12kiWJkxVOXp1YeV9hj1dMVI2zsybaTB5nMXZpsg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EE57A453A8
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 14:46:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C22F10E323;
	Wed,  1 Apr 2026 14:57:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0A3060132;
	Wed,  1 Apr 2026 14:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74290C19421;
	Wed,  1 Apr 2026 14:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775055455;
	bh=8e2oNK+RNa0NzKd4ZlabYjd8IqP/GM5sHzXlyJGAd+w=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=mUKes+mMPs5iX2Viqpl9YEl86lcLJksX1Gm+Yr6B8QPMTf30lx89O2N4j4uuRrsBt
	 /WvZPEZXGvjv5HHYWLRMgt89uNfXGP2JoNEUA5+6vWs31qT6KXWzmOepYAC6w3/ykq
	 65Mfexkf/2wemcaMM77IqDmD9DJaj3yY175CnUJa1sC+ANoroZ4twvbzpIYHfpWSOs
	 2Zjfn4ErkryA82DEigqSFP4d/XQVInePh1+SDffXkjaaFz1OU76sLVrNgbh2ehMITL
	 vuBN0C9PQLVQShwJWA4kjUmjBbYNtiYIsifnmGW7kksVSKd/ea83EEwhf/sQ9cN1MW
	 b64kr4qjr5Q1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:57:24 +0200
Message-Id: <DHHWN1TBVAZS.2EAX0F648ULPU@kernel.org>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to
 1.85.0 (Debian Trixie)
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-2-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-2-ojeda@kernel.org>
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 3HUOSD3OEYWPZQNFKFGGZI2HBRUHVPNX
X-Message-ID-Hash: 3HUOSD3OEYWPZQNFKFGGZI2HBRUHVPNX
X-Mailman-Approved-At: Thu, 02 Apr 2026 18:53:59 +0000
CC: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3HUOSD3OEYWPZQNFKFGGZI2HBRUHVPNX/>
Archived-At: 
 <https://lore.freedesktop.org/DHHWN1TBVAZS.2EAX0F648ULPU@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Apr 1, 2026 at 1:45 PM CEST, Miguel Ojeda wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
>
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
>
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
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.h=
tml#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://www.debian.org/releases/trixie/ [4]
> Link: https://packages.ubuntu.com/search?suite=3Dall&searchon=3Dnames&key=
words=3Drustc [5]
> Link: https://launchpad.net/ubuntu/+source/rustc-1.85 [6]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Very happy to see this!

Acked-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  Documentation/process/changes.rst | 2 +-
>  scripts/min-tool-version.sh       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
