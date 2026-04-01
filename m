Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC96D1076387
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 17:39:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA2710ED70;
	Wed,  1 Apr 2026 17:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hWUQ4/mD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BC93145473;
	Wed,  1 Apr 2026 17:28:27 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775064507;
 b=jkB/WKj6oUMB9n6htxe9JB+OzEeYtbi06iJGgPZp/NchD9ZJ50ViA8e8iVtTeB0KMbFHa
 cbNvuAjbyO9/SCnMivY9CnwZ5femkciRz1L10I4KaBQYhKNeAiQmf58Ww5JzHXZwOCGCREO
 fcwcF0FuKcP9KpR0DWCPacwI/IkpDM490DGNbI5UUwp1W7Y6RDlb7wUkrBJSQHn5ZsuwzLB
 jgv1lb9vmcfSg6KyHcT9DMyodNhRzadYziQ882o+llGFf9M3QcVXTXxQbJtIfj/H1q8BUcm
 4CEvZ/fCkkUffITxyeN4A6MkKY9yCz5RXjno60N0/Ne3ieUmBh/wxDtJDV6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775064507; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
 b=MKKBHmGRcL0hF1FJXWCx12G34RcviEdwETiJFO66CKV5vTiSKRDHut42CkdF75MYJDXNF
 BjV1AiRjs2/J99uNJ5sgNczVpD2k1ZA2JMEwzdLXSXNcOHvY6PED07Up4KvJ+sTyBXpCMxH
 KQH1a+Uq+tF9uVpKYMYXm3JNjzj1bLQZ+HflgLM5MeHSSCnd2PRcZp8/rONtOxm4U/EgOAV
 JwnetUrgvHTdiWGniVQxinaX1Tt2vDK0OwiwIIOhdYG72Hoh/vuk8aZwyokawIQfpOFYkOp
 /U8W/bRIeBUToWS/Gangdi3uegRWmifWhzh5nam53BRfwPO5ZnySY1cmauAw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D99DE4534A
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 17:28:24 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66BD610E756
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 17:39:47 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2bda3b4318dso4976eec.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 01 Apr 2026 10:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065187; cv=none;
        d=google.com; s=arc-20240605;
        b=XZJYbKRZx2LNIgT1+yJGhTCBMV/+Sla2VCnf6ShrdK2PUA56nFQ0uFTbmDt8O9QYRh
         bQj4+lACT7aUG9en/BdejDIw/BszEbEabL6JgzmWoZvK/pNLx2kLOJ2ArCgjdj7MIFoU
         msjZUAbFVAzh/MD8H/oIdsbQ6kxppBjy5/FyM52ZVxu/dotBiRJR5KadrzD0DzmiPMqk
         YvNV2ZEWxHUpb9Y7U7/ut8Y0piThphGPBDXVNdDZQiqpsrV7foIpuLPq9u5+g1uFSP5x
         AuPpLJc0TSIPd+YEJaBNQINJpns5VOp3yzIP9zvWE7+0qGJl8vJS1ldBK6hXHrzpLD4L
         vVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        fh=RbSr4LvzvSJ4c5I2HiZedmm7+5TrPh+Q6MHD7VWgAbM=;
        b=PqLiA38OHRlmBj9g5g1xxT6roRj/Fm05fJ+AWXaFV+Htrh8IZfegWtTVuX13hThOp1
         6orKTA8ScejdkuyY8byRioqrvoMxqer9szt55Q7os5ntb/pTEawf6cxpKrKAtk+dSSfW
         IUKsAMRj9t9YeDmabKd60ZFGvo7HufFeCyVqq0DHz8HrQORwDw4s2H/0avBQwRaf5ZKj
         6cOVAFnGi0J6J0G42kRvKVvpGuYKVg6WbSK4Rv5JS9AReGHUVI+qlIOs0j2/Ry47lQIt
         dEfvvfRCTpKRa5C4YpK9GJbB+m7pn83HCySOIiCAWNApE5xinfkA69RTtpy7yUTru8Ko
         L2mA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065186; x=1775669986;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=hWUQ4/mDCNNpbFCn4bI5SYdjvD6naFeFDgjqLJPXbUHA3TlyQ1d6BK7gcqlFh37roA
         2MxtOwTxxuDn2++yzCPCQWxZAFPA/iY1IAWUyAMRBF2bn+SovsmZpdn4IRp5JXwehgL/
         WlnF/9Sae4cWG+OI5JJX3gYDgUUfDtqvfMsc1NjEbtg+AJfKTpIlsy7Ox3+TjQ+kJ6fg
         jFlcjgko8bNDQLDL+8xv5yaHSW2WAQHvyyEbVANhlhT1afzHJQ8/7EMK6y44DN5yF8sr
         52Zh5Xod26wN1Trug+MNOOERyFy/VV87Oz6cLyQbhXDzpRmWVFUpIy9RNsg2TABotTwD
         moPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065187; x=1775669987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=b1rYp4uGM2SWofjpHAZsXJMpBoLupDrdfwI+hqCyz84Uv5AOXadQdziUWWV45H20fW
         KP+w21TF/C3wNHRCy4oKLpY+K6VurdkK5UJHfrGlYS1WSdDFSNfLbyUH+5u188nUI0A+
         hp1aKWBjhM9brKrDg5jT72ooBBLw4zoPZ2oVrgSGa350/+C0G1kzjv2W1SQip1E1gj7s
         RbL2gQTNPPtS5SlvEAsNMPcTFYVP7ID8MUt0uhm+kLJsghi2SnCadpFhxhqesozEXcSL
         STUziws2nIIYJB3zK+lqLF7d+DSTn4LERhlMNx9v7JIVniEzIjshex6TsrhWKwaOHPBm
         Ugdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlsscMQu7fqetpma5pvLDExGqoAJlhLSm/9AfMzko+nHEdom7Jcf7Ci30BGDCA4PB7cm+ibORg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPlLl+0OUyT/q454dlEONo+tQBGBCMziMcf66Wv6ES8PxJ/fkX
	PUXoCLuzV/9J71bFf+E+GFr+Ps/hOVUoCF8Zucf7cCS06FbnCRMEIezCarKxOrn7TMP6mYuzy6N
	4cIcWFRUo3VS62M2InnZQScQfSiuO6IE=
