Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391E4D58CCA
	for <nouveau@archiver.kernel.org>; Tue, 24 Mar 2026 12:52:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E3F1C10E6A2;
	Tue, 24 Mar 2026 12:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J0m0ok8m";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5FA064527C;
	Tue, 24 Mar 2026 12:40:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774356057;
 b=Mo3kvtGPU0S8bPpaoKX9OLvGoBqBRQ4KrMgd6c2HeCxvJNpIQPdYnFBSzuh+SshZuQXIQ
 O8SqXmWVD6gmOvgU6tlZwJ+PeIpW0wQ6AIkmdWBkxXjSy3OTxG6q5KfcbtHyBz0MJNTZAZr
 J0eqe02JEL87S1mpVsnId+37raPV7SuDulhqoV16lPG7udpWnQ3w7R18dSp9Qi+97Tb+L2u
 n7A0AfrpxOL1bVHWQ0CLoPzTRj7XuHxdNhZhiKa15VoQsoVYUWOpPPFw9u6UwI8rBfAIW78
 dY/xwB93lMIjEqjXHoPch4h6pFmOvujRRcwBkCunU1aolnZ7hnC7nGdN7mlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774356057; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=36hQ1B0QighPB/KAqGfc17vUqkM+nQfmESwRKVrZeCU=;
 b=km/oCeqsNI4z/ku2wApOLcbj0wr/YNfnOdjjzD+ZNGmlMZLUJqwv0Pw2wiB8SbJCpVZ9O
 hyzVspu6YeN6jnXW3nwXOVMI3FoPA2RMto4oyxY7X3itG5cVfnyM7/36HK0z9n2bQZnjwli
 TF/XY2wodM41zl4i/qgqWU85mwoAb51QXSjnHhWRWlZxObZKiegUVa4pOXPHeF1NTwCCRz1
 9GwIpsaw1b6UvCdbTZrlP1Ki9vDBJjpttRhJZcl/UCCDndvxXk+5PJSNi9ln9PiDYyKFmcT
 BfkB73BUYmO/hDb5W3IyhkJ/sxDGcHKy3etkXQdzZF8xdotCLEm6VHzLxc/w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6035A433BB
	for <nouveau@lists.freedesktop.org>; Tue, 24 Mar 2026 12:40:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A562B10E48E;
	Tue, 24 Mar 2026 12:51:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F14843C47;
	Tue, 24 Mar 2026 12:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C77AC19424;
	Tue, 24 Mar 2026 12:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356718;
	bh=xvicNmew9YGVE06h8feoW2WxPglCVqW6Ob1aqjokys0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J0m0ok8mYABf6NtwFb0fQ+bgKBJ3sRCDZwG55FzC8VdLXM7hmtw4ep11W9+APxQrx
	 K+TjLbau9TJtVul6lXk2YJtFlWB8WozTRPB09jQiJOYMg8Yk9BR7DK7m1lbZPc+LJN
	 OXWDEeCwzXSwwRacJFBHEB4HDSJqtPx6uP7V6C0HKMThlLM8rqprL/OHjWdTPXQbNJ
	 x8TF56E26tOSH5SHyGdqXT0XDu76YDL/8lDyEqkQao0JGydrksoMGet8iepwO759EG
	 iI/MISunGCc/IAinK3cZvEYEkPTOLJpi9lJQkRS4A7xUxqgBVNX615iyz0JfZvuqMj
	 Rz0cM/PaXdU1w==
Message-ID: <5ea753b2-a702-4d13-973a-9eaffa9562fe@kernel.org>
Date: Tue, 24 Mar 2026 13:51:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] dma::Coherent & dma::CoherentInit API
To: Andreas Hindborg <a.hindborg@kernel.org>
References: 
 <9A1gWen63AbJmi06Y_vu_qF1S86nj3fcQEil9RzLAn8QkIYpCOrLMNO7JcgIP0BccPHhzaYaQ_te1S_gKuHRgg==@protonmail.internalid>
 <20260303162314.94363-1-dakr@kernel.org> <87cy0tqueu.fsf@kernel.org>
 <NNO45MYwzudmCWH1mWf1k0Icy8Q0eKR4ANI6fg9-zxq3_dHLfhyRsHaq2l77l-RBwmek7tHzQIv2vNhOFg1Ysw==@protonmail.internalid>
 <314ab89f-3aee-49f5-804b-f33dc8ef5ba4@kernel.org> <87a4vxqtsj.fsf@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <87a4vxqtsj.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JIFI63AARJNAJOJELVSER4QJUKT5BNOG
X-Message-ID-Hash: JIFI63AARJNAJOJELVSER4QJUKT5BNOG
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JIFI63AARJNAJOJELVSER4QJUKT5BNOG/>
Archived-At: 
 <https://lore.freedesktop.org/5ea753b2-a702-4d13-973a-9eaffa9562fe@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/24/26 1:46 PM, Andreas Hindborg wrote:
> "Danilo Krummrich" <dakr@kernel.org> writes:
> 
>> On 3/24/26 1:33 PM, Andreas Hindborg wrote:
>>> What did you base this on?
>>
>> drm-rust-next
> 
> I don't think 1195fcbda62f12108dc9be56fa4173897905b90c is in
> drm-rust-next - or any of the other branches in of
> https://gitlab.freedesktop.org/drm/rust/kernel.git .

Oh, I did not notice that you replied to v1, there's already a v2.

[1] https://lore.kernel.org/driver-core/20260320194626.36263-1-dakr@kernel.org/
