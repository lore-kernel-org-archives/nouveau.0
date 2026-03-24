Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D18DE9A77F
	for <nouveau@archiver.kernel.org>; Tue, 24 Mar 2026 12:46:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8831510E69E;
	Tue, 24 Mar 2026 12:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d1cJkGkO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0B82C43F3B;
	Tue, 24 Mar 2026 12:35:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774355746;
 b=DUJI+i64s2nX8GM8DKZNIbIVtzpJ68xaExisHAE3zRFKlDh5F9TrUQWtMM8Uc+Y3IHPBX
 W0YsCVO5rE0uA5kyIEWiECrrvBafDQpKw11WFGbuRLQekbGnaW4ShZ+OmffEHcEUKSvl7P7
 XENgRm6DK6PpUsrqhp3Y6njqKaTUE6I1kN1AjWKzCCVntS0LXktzUzViuXassIRlrHX04r5
 IzY98CxMfn092XxlzJCDw4oJpISpQ3jOaWAQAp8KSI7TX9/pYAaIQa6KGEfvW4DOhvHJHAX
 MgGZkLjBYQTjDkk6wKgY6Okuf9+yeudqYqF2tPLPTnjXbsO65n7xeY2hhO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774355746; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dsxveakDjRYMQkye9OWRI3sTONphVUVna8ujrl9GArE=;
 b=UUDENCnvRUje4fsa47MQgi6Hm7ceqs5xVJtGp3bncIFmCan6zxig0sRLc395V1T1ne3MM
 LEVxl3S1qxx3fqMJM6pc9SswAIHe/9FWy9sJcXYtcl7EKWMyHF2jiVH2SJa/W7u/I0ZHkas
 1xwYa4yIz35/V8xahsy9PabtRhByQpKsR3zLK7K3qypbhjjPZVfGA6sR8NpvgodaSUEuuUg
 C9oYPai6lijatgc6MbT71QwjxtMzSQFlWzGRqVKKBt8nQBGn/0l/9gYR1OTWP5xV0RhYcgY
 hJru8TiCp9PGVJVm0ql8JuriCk00EjGjfbOkz6rWEiBa5DnoTPHlRe+r9C8w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A33E040218
	for <nouveau@lists.freedesktop.org>; Tue, 24 Mar 2026 12:35:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E313F10E5BF;
	Tue, 24 Mar 2026 12:46:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34DD86013E;
	Tue, 24 Mar 2026 12:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC4CC19424;
	Tue, 24 Mar 2026 12:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356407;
	bh=dsxveakDjRYMQkye9OWRI3sTONphVUVna8ujrl9GArE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d1cJkGkOpD3P10vow6H193rMwXx4pCGknvlcsUyKntyc3hs/Dl6cAmaqUqazKT8mS
	 IcjVlKuVgutbV2SYEHS3ON5BlhJLbFK1ejAQ1WosoxDL26QL0j0mz7DNktyKw00AXD
	 61lvhBj5bDAirroIg7FMAWGDBzyEZOWrw41fyi9C3H3Stkrby6J64GFLJjknK55jp5
	 UOSXNVCz2JIKyK7LKDFkhTfVyAVc6YtnTGB4shSfmSdJYUokpq1XBmiAWzMxT5b0nV
	 fKTA03FfPN3sEqu3iB8pjBKWtMCm/Yc+wRHfPpVrhe6R4E1jHNoRx3JWglVIx6TBQ3
	 1CcacJaKLrAnw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 0/8] dma::Coherent & dma::CoherentInit API
In-Reply-To: <314ab89f-3aee-49f5-804b-f33dc8ef5ba4@kernel.org>
References: 
 <9A1gWen63AbJmi06Y_vu_qF1S86nj3fcQEil9RzLAn8QkIYpCOrLMNO7JcgIP0BccPHhzaYaQ_te1S_gKuHRgg==@protonmail.internalid>
 <20260303162314.94363-1-dakr@kernel.org> <87cy0tqueu.fsf@kernel.org>
 <NNO45MYwzudmCWH1mWf1k0Icy8Q0eKR4ANI6fg9-zxq3_dHLfhyRsHaq2l77l-RBwmek7tHzQIv2vNhOFg1Ysw==@protonmail.internalid>
 <314ab89f-3aee-49f5-804b-f33dc8ef5ba4@kernel.org>
Date: Tue, 24 Mar 2026 13:46:36 +0100
Message-ID: <87a4vxqtsj.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: P6EUC2O5KEKOTXYDXDFH3VLX4C3QU4RT
X-Message-ID-Hash: P6EUC2O5KEKOTXYDXDFH3VLX4C3QU4RT
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com,
 driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P6EUC2O5KEKOTXYDXDFH3VLX4C3QU4RT/>
Archived-At: <https://lore.freedesktop.org/87a4vxqtsj.fsf@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Danilo Krummrich" <dakr@kernel.org> writes:

> On 3/24/26 1:33 PM, Andreas Hindborg wrote:
>> What did you base this on?
>
> drm-rust-next

I don't think 1195fcbda62f12108dc9be56fa4173897905b90c is in
drm-rust-next - or any of the other branches in of
https://gitlab.freedesktop.org/drm/rust/kernel.git .


Best regards,
Andreas Hindborg


