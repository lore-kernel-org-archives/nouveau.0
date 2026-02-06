Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547A5EE2089
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 10:47:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D273E10E708;
	Fri,  6 Feb 2026 10:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k+AaQumU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CE41141B4C;
	Fri,  6 Feb 2026 10:37:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770374276;
 b=g42e4UPM33vMECjt0h/EqrspAD6S7tKaWeAupqj7NIi7ormukGD5rMC7/5VKIdqZ7WyAV
 KcQPWlShV6SOobPz17S9cFStMchsVJuOsH67gs3cjN29dwFtsjo/0xWxc+3eLEMs7rWk60m
 K2MU/PesxLsJeOZndTdr/34C+kLce9hpZnNAiOWlLD+IsCLkaXkVC4DHZ6nFe59AYiJLVMq
 CNlZAzHydl5sEnmHwnmJYsBWDSXsojcWql1cy4Qqig2+3pVNGGKbW/B0TRGljBt7161sw/J
 Wzpg+9hJ6psivj231vk0qbMLsJa2N5GC8sK5AuD4ERLLEP65KTNEsbC0rSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770374276; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hHVMdwW+wwkpn3m9YeQ+L1EfN1f7eOWIlEoTCcgPMEY=;
 b=lJf0smQOTuqL+aTnTHX8UYMoGOQd1pYC0qaUDuYe4tkpW/MUdbltU8P8za3dcll1KD8LE
 oQUNNTX9vcO6VarSIqEgJ0elYmqc3ZsyupCv8yfcXHYFUYIyorAnjuXJQHmKJT3PD8RQ+wW
 W9G19OpsbBlPKtpgIh3eEr7zwe8IP1t1Bj71HKuKphFll7RMCleUhWlVPKeWOMrrJK5AEFf
 FbFuUkQxE1dFrfDtGZXw/D2UfwGs+LPaLfKn9niFEmejnGHNHym7FxyF+eJ//xmCBIg3qTU
 IYtBORB1sd2xqBNxRSti6PvNkbOFpXoe8fJjaMEn55t4oYl/4qCqI3TtvUsQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9661940492
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 10:37:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C39F10E027;
	Fri,  6 Feb 2026 10:47:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51BF760051;
	Fri,  6 Feb 2026 10:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAB7C116C6;
	Fri,  6 Feb 2026 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770374834;
	bh=hHVMdwW+wwkpn3m9YeQ+L1EfN1f7eOWIlEoTCcgPMEY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=k+AaQumUDRdLTa6+HJXM/M/ZH64/GRbY5Sqv5y58SCHivX8wv4BRcGRaowVuvFyi1
	 l28Re4f2IqBLyHlpTy4dN8W1IWVNDg2bE7GW8+GH9xWUgyaGCXCZo3dYHKB57jLjqf
	 zmXyX1z4VuYT388ufz63Rken35Iy8ckMJra7lWxw2g4eFKR+PB8yHBygXf8JlA5L0h
	 bI6q3oksHykbX/gZNI19GBo75SZjmanw9ZQ/Pg2qjHKSSzClGSADG1dTTbwx0h1pa4
	 gIf5BfRIxEW7v+EK+edD4iljRFXiQ1khCj5p93BXhkBGCwA0hjCaHCdU/P8Dt++g08
	 Vp6+VlLtcltpQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 11:47:05 +0100
Message-Id: <DG7THZ3CYQYJ.LM9KKSFC48HI@kernel.org>
Subject: Re: [PATCH v2 00/10] rust: pci: add abstractions for SR-IOV
 capability
To: "Dirk Behme" <dirk.behme@de.bosch.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
 <4669209d-c53b-4cc5-ab2f-0f09aa5dfc50@de.bosch.com>
In-Reply-To: <4669209d-c53b-4cc5-ab2f-0f09aa5dfc50@de.bosch.com>
Message-ID-Hash: E6WXY7Y3G2JFA4QA3G7U4DXB6RUZNVUC
X-Message-ID-Hash: E6WXY7Y3G2JFA4QA3G7U4DXB6RUZNVUC
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 Zijing Zhang <zijing.zhang@ry.rs>, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org,
 driver-core@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/E6WXY7Y3G2JFA4QA3G7U4DXB6RUZNVUC/>
Archived-At: 
 <https://lore.freedesktop.org/DG7THZ3CYQYJ.LM9KKSFC48HI@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Feb 6, 2026 at 8:45 AM CET, Dirk Behme wrote:
> Or is this completely orthogonal?

Yes, this is orthogonal.
