Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F120AEE6B64
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 21:30:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5D43F10E943;
	Fri,  6 Feb 2026 21:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="PgOuGqgD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4FC1641B4D;
	Fri,  6 Feb 2026 21:21:16 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770412876;
 b=zE0muVyX4jRcl7iQdQbRHySgISSutmJfNFyfRajEt1d++fojAs06hcjiI6WZPv8fwFGMT
 sWoW3oorvOXjXECfJnIrjanMWWGLR1fQLfPst7X+/6vPo5J3Pw3KSHOXD4TQp5BR/IKslwv
 xn2S7tzVtKkA5qaZqoThUOTiJ7mpdJrLZ+SpV5JaLkxlZq1tM4Rg/vrjwjYPjTwb7AZH1XX
 ysO20ElOan6kvFQm9u7SMIdBJgDjg0CVm7GMC3OuxsQrCHDAWs22/WPa3i6wTFFN1qDgGJY
 t4H88rLpiwDBVl1EHfO+3qcOLyR2/pnwYXc2dF6t3vuPDLYN/iW/IRFV9Qvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770412876; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dHk/uf5/R0o1Pb5W9VHPvuhr+RUwzmWTYbA59LNhJ9M=;
 b=YBpg1oizJKJ3BFB5rU8iFGvUyalPBQVzqWtrDRnVYiLSqj9ng/z7JQGak+rW9EtHE+ne6
 fL5imguTL0SuI20eMHFWuri60JTIoljqHss8fdRV21VHQEbCcz5TseFDaYVtrksX1MCBN38
 x6VHiU38cmWnDuhsIXE0xBxH0jv1dGGQDpkJpd5grioiRvPBZle366oFC/XMOahJtsK8ZbW
 h2qSbhF8BcLpIo3/tcaePbP91UEohE2z1yEcOK7gEI2cRkcJe0TPGKWBHq8UBM/I7x+azHD
 dISm6RUf8BmqC2xz9iTSpPjzBYtonpoLCI3Rf4bQG5CknnSvxZH8dpcAY4vg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=collabora.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 57521402CB
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 21:21:13 +0000 (UTC)
X-Greylist: delayed 491 seconds by postgrey-1.36 at gabe;
 Fri, 06 Feb 2026 21:30:35 UTC
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F04E810E13A;
	Fri,  6 Feb 2026 21:30:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770413432; cv=none;
	d=zohomail.com; s=zohoarc;
	b=TkGT/rcpJE5Vm/RPC/OLo0/DqSafIQP4dRJ9DS5V9ztK6Ke3kRltQ9h4WbEj57/jfaJLtvCMwnIh6yWLQnTLqDq48jerNv6XpjWF8X5j97XVpzK18xlVRoDnSTTu4fuy2JeuB3KoZ9Jr22UoO/dl//sTGhvEt0MSiVFamYw0wkY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1770413432;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=dHk/uf5/R0o1Pb5W9VHPvuhr+RUwzmWTYbA59LNhJ9M=;
	b=L6YzZ4DJDJPYpSP3wIFwYXu65xdUaNah/57hxFQLAxsKteOXGvzUi2ZgeyUSNPkqsRX5PCNEeD0pA1KNmjXk/uIjTznAWfAcsE6x4AC4GK7YyMpd37JDrNLheEQ9Kb5ODTN63I2H+AkFaDlr/VMeIiBVHKX+ERmLTM+fLtJjDA8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770413432;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=dHk/uf5/R0o1Pb5W9VHPvuhr+RUwzmWTYbA59LNhJ9M=;
	b=PgOuGqgDm2r+bre0v+IcQ1LH7g7YFthyDqz3hqjJrYgXp9ck0UIVNlgNR+4ogr8B
	zu3HbqxQq8nl4tD3M6w2uHxQnQ/DbcuSufmz8XsD8pxovUabdXl98yfhOsYX48rwuYk
	LwfLOpDCV3saDkZIIa+RtC+Uut/J+35pmJ8yGMJg=
Received: by mx.zohomail.com with SMTPS id 1770413430954879.3535008602513;
	Fri, 6 Feb 2026 13:30:30 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DG820GM5YHJS.11E92OR824CWM@kernel.org>
Date: Fri, 6 Feb 2026 18:30:07 -0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <31AAAF36-093A-46CF-AEEA-709CB1DE1E81@collabora.com>
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
 <DG800TDA6OXQ.275PMMS19F1EX@kernel.org>
 <77ac3274-a962-469d-a2f6-6ccc0670988a@nvidia.com>
 <DG80FV3VTT6P.2ZP18EM8605GT@garyguo.net>
 <DG81PJ9QD8FC.2NF6VEKDD3F2Q@kernel.org>
 <DG81V8NG5RC7.38EYLHQZXKTTO@garyguo.net>
 <DG820GM5YHJS.11E92OR824CWM@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
Message-ID-Hash: BELJAYIWIZOYPIZSLAWDYFXYKS7Y54NF
X-Message-ID-Hash: BELJAYIWIZOYPIZSLAWDYFXYKS7Y54NF
X-MailFrom: daniel.almeida@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BELJAYIWIZOYPIZSLAWDYFXYKS7Y54NF/>
Archived-At: 
 <https://lore.freedesktop.org/31AAAF36-093A-46CF-AEEA-709CB1DE1E81@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



> On 6 Feb 2026, at 14:27, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Fri Feb 6, 2026 at 6:20 PM CET, Gary Guo wrote:
>> I asked for this to be changed to `pub(crate)` because I think this =
isn't
>> something that should be used by drivers.
>>=20
>> As you said, tt might be tricky to enforce that with new build system =
when
>> subsystems are inside different crates. But until then I think it's =
better to
>> limit visibility.
>=20
> It should *usually* not be used by drivers, but there are exceptions. =
For
> instance, it is perfectly valid to be used by Rust drivers that =
interact with C
> drivers.

I agree with what Danilo said here.

I don=E2=80=99t see a reason to forbid drivers from using this. If the =
reason is
the unsafe bits, then isn=E2=80=99t it the same pattern used by =
impl_has_work!()
anyways? i.e.: a macro that implements an unsafe trait so long as the =
driver
gives it the right Work field. Seems equivalent in spirit to the =
clist_create macro
introduced by this patch.

=E2=80=94 Daniel

