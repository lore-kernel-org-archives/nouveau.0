Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89614C5AD2B
	for <nouveau@archiver.kernel.org>; Fri, 20 Feb 2026 16:48:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEF210E819;
	Fri, 20 Feb 2026 16:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f/PdMzut";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5F65843445;
	Fri, 20 Feb 2026 16:38:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771605532;
 b=Gks7mBIlTuXikOQMEA4HqcMdhwM4+raUPAGWqYxfgvQYxNHjOwdmnfq7Kf3Rujg4fSV8E
 h07zZFUDMcEoYc7nSA8IN0NyVATsFR8fZvU6QITx38uDcwlO85NedmQVpuHIp0vXX7JHa5K
 ptkUzWg8SyQzVrxzuBZXlUm05Y1THKT7HgInTqYIUwOx+PQo5iJxUmLmNP/4GXsrvzCr5P1
 CdXsQJf+3fM/au/+HLbCIYs2yifLREHkazsmESoHdrFcOfPV8awXxcXdMPZIr0swyocMBJA
 jbNT4TUGnGxdKDhIYHDQs7CBzLgZFsce11RO5sFeOF3LdHULWdFR2dWf2M0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771605532; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+vXeohK+QXDo0ed+wtOjiTKww0It+m/EbKZccebf/cU=;
 b=P4aQxcPKw0tT9Har6bcGxH/nqOKEXVbQP+IvHEdrSdFSI0Pj7wEplEWJJKAsEoo3B2oEA
 O9Q3mfjO0iVbLfPKuCZZUP/C+CDeP9zSATkID5AknRe8HOREfHy447IR6LpYet5Hzibudw3
 sI16ozAv1hA5e8gn9bxu4wfhaKNwMpGdUzZhlYY8slHHbzIXX8ugktAh/5DTrr4mqiiP8dd
 d1D1cP5sKOtKcybwjGghvKUSSdQLXw/5hRuOtmsaVjGwZSTIxLsRopCDUTsa9619B3wLAB9
 ilfuE3NxEfv3SpUCXVwv8yuz/jlQ2TL3AZGjwkmgLyEy3oYqP+GlN1ttIWDw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F164432A3
	for <nouveau@lists.freedesktop.org>; Fri, 20 Feb 2026 16:38:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF84710E1D0;
	Fri, 20 Feb 2026 16:48:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 269016001D;
	Fri, 20 Feb 2026 16:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F51C116C6;
	Fri, 20 Feb 2026 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771606122;
	bh=+vXeohK+QXDo0ed+wtOjiTKww0It+m/EbKZccebf/cU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=f/PdMzutKk8ct2B+TiMlXuQzV4bItd1UscDXW9PaRASzQ7p2/1SeLFm8G0V4WXGfi
	 W7q7Yl1uG5ILHbgFWXRf4uAP5IrVCn0LfW8lvXJB1GjVXA1EMFQmMqGlbyW11A8NsY
	 uv0CP3iCCwzYBkzNxZPphguCc2JipSYaiNL90q9TcrrV9Z5qNx+BQ9ChAANXbMnMJU
	 BFZRWgo1GtmlEeYDM6JZ5lDr6VCzSxniOu9jF4NORg4dVYNZ1Sf03u/y9cvr+vOc3c
	 jOxxLqoAg8Ou0l9rbyvb2Uu4U3DnrfE9NBkFxgNRtf3o8xqSNgHv+8qup7lbJfZUMn
	 1TnTACBdf1BXg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 17:48:37 +0100
Message-Id: <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
In-Reply-To: <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
Message-ID-Hash: MFQ6F54UNBGC4GIHQ3WTVGLNWNKSFM2P
X-Message-ID-Hash: MFQ6F54UNBGC4GIHQ3WTVGLNWNKSFM2P
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MFQ6F54UNBGC4GIHQ3WTVGLNWNKSFM2P/>
Archived-At: 
 <https://lore.freedesktop.org/DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Feb 20, 2026 at 2:09 AM CET, Gary Guo wrote:
> On 2026-02-19 16:24, Danilo Krummrich wrote:
>> I feel like it makes a bit more sense to have an entry for the entire cl=
ass of
>> "RUST [FFI]" infrastructure.
>
> I don't think so. Most of the kernel crate is doing FFI. We have a `ffi` =
crate
> defining FFI types, we have `CStr`/`CString` which in Rust std is inside =
`std::ffi`,
> etc.

The idea is not that everything that somehow has an FFI interface falls und=
er
this category, as this would indeed be the majority.

The idea is rather everything that is specifically designed as a helper to
implement FFI interactions. (Given that maybe just "RUST [FFI HELPER]"?)

For instance, this would also apply to Opaque and ForeignOwnable. But also =
CStr
and CString, as you say.

But there's also lots of stuff that does not fall under this category, such=
 as
pin-init, alloc, syn, num, bits (genmask), fmt, slice, revocable, list, ptr=
, assert,
print, arc, etc.

There are also things that are more on the "partially" side of things, such=
 as
transmute, error or aref.

> I feel that the FFI infra is the core responsibility of the top-level Rus=
t entry,
> while specific stuff can be splitted out.

I think the core responsibilities are compiler and general design topics, s=
uch
as abstraction design, (safety) documentation, etc., as well as core langua=
ge
infrastructure, such as pin-init, syn, alloc, arc, etc.

Given the definition "helper to implement FFI interactions" I feel like we =
have
much more infrastructure that is not for this specific purpose.
