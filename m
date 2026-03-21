Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8242F109449E
	for <nouveau@archiver.kernel.org>; Sat, 21 Mar 2026 23:22:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED1210E31F;
	Sat, 21 Mar 2026 23:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kucJdISX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 48F1A45259;
	Sat, 21 Mar 2026 23:11:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774134678;
 b=WMZekJJ7t0LAxW36RQWHIkZsjsqhLmnr/y3spwdsZpq8mXEh5DOm4hzzg1wzjqNoLIwA0
 v6DWytnluRi7ZYEHPrms/e9cEU/K9/GfnJfd04Ry94vbdauZV/sLxmA7SH0BNl/9b2er8JX
 DYryYBhSIouhKpYyMa/1wBWK2l1yP5OTpOfMTU7QdbxB0hT9q36IYppSO7eeWYiM/+durbv
 nV2cNvIsgsja96jbh5YL1nhxPgT2C9H/9OsP6jOE0hOc/nLkjLnY3pGPcNCpftIiPIPPKES
 LQeSSrY7G3ICNSdZsf3C4Bn2kZhAnDTRnz2jlJOU16SngdxuJoXXKhOiaopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774134678; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UmSlASJxZ4qJNq9Ag8r4ipXI8Q0Axl649+ut2f+sZl0=;
 b=wKiL1xWurxZ5/SZCcAwt8AeIonGE1cCSjiBgb7kRw/jn9dJmj+//RFhwgG23jDqUN+Crk
 lfcZvt+pM1V0HhfqPyXxD4VxoqWdvmez8fIGo80BhXFKqvRnaHhxuJnzxh5K0+/mxOX7Z85
 5A8H7d53n5x7fWZSYb48Y1nwn6qprJR37KMgdFrj3EuCCPcnAjW/oQNR7/eAKrevMxummqD
 1kR2BhPtqoLiF2ND6YB5SOaazBiuudpS8jeEkBv+FhtQay+qwrYf7RFv7JA3R/9g8EHieaD
 3SML4jqcNcdfRmDUXR7QF+Hy7Lq+p2KZuNR7UaTxw9mbxjTotcSbtfm099gA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EDF9540214
	for <nouveau@lists.freedesktop.org>; Sat, 21 Mar 2026 23:11:15 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8207F10E180
	for <nouveau@lists.freedesktop.org>; Sat, 21 Mar 2026 23:22:14 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2bd9a485bd6so2096397eec.1
        for <nouveau@lists.freedesktop.org>;
 Sat, 21 Mar 2026 16:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774135334; x=1774740134;
 darn=lists.freedesktop.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmSlASJxZ4qJNq9Ag8r4ipXI8Q0Axl649+ut2f+sZl0=;
        b=kucJdISXJT9np2bghB/MyjCSdDG5CYB31V+2IfY5Fd2ijZEj2YeqB0LWtQtgWsEat1
         mwufcKpzD4LMNnU+M0upbMGGJAFZ9whKSpaMRAuvi7cV3FSQXZutxLywASlUnEcB02Nb
         TBYi5VPBIVbER65SGz05ZCK9n3VIMzn0SZvEwXWPlgbwXddSSjiLN7FeZMQGVVwieDDr
         THZsFoF7wKDrK50L/xjdQqu2YJuMM9GMnJLSGitIBxGT1dmdNppvrWmNGxoyDyyw22X+
         N5drme/oZOXiRakrjebiMIPgzdJtDEdom5P/Nkcj82cLTqdgaTaeii6UMaNWiqLq/hld
         uK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774135334; x=1774740134;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmSlASJxZ4qJNq9Ag8r4ipXI8Q0Axl649+ut2f+sZl0=;
        b=j6XdXz0QVx1rx886iojCqBmfD+spfDafrKDp8HivBEmjTzVH9+ATAefjRrKY/nhrWz
         /Q0EQQ2Z2pI0UVfwLqgYMcMk78+oX0Ah2d6uxS7PcXSrFk1+ySftxmIuOvF8Tp13e+pj
         W13dpwzRGTp19kLfA5PoyoJaJ0sq2G2M37jqskDuqBIWkJq8ps6FJKOOQMFjPgid434d
         Hp4Jn8qWIP+uamAHmBSlISZIhGmrZKQ5BJjY4XCht4EEFwNGPvfTGcbcDnRgz7CrpCsd
         Z7GVB7MFs5+kpP1700LpTbgrDU2u3XvO2q5b0YdiVXPO4l9xteu9lr5lbOydMtiSW5DM
         sK1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFuzhnko45iM6fmHqGUYfn8AKt2+IR3hz/0MWH/vNtCTPMTLyWbDRyHd3mLEWGhaz0HT6FTibx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXOQUBkPf4hVTDLCIlDLIdRXnbmVgGePUFG5RehvE5cUcGlzaT
	P7skSAvvfCuOsuaW9MJmghMtitHSBvCFFO3OtqFYjgHVTwOmL7IBLycv
