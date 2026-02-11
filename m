Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B82DEA812E
	for <nouveau@archiver.kernel.org>; Wed, 11 Feb 2026 10:09:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF5810E36D;
	Wed, 11 Feb 2026 10:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uM/31P3l";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 27B5741E87;
	Wed, 11 Feb 2026 10:00:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770804008;
 b=x+LCNtyCDUHQ/OT+t+YAV6dZDjZLyaNL0apa3rNJ/zoSymlyFFfpDw017QG6rbsF4qurq
 SWe73mWJNtDuvj/jJq1y7iI1ri7GZ41c81PO7uQnEXHxwLlQfjuivYaXozG+TqbdOaNv9Kb
 l86p4vFBDMxd8yxrKa85wG6W5AH/n8YL1TfPj9vuZ9+3XCgZ9Y4Z2D27kltkqjKPG/3aXZ0
 QPw5erZUms4QQH4gLZhUyUYNoFfE2NzlMcsYQYar7rXz8u3lgZZuxdBhYMjhPw75YR5HDRC
 VcZlBRWgI67GOvdZQSQfVGv56QuRDt6Z68DVIyFWI3k59dlbocsCNOmkDcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770804008; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=W099MKegizyLm3LU6ly5n7c46vdaMLs/3ODPjjdYKrA=;
 b=0CccBA+3wq4SSCyzanKt/LSUZWQtLS7BzRrqfsB7R7nDBYX73kiSg8ZQM2TOrKiY7zMCf
 ZxopNIe4gp83u+25iKRUFCwp+43YyrJUkZ2oFC3TV9Ymnz75xptUdgSJSDxC3UbxseW0WW9
 zmIVdTo80BzbjJKhqhdhNm/iGlzQ64PSmID7k30RlajzXQSx1ZElKwCCiRYgTKjuVc23D1o
 aDnpwJ9cSnRwws81OW1y5uwhgbtVieqf9Iu6jNj79GQcRLPFWMv8f/jbSMlKS/MOoZHWuQg
 tsA1UQzbflB3qnneUJY7dIEnPgITYqxfJAgp80ItG2QWnrN+8Xln1f27pUDg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 74ADD4053B
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 10:00:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5947910E369
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 10:09:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C9E443E42;
	Wed, 11 Feb 2026 10:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3334C4CEF7;
	Wed, 11 Feb 2026 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770804578;
	bh=2yJOMJwE5inPXsHc0h7m9YI+MYkeBDhtxdnF0857w/0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=uM/31P3lxo9J/yDXLyViLzKLcLemaqmBgbsfuzlUMzId6n5WwzWxJxX8TZ2y9A83e
	 QNNCI8VYgqK2mm//d9+lroGncVKoOju6opLPcZDPgEov3vk07Rmfh2ZxHmp+INcmCT
	 ukK1lNBj4ewuD5LJi7oJQKriWSBXZxS+8uMcbXRpb6N9NGw8JkpVx5v18Db5LHVnoX
	 e6co55exzIvePw/NWBSMpRC09ht2WCMK4Obxjl3JgTDnRootIsMdQ2GnjzapeOb3/f
	 bpMUTmHXZO88NtRnbO0IlU5pW/d6duZ1jte733eKos0+2JtDxzXUds07RsgSZM432x
	 oEY3ED8ip55BQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 11:09:32 +0100
Message-Id: <DGC1TY0BINGC.3THSKW6E6OJLQ@kernel.org>
Subject: Re: [PATCH v4 09/33] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-10-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-10-jhubbard@nvidia.com>
Message-ID-Hash: 4JNAC3TC3XTI5YBK4XJ7TZL4N4UHGZNK
X-Message-ID-Hash: 4JNAC3TC3XTI5YBK4XJ7TZL4N4UHGZNK
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4JNAC3TC3XTI5YBK4XJ7TZL4N4UHGZNK/>
Archived-At: 
 <https://lore.freedesktop.org/DGC1TY0BINGC.3THSKW6E6OJLQ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> Hopper and Blackwell GPUs use FSP-based secure boot and do not require
> waiting for GFW_BOOT completion. Skip this step for these architectures.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 24feb0e8723e..f04e2a795e90 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -304,10 +304,19 @@ pub(crate) fn new<'a>(
>          let chipset =3D spec.chipset();
> =20
>          try_pin_init!(Self {
> -            // We must wait for GFW_BOOT completion before doing any sig=
nificant setup on the GPU.
> +            // Turing, Ampere, Ada: we must wait for GFW_BOOT completion=
 before doing any
> +            // significant setup on the GPU.
> +            //
> +            // Hopper/Blackwell: skip GFW_BOOT completion waiting entire=
ly, and use the simpler FSP
> +            // Chain of Trust boot path (elsewhere) instead.
>              _: {
> -                gfw::wait_gfw_boot_completion(bar)
> -                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not co=
mplete\n"))?;
> +                if matches!(
> +                    chipset.arch(),
> +                    Architecture::Turing | Architecture::Ampere | Archit=
ecture::Ada

I assume Blackwell is not an exception and we expect this to be the case fo=
r
future architectures as well? I.e. checking for "!Architecture::Blackwell" =
makes
no sense?

> +                ) {
> +                    gfw::wait_gfw_boot_completion(bar)
> +                        .inspect_err(|_| dev_err!(pdev, "GFW boot did no=
t complete\n"))?;
> +                }
>              },
