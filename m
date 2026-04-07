Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD04FB5178
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 01:15:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFC810E30C;
	Tue,  7 Apr 2026 01:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A6T8u7U4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AD33D456AC;
	Tue,  7 Apr 2026 01:03:49 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775523829;
 b=fo0YO3ItvWqfUAD9+BpZMGDpOw1c9dhYhqwA9ULrLYNLcUZ6yb/BA0sKIQ15Quu5wEtpV
 CMMAUstZ+TQMw2AyrG9R8yiv+l/zx13AvM8HhP4dE809f0o5A0WWglJS7YGzreViwuq5fiV
 iwnoPvoQ+BHhldRDQn3PT22TXF3NbrVY9KrU6C7GqbvgU42P4GPxBGsnZoHTh2QMysTLks7
 HQrEftNrY9Eg3lqjMT2RL68rKajpl8cPesN4ztmItFE66G4O0ir6AxEHXmY4tdYaXcr3pbC
 /F/rvqbZX1WgUDSGXHc5Lz5sj810mGczEs1REVXuQg+MtTfR+g+1Pxnm3GuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775523829; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
 b=m09L/vOx0VaLif8/p02cu1iqAh5BH6K/KaSZ9gfllZcWP79V5Pnrvbru7rnBSvQxkx2v8
 DGSNKgYpa4sbo+MHyakyw2JXQo2pP8rYkjM5bcRJETYxAVyGlQBAcEIH5oU7oJsKJ7K9iDN
 y+lPKxehvwFwxtd9E06C02imlcoigHe4PfJrqZpLgs7yvzxfN6pngmnifw0Rdv4gNQ1scHG
 A34JO5IaJnlEhjzq7+wbuAv+rSuoJSofXl/zrWTCb8GQuiqcHtTXe745R6yNdtsvwf4U4S/
 3kw2ce4peXWC1EQ/G/5qPtMPvXO5voJP3UoTM/L4+DXgYGryQHY7f2Ol76Lw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D6C1045261
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 01:03:47 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com
 [74.125.82.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 306CC10E305
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 01:15:22 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-12736a0147cso275722c88.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 06 Apr 2026 18:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775524521; cv=none;
        d=google.com; s=arc-20240605;
        b=HCopvMIUdF37lCWrMYdIuZEoCxnEdNLLx/eN4oB3fD0cM3JO5dILhCFfJBchaZPDpA
         kdyGXHZU18KnJveS8aq4tBP4R0RodpMNKBmmEgtmveSAWlbj1QK3ERTGVjr/c3oGKL3D
         4shAiOAtwavMNuJHvqZJASl8xzaRfHxKq/IKcAhdnmuA23ESbu4trxIXTEzcR+EC8fya
         S/lSPzn5FB3Sh33IzgMmqpayL2DJOjFcTDXfB+3+SQX1Fz3fQAt/eOu+UEcODKa7OPna
         7lUCbSzVevq5zD+v8LPw/ecD88O6Vf2N8s/2TLjtPKWIjHo9a5h34zvv0Hqcsv0LPO5f
         CEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        fh=ubdchgflahZNMA+QdRViZ6w1zuedRi3J7N0P8iOFUeo=;
        b=Z5iy4UTSsokeRyP0Ms5qCwRNMahcoQbfZeszGcV80KuGi/+ce7U/65xKa/Yj6cBte4
         l+B/L3KMYeFvwbSZq1e9HpTVTKRQpTzBTSLvD+6ACzhs+UNRkCnN/na/g+dAdmlkliOF
         eNZk4Kry1lF+Xl5cJoQnxNsBahcrZ4zjdpsFG98Y0x11niWlwDYBeTZE3fnOz1ncbNSO
         EM1/9qssZ3VSDrBqaeLg/1Ycvkdebxu5sJhFRwduT5acaw44TtneaAHzY8FZltwgrN4O
         42bTJ+BMW78AXsIrxYKxKQWpms83cKAuYklCXbQdUEn/Mer2s9wNJ5n2hAG2GGpd3yvM
         XCow==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775524521; x=1776129321;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=A6T8u7U4KgzlbM7LWJEs/2yjmMumMK2UOHdujcSRdrVtaw0dpROH5bs2/t6mih/Scd
         BMkds6RWnFSAU84CF4FQ1GapwSty7mPfqYb8gddSF/ngLKSYvMNV96+NSUCqVOEfGDFe
         SV6joQs3tJ6AZxQfkpA0cXPvMc9Zv8eptZxPtxEZML+ZTmVwBvV5gFabMo6thP578Qtl
         DNSV/OeSPDuXRTNQCRHL2pOaa3bzfG65j+eAXzvb1ObbZ+rc+fdrqR30/4PK4tZVngPE
         egyBe6GqVKAcE2rMeHGIbVjcz/d8aGpmZE+vxAZYM5GgWR94z2TfmBeKJ/Bc3AVprUYu
         GQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775524521; x=1776129321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=UQnlka7Pj2x9iJmBW7fXLC3igs+2T3pNjSGdLYoB2BVvV3evXNcvvAT9P4l9KjSVVk
         f6lGG/WQDGie0mpVsv/6G76JVP6LvUl+Qlv80O+syMzlGacut9oZY8yHL9adlVG3QzsW
         XkAXOtDW+wOyp4mGVqZRjG3DGIffTNynGzpjzLHRA/RBu8ODWq5oJQ24Z80zxNfAUUKF
         iOKWRdOuVlHNIvQQeB97KOvcZQTybEtnxd7BUTDCJUQtiZKXQXSgko4CaJm5uQMjeUUK
         ks6ffZK5hfHAtOLNLgrUoySOuSGc84Hz+4hllZOfHF0mjf26v6FCHH5qYKBb2BWBubuP
         YPWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBPt/2OqKSsNk01WEh5retGCR1F05roCbAjj3wc/niDKWki2jN/Ui+4fI/YqnHT0faB+9Z7vZv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ9grI97ZdnPlcof5Sfr8DfRgVo7YklQQXRLHKf9KIc5CFUWAb
	NGmw6UgCn4WTO5bEvmw9Emv0zRUnFbXZBec77WC+HGxQjZej1rGdaugeTx6oTOZwJQwBzPEQnqO
	A38Io95Ichw2DZPwdrRd7/Om0RgJ90RE=
X-Gm-Gg: AeBDietulSkwtqHeatsc0lG6zoyZBbDgT+tGnmhgCX9oG08JG7d5aYZONaj0ief+Rbp
	zaY9RV9pW1bk1TnJgKtvJeWQeukVx5TmZnScSnfGd01naFd+eu10yuOrILsg5dVh9HtxAUhk2Oq
	JKAwzEkzNoaB1PqUp81PVIQArjkRp5LtvJ6UKolfYKiSXHU8W31EhShAjrzhcIas/dUsujHdURJ
	oNoKaU7TthNYhCpqRjFdUJPL4uhbjxBvGNckNbAAl7OXPMrkjq5AEY3s1H65AMcXvp7ejKs9pzk
	3bzzwQ6JsmZ+r/ASQteBsUkGxlhjRUauY744FwgCOUgB9rrOfOuvVSX8bWuO49ao8tEdQ13g+x0
	Vojgasp5IVUVhvwAATup/Rcc=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr3516734eec.3.1775524521173; Mon, 06 Apr 2026
 18:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
 <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
 <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
 <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
In-Reply-To: <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 03:15:06 +0200
X-Gm-Features: AQROBzCpjGVGSHiqD6WWW0AkLWSnE3ic7jf8UnYoPnV_5tut3XVgaNfJWwQj0o4
Message-ID: 
 <CANiq72n84On9UxQ9CNqyFb5wpJZKrBzb1Xej9ZRqhLim--ftAQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: F34INTOBEO63FINTARQWIWCVBJKDPO5K
X-Message-ID-Hash: F34INTOBEO63FINTARQWIWCVBJKDPO5K
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F34INTOBEO63FINTARQWIWCVBJKDPO5K/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72n84On9UxQ9CNqyFb5wpJZKrBzb1Xej9ZRqhLim--ftAQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Apr 6, 2026 at 9:07=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> That's what I thought I recalled, too. Weird that it is not in rust-next
> already, though.

It is normal -- in the kernel back merges are generally to be avoided.

Cheers,
Miguel
