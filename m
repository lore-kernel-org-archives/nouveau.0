Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE74FD007D
	for <nouveau@archiver.kernel.org>; Sun,  1 Mar 2026 23:43:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5871310E339;
	Sun,  1 Mar 2026 23:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fBADYtrh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E61FB44D27;
	Sun,  1 Mar 2026 23:32:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772407971;
 b=aoo0RA0ujfjkd2NbgtbGCZ3ktyPh5zghc/uYfOl3X5uh52ngnS3j24ZXmQpy2TyQtm6iD
 PDJN1XCOTkqIPsoS142cz//uzGv+U1f/U93I/V3QUvSj8vt9GK9/ZqVyP1HfAdE/Hf8pgKK
 krCpJ41Xz5cgsJP7/w1yINyDkThmrxRoEHm2cQvgoLG175BvOfYEvHJxNKqQZfR48p9BUWE
 dEnMsQDwFJt8xWNGWAgP4p7XJbsowZFHpws90ljiWWe1QyzaBa36P3+hxpq9i8Epv5B1YN0
 6SQz9T6K1Yucp9bYuKEksq7dchZPcpI/lmmlxA6XI84QVAqr9QdEHAHWbsfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772407971; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=U1gYsY7zWUiNKxFF1e5Vu7YTdyDgHqmsZtnGIts9t9Y=;
 b=EfZeVbx5nOyHGXg9drH6PMah7p6UF+AFfNKdmmKs2Jps5hB39GarXuEaHdR0+kufF9F7j
 K7zTgHfpM8/uj85Ji6dF8BLq7hYN3HrOAhfcVixA3schdK36Pr35S4mCVIvaTQ2pG1AkAQe
 5sVMEhoqtIf7kxGxCBP8zeqSZ+5nmVoe0sJy0iATSBO/O9xIi5jAlKB77QDqx3xaxkeNQiR
 BS0ajnimMB0gA5Lwemk8JVFtJz0oo2FFgnBi9bGxjLOXxr+E4pWmg4QiJ4I9cy4AbhajUe8
 d9rNrDpKBQ/HEhLgLtYoPnX2vHjAWgEEGI/0dr0uZ1lT9+JECJUeae13KBhw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3C6D24055F
	for <nouveau@lists.freedesktop.org>; Sun,  1 Mar 2026 23:32:48 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 63AD510E335
	for <nouveau@lists.freedesktop.org>; Sun,  1 Mar 2026 23:43:02 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-2bd801b40dbso275621eec.0
        for <nouveau@lists.freedesktop.org>;
 Sun, 01 Mar 2026 15:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772408582; cv=none;
        d=google.com; s=arc-20240605;
        b=EqKU55N6l5eZ5LeHnVXr27DRT44p02VIILAaepLVkyCQiptwRfI/EDu2JjThFem9/n
         rsFI1jck6ccTcu3tMRka3//disyqmHKH8mUBVbknxojdgasahYc9cnXoMXz+OtVmvrsd
         AgfrGEISpKj2Or4lGsbUS7GomgcuNeSJMTLzBjm9hYCZNinSipP7Ri8SD6Lbw+1eCcAi
         5DXdYbn+9eEPXWba9rGGREFQvlXOAG6Rx1Ko9XIpXlPxNJfI1nLALZSq+V54m13OBsc6
         KfwXgY/IQ9BjTlq0+LSje2VVCBPzQczXS4hcivEP1nnyHJhJAntIm/V3a+0Q2Diz+cqt
         p49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=U1gYsY7zWUiNKxFF1e5Vu7YTdyDgHqmsZtnGIts9t9Y=;
        fh=KYojMjf/F9/0szltJlCPjrYVPGTZ45ZLBSiU/W0u5R8=;
        b=Q4Ikl2wINJChpB/z2RajLGT5BBuVC/GQEv4FobxbkLmRfhb+YV50H6aQmvi73c8BIq
         9Skqu7WPhJIA7uV6ipQbZH4BSb9Qw3nAnPfeoObCR+pJ8tB3T3ktb7P7GJN/IcwLJtL8
         QVPuAs1CnjBfwJ0XL5K3ZWnMoCQnUBgoX8yS+vGEVzY71XCDNh+Vgxix1Fo3e+heU9RB
         wvqgmkVQ/3a0CQAUZ+F4KuN283hTqO7ut6mXdZ/vxxC3c6QxDhuaz/KLl6LvqC5MO0NV
         MMMHbazH6bOHK5v2yXZh014BsurwdtDG1It25XcH/AdGBR18+zmMwfykXaDS0Sfoxcni
         AYuA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772408582; x=1773013382;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U1gYsY7zWUiNKxFF1e5Vu7YTdyDgHqmsZtnGIts9t9Y=;
        b=fBADYtrhSL5sWU9PoKgJ/e0XFkadnydpGbZkoieciexm6qenQ1n2VBUNs0kWAcI+Tj
         NhpAVbviO7eQNSLHoja69l/fLnV1+5gPu1cz7LfBYIS7gO+A5h9fheM9gwUkDoTGTAmN
         ZL/k7BnPQ/OFC5AVFO9ux2W4GqWCm3obCF8NqOJ81+rEZ0xPuBRcpxfE1+8VENykAno3
         gJUH57SfH1nOI1xOdUgbJyHLBjSRmeqZd8GmwZxyF5kuKUAqET04I5xS4opZAJNHrGpy
         gJIjUILuDHSHX9BPv0R6po3dswCmn/Lqcnm1Hf6CIgyhfiu8FpkLKjsSxdrAgOr9iNot
         2RGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772408582; x=1773013382;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1gYsY7zWUiNKxFF1e5Vu7YTdyDgHqmsZtnGIts9t9Y=;
        b=bKt3+n1B47ukTd6Yqa8mWq31IxAzrK2rAuIVrMxzqTUtoQE07Fc6ZEQaFynPjzskp4
         9lmn9mcUjkjQVBAL6TxSEfMiqk8Skp1t7ztpROv13ly7frqtKjQIbGcCATXUFsDT1zQU
         QKO6VjNKttFS8JxVh/qS0ORmkNMZWevhjEz/lICw3QqUPtyu1cWvEBl9pJhe6ve9HPaD
         yinqCP7oe5TKvcwDyG3CW4MtfafM+zJ8EYTcYagWz0Pom1TkS/M0FQ1wKjC78kIP0ogA
         sT8ZGI4166KejcrsO/mf6FK/QD80/sJrZcFftzjW8zsTC1HRhTwJV8QO+FzLXPZScX01
         Y44w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQIj8krVbdChX/aoEjD1gxfiDQJRrY0OYmyhvyDMBTMrX4mVJlCIAat8NzceDttSFduRjRP3yT@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm/CBVT0C1cC9Gb6rmFsi4F+AmyEiA5ahOw5iQa9qCFzeGyDrp
	hZ+RtMYFahz25e527GUt/74hfbFY2wR2SxwK0B34cBe9rTyj+xWnYPbmOqpjNEQ6JNLMYjxDyW1
	VoXKwe0KkRQOkpKr2ntp25yenZ+JKyNI=
