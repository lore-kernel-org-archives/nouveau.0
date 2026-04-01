Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104151112242
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E105A10EEFC;
	Wed,  1 Apr 2026 23:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b+P4xKOI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BA13F454A9;
	Wed,  1 Apr 2026 22:50:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083817;
 b=kUOyjZX1rPVhg2vCWEWc33WdToq87BD8+Z/I1IRjDAv1rFku5BrsopyFNLrBgNFaWTJqt
 lzVyNo+4M6b60A2DpIM3CIqfAlvwl53I8Je3pNIwpQXhje7jpdzvzhFgtqkwgOe9E0jF4JC
 4xYt/4Wuj0GKNtaTQyzssBkRIpyM657cJOuE9Ev4btu1zOCm4zN/VMR4HnfpkVMtHmc/sRp
 E+4fetwMQO8QK+J/TfbN+PgZL/2lioGivdVIE8Vx1SEqcVpHb/Lsp0AmXmG0Y58OoCatXjy
 45k9MyLfNJdN8kh3r3V6e/7k0mOKBvyemwaD+Q+3R2Zb+QnkM9HnM4Orj6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083817; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yiGMEOE10qQ9vknsbOwQy03tUHPZwbwAyZUE+fcYgvM=;
 b=iEPg7jUiiT4lPP4jytfSBOzMMhkktiWko7nR9+4zlYd9Af4aBrk6A1xWIUJAHwGMZMbEI
 CkN/W6oNsvmFsuSI4W1rlNJck6xCKcPnHwKMA+DIeWwCYBe8Ck9OxZcnDUYNRdFr/Hsvz2W
 3tIwKey9/6qb337PYot3kND5Kpf6h9ZJwJqZIDbhSiVuYu1rARr8cfTtaxAhSIt+GaWABWP
 Gy7BdHvU6zzexOVSwKavrHJwAVvgAh/qeByRhFGd5FiCTm5RGSur9V55q/ZpGHqDkYIVC3M
 1RjRiZi01iaecRwuthGtNPheVkngkGL0NeLqtGBYZomJH+JeTe1OnnhZLbZw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1702045476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:50:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F2F7910EFB2;
	Wed,  1 Apr 2026 23:01:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 764D26013C;
	Wed,  1 Apr 2026 23:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F05C4CEF7;
	Wed,  1 Apr 2026 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084497;
	bh=RA9AY2T7mVYiT1QmYiaR63Kmx/C/myQ45rJJ7MBbsDY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=b+P4xKOIyko3WWJnIYJ8bI4W3dAIUeSADYc1CtoxAYohAjbtUpCM+F8kOdFfxZKKO
	 sKtCiL0N0/I/hhMG9tSPK8eLcdclKVmFAmqphjjRs64lczzUsYFXLSrVx0o1ANBjbA
	 PbMgmXdW64lIPpiSS5apdOGrwLFbf/sdj3jK8v79AsQQCqhZ2+UDs0xMKHbB0T+jVZ
	 pLDv1Ey/utUtJq7DWrEa9I+r+fSckCS2v9ym/rg/yPSw1uFXr+JGyOalgAFUoFqwVa
	 S22IWI21qZsPP3SimeuLhGqA1ycVVG1dgW1QmvLjJyIAme4x0KlKjOt7MTnABWpVyd
	 ShLMS1qUDPGYA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 27/33] docs: rust: quick-start: remove Nix "unstable
 channel" note
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-28-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-28-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434469.73816.1901858850945168226.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=352; i=tamird@kernel.org;
 h=from:subject:message-id; bh=RA9AY2T7mVYiT1QmYiaR63Kmx/C/myQ45rJJ7MBbsDY=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7vyr5hm9V0/abVJ2uNHjxWjGhKvpydNmi2seGWam
 OiVJj31joksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFMdHsXwP2Dt4lu9uvlf/ENv7+GrKJzyWPj4JL1Td13lw681ME/a6svIMGHtDbW
 Hc6vi0/gEvt/n71IVU5sz7WhmpbvD//JX+9XesAIA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: GQZHBR3N72XK4OKQKIGOVB32P25FUW4F
X-Message-ID-Hash: GQZHBR3N72XK4OKQKIGOVB32P25FUW4F
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GQZHBR3N72XK4OKQKIGOVB32P25FUW4F/>
Archived-At: 
 <https://lore.freedesktop.org/177508434469.73816.1901858850945168226.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:34 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Nix does not need the "unstable channel" note, since its packages are
> recent enough even in the stable channel [1][2].
> 
> Thus remove it to simplify the documentation.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
