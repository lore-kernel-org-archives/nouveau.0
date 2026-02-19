Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC67BE9A048
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 09:58:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A172610E6C0;
	Thu, 19 Feb 2026 09:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fRQVYmX/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BDE1B4341F;
	Thu, 19 Feb 2026 09:49:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771494541;
 b=cAFvqE6y9lcIcXhk+OxfM17dmgsLNcpK4SBIZtgb3XwF//+y/kIBatPOGKOGWlAuSJCaX
 H5p8oT+LeOyOXv/XWGHOlvEh/JeVwK/dh4eDEqXXLihDbaBPieU9AH2tAlkBBwQGc/2NJTi
 8Gjw2VGpCwREfsxg3cZMmEgTlmXFEb9Fp0fTU09Kgp6rygTwpoCS/8UtcPhTqpPO0aES43L
 QnfFsnCGLb4qv7qPFInIAJyart8sfzbNhPGuQhlY0JDwJ0zz5klX3vBVH32MiQcwpyMjI+2
 R0vFx3vXOLUlA4bYUcQ/wyzZcaHGJDbtQhsyyfp1uekOqFS0IkdiqEOUed0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771494541; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UKf32m3uT4JzXholCdQ87l5Nd+rV2b+UR1q5Km3OpUY=;
 b=NflNyEYPqwGP8hNB+oV7Ae9ZwtgW/CsSm4QnZhMd7UA9ZfygxMipbygbMr9vaG05QpeF6
 9ULPGbBKaoIbQYm7CgYb0dJ6IdKAbmI2UT3m5LPMByOUUHq+IYVMCs6kXruUHizzg3G0lDW
 a62J6RJHMyiTJJSeEKYAgl4yJvsnoDXwjNT/AvS2M+LQGCQETAEg/u10ud8RW43FIZZVbK/
 nwCz8gOuLi3svG8lIm3pgKd9C/A9Z0t9YX/tCDJe53LN27Wjyf1FpRhO4J6s9azvYaaXdaE
 SVeq9zOVVN2IJQpnxLZBnJLWmATIARXzz/x+S1gmQ4tmtPHQZlv03stugidQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9A679430BD
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 09:48:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D74B610E6BF;
	Thu, 19 Feb 2026 09:58:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01E9A60054;
	Thu, 19 Feb 2026 09:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E61FC4CEF7;
	Thu, 19 Feb 2026 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771495127;
	bh=UKf32m3uT4JzXholCdQ87l5Nd+rV2b+UR1q5Km3OpUY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=fRQVYmX/BS7iyXUsNtUY7Sg9jqNMp54m9kaei7NwBPvTdbYtddGLVPF7fOM1zk3w3
	 ZrONiZxfNY9oKKxv0Qiem2wmuq8EvljqxXo24FjnYZ7EKBF+oOg3aFf3nvwqxtNo6q
	 9dK7XCtHBckiSF/v6OJ6M3aphJt+4zS4nfoMNgwLJvs6m20bcpS11RcagiHBqPss2r
	 WLiWSnOL09qcCAV2QynPUj+6RaKfir+I9GRjAOIJxZSO7x44e3hDsYW8tpVOVnoXXW
	 qTjw2dF5LhA11hBfUO2VCsCAH4p4vgC5vJB332TS7lGAaP0iI5uYTYla9Y4BXB6yN0
	 hbBFSg0Q4CMOw==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 10:58:42 +0100
Message-Id: <DGIUM0N4QQWD.1IH8DWPVIFXTF@kernel.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-6-joelagnelf@nvidia.com>
Message-ID-Hash: PBDWCFTXUJAWIKSQIXL3L2S6DACNUDEW
X-Message-ID-Hash: PBDWCFTXUJAWIKSQIXL3L2S6DACNUDEW
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PBDWCFTXUJAWIKSQIXL3L2S6DACNUDEW/>
Archived-At: 
 <https://lore.freedesktop.org/DGIUM0N4QQWD.1IH8DWPVIFXTF@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
>
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
>
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

For reference: https://lore.kernel.org/rust-for-linux/DGIIMT4F1GWA.12UFBEUA=
C80VW@nvidia.com/
