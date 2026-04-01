Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C87D3517A
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 12:29:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BAD7910EFAD;
	Wed,  1 Apr 2026 12:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cNc4Unp+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8C33745410;
	Wed,  1 Apr 2026 12:17:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775045878;
 b=zWbHByH4hEZT+I9XAdy0Jsb0gRMAvt4gOBrby7SM7/yRkfbTisBuxyMvXI+Zvigp/9I/z
 G6W3WEyMtzytyHKIQofzs36GmuW0zolhpzSuQx4Xvh9cAT/K8mUzd0rd3q0mtj/WyBhEyv7
 +JooLUzQmp+SF0GoSclQtwVtZBiF/McSDC3Aw7E6iqYHycHRF2bWHrKnnJd0rELhDG3P+H9
 XKvWwBkF/jdsAOhftAaBF/FNu1LFyr69P3/mvORpklVJOEMcdGvmWUQTvta9M5otbJTVCxK
 2FzTXDdsKE6tc1giK0ESvhZn1sBQrRzo570nrXt7wE3CmmTx1Zgg99r4r/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775045878; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LI9WhSdEEdZ3tG3mKql7VBDkTBXQLZ/gbuOGi0yNUv8=;
 b=kOyYn/Z9Z7PoJo/pzsxiS8q9xld+iICtD9vndnin6ogygex0lUVlA0VhAaRvixKRS0MO9
 WwRuFraAcHB0Ln43cABoN6OBon8z4xSVwhbH9rjFwK6LcL//DmkZbC7uzQS4O+adT/9JSTO
 FC9w7o6wbmKZh5GDbd8j7ZTxCOWaEJ5CiYy1PGBsp+3WcMGJr27MDJFkKhpQaE0Ij3Q6nDa
 baStwkCD36aTguEICNBPnWWQ4xsttpnEEIS1S+PnH5DRdK/UCmLrbqAXjEjEkzhc/3vBXPr
 +Z4MmkkjP4DlFs7UFDEgOIB2yeEv7nmELNhKdxjry1r0mZK52uzqmqVoxhkg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 626DD453C9
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 12:17:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72AD310EF4F;
	Wed,  1 Apr 2026 12:29:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5683440426;
	Wed,  1 Apr 2026 12:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C95C2BCB2;
	Wed,  1 Apr 2026 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775046558;
	bh=LI9WhSdEEdZ3tG3mKql7VBDkTBXQLZ/gbuOGi0yNUv8=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=cNc4Unp+PRYooUmgGFFye5pDT1W9gMHh2kYwCyjV+QfNlITpPwQ/dJuvgfcNRQ2RU
	 OLAaelo2Y0M4WDZzhqq4RFZXh9vweX3G+C/5TXnNYfixFZeSPwJ1TncBCwnYdhO4+N
	 iUJBSVjzKvnbJsWNKBdcqSDoCCVgRcPImXqZXrY2LM7yFKn2M2coddn/epy+7pRRuJ
	 7kjR5sUlRh74ki1EVprakY7r7VdQLjXSDpn81irF7Wy3aK4ONAC6bsjxvO3qaEeF2y
	 Ih/6O0he7vcr4VTXsIepdeDgBSoaXWc/+n1c+XHcoTMZbv3F14pd5Q4viy/bXvnp97
	 pRV5GgtSPhWxA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:29:08 +0200
Message-Id: <DHHTHIT2GZIG.P942QFSTQ32M@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 21/33] gpu: nova-core: bindings: remove unneeded
 `cfg_attr`
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-22-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-22-ojeda@kernel.org>
Message-ID-Hash: TYOFAC7VHFHGH7UONJCKZVUMBW3RM2XE
X-Message-ID-Hash: TYOFAC7VHFHGH7UONJCKZVUMBW3RM2XE
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TYOFAC7VHFHGH7UONJCKZVUMBW3RM2XE/>
Archived-At: 
 <https://lore.freedesktop.org/DHHTHIT2GZIG.P942QFSTQ32M@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Apr 1, 2026 at 1:45 PM CEST, Miguel Ojeda wrote:
> These were likely copied from the `bindings` and `uapi` crates, but are
> unneeded since there are no `cfg(test)`s in the bindings.
>
> In addition, the issue that triggered the addition in those crates
> originally is also fixed in `bindgen` (please see the previous commit).
>
> Thus remove them.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>
