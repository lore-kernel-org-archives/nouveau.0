Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FCC1112244
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 804E910EF26;
	Wed,  1 Apr 2026 23:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oQYA3r0d";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5723F4549A;
	Wed,  1 Apr 2026 22:49:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083751;
 b=CQzxzS8M1HEf7aUZYjsGXJB1YB0UesRlctW5aei7DcB48qypJxd697uuVIgl4QifAun9t
 T9nJMr86RVzxW9bcwV9kg5WdVsmBPv3Jlsv9EFqeu7iIx3NxlBxXjpb1QH9+E0rIN8D3IWM
 TxyJhG5onnOWy02jQPhPm8LiSy1bvJbHlCjX2FEOlqYlV5HvTs4Lad4rsxHV1yUDqf1fE+p
 gVX0CptCPFKZy1E8UG3GKyXHaOydf/zeNeGiXvOb7MjtNGwxLsAgOEP6Qzuild+DG01ao9K
 MiNXYH4tnCv6jYU72/UFpg5qdK7Wrc11nKlY9lHQEw8SMK/T8NJzTGpDmj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083751; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GqQcTvNUQ2AKRTjj6isrBxzdmhfADGZQTOmZJu03FBc=;
 b=uvMNocW6p8F8me470mRJSsdruAvHU2oST9S7PjzbsJce4wPCSZ41xvoZMrII4xSoShOBy
 5Jkow4NGbZri2gcjvcPpfw3Y9nZ9CmE3Tl99WlDXnPO2frpI16tfebr3uZA69BDOU74tXfb
 +8VLgZJYdRjWFTIGhD01ZKQw+BiS9abjfX1AokfLy0YorjKkQoZHXz2mKSXNkkpVGpwiF/n
 8wUA4+Py+2YFhZD8oIvWRfqovx4xdpNxY1MXZljes0oOG8QeTr8qHCj1q6I2efXZI4ifubh
 ew2rPNU8TqisTW+mLrhmnrpvrmGduSVDiAsFaJz2ETd7jb4Tig9lREpDX/qQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 30D3345476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:49:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1D04A10EF09;
	Wed,  1 Apr 2026 23:00:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C78161344;
	Wed,  1 Apr 2026 23:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AE7C116C6;
	Wed,  1 Apr 2026 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084430;
	bh=07RYmc68kwWSWXlQHk2byVEKgYJe5lGIx1f5DfAeNR8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=oQYA3r0dixjm9P3ZtxnbQd5Qm7hyROO+WINura1cRHdUPhRA7R3yadcP3RfFPj8/C
	 VxdVfpNuao1M98yeOweVob0wX7hSjpdZnAkdUUSMxxZHq7/Ho4aEEbvHXx2NzbMw+r
	 ngeKEPtWKPoglM5x3QXxyZd2FilyiQMxvUqGET4JqdEgDwemFUKon6+OPpCVN3k1st
	 YYX9c0Fz4JJUjLgctF+IxiuBaFUIVSWCpmCHfBib/EzS1ySslb1waFcGTPEvkZu72B
	 Sc69/XHEhnunRgcEBsXdBvhB/7Bfax8vnWVBXIMvKmUoDyhqrFUDNM1BZwqGd5tGym
	 78v5bJAkafldQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 14/33] rust: bump `bindgen` minimum supported version
 to 0.71.1 (Debian Trixie)
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-15-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-15-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434452.73816.1986421844891352038.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=455; i=tamird@kernel.org;
 h=from:subject:message-id; bh=07RYmc68kwWSWXlQHk2byVEKgYJe5lGIx1f5DfAeNR8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzuHGq5eNNeDNfy/YX5tXUT8+rxFB1c9WKVtk9V+6
 59d8PcNHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKZa8zDDP/WDMQ2dy+9seaB/Ozs88+d6jkCrt8I5tjybTXZznZ2vacHw38l5SlM
 qh5u4yn6brzm9hmd1kk5d3H3k2ad/9kWHPKKX8gMA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: SYGAD4H6KLNJA6M3AZL2JY7HL2RPATYO
X-Message-ID-Hash: SYGAD4H6KLNJA6M3AZL2JY7HL2RPATYO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SYGAD4H6KLNJA6M3AZL2JY7HL2RPATYO/>
Archived-At: 
 <https://lore.freedesktop.org/177508434452.73816.1986421844891352038.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:21 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's `bindgen` versions as our minimum
> supported version.
> 
> Debian Trixie was released with `bindgen` 0.71.1, which it still uses
> to this day [2].
> 
> [...]

Acked-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
