Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A17C61DFB
	for <nouveau@archiver.kernel.org>; Sat, 21 Feb 2026 20:50:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 238A510E094;
	Sat, 21 Feb 2026 20:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jRPjbW7d";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C762443474;
	Sat, 21 Feb 2026 20:40:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771706458;
 b=dOPy/nnbSi/ipj7jB6hq1orycS+ryj2qpfG4RCtB1X54fgWJ4o8K3htQM8rvQLpt6g3Vg
 Vs51pCNNrtChEQFEnrKfUfsc42rfdXCqJjUD+GnGwdQAAH3qQq/Ekaldko13eXxZ5JEOTSY
 NQDAfEJmjBNgLdqz/iGt1FAwLw/ztuG8Kzzp3C4l0GRD6kSlE2lZ8PrAHr1z3aIDCX7X4mQ
 3+SNur4W7mlKBY2mPiM8jwTOGc0I40NBLL7/oo7kiXs0zc1vSzH7BcovHnevF094ZR7GTEm
 +3u3hBvwgJdSp0E1a4yQ5mJPEvj2vVNVsosGj945gp+kUoAQ1/Z17Zzy6sUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771706458; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+lpy+To4hAQnLOjsEbQcqc+n0mUzjIXhpOqd/ok5q8U=;
 b=ScaiMgbgWIBY+6Hf6gUQuYmaWuJ++kxxobvmN7E+REpN5R+gWttSu3QYy0K6evA+rHc1Q
 El26PO2jQNapE/gzdYwlFjLsgJyBvANKgxDpkxN2sXoXqL2Uld4TmKasIt+A/xgLrFnhcPj
 usQK2rGzXa50PQKAyQJFNcYQFUHnsCCzs+pqmr2vXB914P2Y7Ko/4FJ5tOY0++PnvYnPMlR
 srm/Dx94iNoBZFHu3gI79gAn2EXDKJDGHiBnfyydw6EAaKUPiQSP+ZPO1Xrvbteogg0h7Cf
 r6iZXJZCrUZ1xml4V3PYlXc7Cmrn7rvarcTmd1608EH+BDzdT7A0Yd9QjDdg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B7A4243400
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 20:40:55 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA5B910E008
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 20:50:51 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2bd801b40dbso31583eec.0
        for <nouveau@lists.freedesktop.org>;
 Sat, 21 Feb 2026 12:50:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771707051; cv=none;
        d=google.com; s=arc-20240605;
        b=KKE+uAa/Scu98BfDt/ZmdNZRyjDXa+jIUBINdeY3aEMkRh8myaz84HOImM09mELwsm
         YhvMh/2voZFz2r9+9egPqE73pR+EFg/yXddsVGSD7WyyRiz0n47BXQ3N89Vo7kEno3od
         KU6poaTHDucIezs8IOqiYcUGCi1w2imrSv11DFIy3aVQugSAJf8/sl3mO8268kE7g3Ur
         IUqXwllUvoCiAlPt0DuOXLuzTa1Yt6sf64PM0ge1OIpmnRfsCVuu6ImfsSomv2EnQ1xr
         A1JhvrH7OAgOA0armqS9CHeGiUHcOO8e9m5as3iHUeRnMqGsNQxUfGH23d4sr2cRNHeN
         IRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+lpy+To4hAQnLOjsEbQcqc+n0mUzjIXhpOqd/ok5q8U=;
        fh=mArvKWe84XMnzMl9Hpw5kSzsJ4FokCmiSKhWHjowiko=;
        b=kvp/v8wA3bA7y6QS0ovQcMPyaFXfVlXT8I/XPBNXQeNwcjs92Wz1WmT0391auoworJ
         8shxY2xdT0TwfHNbO0rHgCDHcgHbcKSJP6D56ZN9AeSTIFeaG16WF2rBRFBsd8A0JJ7U
         wVWxc9f9HxbyVvHWefOuFdGRjbQyWH4SlcSKzTAJuZhJnZcTux693xd6QO+qOy/pdIGY
         U9yXQid2Y9LH4jW1M3LY4SMY2r/04WBVlEMgnROSQokO5Uipyr0N+JhwwT/VZiIAOhAv
         66iFAt/mKGp2HIj9p5omKnch9rEo62+2PWpvPMO3i/e35uT5zaeN+jK4Hkg4rueq04xi
         +0YA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771707051; x=1772311851;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lpy+To4hAQnLOjsEbQcqc+n0mUzjIXhpOqd/ok5q8U=;
        b=jRPjbW7dRuvqIc8FOQAAo8quP017C340p3ImeHvj/atzY2q/CPHrQ5yeUWTwAnKATN
         89k8HECjicd8hnskKR5o8U7YzzElze18fsgIJU3pqYnOSwPS45w1vcPHGEznIKiolXYQ
         vUh+/uVzPKuM/AQ5KVxO1jnuySzrnVOeuA1hDgCLf0STthxxOTXg/C//jRWeGTm5cHmq
         sXS4YemY5vOA13YyQQcPcyr3/fmtNin5FEjI+uU8XwhPQ6yfVWag/NTsmVucqPx87/3m
         2nfrdLfuiBqit//WWYld1VFLrj5vq8qUuWJfMzJca6u3dfHROhutqhl8fIVlgngoeXIU
         qmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771707051; x=1772311851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+lpy+To4hAQnLOjsEbQcqc+n0mUzjIXhpOqd/ok5q8U=;
        b=iK163km6FtoEL5Z4KTCaU41xgLGPQ/Ce9xRhPMFb96mIJmfR7Exvc4DznepRH1HjbJ
         Y8MkGF9IGRVdN//CZFJugtUBRbPNtK4UA4ZUu43II1APq+SUv6YdtmPpDW6GZDY746kw
         IjyMbLlJX64iVMvoXEqo9GF25mcIVsBzi2+F5e1loo6qGj2Dgvd+RBx1SyYK9nPo52q2
         o/cQQ1M7MDzRPMQ0O4r9jDqhIppr5VH1bNTBh+bF25zwPu+fzPtGuCNh0VQCq69YKOho
         kXbjo7SGbqx2Y1nhHO/nbZvhpj5B+aKB70AhZCuF41oMskU8+1MwJc6T1BJka8ETwKoF
         dHGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsAbbOS2fC2yoqcP7HFaVp0kLeGPgPFk6DWYaq9n6AEadgDDLiHxIAqXhkTlRp4q9+NwSesLUB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKwqk427ufrK2QC5rKAfUC3xiUnyTqIiEYXco0ybSUUfKsF17M
	L5/Mmkw00ZSTVhWOfy1PqF+FBJETVa4WqDwD4HqH548NV/Qpl8CW+rN5qISF29uLO8CYo1tavOD
	xtd4JjMYEISz7QAG7OJ9/Q7MME8DPp1Y=
