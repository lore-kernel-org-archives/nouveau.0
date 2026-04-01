Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B741112240
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D848210EF56;
	Wed,  1 Apr 2026 23:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VGUfyfMi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ADF72454A4;
	Wed,  1 Apr 2026 22:49:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083775;
 b=b0hu3UgmNWEei90HB9D0QNNwcVeVsiS5SgkNcuvxQ+DdMJOQaTLZCuGR9UG5vTBTX1Nzh
 mormF4Db1fCsKzXdrRooGJn/LKrMR0zTqdL0YoOhmOeGQM9UtIMI9xoat524hdkXahZS75j
 7XZcZ9kQAXzj1nEPWvkodroli+B+2JUDTe/lkR2M6DFEtBdG9JV76yT5JxtHW4LA1/lT3ya
 psYRxSeVi5fBohv+EW7vgvBeBObAgMyi75MqtSucuXEFBHfsuxj1Ruzt7UlUpDwURHdOxOK
 BwW2TAZKxZPpkN6KAqU7Q5zNcQlOFNN6qhntDiqeQ4DS/0Isc3cYh7eHxJgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083775; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=X09WtvhFSSqOeSQEuWQYN+k62tv4Q9cQ4taf1juK8yk=;
 b=qz7AiOoBw050ZIMWBhW14XbBlRb9HkiT/3oqq8ophvq5YoKgvtdu0ITkD4Q4uSJX5Poz2
 h6YMFzm2H7Ev9aX/YludcVmX0F53Ik4qpC37QGkmxV0SvLBoErxJPocoXFYdOWdwXEgOoyu
 7fIvuF8qSuJPJV6g3WY1EsT9qWOU2mKvWa2vNV05ROw2tiACz+QsAr8RNhuMivlYdS6C+gc
 hwgCyedlvX/gVrqmulmN7H2W1FBEPyrNlkQjHG54qdq/aKeloV0bAr1CQJiDFmSlP+0M79q
 AMnKzYFfp4oWhqa4sAJ1/MW0bwdMfcIoseU4O/N+dBDML7HGcCOuA0YFwCOg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0379645476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:49:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE3C10EF50;
	Wed,  1 Apr 2026 23:00:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D76CC43B01;
	Wed,  1 Apr 2026 23:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D392CC116C6;
	Wed,  1 Apr 2026 23:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084455;
	bh=GCJ+m0qU3OWvf8YGC9WUklASENVhEYDK1UFFBlA2558=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=VGUfyfMiDFro7/uFCZk7gIzpuLEFoMi414OG2wChlCCGtsxshR5yceynwR439I/vO
	 cAl7uJM6Ctf8MVwxaNpGL9jj+iwgQVBFL49YsIP/nIwL4X+3x3fJ0lXA2W8UM8AQFm
	 z9k4Ltwvlw8Osrik0sYvSd33MJoCmf+05cT6M5pG0Fw6RdgHESMnM/gk4TspBo49N0
	 PZmExtBPw6ZankuYb+RIkJv4/yr0ckhVKDxfZzQhr4KxaC73FUgIv/J26zkojU/cAj
	 rh1oIOQ0Mg3ZueCrfGcYBdWyLquc3npSfNBy+qf/cLrOMq2r2xqkgn4POnjnU7EJl0
	 CnPA7eivQYrVA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 19/33] rust: kbuild: remove "`try` keyword" workaround
 for `bindgen` < 0.59.2
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-20-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-20-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434457.73816.12576716090516353619.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=350; i=tamird@kernel.org;
 h=from:subject:message-id; bh=GCJ+m0qU3OWvf8YGC9WUklASENVhEYDK1UFFBlA2558=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7tUrk+ZNCF5VrPNBh+HGPO3C9fF8vX4Tsq3TLtdm
 Rj/2y2zYyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFTvMWZkOBj9QMm5dl7nVb7Nr2x17v/R/lv1oiHh1xmtr6/c+r49ucDI8LHy+h6
 fJo+udQoGOWb2SqWM/zfdcX3JsPPAk2yWlW8ZGAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: GIFEI47O6YGK3QJ2OHJ6EBMPTHLTWAFR
X-Message-ID-Hash: GIFEI47O6YGK3QJ2OHJ6EBMPTHLTWAFR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GIFEI47O6YGK3QJ2OHJ6EBMPTHLTWAFR/>
Archived-At: 
 <https://lore.freedesktop.org/177508434457.73816.12576716090516353619.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:26 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> There is a workaround that has not been needed, even already after commit
> 08ab786556ff ("rust: bindgen: upgrade to 0.65.1"), but it does not hurt.
> 
> Thus remove it.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