X-Gm-Gg: ATEYQzz2vrQj/gIR8+g+AySL8Rmpv4G3K/8fBdmO7s7yrKXKxCH1um/qBdYk6m6BQSB
	d9RkYLAiFr/eG5YKwdroG9i2RQMM2BpnwtXJ4F/n6cbjJxLOGQ8EchpUi215THU6J9Wi4HuHWDF
	IzNeERDe07lieqPRelLgTcJhSVJbIAM2IXh7ezm74EsW/KVfc7StecqCgR3UVXX59xuALTTaMSo
	XeytsbYKsSMTddWRK82XRU6nlu3VZwWnqfedKPS+rK4GFZgeLJgaq90m6JhEm0ponOFOGbjeEiY
	4HZ1ajKuQEECKp+lCoz1jqXh7ezvkcfZC4QCY5MioGDxumhDbYlsmK4qT9qPPD2g9u1QwtBDsla
	iM+suvi+RagGj/EtYtSUZaZv/1CrU
X-Received: by 2002:a05:693c:2c8f:b0:2be:171c:2177 with SMTP id
 5a478bee46e88-2be171c2ccdmr15106eec.7.1772408581518; Sun, 01 Mar 2026
 15:43:01 -0800 (PST)
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Mar 2026 00:42:49 +0100
X-Gm-Features: AaiRm52fTXrGz5PlTORiyphpsPMjHdsF2ymu7kB9CFR5ioFaHp3gh72XIk80BjI
Message-ID: 
 <CANiq72mAQxbRJZDnik3Qmd4phvFwPA01O2jwaaXRh_T+2=L-qA@mail.gmail.com>
