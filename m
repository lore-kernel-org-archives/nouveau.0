Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06D1EC1EB9
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 13:48:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD52E10E8BA;
	Thu,  5 Feb 2026 13:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="gEiLhMSX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CBBC841B49;
	Thu,  5 Feb 2026 13:39:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770298751;
 b=WuDcfsnJ67oii7Sd7+tXlU+haR+x8fI5KkE8/ohkf12gtbCZxmL8wCxL0mZkVaOv5xVil
 r9ZTiRlJJyISFSCZQ2T8YHRlqHNU8OoNexAvAiqmECQ9Z3fjGVubNjC63k3nZcYBZ2cQGaK
 AzNKhNgg9aVeMOJUL/WDG5uwWBmBWKoOZY0qbWtMevVT+WRNSU9dJpqHIJw9zrYIwZDLyLT
 MAi1lffIi3sR0RN1NWyd6Je+Ljl2IQOyCbiW2QHIyL8M993O5SkzlJEC8AIPq2hYKm55zAp
 1tAT+TLbRAPWYJGY8Txo3yZssT0cSjR7pxC4wfz8WkzTNgxC8BRQSQZAfhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770298751; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VABa3a2InRQyUMIOZndTLQhiPNjlqxKvfyjSp4/ZGlw=;
 b=hoBPhwgDKGsBWvhfOd6MoPSas/H1CWc59Y6ec190/UCUMfXr3B831sCKarQbw5OonOjEp
 fxP8JmYMW9X0TAW8Kpone1aWlpGKvXmk9w98T/DWuXNq4EVjL2qrndb+LVuuqanDRFk97WQ
 ukIIceUAc+E5mLGOOoDNIXybfus3NuYjLakToJy+tsjtzOj0wKmaTZDvCWe9rVUAEMDMlKC
 a/IHiAEtCRcUaSOMskvVCWs9QH/MHh2so33Zr9qutzv0l1Zu1/g8XPFUQMVU+qdyNqMnhck
 FjnCDovBpjhli6kEWPnh8NOAPrWD2O3Bc5eHOwvt4LXXv6psmbOhmmLsSqqQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=infradead.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=infradead.org; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 36D8B40F37
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 13:39:08 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DDEE210E1B9
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VABa3a2InRQyUMIOZndTLQhiPNjlqxKvfyjSp4/ZGlw=; b=gEiLhMSXMRY7nQ3vnaUSGJv4wL
	V9u4yjqEEeL2PExlWSGYF1hfMAjI0BRcFxzvEp1TJd4hz2cdLeD8WKLAn4q6QbSdhukXm+Pma1dYM
	RemIoIlFZc9hspms9lqh6Ca6tM4I2S5outJSysx8PRNF8iB5Pu0XXEPhr7mfC4lAZv81EGNNSrmAP
	uAhuBx9Ho4K1gZtwOpVTvNtm5zLj0u/Fk2mDluZPGgr1yZkuJaiDWu3JJ1eToV7GNv5LVpFNqyLX7
	qL0p92pSyrjgVfs8T2z9r7o8E0S9kw0D4xsWzSFdIxAfAIREvyJPZ8fHbnu3Mzp3NjTPxNODt5LoI
	k3tsSpkg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux))
	id 1vnziX-00000003guy-1S3U;
	Thu, 05 Feb 2026 13:48:21 +0000
Date: Thu, 5 Feb 2026 13:48:21 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] gpu: nova-core: fix aux device registration for
 multi-GPU systems
Message-ID: <aYSfpf3xZNwZhzXs@casper.infradead.org>
References: <20260205041120.127106-1-jhubbard@nvidia.com>
 <DG72N8GDQ9E0.2FUX560O3I19X@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG72N8GDQ9E0.2FUX560O3I19X@garyguo.net>
Message-ID-Hash: 4YD77QLCHRB377CA73NNY36RYQXLTZXG
X-Message-ID-Hash: 4YD77QLCHRB377CA73NNY36RYQXLTZXG
X-MailFrom: willy@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4YD77QLCHRB377CA73NNY36RYQXLTZXG/>
Archived-At: 
 <https://lore.freedesktop.org/aYSfpf3xZNwZhzXs@casper.infradead.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Feb 05, 2026 at 01:44:27PM +0000, Gary Guo wrote:
> > Fix this by using an atomic counter to generate unique IDs for each
> > GPU's aux device registration. The TODO item to eventually use XArray
> > for recycling aux device IDs is retained, but for now, this works very
> > nicely.
> >
> > This has the side effect of making debugfs[1] work on multi-GPU systems.
> 
> Hi John,
> 
> Looks like this is something that should be achieved via IDA?

Yes, if you have no need to go from ID to pointer, an IDA is better.
That said, as far as I understand what this code is doing, an atomic_t
solves the problem just fine and is cheaper.
