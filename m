Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC2BF483F8
	for <nouveau@archiver.kernel.org>; Mon, 23 Mar 2026 21:56:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 14B8B10E4E6;
	Mon, 23 Mar 2026 21:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l1Z2F02g";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9C85F433C3;
	Mon, 23 Mar 2026 21:45:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774302354;
 b=BZdSOdhcrD9v5B7UrYuW5EyquGA45DNPLOLEliGjTBjtziX13XRXcl2lxJZPOZ67ZK2Hk
 tnoQX+qxfIX3L8aZzRsXIin2pk0K2mWNNbtTEmZ8lkps5E0bc6UxH0n1S9A5l0W0023qgs8
 enGsuCcDnsadDt2m8w9XNXo5p2HCPPeyeS2VIG1absDm31Vo+8EfwST53YX86G3INxaSQ4Q
 J8kr9l7Ty7qSmnsqhUXUd8w2C1EiX9tIKpT4hX5VzN199Jwt67z+RVooBg2c7Qrsu8wYOXj
 67e6JWAcdVe/unKRAh32O7LlWcC67Xpb02jjfUlg5mhG/L8bVVWZAG4a8HGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774302354; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7gYtX8ENTTm0cXyqHPbNb2Ggg2e1iMT6LPmrAujrrGU=;
 b=WwrV3NBouqfjadOWLvIHnXW7GOaCGJ3IaltGU4CIiCFyHpI8RnslMjBVDdZ81p1Zt5cSx
 S+XxgF5u3P+eyZWAQ/Q2Ez8dkGJ5om7NIAu0uaxHI6Gb+r/zz7LgWEypB9cEiz8E5UESbff
 NUYKTlIxXkR1l/4nZAbVvmTNgf/749RWhAu76QqROpopU5kDBTQGAS+v6pPjP6ZqScmBANN
 F9d0qqIKmZLZRdJdRLImKMjFJrfptHkO9Y8g1gaILeizSfAG68J/LWD/I1EwcrwHnnrBS7w
 Sb/pn68oNyNsBYDc6fUnZAQRfL3lnnxBNVSiZZavnoq02q7l0O77ArtQcKfQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1DFD1400CD
	for <nouveau@lists.freedesktop.org>; Mon, 23 Mar 2026 21:45:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 105C610E4AA;
	Mon, 23 Mar 2026 21:56:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9115742D9E;
	Mon, 23 Mar 2026 21:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A516BC4CEF7;
	Mon, 23 Mar 2026 21:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774303014;
	bh=kI3bMJRdPfjTY4J1ka/g4c7ItdC1C2EpVS7Hjd+xIms=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=l1Z2F02gyMyZJBFpQf9P9PihXMbmx1Y6+anjGj6bBrtHMyQb7tC/h29f3Cv20spBo
	 2RmTqi1HiT9eUWcS7k5cjlUKMYfCxr3Iu2A5vOjQ2ttJDGdrFSGfkLPtgSuwiitP8c
	 b4KMSqh9rhJ3FDv6qoKve4ZZmdPWx6aiv3jzqcxpm+8PY3Uw2CpFnP5c+s+XbURzmO
	 rbIgOsgY0BtqzvOk4vUgIwyaoEZ2wTwX/lCjJLdYAqa241FdPLO0cyRp7BeXv0FWpU
	 QA6cSN/tbG5ksPGOvkdJcqfJZYdW0/j6u1VTp4keB5Ch8sxhw9Ma2WK+Hah+iMZT9x
	 KqfvKf4MgtsTA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 22:56:48 +0100
Message-Id: <DHAHX9OTSGDZ.3YRZ455BB0J7@kernel.org>
Subject: Re: [PATCH v2 0/8] dma::Coherent & dma::CoherentBox API
To: <aliceryhl@google.com>, <acourbot@nvidia.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
In-Reply-To: <20260320194626.36263-1-dakr@kernel.org>
Message-ID-Hash: ZQKUGQREAV337V6WRTQASE7KY3B6O5XR
X-Message-ID-Hash: ZQKUGQREAV337V6WRTQASE7KY3B6O5XR
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZQKUGQREAV337V6WRTQASE7KY3B6O5XR/>
Archived-At: 
 <https://lore.freedesktop.org/DHAHX9OTSGDZ.3YRZ455BB0J7@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Mar 20, 2026 at 8:45 PM CET, Danilo Krummrich wrote:

Applied to drm-rust-next, thanks!

> Danilo Krummrich (5):
>   rust: dma: use "kernel vertical" style for imports
>   rust: dma: introduce dma::CoherentBox for memory initialization

    [ Remove unnecessary trait bounds. - Danilo ]

>   rust: dma: add Coherent:init() and Coherent::init_with_attrs()
>   gpu: nova-core: use Coherent::init to initialize GspFwWprMeta
>   gpu: nova-core: convert Gsp::new() to use CoherentBox

    rust: dma: remove dma::CoherentAllocation<T>

> Gary Guo (3):
>   rust: dma: add generalized container for types other than slices
>   rust: dma: add zeroed constructor to `Coherent`

    [ Use kernel import style. - Danilo ]

>   gpu: nova-core: convert to new dma::Coherent API
