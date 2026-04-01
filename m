Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC0110FCAFA
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 469F910EE60;
	Wed,  1 Apr 2026 22:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dSX2Jo1v";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1BBB04547E;
	Wed,  1 Apr 2026 22:48:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083688;
 b=FhHy4kNz6BlMfCCFD+YQXIFBHabjT5j/g+LES2WKfKC4RHRaShjOmKfOt5nR/qZj5quKw
 RMf4Sv4JUAusb6tQPkLZljeCqDGsWfZ8na9869Bv+B0Ks1Kxb1775zsj+fu41UntascRJM/
 RNg8t0ebc8IRyDCxj1W62ObhkqvVAbEnC6bU9OeF/VGbU9qyzZ5eY+4GsGXrdTrYQjpOmEf
 5NiKYDC6XK8J+51uGshm/UQUogrks4MPZRyXIu/y/niQmkcj9yQOMjcwD8IdV+CRYAqGLHp
 1mX36bo7RWfgsKP5d7hC0r5VIhRVOEyDnT0c0PIgY22y91PU5Q4U+x+dzo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083688; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ycjkIWDNkLRP9o7uYN0k5oMtUxpxJcfzGktSWdIlTk8=;
 b=lertARqAFg7tt4lQbZoM7Itj3FYb8E1p45/I8K7q18FvBtwxY7qbNBm/hCiEliAv4/mDq
 vnho1mIy6TinWtbY3J70x1dnO+ETNhEXyiJvhFHZ7drRA6sEWMvB44NRYGCVe+L+EJvylej
 LJbCP365ZFMIsUgmY6oIqkx3dP4jLvAb+z9sI/DO5VASs1/P1oQB5z1Kq94M+TD1s9aLHGf
 MbHJmCdEHUf4jzYypXSGEdpl0hrKXbXLaNBw2oSzQQrfCtDWi+XoA5leemJFXkn/iuicjKz
 00qlVX4P3WB9R/NZLRQnK65PXofKJHOSk5GFWAp4QWiB9ZO2E/+ykMp5k4tQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8BFA84532E
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:48:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C225710EED8;
	Wed,  1 Apr 2026 22:59:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43AFC417AD;
	Wed,  1 Apr 2026 22:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4809DC2BCB5;
	Wed,  1 Apr 2026 22:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084368;
	bh=ARB27mkqWy48zHjSpe5c7mSg7apze9vr4gstNm/P1dA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=dSX2Jo1vUk8hHc6gSekzst2vH2DiO7wZ6u4beWxHN6DVag1hSDpfVxZig8BZqa+bD
	 wHlv9NAlTPwhU/5YXo2CA8Ei6wNqOZ8/nLpYVgOOdYcm1zfBUsWRfpaiKCY4Jps1RG
	 9i6RxukwkTR2YCbr57la6zwGNhonLkn99aq1wPZ7VT2QoMnVwAYowp/1fMO51Re26E
	 TABn3IhQMybvZV8qPytb8kneaw1xNx7b9VeBd7g0EgaLXlXLh82c3onZzwa+NlPG3W
	 hcibdBWYOWEOw90C6j681RTs8g0W7sezYjGQ9+EbN7MxFHn/Bvu+yavZFPq3imqpQK
	 KUt5j6UWP96ig==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 02/33] rust: bump Clippy's MSRV and clean
 `incompatible_msrv` allows
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-3-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-3-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434433.73816.8766024986606345244.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=403; i=tamird@kernel.org;
 h=from:subject:message-id; bh=ARB27mkqWy48zHjSpe5c7mSg7apze9vr4gstNm/P1dA=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzsxPz5uG3k8Tj7ir4KoUcXix9PWt0Ys/8uk0vf3x
 vEzkUmfOiayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEx1UTTD/1L+44y5J4+waIo3pf15Py11ZY+jryrPC2mWBK/kjy84KxgZ2qzvZ/h
 m3M2+YXO9YNu6hUv38i1xFF8vziQ+Vem3T/xmNgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: 7KOA3YXLMBGDTMUMXNAYADCWQOHOCNEI
X-Message-ID-Hash: 7KOA3YXLMBGDTMUMXNAYADCWQOHOCNEI
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7KOA3YXLMBGDTMUMXNAYADCWQOHOCNEI/>
Archived-At: 
 <https://lore.freedesktop.org/177508434433.73816.8766024986606345244.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:09 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Following the Rust compiler bump, we can now update Clippy's MSRV we
> set in the configuration, which will improve the diagnostics it generates.
> 
> Thus do so and clean a few of the `allow`s that are not needed anymore.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
