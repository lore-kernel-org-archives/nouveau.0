Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248B7C5CFEB
	for <nouveau@archiver.kernel.org>; Fri, 20 Feb 2026 23:43:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E37F610E857;
	Fri, 20 Feb 2026 23:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="akoM+guz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 80E5443446;
	Fri, 20 Feb 2026 23:33:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771630421;
 b=AopjJWCW4tXX0lihhWUV7luJaWZRZMHYFoV+YKUrYAVL+0oLXhhNPFE4xvgog9+3yHUOY
 yniTJ7U1Ad2dcpJiiePj0eLGY5cxfl59jhRdJ2x+P3h4eOu3KVT8cRG3J21356L6CrskpQr
 JdRwxeRqp39SQ5vyBuFwypuD1BJIsOfo8CwS0O9w7Mlhm6rYHtUrK6MUSmLTNcLzubSrgY9
 TcpzQgXd+famlCF5GYNT1Xw6oRjXw93DgTNZQIU9hc64/0DGNbVrbPHkA732i8HvER4iBhM
 DWNIrltxSAaMAjWNrKqwNY/AG35kIJAvSALCdQBvl6D9Hgn/3NMwP3LTCpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771630421; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9z15D+iUVyNLlZu+5JV6B5n/tJIkZiHt7FLKdFAZ3t8=;
 b=R2KPE31PKPVsxZDNHsefrtssUGFXi1Ex62Cxrt/x9THR0XfOJ79CGo/wopzxNxHl5a07u
 BDaSAQWYfLFxwit6/npHj1nVrD5sDmREyWNYyFEvgLMTBjJACI0EEaSJEaSuWvy9sqad3EV
 6f2MvcDFOyBhY6hY/yCW0MZxW+JJxB3ERo2PV3HQGBvkh+/uywQFQLUoWAsdYXRd/se/inO
 HSYWjqUZHkYARwEHfdwLqY6NxWdM4Krr2ICpWw8SgR+kMu4da6Hh1n4TnnU7hxA+wJjjLt9
 mij+uDG0dI6rphL3H/umPmKyA46RQFzcOuMPPtmV5HVLOkH358aVnK2YzdCw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B62EF432A3
	for <nouveau@lists.freedesktop.org>; Fri, 20 Feb 2026 23:33:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CE7F210E852;
	Fri, 20 Feb 2026 23:43:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFF0A60123;
	Fri, 20 Feb 2026 23:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1CFC116C6;
	Fri, 20 Feb 2026 23:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771631011;
	bh=AYjchzzoyLOBMqiFo72PIrY6DUb60UnluRtgVjVXLLk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=akoM+guzkSTD0GY5Z6qkvYPbymswvNkiW9PlLdzyAKaTZ/Y8DloAvXb2sb+PFxdAw
	 /Wh4f51MB6r7/zJtTlVEYZIvGubkPVWJOa8GrSAhG8fynC7ZcyhYRuWL3arrhumFqs
	 uSO9JifNmrt48lWDZ0rNKj4cY49PrxH33sIwP4cDTdbMQgnvhoT9LnUQlU00VwjoOI
	 dOPfLDC/UNRDWSYwAGXJqMu0QhCnXynq5eFcsx0RGiVgrXmfQbO69/nKtR8gXb0zYk
	 BatyUUs5cD9jlHjJC8l3HL3ClcdRd+dAcodT51lJMuj2Leu7amW15xphrTM5APbntk
	 YQVqn/dCrhWsw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 00:43:26 +0100
Message-Id: <DGK6S0K1FRBA.DAR9BQ6Z18LF@kernel.org>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGJN74VW6HS2.29CXZ59K9M220@nvidia.com>
 <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>
 <DGJWS7GBIQ2H.3VSOWO6T8Y482@kernel.org>
 <f5627be1-0598-4ee0-9146-7ab9d1bdd0a0@nvidia.com>
In-Reply-To: <f5627be1-0598-4ee0-9146-7ab9d1bdd0a0@nvidia.com>
Message-ID-Hash: RVTVJGZ7REAT53KT5RBKE2SFSVQAF3I7
X-Message-ID-Hash: RVTVJGZ7REAT53KT5RBKE2SFSVQAF3I7
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RVTVJGZ7REAT53KT5RBKE2SFSVQAF3I7/>
Archived-At: 
 <https://lore.freedesktop.org/DGK6S0K1FRBA.DAR9BQ6Z18LF@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Feb 20, 2026 at 10:20 PM CET, Joel Fernandes wrote:
>
>
> On 2/20/2026 10:53 AM, Danilo Krummrich wrote:
>> On Fri Feb 20, 2026 at 3:54 PM CET, Joel Fernandes wrote:
>>>
>>>
>>> On 2/20/2026 3:22 AM, Eliot Courtney wrote:
>>>> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>>>>> +__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy =
*mm,
>>>>> +						   struct gpu_buddy_block *block)
>>>>> +{
>>>>> +	return gpu_buddy_block_size(mm, block);
>>>>> +}
>>>>> +
>>>>
>>>> Will `rust_helper_gpu_buddy_block_size` be used in the future? It
>>>> doesn't appear to be used in buddy.rs.
>>>
>>> I think it is worth keeping because it is a pretty basic API the underl=
ying
>>> infrastructure. Finding the size of a block can be important in the fut=
ure
>>> IMO. It is only few lines, no?
>>=20
>> The helper should be added with the code using it.
>
> I will add this as a test case to exercise it and include it in that patc=
h.

A test case for a helper? Or do you mean you will add the actual abstractio=
n?
