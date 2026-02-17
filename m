Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893CBE68147
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 17:13:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C69BB10E52C;
	Tue, 17 Feb 2026 17:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m551fof/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A47264339D;
	Tue, 17 Feb 2026 17:03:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771347839;
 b=KN7uECgpYpGbuH2v3RW9HNpWdxx2LdTeZyaenoyL/q7qjVu0KehDwkTqDLLvkcNYlcBdv
 VrMsP63A7kVlmab39S3hieRp6wWF3ufg3mmQw/PJd47IMxXZCLZ6KmLCd5+gMaq1T9nqswv
 nlJESGePTeER3ldmAA06raCpmoe/pIz2zXplgcx/ZfteQJBnrUuHH616gP/f8g6FMXl5FXg
 OTw0CIgpaJ3mmv0RuiJ1k3MpyStjXFWY/w3wAEIBvrVE7eMPDYDca83tot1taCSaWSBgwuA
 YHxrlVx2zBKFdCvj/rWq0tQAoAqdsbIijjQk/BhkLPzX0KAQA52SHShRpX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771347839; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8MX87cd2+rQlEz8+3q4c+9Wkx4sL48u3mG7KIupkKQk=;
 b=rmrwZS6qSUW8hrkqwU6gskVrqODTNoqjL+Sdqp/+wH4rhtNDOWAjI0WeZ1nVaehUceoRX
 B9HQsoTA9L/NkOkhg9DdDDoDii2fxB9kkbCx+zEe3KLRjw/ouCxmurxyRT8+HXxUqe2WLv0
 KPyls8hTR6GZR9xcKuU6PNd4IZVfn+aN0SPp25Re5ZPwH+3ZPFmLqQU6/56I3poiOnsCBP2
 xoFwnav73mQSHqiaCkhzFRcvc711K3aUIoLHv2l6y3zhKkgznt3UxiezGtJwhxK6wB43vjl
 1SRqE9A6SmFqXCPMBLWwLGS3CIX8Oz9Rm5XWDBV0gXg3qPrFbG8oC5LlEZRQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 23B5D403B4
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 17:03:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 118AF10E526
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 17:13:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C682143FAA;
	Tue, 17 Feb 2026 17:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFF4C4CEF7;
	Tue, 17 Feb 2026 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771348422;
	bh=vptxEgejUk6RUu8QcN6WZNUoO045BQu6cw/K+CzpiQo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=m551fof/DH3BMY9KhVN6WKZmmjyb5d4NtKj0Kbj98ukoi68Bx8jyZhfvwtE2uVonr
	 ncDDLHbrtqiiXahbjbuuP782PWWQ+QVd3Qs8ZC3EkRXMrxzxFLE+vW70+plo37SuiV
	 pJjZn3iFLB2AFjI8Bew/RIGFEaCAERSzhugzudBbteUkvxHUIsg6LX1Wa5bVbMvyGn
	 1Pf0utmPUm93Jd5zLyJfa6Fq5Kj4RffaA6rWRZsEityUbnlJ+f565WVYQ477PIllLJ
	 X/e+s0CJdvB+wgfDUeGALl1XVbc+lv+vnSsOeNAi8yREnPJyd/jH4k27rL+VMSnDRG
	 5bHEduK6XTYVQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 18:13:36 +0100
Message-Id: <DGHELWT4WZXI.3JE0RQF59ZFZL@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 20/33] gpu: nova-core: Hopper/Blackwell: add FSP
 secure boot completion waiting
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-21-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-21-jhubbard@nvidia.com>
Message-ID-Hash: F5AWTESCWGFKP3NQ6JDFW2GMU6XHFZ7H
X-Message-ID-Hash: F5AWTESCWGFKP3NQ6JDFW2GMU6XHFZ7H
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F5AWTESCWGFKP3NQ6JDFW2GMU6XHFZ7H/>
Archived-At: 
 <https://lore.freedesktop.org/DGHELWT4WZXI.3JE0RQF59ZFZL@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> +/// MCTP (Management Component Transport Protocol) header values for FSP=
 communication.
