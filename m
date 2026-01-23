Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E729D74ED8
	for <nouveau@archiver.kernel.org>; Fri, 23 Jan 2026 14:19:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C5C2F10EB00;
	Fri, 23 Jan 2026 14:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qmp2EdBd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9A6AC40564;
	Fri, 23 Jan 2026 14:10:27 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769177427;
 b=F4rbxOGE812jhc9sp/QH9q9e7QP+zg8pXSXv0iHLTOXIUlV3khXcE25ONbQSlN4I+iiWV
 ngMqoMfikRvQDGiBd8imy+xkXVHvGuZdzuIQ+0XwGzH+Jr8ZyVk9lfZC3KslpPm+XCmElgy
 Sby7e0rxRJse5OQi7XVbwshaxk9BCnynV1MvLuthJImw5SkTeb+Q24ExV7J33MoYatVnbwx
 Z+RfpEPl3Iv10hGOmoamwkL5Hf8le1fbIXHXPhO7+e40jxwXYwISCF8ThVXP7nFYuj5T9x5
 Lm1xym/yRpvoWKHrMbgYr4DoHlGmzbmukLIujcs9yvSnvSES7Va+lijp1Xog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769177427; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YGHC4awsoSa/dRJGgbn4zkLgLCUO/JGIDvPLTMMvbKA=;
 b=SJ9nyOZaJa73cbuh+fkChAqwLN1VtJPQpaVgS8kEI1Ly75Sw86Umksn5l9jE/RVlfB5cw
 qvAMA+8xlSJYzkn3HIyAMA1DNPQyT6aXK39jM0ITfxy3iUm/XxGLhtF18lNXUPrRXVHJZAG
 ej/FVhQICS7hwPYsABfcYU1z8MP/+2DXhGtWaf2OwV84ytWoS8OnMlXy3R5n7Q42RvwgOon
 Y2P7cNA6DZDQuGrLrCLqi/wsDy/BR8Swy1WdM4qocmtdVgSR6tHB3yYO9O4//hCD06kZ2UT
 9BTwS/UmV4OfI7jUmdBcWx3StCveUifLz6h6r4eRKpGu5qUtsBoiJWeBNj1w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E893C4031A
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 14:10:23 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D29FD10EAFC
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 14:19:14 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2b7063004daso115067eec.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 23 Jan 2026 06:19:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769177954; cv=none;
        d=google.com; s=arc-20240605;
        b=IS+lEGgOXqC6ObbFZEJ/Rc6HfLfkPUzu5CAdiUoidNJKR3Z+x7HYmCnhcAR+aDnAmx
         3mhMGfEk/cEx8oC7OEroS0cEAceybNkmq7HB39hWJGrB4UDUN/xSHFy+UT9VRRTHbKGf
         vRqSoybzSRu83Us25giaPpZ3boOgN3B4PblPy1mKihJS9m3c+KSHhqbNoO43y5PGfPTM
         fhr76pxmYR2Nixr7WiCsQ3jCNL7pC1c6uV/4gIHLPuWVzXzipOj+mfda7rsWZ17F8omg
         /N0ERjP6lJnCLAs46LS4YUVbVtYEYwpHAeoe0zplRBfTUj0HSe81Sj/NzfweWWkb7dtf
         Ax8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YGHC4awsoSa/dRJGgbn4zkLgLCUO/JGIDvPLTMMvbKA=;
        fh=wWixzkXmC+0ZNDdQOqgEVuQQc/YBASYDR8VOd4AFQQM=;
        b=JLTDaGNTX5DL8e+zdGfN3ViYzvR7uEzBHXd8lClUb7bA5Yb/j9My2pZ67SAE4m1sQB
         nzoJsjkjsfdmtBy3Nr7XP3j5p2JRqrESKxCnBM036c0fsLCRkuifJwZZlURtVj/XxKm8
         Ta4igd+IaoXXtxC9TpSyS9uUDXQmc8OFN/dqiyQYWaDTq1+2A/aqC6ytqY5Hv2fQCA0G
         phYh3HVEWx0eDXvp+EdEZpVKumTmnZiUmp1wUZtPmOO+6ReMH+up42g3ZWM7h4RBWn9b
         nJHIJubiLKiC5GJmBvebhhhQBzBwIk1nyVXK58Uv6AnniUH1aoCRUrmjC9bAu83rzRa+
         mcsA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769177954; x=1769782754;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGHC4awsoSa/dRJGgbn4zkLgLCUO/JGIDvPLTMMvbKA=;
        b=Qmp2EdBd7IDCmBYQzgmXDAhlA/RSPWAKuLmuxhU4DO3a+HybpBVHPy/jVEO8onZc2k
         QWYy0HJNMIvgNPuZ5Cxi4a0iQg6yShLfoN2PARsbJLjowBTmCuFX6L+qC0sGPERhNb3r
         Oqmpq9fAEyhLiDZ6KGu+N0wW3n/j7BsgcKRb9Spk4X2BXkhJuGQ7cV0jKlP9WTvt6w/6
         Z3nHYkYTkMdGDhnYB/lRbahdlEHl1zN4ySGHkLkXH5YPONcqz7q0ty7T5NtDImW4a9My
         p4iNFi3FT6aYILBajpychgGT10jdK28wOEpQUanRgZMv0s1V6vLKnjbwhHsnAajkmXc8
         4FFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769177954; x=1769782754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YGHC4awsoSa/dRJGgbn4zkLgLCUO/JGIDvPLTMMvbKA=;
        b=qFGBAS2cA9FLP0I3rUBd2LrDpZCiG+OpBFtcO9QpjTphBlGJNhW5eaOW9zzAcn29Dt
         KVum9n8DHmt65YfX76O5k9MPI3La9E2/zhH/KJNS/+HFdN+qRYkxkMdfgnO4k3BwX2EE
         sWVt3X3ij81NBQOUe9jbSDs7VE4kstarQgKttTk+EQ3DiYTiMUXT6/hf3ehp+sbgxEAG
         4oZW8x82hcu5YDSkP9FHam+MY3IcdLjG6Kzjkll4oTDLZa+ZMYOH5uCbf5nxE0tnsutp
         jhg+sP6iiti+HkEgcxGqxwZwLHnvYBE8RwupRaGa4zG29cDC2SrY8p6GYOI1HjBgNlNe
         XMUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE7rmKgfJldYTQ3Myw4rhsV86hxQpfQqLovwGxd9PAESXd8fNYZYEJkpshBFU70REhhoRtKT+x@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqPlazY5+Jwc7MPdDiPpRjmbsXYU/qkfMMBngMES3yaBuVA0e9
	vu6PYvasCYB8/gYMZfx/2zbZPteqqPRH0lKupFG9Kr1iUafN2CEkJV6O8e0xcEVb1cLPJlovFhy
	weOy8ovssyeCoVS4B+Mp9lyNupRCW8cY=
