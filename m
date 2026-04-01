Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7522D35173
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 15:39:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3151310EE7D;
	Wed,  1 Apr 2026 15:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qr3SSI6o";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9AD0345467;
	Wed,  1 Apr 2026 15:27:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775057262;
 b=b3Nz1TyCuMg1Cxn17wk6d9neHOHaMFvGVHvYabbIYN5otN3YvSTRMm7zUR/xegzCamA7s
 cn9YmppE//T3IvdtjPfji9evZc7o1StvsFYNZQekP5EI6JMqvlTWxb6P48QAyR2yBphp0zk
 FFmJY2eldi8UlvCSEiq0rjDmPxcsS2zMvR+uThBKI/UXZVO80DjcigoJpObwfDDf3rkSrW2
 sVYLAqIVpbpe/oNELTf/0Bt/j9aSfQbJa2GWTST1+9vwpQEdYiVJOqsHNGYcQsmpzAundpl
 DpJc/CrNaP1ZtrSpVAZ+1OJYihOzdFekHSW6bKW9q54ttPfEZjH1rWHzCiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775057262; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AufkUEahOgBfy397S/uJsQKFUxpcd3i2DL06g/yFGEg=;
 b=rKrguE8yNEKBGDIH6vQvoKv8RU2tkEzxK8K/Ay7cZRFEFNbbE/KLxadCR7qJdpr9AJGEa
 Ms6CaMuudRQhChytnf6ra35Uzih+AFjxiLoE4Rth0DPz8WHkfjrLPC9yw073W17N4i+6AB5
 vgeBJUtXm3htLyCX8+dxo5gB5DJ22ug12ReS/yXq6dkHXmWFeKBCsV5UmIGpAH+F9rpC+Yt
 b6Z0Xn4HaY2ty/vSkKlpt7XqF19Hjy018NERpdS7lnn2YDepiXG6bF+Z/odjnHbBiRItfHH
 bYRp87YI5DPtm1sGMtal/wMKublFbJmgfxD99ATXmDgtSmGhCrmEInToPNkA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 83AAF453C9
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 15:27:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA62910EE71;
	Wed,  1 Apr 2026 15:39:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14B4940C25;
	Wed,  1 Apr 2026 15:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46536C4CEF7;
	Wed,  1 Apr 2026 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775057940;
	bh=fJdFksYvhu2QBW2xM51tNuc3BCiB5YiBhlwDrUJiUZk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qr3SSI6oBvZ+JpJTYcUXaAZU4g6rvIYySeCjiEK8in3tDiXKQOwN9w9IL7MV0KfHr
	 VDj7jDg2y+ZEbMEPm58bDK0HBWdunouxBWnX/uEhokekEjMfPAfx/mgiAYSs361378
	 vesh0G4OfMCBIJSWzUZP190/CSoWuGdO/ZLsZovBbn5oGwM56T7tGXH1I2+YiQEGv9
	 7RALUg9V6caWS7Z1FWU8E+XllK8kNKPYaZaRLpq42UvvjNXEvxqdhZQhqVHotZNlvd
	 qCKhuASrauwkg82oTq6DRtUHC0wtKP145B0lkKILpqf6FQdYOVSEf0A2873+txIRkd
	 olz30NccPaUEw==
Message-ID: <1f88e7ff-eb91-4601-a549-cddcb06b87e7@kernel.org>
Date: Wed, 1 Apr 2026 17:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/33] rust: remove `RUSTC_HAS_COERCE_POINTEE` and
 simplify code
To: Miguel Ojeda <ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-6-ojeda@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260401114540.30108-6-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PKY4WKYO6EVS5JIED3SYPUNICOOZ2ZLV
X-Message-ID-Hash: PKY4WKYO6EVS5JIED3SYPUNICOOZ2ZLV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PKY4WKYO6EVS5JIED3SYPUNICOOZ2ZLV/>
Archived-At: 
 <https://lore.freedesktop.org/1f88e7ff-eb91-4601-a549-cddcb06b87e7@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 4/1/26 1:45 PM, Miguel Ojeda wrote:
>  rust/kernel/alloc/kbox.rs | 29 ++---------------------------

Acked-by: Danilo Krummrich <dakr@kernel.org>
