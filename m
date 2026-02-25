Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A04FD45E5
	for <nouveau@archiver.kernel.org>; Wed, 25 Feb 2026 19:48:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E126610E887;
	Wed, 25 Feb 2026 19:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OpKsM8iT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BAD96448D2;
	Wed, 25 Feb 2026 19:38:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772048321;
 b=lUKgy3VJxBIvZdTo7YBLmRnM+h2AwODow7nA3wa7O1KluHbL+tyJrO2o7ornsuii8Po70
 Q+EFuwHJiqKaMOZQThw+khIZYKTne9A3kZEb6rivMFKXNZXL4UpuVDvXE/vALOde4fiMGE/
 GK5kjN25gFXx7e0fXChnhyNzQ8XJHTzuYwxUDmsEVQJW2FMEg9XKWZBiJg/djivG4x0DIlA
 HUYvpj1US6P2SPSBFtJeYXtRE4W5tL6mGzfibi2mqjbns0ad7ItBnLFzp9pnd+A3imFcy90
 xT2y6PYC/yr8WNnBB8yfZSmBaCJJ/Y0eNJUPm8SUQq8Nn4x00WVA6jSO1lJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772048321; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=L+Qb4s88RD0A+SlpQPzubGRvREAN4YpD2k08Q9oO3lE=;
 b=Cv+Kf4A6hfLfdxTpxKDnkiJQDr8+lpYwNm8nj8H8yL/RKy9vO3UD19dxQwf909IJNt+bS
 2lTedw5PT2q9ZbF2iSjVkHCIarP0rxAa2I8uiY7WK4Fe87vOq7xqQE7I9ZRkRTNi+ssxYaw
 WVNS5d+8ZgYYBfjk6R0gJMGQasWuqxeJMHh8b/g9x8M52Ayn8wqB+mUHRhjkHu0zKNs7QzU
 /qTR2mi+jTOgGQ5bX92/zu2S+aN1EEFpbntC3pNPBSu9z9XwiIcrWr8ZRduqUmM8hPRG6pt
 nYQP+gpIp8s85M2NVq4kwmEktdURpPTsCW+q5Vf1aT1iihdjJzubiuwY+OSg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 604FD43716
	for <nouveau@lists.freedesktop.org>; Wed, 25 Feb 2026 19:38:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4F21B10E814;
	Wed, 25 Feb 2026 19:48:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0FA043FDD;
	Wed, 25 Feb 2026 19:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16071C19421;
	Wed, 25 Feb 2026 19:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772048922;
	bh=K2Thy+cfo8IGrm9J3gFlrop/sJOrdHourjqbZe7bYVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpKsM8iTP+Ar1Wf7dzecNATnhVKbSyGteQq7w4VAJMzi/nH4aIJIWvhQ0VqhpqFem
	 ARKsahKUO3xnVzOkurrPKQV5dk3OhEscaqaWiIBfKmvjR4d1XgbsCHJrXzw4GkrEEt
	 /fmSASYSs7TOhKkH+/VuXkeMIvs+Ivw1cHd5XnjhJEdLwifv08sHfEsRekneDuLrbJ
	 sII96zHGA2jjBnXcnHSmOfIYKuDGk0Tmj/VD19ucvoLak7hgXrgPm3otJuT4MEz2cI
	 J4fSkXg1Zxb6YsmwALV0qOcntbpBq/DucFpgL5Y68sqJ67XF0AKf6bdqJyQULCF/zK
	 0y/e66pvIDX5w==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 316AAF4006B;
	Wed, 25 Feb 2026 14:48:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 25 Feb 2026 14:48:41 -0500
X-ME-Sender: <xms:GVKfaaAi8FIFLztlmdfvgB7vzzc3XD7KIg89Nj_ZMQwwrbv8Pq2MGw>
    <xme:GVKfaTy2kN_Nt-Gn6hXzIO39R4wDEKotJiizDpxyng5BwNq0x2fQFjxyU51oJ5qD-
    f2R6Vs-tvDVsnJE-UEm96Z1SnUF9UMlBrpJDHX9FIOXKk1U5cCWAA>