> +pub(crate) mod mctp {
> +    pub(super) const HEADER_SOM: u32 =3D 1; // Start of Message
> +    pub(super) const HEADER_EOM: u32 =3D 1; // End of Message
> +    pub(super) const HEADER_SEID: u32 =3D 0; // Source Endpoint ID
> +    pub(super) const HEADER_SEQ: u32 =3D 0; // Sequence number

This looks like it should be a MctpMessageType enum instead.

> +
> +    pub(super) const MSG_TYPE_VENDOR_PCI: u32 =3D 0x7e;
> +    pub(super) const VENDOR_ID_NV: u32 =3D 0x10de;
> +    pub(super) const NVDM_TYPE_COT: u32 =3D 0x14;
> +    pub(super) const NVDM_TYPE_FSP_RESPONSE: u32 =3D 0x15;

This seems like it should be a different type (or even types) as they are
specific header field values.

> +}
> +
> +/// GSP FMC boot parameters structure.
> +/// This is what FSP expects to receive for booting GSP-RM.
> +/// GSP FMC initialization parameters.
> +#[repr(C)]
> +#[derive(Debug, Clone, Copy, Default)]
> +struct GspFmcInitParams {
> +    /// CC initialization "registry keys"
> +    regkeys: u32,
> +}
> +
> +// SAFETY: GspFmcInitParams is a simple C struct with only primitive typ=
es.
> +unsafe impl AsBytes for GspFmcInitParams {}
> +// SAFETY: All bit patterns are valid for the primitive fields.
> +unsafe impl FromBytes for GspFmcInitParams {}
> +
> +/// GSP ACR (Authenticated Code RAM) boot parameters.
> +#[repr(C)]
> +#[derive(Debug, Clone, Copy, Default)]
> +struct GspAcrBootGspRmParams {
> +    /// Physical memory aperture through which gspRmDescPa is accessed

For the whole series, please end them with a period. Personally, I don't ca=
re
too much, but it's a convention we have for Rust code.

> +/// FSP interface for Hopper/Blackwell GPUs.
> +pub(crate) struct Fsp;
> +
> +impl Fsp {
> +    /// Wait for FSP secure boot completion.
> +    ///
> +    /// Polls the thermal scratch register until FSP signals boot comple=
tion
> +    /// or timeout occurs.
> +    pub(crate) fn wait_secure_boot(
> +        dev: &device::Device<device::Bound>,
> +        bar: &crate::driver::Bar0,
> +        arch: crate::gpu::Architecture,
> +    ) -> Result<()> {

Please just use 'Result'.

> +        let timeout =3D Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS);
> +
> +        read_poll_timeout(
> +            || crate::regs::read_fsp_boot_complete_status(bar, arch),

Let's just import regs.

> +            |&status| {
> +                dev_dbg!(
> +                    dev,
> +                    "FSP I2CS scratch register status: {:#x} (expected: =
{:#x})\n",
> +                    status,
> +                    FSP_BOOT_COMPLETE_SUCCESS
> +                );

I don't think we should have print statements in the condition closure. Eve=
n for
debug prints we don't want to spam the console.

> +                status =3D=3D FSP_BOOT_COMPLETE_SUCCESS
> +            },
> +            Delta::ZERO,
> +            timeout,
> +        )
> +        .map_err(|_| {
> +            let final_status =3D
> +                crate::regs::read_fsp_boot_complete_status(bar, arch).un=
wrap_or(0xDEADBEEF);

I think read_fsp_boot_complete_status() should just return an Option.

Also, do we really care about the actual value if we time out? If so, this =
won't
work reliably, i.e. final_status could have changed to
FSP_BOOT_COMPLETE_SUCCESS.

> +            dev_err!(
> +                dev,
> +                "FSP secure boot completion timeout - final status: {:#x=
}\n",
> +                final_status
> +            );
> +            ETIMEDOUT

Even if it is the wrong architecture we return ETIMEDOUT? Actually, since F=
SP is
for Hopper/Blackwell only/plus, we way even want to print a warning and use
debug_assert().

> +        })
> +        .map(|_| ())
> +    }
> +}
