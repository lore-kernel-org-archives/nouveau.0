Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B393E9A03E
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 20:20:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0C5610E517;
	Tue, 17 Feb 2026 20:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lffsmcpu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 617FC433AD;
	Tue, 17 Feb 2026 20:10:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771359052;
 b=zsYIJikGcMfFnW8gutnsY0SksVihEgKSXfwcHdlHnwlpByN3xtAaDZiB89HMrBbu5d3U+
 Y/zW2qgz3ECwS5Ob4E/FWwLA1lmASeq3SJbLQ/qdukuomdORPP+XFztAmh/utUUilHmL7/X
 /FUqmLUNg5aXF7lVGk6sxkD8ilJuoEuJVowCG+hRbJOszrKtTh4UJ2BuPbrwsn78JMH3Jxu
 53n7VZQk823Qt6mdgc4GvmdJZMQCg5v7e/1Nk8DyWoi2cLvUPgwa9gwnEZlZiJ3C6ualnB+
 jj7oCchYcdFC4tELwDA9u6/zXKky7s1paTi9PgFnzRZoUciawcZlky9X0+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771359052; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OWaB3pJ2IS/dQkl0gjGL3y314g1UtxLl1a75cVHBCzM=;
 b=EVuqCbuWS+7bqDQoJkRHkOzqeFJG7NGo2Z+b4lVBFeaJqDK0QcTHpqnvqZ5YYcR2q5tVY
 84HVtEJ0FfIkMk5cuVoGEG5is4ytr+TyZ31lOQapfbPTzJpYgpg83pL+3Wx+rOOxyFxBIB4
 HGRuHAR/zXQ3AqJUWvcBMtw39VrkOBGcpgAPG2/jMyW4lK8H48WGySt7DhyK5Zl85xUcQpX
 CB/r726KfLMdIyHH/KHp2eOHtJT3yzt5cX/9a3Zib32T4Vqdtt2QqD8W34kVbkWVBsHJQye
 Rq+CBTUmbsKecY9FMiplMWqwgjs6BQKhW+lj/gNBSmOxm53OdsJRCY2BGR4w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A95DA40042
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 20:10:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DDE9310E28E
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 20:20:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71CDF40412;
	Tue, 17 Feb 2026 20:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32114C4CEF7;
	Tue, 17 Feb 2026 20:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771359635;
	bh=xi6JdHVOolR7yqRp5EcdMOWPCbF2v9DXAAcKW/ooPq8=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=LffsmcpucD1bZXeKVhl+366VkOpJYuqcULdrFOxNV3m2UwjcZtRIkcMYKRD2tqPNm
	 h6oYvAAh2+MPt7iVnbLZGvTDwd663M685FaprjWHD0Nuq+YdI5AafV4w/ZejSSjKul
	 dAahMOjYbIqWgsQ5mgiTVhGICYc3LZN/0UfFj0fa0KNCiXZB+RbnmgU/gnP7xQcuyL
	 bpcwfJhLNYqzzHWiy2I+Y5NpIQ+USba79w2bdH2HP7KwAZLqA2NBr5bDz5vTblfi+i
	 bV/WiXa9CLRgPEqiOh22AvcNKg+WIDcSvwK185ot2tmWpxbhUEjaIyW7/8TPxSD9sD
	 OBdA8d7fBejCg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 21:20:29 +0100
Message-Id: <DGHIKZW0M7DB.2JVQUP5C27J3Z@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 29/33] gpu: nova-core: Hopper/Blackwell: add GSP
 lockdown release polling
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-30-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-30-jhubbard@nvidia.com>
Message-ID-Hash: GMOQQYS2UR6L4BW7GDU2HCIGH2VKULVM
X-Message-ID-Hash: GMOQQYS2UR6L4BW7GDU2HCIGH2VKULVM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GMOQQYS2UR6L4BW7GDU2HCIGH2VKULVM/>
Archived-At: 
 <https://lore.freedesktop.org/DGHIKZW0M7DB.2JVQUP5C27J3Z@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> +    /// Check if GSP lockdown has been released after FSP Chain of Trust
> +    fn gsp_lockdown_released(
> +        dev: &device::Device,
> +        gsp_falcon: &Falcon<Gsp>,
> +        bar: &Bar0,
> +        fmc_boot_params_addr: u64,
> +        mbox0: &mut u32,
> +    ) -> bool {
> +        // Read GSP falcon mailbox0
> +        *mbox0 =3D gsp_falcon.read_mailbox0(bar);
> +
> +        // Check 1: If mbox0 has 0xbadf4100 pattern, GSP is still locked=
 down
> +        if *mbox0 !=3D 0 && (*mbox0 & 0xffffff00) =3D=3D 0xbadf4100 {
> +            return false;
> +        }

Hm...we could create a tiny type wrapper around this value, and do the chec=
k
with a method, such as Mbox::is_locked_down(&self).

> +        // Check 2: If mbox0 has a value, check if it's an error
> +        if *mbox0 !=3D 0 {
> +            let mbox1 =3D gsp_falcon.read_mailbox1(bar);
> +
> +            let combined_addr =3D (u64::from(mbox1) << 32) | u64::from(*=
mbox0);

This could also be part of the type.

> +            if combined_addr !=3D fmc_boot_params_addr {
> +                // Address doesn't match - GSP wrote an error code
> +                // Return TRUE (lockdown released) with error
> +                dev_dbg!(
> +                    dev,
> +                    "GSP lockdown error: mbox0=3D{:#x}, combined_addr=3D=
{:#x}, expected=3D{:#x}\n",
> +                    *mbox0,
> +                    combined_addr,
> +                    fmc_boot_params_addr
> +                );
> +                return true;
> +            }
> +        }
> +
> +        // Check 3: Verify HWCFG2 RISCV_BR_PRIV_LOCKDOWN bit is clear
> +        let hwcfg2 =3D regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &crate:=
:falcon::gsp::Gsp::ID);
> +        !hwcfg2.riscv_br_priv_lockdown()
> +    }