Subject: loongarch64 objtool warning with LLVM 18 in Rust object file
To: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: INGGCRBV6OKGAXDWE6UHMOGD6NTXDADE
X-Message-ID-Hash: INGGCRBV6OKGAXDWE6UHMOGD6NTXDADE
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, loongarch@lists.linux.dev,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/INGGCRBV6OKGAXDWE6UHMOGD6NTXDADE/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mAQxbRJZDnik3Qmd4phvFwPA01O2jwaaXRh_T+2=L-qA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi objtool & loongarch,

I noticed an objtool warning in a Rust object file for loongarch64 in mainline:

drivers/gpu/nova-core/nova_core.o: warning: objtool:
_RNvMs1_NtNtCs3LxSlPxFOnk_9nova_core3gsp4cmdqNtB5_4Cmdq3new+0x238:
return with modified stack frame

>From a quick test, I saw it happened only with older upstream Rust
binaries (1.78.0 to 1.81.0), so I suspected a switch of major LLVM
version, and indeed with 1.82.0 LLVM 19 is used instead of LLVM 18.

With LLVM 18 I get:

    addi.d          $sp, $sp, -2032
    st.d            $ra, $sp, 2024
    st.d            $fp, $sp, 2016
    st.d            $s0, $sp, 2008
    st.d            $s1, $sp, 2000
    st.d            $s2, $sp, 1992
    st.d            $s3, $sp, 1984
    st.d            $s4, $sp, 1976
    st.d            $s5, $sp, 1968
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -112
    ...
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x870
    add.d           $sp, $sp, $a0
    ld.d            $s5, $sp, 1968
    ld.d            $s4, $sp, 1976
    ld.d            $s3, $sp, 1984
    ld.d            $s2, $sp, 1992
    ld.d            $s1, $sp, 2000
    ld.d            $s0, $sp, 2008
    ld.d            $fp, $sp, 2016
    ld.d            $ra, $sp, 2024
    addi.d          $sp, $sp, 2032
    ret

While with LLVM 19 I get:

    addi.d          $sp, $sp, -2032
    st.d            $ra, $sp, 2024
    st.d            $fp, $sp, 2016
    st.d            $s0, $sp, 2008
    st.d            $s1, $sp, 2000
    st.d            $s2, $sp, 1992
    st.d            $s3, $sp, 1984
    st.d            $s4, $sp, 1976
    st.d            $s5, $sp, 1968
    lu12i.w         $a2, 1
    ori             $a2, $a2, 0x870
    sub.d           $sp, $sp, $a2
    ...
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x870
    add.d           $sp, $sp, $a0
    ld.d            $s5, $sp, 1968
    ld.d            $s4, $sp, 1976
    ld.d            $s3, $sp, 1984
    ld.d            $s2, $sp, 1992
    ld.d            $s1, $sp, 2000
    ld.d            $s0, $sp, 2008
    ld.d            $fp, $sp, 2016
    ld.d            $ra, $sp, 2024
    addi.d          $sp, $sp, 2032
    ret

So I suspect the stack pointer is not getting tracked properly and
thus the mismatch. Is it a known limitation for `objtool` on
loongarch64?

It is a very big frame, so I guess maybe it is not even expected to
have to deal with such a case to begin with.

I think we likely want to avoid that big stack size to begin with
anyway (Cc Danilo and Alexandre).

I am copying the full disassembly of the symbol in the case it
triggers the warning below.

Thanks!

Cheers,
Miguel

[1]

<<nova_core::gsp::cmdq::Cmdq>::new>:
    addi.d          $sp, $sp, -2032
    st.d            $ra, $sp, 2024
    st.d            $fp, $sp, 2016
    st.d            $s0, $sp, 2008
    st.d            $s1, $sp, 2000
    st.d            $s2, $sp, 1992
    st.d            $s3, $sp, 1984
    st.d            $s4, $sp, 1976
    st.d            $s5, $sp, 1968
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -112
    move            $s1, $a1
    move            $fp, $a0
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    st.d            $zero, $a0, 0
    lu12i.w         $a1, 129
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $s5, $sp, $a0
    li.w            $a3, 0xdc0
    move            $a0, $s1
    move            $a2, $s5
    move            $a4, $zero
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x6c>
            R_LARCH_B26    dma_alloc_attrs
    beqz            $a0, 352    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1d0>
    move            $s0, $a0
    move            $a0, $s1
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x7c>
            R_LARCH_B26
