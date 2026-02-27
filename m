Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C823FEE4EF
	for <nouveau@archiver.kernel.org>; Sat, 28 Feb 2026 15:30:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6786110E2C9;
	Sat, 28 Feb 2026 15:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f64d3RJF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F0BDE44CF5;
	Sat, 28 Feb 2026 15:20:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772292038;
 b=Fkt7DXfVq21m63tqbMbQVGBPdU62lFrLuPEVHVJRCwdJ2aNUO9pH00JFrDWvS8WmMR8Wl
 kHDc6nHOTgpicaz6+1+vOA7brpKnOT07r4U96Lu3OuyR9aW77RJrnhF6bKGak3aCPPG3Heg
 EzYpc9qusKNp4E1kGBGGKsRAwMzSFGgJKZvtgBA19prW5438jFfG4pbeu3ajI6+1AWp9xw1
 Js6hyYqg5Q4gwnf0UaWWbdqLlg51pJDKpMEOWVtJ+JAfcWCHpGO5LXoHeOQ1Ym054VftvoV
 EbOfzK6CF9X2i7Ugxm1svfkPDugmYwx9wTVRYDighWpxnEviiFcIumv1VuVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772292038; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sMgCgfThj0uiQ/ajRpndQGU5RmdKGE2cIcjmdTi6q0U=;
 b=Iye1XNA07jmhzobKKOuktTxDJNkXe5fJbJN/QNOvNju5dDY0O2eozggsgPfBBmcVIvM7/
 fA4GQCDTyB0hE6SEdD2NpR9eHoWDoz6nneo+aO3huhvIsMaMLTI4kBYOuqQAX7NAF26mt/c
 4DXfHEEhvqSbGcg0N6CxzB4HU2iXH4WUXEHZ/nt5TKNF0qcJjZjptK70nruRD93fDoGqNHv
 nA56YuOC97NIuTSKGHUqZE6sEBo4w++tldcaSb8JI1KZXkEG8WqvIWqS+TjWixnNyJ7LNVC
 dvBKNUzJrRiF44yhOtfpc3llli+DG14cKttbjIVfqimaTKDtfOMpGeMFgk+g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B91B344CB3
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 19:20:47 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1046C10EBFD
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 19:30:57 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-506a3400f30so21106111cf.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 27 Feb 2026 11:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772220656; x=1772825456;
 darn=lists.freedesktop.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMgCgfThj0uiQ/ajRpndQGU5RmdKGE2cIcjmdTi6q0U=;
        b=f64d3RJFYMv7P1X/VLlSdJOSXB1/XbZ+J8fVTx2K88R7xNS0t274eDkAC8MHlvVnBA
         3SzD6/AxvheX36NkMwUxiEamHLfblcvkRE7nxds/Vs5NAjGJiyhV/Nf8CtVaNk3B9wA2
         pK2PBQR+Qp5pPoJHTkkuPaUE5+dmcV3HdSZL4Y2sdiHE1fEsk/NH/WNcKDlHoZapiwgT
         ytlcgVd+DBPuDqPez8rY/M0crZEZBVsioeYcbSGk6O3s3QfujphIjBe0XKRu3L72iF1b
         F08LxvpLxPjA0pdpMRi+yn//DOtPdkIhcLs3UvUeZIqBmi6UsKq0RDjdKmTMg2C8ocXg
         1KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772220656; x=1772825456;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMgCgfThj0uiQ/ajRpndQGU5RmdKGE2cIcjmdTi6q0U=;
        b=HHsTIrJRacxelN80w6kIfLmGcj3Us3S4s6IameXgoNjDdi6SAYyINZDr9MNS+GJaAk
         +iHVkCYf5RaIM6k2B0LM20CanWhqygB3Rfx3MdZeTtIz/4PaGi/0m5JwCXLTt6ZtJ5Dg
         XCDMLqM6SBxOCcM3bqGCYcPwBpXieb/lR3BE3I4tI6pO7XLqoy+jZ/ZwdWS/XOZoEKYB
         IW+W48w7reaKpwC5swtXzmICFbzWqhfD5AIPMrWgm5ZJi/D6/G52FtYCkY3Y9mY3r7+l
         bh4G5ATyfC6KUIWoykw1gOMQHKlC3Lkvk6Z8pLqjcyFMO0Ett0umXKCGnED6nGQ3i1r3
         WcUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqY09+tQGCufLIqWXYJb2MhMrwC0ld3eTOgkk3lTc3Wjxgk26ZFwSfMwEXUJHeNC27ui7JtAVZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDx/ibGh1vVD/sCBjHmngNAQ/PAXgtpzzWoVDr3MSvEWCLetxa
	hcXize39/S4FXlcusq8L3dVvcDIK2nARAV0Rv3zEVGIYhv4GMhaoHjeQ
X-Gm-Gg: ATEYQzw3zQ/LZFwy0qeb30/DwAi/krMLvwWRBAbE5ROot/fUkUx0kDmCbgGJzOPBUJg
	J8P8Sc4bgHo8cdgr21u37gaxzMAg/0yUKRrVBqrbZbIFWX9cLi1FTvH4elPcG08OEwPAt8hVOM/
	rHq//a4Ok+xwvE43uJ+MWWSpuu7mDKaG0KtTTGEKBpUOsFxlsm3/Llnq6lLNMjaP+Jd1Gh6FwPr
	b/PPlEH14DBwTi9+UDIsAmXCmgF89vtdqNvUKUnX7bLytRe6gJPQ8Zv7tEc+R4t50y1A7vvHGkT
	OrfC1J7tonQrcKRhL2mt/NAXN9DnTGBiAV+ia8GxwsHe6e2EgKUtyAP8Mp2PoWctDlJoq+XXif7
	UoT7EteCTEYonPYG/cJwKN/2ELZoFXhSF3NdXMVsIlG51XIrv+EFsNIfvJjgTdpV2i2Mzu3J/uD
	gQJK8VcG+78ThPZrLzaHS0ZKQy9U9Ggckc2w3lF2QsElNb
X-Received: by 2002:a05:622a:48:b0:4ff:a6b7:6c9d with SMTP id
 d75a77b69052e-5075248b828mr56391801cf.38.1772220655720;
        Fri, 27 Feb 2026 11:30:55 -0800 (PST)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50744af0731sm60355271cf.31.2026.02.27.11.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 11:30:54 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 11:30:49 -0800
Message-Id: <DGPZSF0HMGPJ.2ZDZ6J28MFTQK@gmail.com>
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Lyude Paul" <lyude@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
In-Reply-To: <20260123175854.176735-7-gary@kernel.org>
X-MailFrom: adi.dev.github@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: HZYSSLJV5X7S77DRJ3FCWTPPNM5TD5JW
X-Message-ID-Hash: HZYSSLJV5X7S77DRJ3FCWTPPNM5TD5JW
X-Mailman-Approved-At: Sat, 28 Feb 2026 15:20:37 +0000
CC: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HZYSSLJV5X7S77DRJ3FCWTPPNM5TD5JW/>
Archived-At: 
 <https://lore.freedesktop.org/DGPZSF0HMGPJ.2ZDZ6J28MFTQK@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 23, 2026 at 9:58 AM PST, Gary Guo wrote:
> +        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
Nit: Missing colon after MBOX1, should it be `MBOX1: {:#x}`.

Thanks!



