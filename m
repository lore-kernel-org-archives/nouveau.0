Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B00D49C73
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 08:31:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 842DC10E92F;
	Fri, 30 Jan 2026 08:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CYCGBhbp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4DD0240F1F;
	Fri, 30 Jan 2026 08:22:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769761342;
 b=VnDqKMFzsdk94Xs5FGv7fzVEHCoZ4gypRdG6F0o66S2iNEoOTsoDVpS5W+Vp7xwoGTmvK
 +QC8tmm7dRX0ALaEOZXH2ypsMcwRI8JlZXekcNme+Jo8jsdhKhUTjzcMvwcwcX/MN/0I6u5
 +BRg6yP1xyu02je1UmRNtc7oKAJcvmUXYl5b4pyN6P52xSqtMvzQccHvtJzzixPqOYP3kJa
 7yjs/xZ1u3YrLqkuMIqSTmpOXCs13CQ9MKRU1ek0GkuQC0xCtkBEkX5vTkSLLwAhjYYJpbl
 Y51F5Ggd3ra6LaRTIt+AUtuiTpv48b+U/hKxinh+rtohKZhDesZ9lHPR8SbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769761342; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=n+GzpbkBojeUlEtJWlBKw8ZsdLYodfMK2fNmjvVY9hE=;
 b=r7W8Uwd0YK1N1G2r/qA+wSUFkYlA3DX4O8jwq48rv50p3FKaPkTVaJX1dlhwwgxK9bJ61
 nLCeO7ficasXRVRYk6V/SuF4LbeKBvQmrotWdNrZBX9eKUcgjFP3aq3OFvhUtseovk+hB9Y
 69IgjsS/CbWmqcFQzX+ny01GnP+OyUbXWa9ZamdOB6HWvyT5nSoOWU6oHfdMHamLWMVryBM
 YNsuQW65jfMS0xe42pejpN+8eBe/N2tb6iA3mJ2f1lMOsd/qw7BJCOnlTsbkDDoLNDkx1CD
 Vp/NxXe8fpr+DBIBq+4K3qsFDYV84o++MAzFMRHOLZdbhO1Zwz2Qfdj6sGvQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 701B840AA6
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 08:22:19 +0000 (UTC)
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED1B10E92D
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 08:31:25 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47d62cc05daso14607325e9.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 30 Jan 2026 00:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769761884; x=1770366684;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n+GzpbkBojeUlEtJWlBKw8ZsdLYodfMK2fNmjvVY9hE=;
        b=CYCGBhbpOlClc5wmTV1g5p0XfKDO/6UGPTD6E8zOCR4n/IApMak+3Kia5fDsz/Te48
         B4X0frEu0T92AamBUPcXms76JGt8GA0SLsqRe3EvTfP72EP7Lv6upjuCkqOaK2grhpFs
         5xkeYuLWEDigsd6b+I9zfENlYWcDfC5J8aIXvMfGmH/7Qtul6FrMWyKLB1bbzXTVCzjg
         6w4frRKViUgHxfKA5Xur3+vFa95Oag7z4Ueuw/HQQD7wS4mGLK4vISQ2zQzgtyFAlsP7
         Qm+kYQ/8FguiZl0srRakFn1TO8LjBjAwTk1HuQAGl6crA+p7fyFhOzBLCu87wcTDFxfo
         S4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761884; x=1770366684;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+GzpbkBojeUlEtJWlBKw8ZsdLYodfMK2fNmjvVY9hE=;
        b=WzYfxyEmv92SOd4qKka8AjzOxfR+ROe0FhWdbaVb7lVq3S8ysIXFwHo1Vpg3RXylBU
         6KOe8peeHRngbRX3h5nYgXoinDX0O1YwpPLO42KaRhQfQuATxi1aJH8PjvhMdvd43vMG
         1DvLIFA6wFy7uh+jSZhcjpXHFHBJJHNNshfVPTrSo4wHmyfZgAq3pIHrhWyru5SbqVQW
         F1eQdWJmNNKXGDf0CHcJ2WtUPau85/JBlGzpSUoFpQJfrf/7FUxRCy6AsY1JOx0dTcw5
         p93X7VJQRZ+dZvw8y7UID5E7h8ub+2kAh8s/iN4JMKhvBK6kfB8SwFgH63h0vM00sqkU
         tUTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzelJenRls+URs/LncT/sUmworH7zrohfRCrgawXcwyLSG+ouXlqbGLn0Tn4KqpH/MUKw7XK9b@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0n/qZDkf4VHCpMgVQejzUFqED0FekAijHpX71ypFD02ik6lX5
	fY+GCso4Gu0oni5Gt2Fp8TjP1aBmfS6TsIwV5Qj7xa3LElwXYowLbkEQcVN5r7emo2gk8QJdjvW
	C3aRnEKqUPoxumW99eQ==
X-Received: from wmby7.prod.google.com ([2002:a05:600c:c047:b0:477:a678:a39a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8a:b0:477:73e9:dc17 with SMTP id
 5b1f17b1804b1-482db4992famr28105065e9.35.1769761883601;
 Fri, 30 Jan 2026 00:31:23 -0800 (PST)
Date: Fri, 30 Jan 2026 08:31:22 +0000
In-Reply-To: <20260129022837.4133832-4-ttabi@nvidia.com>
Mime-Version: 1.0
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-4-ttabi@nvidia.com>
Message-ID: <aXxsWuuV9mlAEtAJ@google.com>
Subject: Re: [PATCH v6 3/7] gpu: nova-core: implement BinaryWriter for
 CoherentAllocation<u8>
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: 7Q7Z5PAKMCVDQISJQJKBWRCMYECJZPMV
X-Message-ID-Hash: 7Q7Z5PAKMCVDQISJQJKBWRCMYECJZPMV
X-MailFrom: 
 3W2x8aQkKB3gWheYanudhckkcha.YkijkqraWqheopo.bnaaZaogpkl.knc@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, mmaurer@google.com,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7Q7Z5PAKMCVDQISJQJKBWRCMYECJZPMV/>
Archived-At: <https://lore.freedesktop.org/aXxsWuuV9mlAEtAJ@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jan 28, 2026 at 08:28:33PM -0600, Timur Tabi wrote:
> [PATCH v6 3/7] gpu: nova-core: implement BinaryWriter for CoherentAllocation<u8>

The commit title says 'gpu: nova-core:' but this is primarily a change
to rust/kernel/dma.rs, so it should say 'rust: dma:' or similar.

> +// SAFETY: Sharing `&CoherentAllocation` across threads is safe if `T` is `Sync`, because all
> +// methods that access the buffer contents (`field_read`, `field_write`, `as_slice`,
> +// `as_slice_mut`) are `unsafe`, and callers are responsible for ensuring no data races occur.
> +// The safe methods only return metadata or raw pointers whose use requires `unsafe`.
> +unsafe impl<T: AsBytes + FromBytes + Sync> Sync for CoherentAllocation<T> {}

This change is unrelated to implementing BinaryWriter for
CoherentAllocation.

> +impl debugfs::BinaryWriter for CoherentAllocation<u8> {
> +    fn write_to_slice(
> +        &self,
> +        writer: &mut UserSliceWriter,
> +        offset: &mut file::Offset,
> +    ) -> Result<usize> {
> +        if offset.is_negative() {
> +            return Err(EINVAL);
> +        }
> +
> +        let offset_val: usize = (*offset).try_into().map_err(|_| EINVAL)?;

If the user seeks to a large offset, this leads to EINVAL. But the
correct behavior for a file is to simply return Ok(0) in such case.

Alice