X-Gm-Gg: ATEYQzzPlHHekUVH9yiEz8vFR7UC3DmrKa1jC7LTvrY1nHrCh4CF+RPRmQ/B3nkS2IA
	0b8HntoUuwIvDyH62Wz6X8BNRZDAe0gWyyEUDWR1ih0KPHNkIcdc/ekXIO22IujreFYZiE18kKJ
	ws0qUf5dOYnQlOoC9OhhglpBOSoqWERUPDHABR0Z5tpWrzYUHIcumATCiIBjuBSQ0ps2ca7k7Mu
	F+LIpKNnr7+O4KOuz7USYkRWL4zEQb88uKd0W3CF3bAe5YjZiUw+JN5qtKnPlzkMhco3IrCHPoS
	0ugn1fQ3m9BVUyvXbP/CUzgWOWso7zBhlyCOjO4bK/YgDMYJinhjtmc4qKOlFcD5UL+/s8VmRil
	mk2EW/+GCNtLSkGcivTukV2T485MmGEfLofqV3WxnNd6yxT/JcDqwMcCMeP0JS+DAsoDHPtsM7T
	3nM2XT4leNFYd2W2KaFlp3TdLKHMeageN5oOLP1+5ZZAV+
X-Received: by 2002:a05:7300:3c05:b0:2be:140c:bc4a with SMTP id
 5a478bee46e88-2c1095d7855mr4154948eec.3.1774135333601;
        Sat, 21 Mar 2026 16:22:13 -0700 (PDT)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c10b14bac4sm10927970eec.4.2026.03.21.16.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 16:22:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 16:22:09 -0700
Message-Id: <DH8UHISTLOA4.934370PUTLB4@gmail.com>
Subject: Re: [PATCH v2 2/8] rust: dma: add generalized container for types
 other than slices
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>
X-Mailer: aerc 0.21.0
References: <20260320194626.36263-1-dakr@kernel.org>
 <20260320194626.36263-3-dakr@kernel.org>
In-Reply-To: <20260320194626.36263-3-dakr@kernel.org>
Message-ID-Hash: I6WXQII7XARBNOSPOFX6PHLET2FIC4NP
X-Message-ID-Hash: I6WXQII7XARBNOSPOFX6PHLET2FIC4NP
X-MailFrom: adi.dev.github@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/I6WXQII7XARBNOSPOFX6PHLET2FIC4NP/>
Archived-At: 
 <https://lore.freedesktop.org/DH8UHISTLOA4.934370PUTLB4@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Mar 20, 2026 at 12:45 PM PDT, Danilo Krummrich wrote:
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 2eea7e2f8f04..ff3e147f1a23 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> +impl<T> Coherent<[T]> {
>      /// Returns the number of elements `T` in this allocation.
>      ///
>      /// Note that this is not the size of the allocation in bytes, which=
 is provided by
>      /// [`Self::size`].
> -    pub fn count(&self) -> usize {
> -        self.count
There is still a mention of `self.count` in the safety comments; perhaps th=
at should be changed to `self.len()` ?
For example, see the safety comments in the following functions: `as_slice`=
, `as_slice_mut`, and `write` in same file.