X-ME-Received: 
 <xmr:GVKfaQZ0BlYytldrVEl31YtcBp_qRAYo8mTUzx7hstHzBQaScQdyop8_0vRNbRbug7epLg7MpqKisi7Oq9zwb_XKzHoVp09K>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeefleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggr
    khhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnh
    gvthdprhgtphhtthhopehjohgvlhgrghhnvghlfhesnhhvihguihgrrdgtohhmpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghjohhrnhef
    pghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:GVKfaQSiVhNb9SrGJn_CTx9vf1ZU2IMu41EAY5tdXFJqPqzr4GiFuQ>
    <xmx:GVKfaTjcbhg-i6wzn70Ry3IJEhTQqIcP-VC2mjxL6xUfQpQYCEg-hQ>
    <xmx:GVKfab5isXBVPZ5SYxZcriOhneMhiwO1A1Q3SGWb4M1HXo9YqPOOJg>
    <xmx:GVKfaemleS5ZHYf_i3ltJvPXSacnPLLi87pWLpGFVQjTUzb89WBN1A>
    <xmx:GVKfaUPkGWkeMqgMLmVjjh6cRjeOMSqWN-aLXyqxuz75riSutrAvH9Yq>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Feb 2026 14:48:40 -0500 (EST)
Date: Wed, 25 Feb 2026 11:48:39 -0800
From: Boqun Feng <boqun@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
Message-ID: <aZ9SF5ql6OCdaFi8@tardis.local>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
 <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org>
Message-ID-Hash: GAQMC7WN32F3ADZY44WZN5CPKFF6WVXQ
X-Message-ID-Hash: GAQMC7WN32F3ADZY44WZN5CPKFF6WVXQ
X-MailFrom: boqun@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GAQMC7WN32F3ADZY44WZN5CPKFF6WVXQ/>
Archived-At: <https://lore.freedesktop.org/aZ9SF5ql6OCdaFi8@tardis.local/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Feb 20, 2026 at 05:48:37PM +0100, Danilo Krummrich wrote:
> On Fri Feb 20, 2026 at 2:09 AM CET, Gary Guo wrote:
> > On 2026-02-19 16:24, Danilo Krummrich wrote:
> >> I feel like it makes a bit more sense to have an entry for the entire class of
> >> "RUST [FFI]" infrastructure.
> >
> > I don't think so. Most of the kernel crate is doing FFI. We have a `ffi` crate
> > defining FFI types, we have `CStr`/`CString` which in Rust std is inside `std::ffi`,
> > etc.
> 
> The idea is not that everything that somehow has an FFI interface falls under
> this category, as this would indeed be the majority.
> 
> The idea is rather everything that is specifically designed as a helper to
> implement FFI interactions. (Given that maybe just "RUST [FFI HELPER]"?)
> 

I feel like you may want to call it "interop" then, because it's "Rust
doing something with interoperation on C data structure". If I
understand you correctly, the category you referred here is the area
that we could not simply call an FFI function to get the functionality
from C side, but rather we need to make sure that we are interpret C
data structure correctly to work with C side.

Regards,
Boqun

> For instance, this would also apply to Opaque and ForeignOwnable. But also CStr
> and CString, as you say.
> 
> But there's also lots of stuff that does not fall under this category, such as
> pin-init, alloc, syn, num, bits (genmask), fmt, slice, revocable, list, ptr, assert,
> print, arc, etc.
> 
> There are also things that are more on the "partially" side of things, such as
> transmute, error or aref.
> 
> > I feel that the FFI infra is the core responsibility of the top-level Rust entry,
> > while specific stuff can be splitted out.
> 
> I think the core responsibilities are compiler and general design topics, such
> as abstraction design, (safety) documentation, etc., as well as core language
> infrastructure, such as pin-init, syn, alloc, arc, etc.
> 
> Given the definition "helper to implement FFI interactions" I feel like we have
> much more infrastructure that is not for this specific purpose.