<kernel::sync::aref::ARef<kernel::device::Device> as
core::convert::From<&kernel::device::Device<kernel::device::Bound>>>::from
    move            $s2, $a0
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    ld.d            $s3, $a0, 0
    lu12i.w         $s4, 1
    move            $a0, $s5
    move            $a1, $zero
    move            $a2, $s4
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0xa4>
            R_LARCH_B26    memset
    lu12i.w         $a0, 512
    move            $a1, $zero
    add.d           $a2, $s3, $a1
    bltu            $a2, $s3, 292    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1d8>
    st.d            $a2, $s5, 0
    add.d           $a1, $a1, $s4
    addi.d          $s5, $s5, 8
    bne             $a1, $a0, -20    # <<nova_core::gsp::cmdq::Cmdq>::new+0xb0>
    addi.d          $s5, $sp, 32
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a1, $sp, $a0
    move            $a0, $s5
    move            $a2, $s4
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0xe0>
            R_LARCH_B26    memcpy
    move            $a0, $s0
    move            $a1, $s5
    move            $a2, $s4
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0xf0>
            R_LARCH_B26    memcpy
    lu12i.w         $a0, 64
    st.w            $a0, $sp, 32
    li.w            $a0, 0x3f
    st.w            $a0, $sp, 24
    li.w            $a0, 0x20
    st.w            $a0, $sp, 12
    st.w            $s4, $sp, 28
    st.w            $s4, $sp, 8
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    st.w            $zero, $a0, 0
    st.w            $zero, $sp, 20
    li.w            $s4, 0x1
    st.w            $s4, $sp, 16
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    ld.w            $a0, $a0, 0
    stptr.w         $a0, $s0, 4096
    ld.w            $a0, $sp, 32
    stptr.w         $a0, $s0, 4100
    ld.w            $a0, $sp, 28
    stptr.w         $a0, $s0, 4104
    ld.w            $a0, $sp, 24
    stptr.w         $a0, $s0, 4108
    ld.w            $a0, $sp, 20
    stptr.w         $a0, $s0, 4112
    ld.w            $a0, $sp, 16
    stptr.w         $a0, $s0, 4116
    ld.w            $a0, $sp, 12
    stptr.w         $a0, $s0, 4120
    ld.w            $a0, $sp, 8
    stptr.w         $a0, $s0, 4124
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    st.w            $zero, $a0, 0
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    ld.w            $a0, $a0, 0
    stptr.w         $a0, $s0, 4128
    move            $a0, $s1
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1a4>
            R_LARCH_B26
<kernel::sync::aref::ARef<kernel::device::Device> as
core::convert::From<&kernel::device::Device<kernel::device::Bound>>>::from
    st.w            $zero, $fp, 48
    st.w            $zero, $fp, 40
    st.d            $s4, $fp, 32
    st.d            $s3, $fp, 24
    srli.d          $a1, $s0, 0x20
    st.w            $a1, $fp, 20
    st.w            $s0, $fp, 16
    st.d            $s2, $fp, 8
    st.d            $a0, $fp, 0
    b               60    # <<nova_core::gsp::cmdq::Cmdq>::new+0x208>
    li.w            $a0, -12
    b               40    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1fc>
    lu12i.w         $a1, 129
    move            $a0, $s2
    move            $a2, $s0
    move            $a3, $s3
    move            $a4, $zero
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1ec>
            R_LARCH_B26    dma_free_attrs
    move            $a0, $s2
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1f4>
            R_LARCH_B26    <kernel::device::Device as
kernel::sync::aref::AlwaysRefCounted>::dec_ref
    li.w            $a0, -75
    lu32i.d         $a0, 0
    st.d            $zero, $fp, 0
    st.w            $a0, $fp, 8
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x870
    add.d           $sp, $sp, $a0
    ld.d            $s5, $sp, 1968
    ld.d            $s4, $sp, 1976
    ld.d            $s3, $sp, 1984
    ld.d            $s2, $sp, 1992
    ld.d            $s1, $sp, 2000
    ld.d            $s0, $sp, 2008
    ld.d            $fp, $sp, 2016
    ld.d            $ra, $sp, 2024
    addi.d          $sp, $sp, 2032
    ret
    nop
