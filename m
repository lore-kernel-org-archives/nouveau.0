Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651F11112240
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE9510EF46;
	Wed,  1 Apr 2026 23:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZJatFFFk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 15A394549D;
	Wed,  1 Apr 2026 22:49:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083764;
 b=kXpEG+H/P1b5vF8ujFZjdKSRPlJF3GqotsHDpdFUtmMNx86s3w1aMkAiLCQupxKhW0feQ
 //5RtTUJdbO2/yMbB+VC/Ww+8qUHpu5AD2bZo08WTGL6pwAj4o085WhDLqwtAuTk4G29yLu
 Zfh5KJ96983rsRcLMeieCUs9zxvNLdkC4MUx9b2VrqhSgt+nVIDofAIm1Iz4H8erBp4Bkol
 FfbUCCHOQHfzlz7bHWnMxkWQ/gj82vFe0ZJAyjm1T0DNb1MuORTfjlkYoiXhnQQXd+kctC5
 wNheaaENGE8A8DNhHlV0xVRLjsJZo6GLizR8pzDqqUHXnEiJSuX+EEQIqVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083764; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=McLF2sdtUokmlMpfv7AGz7lZKpzhwFQcwtADgn2/2U8=;
 b=LUNmJj6vrV0L2q4Fvtm8GjSg1qoB/97NzWhkOdy4S3YneoCtiSaGN3OdccQFG+zo6krJP
 NmhkcdDuyy5Q/Vg6JEVp3S2g7+AJ9NRoFE6ULVj7z2vt2m8jm7tlENiC16XBOw9u+r5SFvG
 chcF7yU5d3qrDZLK/R9ofTPh6ChMl6LYiXo5tmjtTnbn35HnVhwh5MxBHNTkarMpnjVSDzu
 0lRhA4BhGD2sPSDZjkvtPTDhkK0n3wDjq9qAgvzzwDH0Cd3LA5EuUfo3sgvstIaTuhFdYVZ
 theVG1yC+OCfmI0JVjsUbw18qcuQPiEETNuSSHtJPa/uLzUoUXFWPI0mb8Zw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B139845476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:49:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BB98510EF3F;
	Wed,  1 Apr 2026 23:00:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0226418AA;
	Wed,  1 Apr 2026 23:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D37C2BCB2;
	Wed,  1 Apr 2026 23:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084445;
	bh=PBFIVlb3y/4+vIcT00tcSiDAg1EkUAKYUzmV5YKhJnM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=ZJatFFFkz2ZScBb/S4TpqCqmlU5CEjZqBFSOV2A6WNBXX8frktEMOQxLuaJ2zui7K
	 TxLAQ++0MI0i/ejdo+T8y3DBO4V58gFNwTbymjm5fDwu6axUpsx0S626SSYNAzrXui
	 e1eIupdeP7FHJUCMfFMrQDaczv1/dJhrNI7saTL0pBZvrmcWTrW0nafC7OliJNtKOF
	 AuSpTcBjZLGhiHOQICoxolcyoBXDzybeR0miWUG0/UGrBi/GbuRVRt8SPH6kA2Tus8
	 oRRSlmlRfvrM80vHQZInm2Y0P7R7TlqrqSzkmPpxE9E4S4Z+eVpQiiDUtv9UUCP830
	 eMM7ek2JPRPYw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 17/33] rust: kbuild: update `bindgen --rust-target`
 version and replace comment
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-18-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-18-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434455.73816.15756486388132647025.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=637; i=tamird@kernel.org;
 h=from:subject:message-id; bh=PBFIVlb3y/4+vIcT00tcSiDAg1EkUAKYUzmV5YKhJnM=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzs3fD173aT8/5+Ovnr2PRYiG1bqrWPgMY6xttK4q
 /CrtKSxYyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFQ/LWD4w7kwWW/VxU2zXts438gISVTrqop+9/KT1f6iG8v5bDV9exkZurQMMt7
 6i16cW2b/YP3LZT9l/vRpFWZm6OW9Dvo5UTiIFQA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: FG4LJ53Q3JA77WUDG6X4N5LVTUNVYBQB
X-Message-ID-Hash: FG4LJ53Q3JA77WUDG6X4N5LVTUNVYBQB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FG4LJ53Q3JA77WUDG6X4N5LVTUNVYBQB/>
Archived-At: 
 <https://lore.freedesktop.org/177508434455.73816.15756486388132647025.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:24 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> As the comment in the `Makefile` explains, previously, we needed to
> limit ourselves to the list of Rust versions known by `bindgen` for its
> `--rust-target` option.
> 
> In other words, we needed to consult the versions known by the minimum
> version of `bindgen` that we supported.
> 
> Now that we bumped the minimum version of `bindgen`, that limitation
> does not apply anymore.

Some citations pointing to the upstream changes would be good.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
