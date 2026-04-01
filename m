Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10443D35173
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 15:40:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE7F10ED36;
	Wed,  1 Apr 2026 15:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XtWc7kSB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1C6B445469;
	Wed,  1 Apr 2026 15:28:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775057320;
 b=HL7ayB/fNavV0kE+afOKdovldVgD0yvDZUzYib13hYDF1DfN7peVccLzbURrorixZyphZ
 QPHMialj3oVk5l0z/gwDMb9CGmG6Dei3RlE3GwKbxD8bLvt6RQd3Rkz6LzMs1PtP6fj9ku5
 KpZwJXCOyAtdwDaDrIBzC3yUEilr4pT/hgmWKkzuI5hIbab6gTcjzfOZGbpNjhtTR8mcNZg
 sAc0qBTuUS5Xu5mfx/RTcmM5lKHWhv3toCNOv9cHPNikhHApLP9A0o4crXx+IxlEMDb4q4l
 yYN33H15lW2VA5ONTmepbr3RK5LlOi/6d8vAqtD6ZEagigUNG8KoKVh8Zyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775057320; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kcoc0BN5ofl1kwegqdCcrmzG2n5wieyFU0iEqLqJvg4=;
 b=0W4sA8Lqd2ga0fM0mPfBgPnAxb+S3AAahTNoNe11JMOS53/sjnX0arnh4Y8t8ZLsgTCVy
 Uh6Uo7EG0bLLK9zPwjIZGp9aWeD+hgXzbV2NGC/Fw+uoVN/9Fd8MDGjFXOSKkWrlwqWDfHW
 GaVPbSL+wXacPri0YGSyVcX6F4CvwoPY0+clIECp/eemeHCLCN5N9urU1qOAP0erRbrdPH4
 eqzs5FuKeWtCEWTO4bmbCq4bCYZsX1Q64l1zSQ/qRy8HuxDCr1RIUH5q+CMdzgQT8vgF0A7
 7vC1qohg5L9gAUWfwriNGDLXzN5kVxN5Jo5Rb5fpqAczVJdAFbpzSgXpWdwg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7A9E8453C9
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 15:28:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D3C7B10ECA2;
	Wed,  1 Apr 2026 15:40:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6D3840D5B;
	Wed,  1 Apr 2026 15:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2904BC4CEF7;
	Wed,  1 Apr 2026 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775058000;
	bh=qluaTkvREC5+yG58ljxsV6cqHwaNZiO+EKP753RRYcg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XtWc7kSBpczDhOeDzctojUGhjkDX9yLOncrss4xMBiCV/aNAFElErs7mbZxhOzBFj
	 IjIntWeGJXpFhKhS/f3AB+fYVKP1SKYagi5+a2LPJgthzcivJeg5Rz9GV4Rw4eFXw7
	 fIPUmcXhywGnFMLSWkC3nbdoxcr1E/+qjOIUMtmLmnJBEAZi4KMImfvb1v0eym+x2e
	 9qqygeFi0bxup5RxJ5c78WULUV35EpKtPMYapo3WLjNS865aTrEt2qKUl6WScPk4JE
	 NEJW+MxF0alErQ/CFCZjckq9jlMzUYvZTb0k9w4o2IO9WAfLDuQWKDcTRbseeV3Jom
	 THPMVL/ytMNMQ==
Message-ID: <51bffefb-395f-4ece-90ba-588b2bdadaac@kernel.org>
Date: Wed, 1 Apr 2026 17:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/33] rust: bump Clippy's MSRV and clean
 `incompatible_msrv` allows
To: Miguel Ojeda <ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-3-ojeda@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260401114540.30108-3-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SQ37ZUECQ5VM5SN2NT4MSSRZP2ONGNKA
X-Message-ID-Hash: SQ37ZUECQ5VM5SN2NT4MSSRZP2ONGNKA
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
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SQ37ZUECQ5VM5SN2NT4MSSRZP2ONGNKA/>
Archived-At: 
 <https://lore.freedesktop.org/51bffefb-395f-4ece-90ba-588b2bdadaac@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 4/1/26 1:45 PM, Miguel Ojeda wrote:
>  drivers/gpu/nova-core/gsp/cmdq.rs | 6 +-----

Acked-by: Danilo Krummrich <dakr@kernel.org>
