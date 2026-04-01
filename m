Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB59C1112243
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B920810ED72;
	Wed,  1 Apr 2026 23:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AiWfjHCn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 90CBA4549B;
	Wed,  1 Apr 2026 22:49:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083754;
 b=a/oNw8YvkEy4X0tXF49WlTt28Ma8+MF2QG1dTSM+5s5aQLArqxvCVXFxHJRXd3fgdJWck
 msnzJqXflN4+oHCVS1f8omt1szhOY5o686c9vokeLPjRwgITtlTmokFJlRuezXWY0OECmCW
 tM1dmqIEnxucCjWZ/pU5pVT0a3HoiZgOMqz7WI3NW296XGTHhCYjxdVTDcDjdpKlD+o0VqP
 ertiWG9apZ/Ku6w9On2FRhqU+V3J/ed7MY9P/6eUZfPJXqG4oj6F2ZvdaVq9/RWu+c3x/Ad
 sTMuEj5878yMTRg704fwIjrJBWFi4YPZtOxZtyWir0Qvu8XUz9Vh+dhar8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083754; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6NAiRpm3Uus8VwVqtxB2fLP5in2YwnTjFnM0wI4z+DI=;
 b=0lElbIvtdb4j21ruYZjsllIl5PfxiiBkifb5W+U53728Gnn54xnVkCW3WibV7cUHiNUv7
 USIFLIxSni4DEOCqc3nmuCoVHF9FsU5wfPudejMJr6khZ0V2+60TjLE8mCRQrfDzsk8fp5b
 9k5BRUt6umPoQC9BN1j2982pJNGcVmhKxwB4SP4doKRHNvINEEOrIEY0wlFp9Iugxujnris
 ZK9HnN+Aqm2UciG0QH1Dc7lFtJP0eUABYzqh1yToomOfxyfUdzOLdwd+zRvXWm+t8KRboD/
 Tpi7oPXkyJEYck5kT0Oj7af8DeY9lkm9wvJJVIQ5xAhMKjKjFygsuP0qhFpQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7FA8945495
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:49:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 88CA210EF2E;
	Wed,  1 Apr 2026 23:00:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CDD744310;
	Wed,  1 Apr 2026 23:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76429C4CEF7;
	Wed,  1 Apr 2026 23:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084435;
	bh=5jL6Cgr9B/cQDMKe8W8Oi3jZLGmF290jWZfZNh8UAco=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=AiWfjHCn0LbePkx8weJeF9kybFxpL7pbvGk7oPwZXpKGkPrQ4kVSeWNHWcI0JO0jP
	 VkEUq4sqCcJ68V1LuUiXPlb60tp2YQquyYgRRygRNazcZTvr0E7d/IjjbsvS/R3nwh
	 lZpFhTh5oC/RhsggJmruJU8Cs+RtdKfproaVRGYUVaAhjli8JhnK3sSTfGJ/4ACjL9
	 U3co6kXCh8yCE9mZvmUiNxiHmps35D2g7Q8vHjGHumvlKSHcjbux0H0SaiByW83HPp
	 rxn+rMtn2ep3UDCC6ksCw0QOFXajSQOW4O/E06nlj3BOVRh5RWHRFQgMsOKIP9PReZ
	 HYTSK6V2Nmx2w==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 15/33] rust: rust_is_available: remove warning for
 0.66.[01] buggy versions
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-16-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-16-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434452.73816.14314388454595627623.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=376; i=tamird@kernel.org;
 h=from:subject:message-id; bh=5jL6Cgr9B/cQDMKe8W8Oi3jZLGmF290jWZfZNh8UAco=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzv/lShpUW158d9cz9w6+6hZQugUYTWHw7lRvP2Vz
 /81PVPomMjCIMbFYCmmyJIoemhveurtPbKZ747DzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNWvdzD84Vzx+Of69/ESu2PD3Dpf9B++ujJ5e3q1gVVUX00TQ1WHBiPDRvFJCTr
 C5U9cxIJnu7z80Og5c7pg5fk+ll+yD7+c6nvDCgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: GVRYBE26HOX4JWRGAF3LMRUUXKCHISRW
X-Message-ID-Hash: GVRYBE26HOX4JWRGAF3LMRUUXKCHISRW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GVRYBE26HOX4JWRGAF3LMRUUXKCHISRW/>
Archived-At: 
 <https://lore.freedesktop.org/177508434452.73816.14314388454595627623.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:22 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> It is not possible anymore to fall into the issue that this warning was
> alerting about given the `bindgen` version bump.
> 
> Thus simplify by removing the machinery behind it, including tests.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
