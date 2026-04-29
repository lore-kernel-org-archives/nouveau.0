Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B9EFF8867
	for <nouveau@archiver.kernel.org>; Wed, 29 Apr 2026 08:06:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BD67710EEDA;
	Wed, 29 Apr 2026 08:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="oTcVMN2u";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C317845D18;
	Wed, 29 Apr 2026 07:53:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777449217;
 b=O3c0M1a3Y/MPnvLMBd4e3pYFMF4ywewXRd6IARWaYMdqc7+XgR2RE78XKf3tb/2eIT11h
 3Vxlo+MBg3yQgYn1pq70gbjz/SDBIByILttBjMsce4C/qitXsbKVFBuIE6Q4qrq8jWKbGF6
 pp2BSHSdrfVDCgo13YKWcSbrqZpKXRuPayXp84XnmwFvBCEIL83c9Dug2YerbRNX2oEz4C9
 BQmWimv4gtyqQgPg8kcXvVea9+Lqu/io/Y27sgL+JQi+X/XwQeFi6QJoVi3t0aFZrXkjgS1
 o+CaOFKUS4RhhgoV1jGRYbFa8G5wpZU8+11a/Ywa+/4wQYL+EZ7qQgYfwiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777449217; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=S6Sri/DxWYhekkoJhKaFCAGZ5nRi8N5LN4MWLa1I+oA=;
 b=U9FUIo0Dh7/1uZI5mygMth7SU7ctcQkzHUehfplawKxLUG8qlBj8Grr4+H4tn4cpgZdQ2
 OEOKTVxgrdNdGTGsFNRWzLDGfPQd965Wf13K3cMHVCXgqvudZou9Ztl8tDZiRcIEN8P1kqe
 7OPJUF3r86Lg88ZFhYXO6hAGFLu2D41RAd/zQoQVf3Q45JtNDddBiys89bA/7NwEucWI3yb
 i1d5poXOXGJ4kaoXVxx7TtZb4AgdSNmyJkg48WofpYIYmKGAVvX7nYrU0B2dOaHZ0e+IHnE
 c9Dta6AZogxSlR/pP9vJX4FDmYxNvthULzRx9VOr+SybvOl9MbKugA4hrDHA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E8E4944C05
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 07:53:33 +0000 (UTC)
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B997F10E0B0
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 08:05:57 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-43d789cebcfso385269f8f.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 29 Apr 2026 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777449956; x=1778054756;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6Sri/DxWYhekkoJhKaFCAGZ5nRi8N5LN4MWLa1I+oA=;
        b=oTcVMN2uPTvjmhRk9EQ20BK5sS1sqg182dC8IwfETscoxGg1LfXvXVwC2xqtjKlPVj
         b0qbLw3pxl7k3uZkJkKdBT7V7h9odH3/ik0tU3qdAFEEETck1lAvhvMciMf6R26iZJAq
         d0xXlNLfgJ99vOdSeEBJh6VqbKyk3mpf8wPDdYgIbChfCCKEhTM3NXTGfLE36KABvtcM
         bV/ic4osYn7xr4m/dSdHC78Zyi6xbce/3hTJ1E9LyG0hNZKmlmkCR65REkyriX9ujwWf
         sL1OQuPguKfpuwutVpZAi9w9GJb0EklDPEmEG41wDvwsQLcjJ34aoNQNk5FMA9/4TWTX
         1eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449956; x=1778054756;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6Sri/DxWYhekkoJhKaFCAGZ5nRi8N5LN4MWLa1I+oA=;
        b=kKGTpQgQ/vDvtJU+/I88lrAWUU9BolNzo4Ggqhz8jGdOABoMSj8Lo3imkVzK2sGDvz
         YRQlOdLVHAyfS8nHFLFn2DVRbSBQJSUlST4XtsAaYS0PcneXI7aUDShoDVoGoNHXF8MJ
         QDOJwWFr0T7nwUFUqK0iqzB8LUKfrXuVCQ0upU1DM5Tnp6MmuwGot4gjLgJOYxbIzb1o
         NBYnhnWJDqObDDwBH2FxSX0Nqoshlzibw7m2ZFppMWkp3ERJbRb9jB+k/AEynGj7LBQL
         35TaBMy8ZN6fiw6vyAWoJnsqMS2LEbqxbyalqenvUmXDMDzUFFZzYvrzHl1ETXUsKRwb
         rNZw==
X-Gm-Message-State: AOJu0YwPziH603TVnxPbzNDiIWP6lAS9iXuSX9mHmRylcL4LwPlD8L6X
	gJTdQXAV3zzzfZKN3e4kLlVVvAZHBijGIe60XT2+GKJMS/N5y0Wb+z+0yNdICnpICOz3/K6gl32
	Ci0wSQl/JdUbwi3cFQw==
X-Received: from wmkz21.prod.google.com ([2002:a7b:c7d5:0:b0:48a:5351:7e80])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8012:b0:486:f893:56c6 with SMTP id
 5b1f17b1804b1-48a7bfb4564mr34552015e9.10.1777449956055;
 Wed, 29 Apr 2026 01:05:56 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:05:55 +0000
In-Reply-To: <20260428190605.3355690-2-lyude@redhat.com>
Mime-Version: 1.0
References: <20260428190605.3355690-1-lyude@redhat.com>
 <20260428190605.3355690-2-lyude@redhat.com>
Message-ID: <afG744xkGUZBgNth@google.com>
Subject: Re: [PATCH v13 1/5] rust: drm: gem: s/device::Device/Device/ for
 shmem.rs
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: ODMIV6KEXWUQONU3RI3ADOZO3WVX4AJ6
X-Message-ID-Hash: ODMIV6KEXWUQONU3RI3ADOZO3WVX4AJ6
X-MailFrom: 
 35LvxaQkKB3kXifZboveidlldib.ZljklrsbXrifpqp.cobbabphqlm.lod@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Boqun Feng <boqun@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ODMIV6KEXWUQONU3RI3ADOZO3WVX4AJ6/>
Archived-At: <https://lore.freedesktop.org/afG744xkGUZBgNth@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Apr 28, 2026 at 03:03:41PM -0400, Lyude Paul wrote:
> We're about to start explicitly mentioning kernel devices as well in this
> file, so this makes it easier to differentiate the two by allowing us to
> import `device` as `kernel::device`.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
