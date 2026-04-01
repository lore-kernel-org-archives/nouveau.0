Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52151112244
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 92D9B10EF6A;
	Wed,  1 Apr 2026 23:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lad2ZbTz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6A3C3454A9;
	Wed,  1 Apr 2026 22:49:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083791;
 b=BNNL74w/NprgAGVc7m/XZayXsi6AJxw2MqPmwMWFlQp8DiI1CZxDQweYjPMPz5+Y8VLou
 PUPIwekq8kOSVuD6TVeq8Onjp5+Rc/ty3y0v4dYIB3W8lX8f9u0ry3h65g2X+maJCUBzzEJ
 96rUWARQQnWx2A2One2TtYxl8snB7AoXo7qqjLAOs0C778gi/NyC1jbhmV9hh/YFA4F6byh
 LfHSZ3Yta/YsRSdz9UfEMJu3Zdwe7pp+/XG29S7s/I7ELfzPyMErvvRF2je7r5VdF2byREX
 X5IWRwP7iSAukwgxNZ9KbzEGVtbdHlGZb9IRrHSgCK8AydqkjNqsMD9/WKJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083791; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IyNaH02CnZyFNUKVFX1brra6By+KY4BKdZIZZIN9sTw=;
 b=Oj/AaQgxYL0jKVRxuh/NYJ7Buxd2OWwTFDwRxB9WewV12UzeeW1O1FXy9CbJJyDfni8by
 rIPhzn7xF5DRf8B/muG6YnGsQ9G1hiGSz7p+hXNb6BxEtmlq2ox5sF6qrtIR09cka93p23e
 lrqGtarVl74+Hf7ViCkk95y6HgNWDHjzM5mclIHlSfGz/Sb0xdCtHHP12gMlLWXFcKOb0bb
 /Nyv8ju8gTDC49ZG0ctiXlNjTTnH6uozyCPDU/luPNwjcTKQea7T/5Mpzvjvxjr8rCv7EVP
 rCIPCMPGB0yai40fHFM+e9l1Y1/qWTQw48TfhhAj64IJ7KDaUVELKQJrcBLg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 65C1B45476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:49:49 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5860710EF5D;
	Wed,  1 Apr 2026 23:01:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0B4E60120;
	Wed,  1 Apr 2026 23:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCE5C2BCB0;
	Wed,  1 Apr 2026 23:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084471;
	bh=7aVFywT+2Lk7MGqcezyZUKBY2qrMkQyNxl1L8RiG6qg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=lad2ZbTz2k+awmv51HvNm9F33ppVCdijDwDOK72BmP33a2sU2k9c2p9ikdqzeKTMf
	 WOt5XDYCZpQlIm+TEbMSrTD8IZMPHeGLi+C+CFNIX5nXLxOp4k0ZNSBtHmtWZ2G+Bf
	 BwZa4C0avT287UqzFaKmOW0lx8m1X5t+TMnRXYyO3GU6eHReK4LeeR8uy8FBVMU7td
	 vE1n1OfYYghytWvzfMDuGHMyHVmjUuvHq8WwwISMwWTEQjOrbDvMZrOcpcha7TexI0
	 RcKEKnUVJ4aCjlCVvZWbTeTakQMO0dGlBMaINHSOui2za/YHQHuGqSTkp6ftZRzVmM
	 34iMXnAEqXEtQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 22/33] docs: rust: quick-start: openSUSE provides
 `rust-src` package nowadays
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-23-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-23-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434463.73816.5322398252343055827.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=335; i=tamird@kernel.org;
 h=from:subject:message-id; bh=7aVFywT+2Lk7MGqcezyZUKBY2qrMkQyNxl1L8RiG6qg=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7t4T27++UF+3krL5Fpu+U1fRLZydWldbK7Y7X3Tm
 zmRw9eqYyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFQvnMjwV2BF2OdjYg17Tzx9Lld4dPLawPp/ur9P7OVO/HQzzXXVz5cM/yvU5gW
 8re5a3mIq12EnwKtTUu99bha3pVI488GHJ2I/sAEA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: G3FBAGRB67LZBS2NEF7DMTKTVDF7QLEY
X-Message-ID-Hash: G3FBAGRB67LZBS2NEF7DMTKTVDF7QLEY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/G3FBAGRB67LZBS2NEF7DMTKTVDF7QLEY/>
Archived-At: 
 <https://lore.freedesktop.org/177508434463.73816.5322398252343055827.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:29 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Both openSUSE Tumbleweed and Slowroll provide the `rust-src` package
> nowadays [1].
> 
> Thus remove the version-specific one from the Quick Start guide.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
