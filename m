Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE30AC636B6
	for <nouveau@archiver.kernel.org>; Sun, 22 Feb 2026 19:09:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5787310E1AC;
	Sun, 22 Feb 2026 19:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CKZsWsZg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E9FCD43483;
	Sun, 22 Feb 2026 18:59:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771786740;
 b=udV3f/UT4c+5R8i6OarQyCdorw7iT6zypGGYsj5xNSvbxBnbic7CXdQmTim73OFljt3GW
 Ag8OIAnr93pxo4YExGclPFrMY08ZEutLO6LaECSP6sr3bIcwRyATfwIRU/ftWyPbrfP+E4h
 izoLNnnYpWo/0OHob8k73WqpKvnkkpg6URpOdVUBouYKcINu5iqDq7r1jxK32gM/nwF8DuW
 RoOiD/okFCnsTz7dmnomrqQTD9X+6WrlVOH9j9MblzpHWe/jPvYGQokHK8PoTqb686TYH9h
 qHjX5Aeo/oHRGbbn+C5OO8EEXfShil1KxJBmaVXW5uC91Do80n69SXeAUX5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771786740; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kl0zg2k1iWJd8IrCu/1XUcKBfdFRiyTicKU6LPJTRW8=;
 b=zUsxVLwWdIAl+BBkVxC5LZh8PAb2Eg/+DLSKCLQOyE6hrpo9FseCLeQv0X3X6PXoxDj1D
 A0ije6LKU4+w6ex9prOsEWIuvEqyVwxmfgM31CREXnxkSjJ+WS+p4ChdHb3Wq+lb4tT5mFU
 BRYoAiE8vtX6+edHx7rVQnbDP+nZDXpov3WUXTZmD4vz89YFBt5uXAbB8nl9QymQGLVui7/
 iwXU/KzMb7cSazDQovTKkwnn54YAmROXhOTyXweJB+VR8y4napZ1H3BZs9hXwtUXcTTMlK0
 g7bQOzaN/omqudycTCg4vHOYACet2OeMwqyayBYeULn39eanc3DCHxQVQeSQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5190D40F77
	for <nouveau@lists.freedesktop.org>; Sun, 22 Feb 2026 18:58:58 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com
 [74.125.82.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6986A10E1A3
	for <nouveau@lists.freedesktop.org>; Sun, 22 Feb 2026 19:08:56 +0000 (UTC)
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-124713e4244so205842c88.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 22 Feb 2026 11:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771787335; cv=none;
        d=google.com; s=arc-20240605;
        b=h6MOFyjxRDDh4KJmOTMARqXXJ9sv1teG7OvVPeD4+J0Ys+YRqEzmIPwgQhZzbYD4RD
         ItMBa21ILsBq8HOsmi1yYDePvYN15l5MRd8XkWjV5yvrkPKmebcYSGi9QT9mwSuxlsmk
         vOq5B0YOln09HgwMQJycOXI04sJYD5J5J7vxVdDD2d5+MrrymKGpuqzYecWWScer1oXU
         vFL1rXE3jSxzBqhpBfyBllPf64DFcgoBVd0bsmx1Cth6bp2s3dN1JO56/QUjoSFehKlm
         7dhwPxjBYlT2gRPns0CyfjJMbXNVTGdtgv0QW1sjOghQNZDniCradV2v80BEwDI70Rqn
         g9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kl0zg2k1iWJd8IrCu/1XUcKBfdFRiyTicKU6LPJTRW8=;
        fh=5gIY2LGVPYvlSDkCO+9Zo2PQl5bhh0gScdXYfhDRHDY=;
        b=BKpb8pFKhJEkRTMHJ/LYzj0hkEfd8RwTnqbaxONIkC9/VqJmDCRRzi14rUUnFAaOnm
         I+dYRGyNCkDLoBEtWoDpwR1tg1sL+93caWt6f/sb+ZZlBKlV439b2LDCtY0xTJcb7sWX
         zGlKhBlYHCcLt3hUNqSGVvCIQGTw3FJrSYqNxogm6P8+1FG1sY1hfmdy+sukwd704/2f
         jL2oasvO/fYS+cTBwGe/+dNGHuFjT0FqqGEPdOCSfYTAPs1WdGbBacbGAaRjz47p8rXz
         UCGeTzIwm6ve740tdEXKSBO10z3cAhhmhI9GX3hUTcjx7UqPUYvExqW3xTfZ2C7bE0vJ
         INIw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771787335; x=1772392135;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kl0zg2k1iWJd8IrCu/1XUcKBfdFRiyTicKU6LPJTRW8=;
        b=CKZsWsZgZYGtSgEinKeXxfP6pW8Dz1B82n9DFM8bMu3oyR1+an1wegeGOmQ72OmwDK
         JTQriBZ3n8ABKSRyOMEjfJ6p7S4vuqC9oTnvq8gkd1P8Sv12+yinUu8DZPc+KMU5mbZu
         HkTWMYxpSOHyJfwGeS5LxP2hd+hok5npdQr4KOSckhVL2OEPCd/35Sck4BomEx/rNMst
         Icf9EQhDZlbS6qRhIiH5sntiYeETcGLpRyPZCSRyS7HiyR/UXzE/TC3fnk2UG1XbAHVd
         bz/lExAhJNTozoUyffChpeFXUa/WblPIJL/GTalbHk70ZIyc3RBQT5AwB1YsJNVh6IUZ
         l9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771787335; x=1772392135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kl0zg2k1iWJd8IrCu/1XUcKBfdFRiyTicKU6LPJTRW8=;
        b=ShN+5aijU/w7I8DjZB6oVJCZUbcBwwQLyKoBt3qk+5RL8uDbAuNuFgJx9DVMU3qOoM
         yDIcP2UWrCAgTEIBkS64wM5+P0TNZrU+XkT6RJLzpGIfzACGGzAl2VeM0uiwWTefoQBB
         baLy5QG4+E30i35zZcus8EnAluA2gWO4Zky0XeFq8TyaPNNmcBnZS4y5mEVBioFl7Zpg
         1UDwmHdLHtKS8lzDnAfyPJV/P+EOo3la06Hm+YANuk8ap85Fzh33GSj0vsvsZ3DmIP0S
         Nm4c9d9O4uhan8KNrz57tLAMbGoHwOnR5e0rb/m6mF959mkjwiMlx7Scbg8TQ9CM54yA
         Qcpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzi89wNqSjakBox3uZxuCOxmarhVxVL7NSTElKX53uDzJyQluHi48Xqz+e9+KSNh4brMA6KsY4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNWDfPIUz/lkgcNMT6OyKBDPkDGXtmomW7/+70NLc+2wlbffy1
	G3htssIEuOBEvz/H/+pEbjV6tA/O/tKpdf6m8THkdD3rEqiw8VfpdlK1roZv/V2TqUX5dOM5mlW
	Ek6P6zYFij5a5DUQObOwFRbNawJm5QT4=
X-Gm-Gg: AZuq6aLnsEn/ltfaCDmaQ7oMwQTZyxts9M1r9RNDDD2kFh/ezs5VcxxF/F+OAET2X9e
	V3XluHiaFYoJ76Vv70X33FhnaRfUflZrNide0QoyJoKFDCBU1MPxeltV3K2lDUNdvO4LNKiwFHv
	Gf1HZ+KPdYfb0LA+dmacX1rnMc1KAecYO46Cxsc9OEPuhOtL21nwypjg26jXOLEMElMigSulvTi
	H3ONtj9QF/7NfCSz3N0W7nDTv8/1XYr9ou1iMbxXskvPdahV9c9tTeuCrsTuVK8g6pYmlBKe4k1
	o6I0gjgNoVnIWe1zTsURY/WirpcgvODXvSEF647D56feoQ5E8AI2kACz2x2m6qNl7bbCYg8lHP4
	Rn9iNel4QV31uuhlhTLgtgaZ0
X-Received: by 2002:a05:7300:f108:b0:2ba:6978:2b0 with SMTP id
 5a478bee46e88-2bd7bd5a67fmr1315684eec.4.1771787335408; Sun, 22 Feb 2026
 11:08:55 -0800 (PST)
MIME-Version: 1.0
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <CANiq72n46KhQv453+9nMWxaXqo77PT20Ya6iw=fiR+oyrPDquQ@mail.gmail.com>
 <86600a42-9eef-4c2c-84c7-112f5b9b2509@nvidia.com>
In-Reply-To: <86600a42-9eef-4c2c-84c7-112f5b9b2509@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Feb 2026 20:08:43 +0100
X-Gm-Features: AaiRm50A_nGtqy_lbkhZtu_nezZAudv0DOJyllseHvbfunV8fSHzfBOG7cfXEzY
Message-ID: 
 <CANiq72nW3MDdBDbQyPfbc2t=5sLEhc6ThpJ-PApcUgpS3S+ViQ@mail.gmail.com>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: O6V6VB6PG3Q6EMBXZSDGBH4QDUSIVXUR
X-Message-ID-Hash: O6V6VB6PG3Q6EMBXZSDGBH4QDUSIVXUR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O6V6VB6PG3Q6EMBXZSDGBH4QDUSIVXUR/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72nW3MDdBDbQyPfbc2t=5sLEhc6ThpJ-PApcUgpS3S+ViQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun, Feb 22, 2026 at 8:03=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Works for me. I was anticipating that people wanted it in rust/ but
> I'm perfectly happy to keep it local to nova-core.

Sorry, I didn't mean you necessarily need to move it -- I only meant
to point out that if you do, then you don't need the other changes.

Cheers,
Miguel