X-Gm-Gg: AZuq6aIatS6so+askMpNDPK15Ke19A524m3IYiZmz7MWDvicgo8RDl8l58YmTX++QJx
	Glq3LrA8z/U01POZQfVKFP4MFSsJ5whf3jSdY+Q+tFhWjeYJ4N6H9+EkKUUu/8WrV1/Eb3oPZ5s
	TEW22hDQ3HR7AFEinaMI0OfeVBsxPxZrWX7GUm71flx1q//PPd8mKCzDpCL1JK9vX2xSLVerN6W
	oK91EAmE1is9VuIeBER0hRimlidM1arR0vGAqZPUfdnAd6w9kHFwAGCdHl35fGhYCeM86skVTwJ
	xmwS8aPsWkNja11KYqRAVbm/k2xjnPhmUk2Mwu7wUaGjzrIFnaZcuNcMJ4mmQCERwRWdsl3KR5X
	7EUm2j74dcKup
X-Received: by 2002:a05:7301:4e0b:b0:2b7:3835:21f0 with SMTP id
 5a478bee46e88-2b73995f4f0mr880908eec.2.1769177953953; Fri, 23 Jan 2026
 06:19:13 -0800 (PST)
MIME-Version: 1.0
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
 <ee459198-04f2-4bae-8e1f-4ec413d92f89@nvidia.com>
 <DFUUVM5M0MYA.36CL66OCAICDA@nvidia.com>
 <DFV0F28KHNXP.3JU1QGBJCZBUQ@nvidia.com>
In-Reply-To: <DFV0F28KHNXP.3JU1QGBJCZBUQ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 15:19:00 +0100
X-Gm-Features: AZwV_QhNDrz0erAn3-OGI1WooCKBr-7Jq3HMbGGFubBIWd3KYSPpgYNkX9koyGY
Message-ID: 
 <CANiq72ksbD57UDweA8Y5-635fBMcRb-mPnzZtdQ9yv86xUNkCQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
To: Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HEQELGT6JLYU6M6YOKIVBAPR3ODDVF33
X-Message-ID-Hash: HEQELGT6JLYU6M6YOKIVBAPR3ODDVF33
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Eliot Courtney <ecourtney@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HEQELGT6JLYU6M6YOKIVBAPR3ODDVF33/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72ksbD57UDweA8Y5-635fBMcRb-mPnzZtdQ9yv86xUNkCQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Jan 22, 2026 at 10:29=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Would be interesting to have Miguel/Alice and the core team's opinion
> on this IMHO.

[ Re-replying to this so that it gets saved in the list. ]

This is something that we have discussed back and forth, including
making it way more formal, even using special notation, etc.

Please take a look at Benno=E2=80=99s proposal at:

https://lore.kernel.org/all/20240717221133.459589-1-benno.lossin@proton.me/

(He may have a newer link)

Cheers,
Miguel