X-Gm-Gg: AZuq6aKPGUeedSB8BE30FMG4LWyUwIy085YTbOXhpOh89km9JaFF5Z4Ovo8LNDOWYfB
	trcSVpYZTqyBCuLQasdjTyKumPovuaLNZfj40T2iTos6+837jfiPnWybn0vQVmqL2GubCVFlUTx
	qsAKZUhmM8A9G85FbcZQoj95OMQwcpwnYcQzXlNimd9pbXoTC3LCB4/zqTvV4X3DxUCa64alGkJ
	u2+IAMu/PEacLjfp0E0QxgAuJAOxxVVgbonvfL8Syndwr8rSL5pRWNEsf0oWyRWA9JS3braWhZ3
	45ez7Syy+tFbzc0M1ibHBP3LMLkNQmuK5utXF5iJJaLRby59Y0kYbkZNoPIRSpn/A0Agd5QE+Nx
	phBo/9Vbs6imqrCLvCnMjvluO
X-Received: by 2002:a05:693c:25c7:b0:2b7:f145:a70 with SMTP id
 5a478bee46e88-2bd7b9ed182mr1020616eec.1.1771707050982; Sat, 21 Feb 2026
 12:50:50 -0800 (PST)
MIME-Version: 1.0
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
In-Reply-To: <20260221020952.412352-22-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Feb 2026 21:50:38 +0100
X-Gm-Features: AaiRm5172XvDnU3UePKgPHx_CxnJsXnvjVHL2rwEQ4swbyAbhJulY3nsCIuvnT4
Message-ID: 
 <CANiq72n46KhQv453+9nMWxaXqo77PT20Ya6iw=fiR+oyrPDquQ@mail.gmail.com>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5DBVIJO4ZQLJTNST7RYK6CZYDCNWOSYM
X-Message-ID-Hash: 5DBVIJO4ZQLJTNST7RYK6CZYDCNWOSYM
X-MailFrom: miguel.ojeda.sandonis@gmail.com
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
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5DBVIJO4ZQLJTNST7RYK6CZYDCNWOSYM/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72n46KhQv453+9nMWxaXqo77PT20Ya6iw=fiR+oyrPDquQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, Feb 21, 2026 at 3:11=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> [1] https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@=
kernel.org/

Link: https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@=
kernel.org/
[1]

> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {

Ah, I thought you wanted to put this in `drivers/gpu/nova-core/num.rs`
like in the previous version.

If it is here instead, then you shouldn't need the
`rust_allowed_features` change anymore, because we already enable
`inline_const` in the `kernel` crate.

> diff --git a/scripts/Makefile.build b/scripts/Makefile.build

Having said that, if you do end up needing it elsewhere, then please
add the other line added by Gary's patch, i.e.:

  +#   - Stable since Rust 1.79.0: `feature(inline_const)`.

Thanks!

Cheers,
Miguel