X-Gm-Gg: ATEYQzwjVNK7ukzqe/vgOud1L+R/jKcAgRTblXyATbmWibWsXSRHkqeW2NW4kG7FKfP
	+AyzMH9prYY8U1YGMKzjQBtvloc+E+5DmOM26jAxhTRsw2uzKjAX9AiW9FeMx6PN1GJqLdLX9/D
	u5Hrdg4VQ+Sc+g6JXbgjY37Qwu0om1mvZwwe4Fmvn10CJd9V7TR0vgzOPlQzLLLZQopwv9T1O+O
	1XsfenhFkV0hi62aYUCKIAdGZZZ/p80y99YFNmlN3S6yFo18j2zgErpLrBCPJVnteCQNzKIHQZZ
	n/YgSJ+dX8jsocxyqXzRFHVwGqa2bHRHcZ6dkwZD0SsSGMtGE3Bhi11WcW7XUhrr4IxVnRKRytd
	j+k3oaZGu8MXbXSXadc3OXF/U7GdIpLwWVg==
X-Received: by 2002:a05:7301:4586:b0:2c7:2cac:8147 with SMTP id
 5a478bee46e88-2c932cb3abamr970192eec.5.1775065186457; Wed, 01 Apr 2026
 10:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-10-ojeda@kernel.org>
 <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
In-Reply-To: <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:39:33 +0200
X-Gm-Features: AQROBzBO7Aafw_pbzha_JEZl4Ht2QE7dpytXYa0WjnL8RQv-FxGnezpSMqEOLn0
Message-ID: 
 <CANiq72kSYFiS6zN+VLs2URhAeHy8_-aEXki1pyR0qoj7jO-qSQ@mail.gmail.com>
Subject: Re: [PATCH 09/33] rust: kbuild: make `--remap-path-prefix` workaround
 conditional
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ELLTL2BIVIPPBJ3SEHWZBH2T6MYPJCTD
X-Message-ID-Hash: ELLTL2BIVIPPBJ3SEHWZBH2T6MYPJCTD
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ELLTL2BIVIPPBJ3SEHWZBH2T6MYPJCTD/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72kSYFiS6zN+VLs2URhAeHy8_-aEXki1pyR0qoj7jO-qSQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 1, 2026 at 4:08=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Okay, I see what the comments mean now. Perhaps squash this to the previo=
us
> commit?

This one was mostly to ensure the workaround was not needed anymore,
i.e. it is more "optional" than the other.

In fact, we may want to just not have neither of the patches, i.e. we
could just remove the workaround given the timelines of the branches
-- please see my reply on the previous one on this.

Cheers,
Miguel
