Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD42FC5AC80
	for <nouveau@archiver.kernel.org>; Fri, 20 Feb 2026 15:53:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 362EE10E824;
	Fri, 20 Feb 2026 15:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z5V9Z3ma";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7FDCE43441;
	Fri, 20 Feb 2026 15:43:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771602226;
 b=jhvb26o8Tn8AHEiMhCQS1F0vJ1vEAlALV4q8A75XUeTsMAmSWyamEbloEQJ1xSJaYaqe/
 QMy+pctlWfbhX3+sQzmh/7BduACs/QXkG3W0yuwiBh+QqMxCBp9rN67fSXI1T+UbuCDWPPV
 84cvjvVj+jnv4dgmPfb4SQeQvnIM5KF3L3uY/HgwxRrkuXFw3k09ij37MFmN3E1qbxQtFj+
 qI7rC3lYfND6BjtYW+PxcIIeoQfgAhcKaP7hoF4B+CxQ8KvLyrUHTkq27lDPheD9m6NbfdG
 P+TmsggCBX6YKWvpK7dHOIzDsr4OkDGJprrWeVh2aoXAQ0dwvGysfgcJQHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771602226; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2B52ihf3JIgXt95TgacS7kXVCqPhqUxNtSRV4m6eBQY=;
 b=JAN2xnjL/UZcCexz52uhkjGahWK47W1se4TIb+zI+fnf790zsPzFmch+YebtL6Bh+ZKPT
 TGRnIhf0GvofW/Bz3ofl+WIqWJhGcmrtA6g+EQIaBvOLaZh2OK90L6B9ABljf5/66uO3UxF
 EYmy7CwJUDUgVL8XYF+l4RdKfbTeSXhdyYW5AS1NKT1F1P955+eArE9H0Dcvd5/6hET4nBR
 q4wqX6941vWYczJozfb0ahfOxNkwJ1CdtUWRHIusYvu2epSSasiEE4v+tC0XN1p6I5wbmuR
 PvJwQW4K2TkrPq7TsXFIL8YVUc69h3b+a8O9nRS5GTu/kVnXEIHAluusVXjw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 62D7A432A3
	for <nouveau@lists.freedesktop.org>; Fri, 20 Feb 2026 15:43:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C3A5810E80D;
	Fri, 20 Feb 2026 15:53:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBAB96001D;
	Fri, 20 Feb 2026 15:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6ACFC116C6;
	Fri, 20 Feb 2026 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771602815;
	bh=BRSZoWiOrrbUjMNKZzInHFPXJxAj9NQkpI+8zNvNgzo=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Z5V9Z3maLOYLu+osNnMhsHhEkfCfGptIAu6jzHiuxf4tjkcppBE7O2tBsjdPZspfH
	 CMj+ycuyoRS/eI0yXv6Xx+qrsVTv001W1qojKUR+HK/zgJatY9foNUQx5BRE9Tr04p
	 1VXEgBNe4c3P9md8C/vcPNPkUEvuVtzfTUTHty7YHCMM+8AbM5NdaK8XPzY3u4RkRY
	 VFye9bORMTO92a/n/WSXNycv4gd0OHsk79ZBaakNkmjD7D12kC65SCL3XH44b2kfkV
	 QJKB6irhnFdx05wdbi/nlCaGrWUnSRRg86t5As8cfDTHXOngahqm64PdvSGuVsmsRm
	 hfPDfxM6HZCmg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 16:53:30 +0100
Message-Id: <DGJWS7GBIQ2H.3VSOWO6T8Y482@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGJN74VW6HS2.29CXZ59K9M220@nvidia.com>
 <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>
In-Reply-To: <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>
Message-ID-Hash: ZCPZHFWLXNPTPDJ42PO6DHENL6F5WJS6
X-Message-ID-Hash: ZCPZHFWLXNPTPDJ42PO6DHENL6F5WJS6
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZCPZHFWLXNPTPDJ42PO6DHENL6F5WJS6/>
Archived-At: 
 <https://lore.freedesktop.org/DGJWS7GBIQ2H.3VSOWO6T8Y482@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Feb 20, 2026 at 3:54 PM CET, Joel Fernandes wrote:
>
>
> On 2/20/2026 3:22 AM, Eliot Courtney wrote:
>> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>>> +__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy *m=
m,
>>> +						   struct gpu_buddy_block *block)
>>> +{
>>> +	return gpu_buddy_block_size(mm, block);
>>> +}
>>> +
>>=20
>> Will `rust_helper_gpu_buddy_block_size` be used in the future? It
>> doesn't appear to be used in buddy.rs.
>
> I think it is worth keeping because it is a pretty basic API the underlyi=
ng
> infrastructure. Finding the size of a block can be important in the futur=
e
> IMO. It is only few lines, no?

The helper should be added with the code using it.
