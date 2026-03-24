Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447A4D58CCA
	for <nouveau@archiver.kernel.org>; Tue, 24 Mar 2026 12:36:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1942E10E69A;
	Tue, 24 Mar 2026 12:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FB+4nBp8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 94C9B4529B;
	Tue, 24 Mar 2026 12:25:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774355123;
 b=Gl1j16Uql7FamZeXf9v3GbCtdZF+5X/4wlCs1vrrd1nd197orMgaoPi2DpRGLJM27wPK2
 Dg28uvMhz0AHdfhiRvi6eWptm2luTd2svdpOKZII1XO2Pknar3vC3CwG9lM4S1IsHZEPvgu
 eTlmu6iJ80npnTYMNIYcSnwudwE5TnePaxpwUp9BmUFMFr4ZHmNbfB/UUdeq7W8DO/qEVLR
 TuA1jNbWptC/MC3GbwyO3rMi+olGHeI4GijcDuXH/bZVkdORFMW/7VUzLhqurIIt1Ndj1A3
 +e9/k41NB/+R3TiF9+KqUHGN8+NhMvZcfWG5tty8w/Px6mcot1D6qyNHgJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774355123; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KAmLyMQeA/wWoEw3rDgQ8UAc/AjO4juofRDFITp/M7M=;
 b=020aSUnCW0bEETYY0Epg0M0LnRF9yLgEvuAyuzQ1q+onNmnP4odLUdVdYNTZa0odg4Xuh
 YAuT5m6Fvhkn1mpdgIg1To6oM1+DCttn5QiqcnDUxvtlyamnTOvZfn15XUNBSkeAWAMardK
 6UBuOeh0yCWkYU29GYFgL4fptSaRaz8hDIuD424NTTaBVpbKhuSCSXpfVR5+0drUQpbXQvs
 fgw+q34yHJjHcqtzhZud6s+xEH1SI1Kx25MNciR6P160l+pTKSKbfvsuoCwkLprFYZDf3Sm
 Sj3en/i/tbG2+Boa5Nq/49e95PTKvD19bZ3lxYvSlFlU7pNfBzr19JV+ftLg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7B0D544F55
	for <nouveau@lists.freedesktop.org>; Tue, 24 Mar 2026 12:25:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C4E7910E694;
	Tue, 24 Mar 2026 12:36:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A24B343680;
	Tue, 24 Mar 2026 12:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F528C19424;
	Tue, 24 Mar 2026 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774355784;
	bh=KAmLyMQeA/wWoEw3rDgQ8UAc/AjO4juofRDFITp/M7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FB+4nBp8y9xP8wkFgkv+Ns/o1iWPPhZJlChqynTjJjtg0aatmPnRW+Pcoqd9Wtjzl
	 Na7kHH15HeEy6ku9mBGrw0sW0xBLorWc14IxGeEhu5K+fPBLBiD6+juSJqfEYWap6M
	 hP9u8lyq1HYkZv74mu9zyrPXDS5Ja05lYftczS2OUXqwJXdY7ksNaGPyeKVESFM1gR
	 W7NgyWmZ8pVRIDJjmxL7h3Sgfb3xn6WUlEQ7PEyJB8FjBeKu4O6UvWyqKK1RGop8AI
	 osac1ec6Ur7n4A0kTuqyX1i+e2kjp4UFsDyXaSd4ylhMxSr+cM5JYTAQ7IwauZNDyd
	 9WbPEW2GkmQyw==
Message-ID: <314ab89f-3aee-49f5-804b-f33dc8ef5ba4@kernel.org>
Date: Tue, 24 Mar 2026 13:36:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] dma::Coherent & dma::CoherentInit API
To: Andreas Hindborg <a.hindborg@kernel.org>
References: 
 <9A1gWen63AbJmi06Y_vu_qF1S86nj3fcQEil9RzLAn8QkIYpCOrLMNO7JcgIP0BccPHhzaYaQ_te1S_gKuHRgg==@protonmail.internalid>
 <20260303162314.94363-1-dakr@kernel.org> <87cy0tqueu.fsf@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <87cy0tqueu.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LW33WBKYMBP4DVQ7GTQPYBJ5HI4WQ7KT
X-Message-ID-Hash: LW33WBKYMBP4DVQ7GTQPYBJ5HI4WQ7KT
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LW33WBKYMBP4DVQ7GTQPYBJ5HI4WQ7KT/>
Archived-At: 
 <https://lore.freedesktop.org/314ab89f-3aee-49f5-804b-f33dc8ef5ba4@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/24/26 1:33 PM, Andreas Hindborg wrote:
> What did you base this on?

drm-rust-next
