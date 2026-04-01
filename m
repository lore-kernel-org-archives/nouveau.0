Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC121112244
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 630D010EF1C;
	Wed,  1 Apr 2026 23:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mUaAEYoJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3B07745496;
	Wed,  1 Apr 2026 22:48:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083729;
 b=if3S4kF+S32/FuUa/QrhQEU14WAhOlP7Jj/ESFR1HVzvitxlkawdxVeQUKL/2qp7hHTNj
 yHc2G0NmC5S1admv8MJ1BaYgGAnTM8RFE+05NQ6FSnA57YD/3mvNA3NdzI6BNIL3tA1kluG
 zUxYj6da6TluPfUhE25kjygRwFBRknXygD3niPX8Yn8TpChbePnnK2I1iFgtxwttfQ8Gy+Y
 274M4fMs2y0i03ByxIbOv3i9S6zJ3peki9BLwnBYsNJrFYH7kA0gwFvUoiPRhjvXZFx1gZ1
 edkLf1wNwj3mDqwCoLGWGiHBhlKHpM0tKZUnMRUJId/FgxmNiw/8nXlafJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083729; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eq0P2OkG45enCRKRsBWAVNOTeEx6dl/LPFzIVblL430=;
 b=Wwr2/1bDjp+hYriwhf4XNi49bdpXaIZEOpTgup6AP6qEfX8p9gZ7vptfXeUzrFcSpR2CG
 TKQa5652nu7MSh2VvnnE57J/WdiLCVCJ9yLAXQVytOMZ3HrddDtrrqdf2+0Ibvdw8HXUL1f
 RdgutzOVNmMJ0UscsXoQJk6y5dTwH49fkZF6cEnklgbymfSsY+lXTSytRBLaZhV78n+PJI2
 iUD/OJ2uPaflblJqjKXvQ8Z+k23ozqboEuSKZC/duhBU3wPc/boR0pyufgdmslZVWHCCosg
 YDPYSj2sNYf9ZrxTMJsIw3McbbaPd32OvxrWkVS11BY0zT9MTO2P8eEze8Hg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F2B694532E
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:48:46 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 080D610EF0A;
	Wed,  1 Apr 2026 23:00:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E131A40863;
	Wed,  1 Apr 2026 23:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB953C2BC9E;
	Wed,  1 Apr 2026 23:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084409;
	bh=1iz62QypXqDZ6Uq/htYWT3N9Li/93jBUNlp6qi9VPHE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=mUaAEYoJhbmY5abcaeYHM2XYQ10K6icPKigUs5kpruvFn2YFe/BqX3zoVgPghP604
	 aDA6lhbLJgFApSmwY8IGphI59Yqe+RMslzbnd20CViMeUm8136UunKT7hCfk2onc31
	 FlScIOCI9Ly5rBYtFuSq03LYjXjorF9zcxY5quF3RxnaoQxUcFyitaMEcF1pyQxwGx
	 Cgpq4F6bmE7tEViLAimYZfcmwdYcEt5GVx8avgWKFPRBDHQDEgi2oYaVe5gBlRZdwl
	 0/Ua4kDkXIjiOHPxOfveO4BK/cEtKGWvrICHH0KWNRs1trRKCutSrrqwNiLDaaDwxd
	 3wPi2LGeECEDw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 10/33] rust: transmute: simplify code with Rust 1.80.0
 `split_at_*checked()`
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-11-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-11-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434443.73816.5437391869400189147.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=361; i=tamird@kernel.org;
 h=from:subject:message-id; bh=1iz62QypXqDZ6Uq/htYWT3N9Li/93jBUNlp6qi9VPHE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFztbJcctdE9j2rPGLCHZ08Nt1bLMixIH7jW9YPW43
 ntydv+OjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFP9I4Dhr8T9OTc3x1ZN11mnq/14z9/K+4/nRv7envO/JfZySn2o/QaGP1ynnIr
 mTyrPOvCvdEGUwIO9Zd4XNHcc/Cow/+GGbVPqchkB
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: MGWV3KF756WZIEEH7LI26ITJMSV4IFL4
X-Message-ID-Hash: MGWV3KF756WZIEEH7LI26ITJMSV4IFL4
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MGWV3KF756WZIEEH7LI26ITJMSV4IFL4/>
Archived-At: 
 <https://lore.freedesktop.org/177508434443.73816.5437391869400189147.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:17 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> `feature(split_at_checked)` [1] has been stabilized in Rust 1.80.0 [2],
> which is beyond our new minimum Rust version (Rust 1.85.0).

"beyond" is probably not the right word here?

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
