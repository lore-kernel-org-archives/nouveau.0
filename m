Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D2EF3383D
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 14:40:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0866310E3E4;
	Tue, 17 Mar 2026 14:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YET4X8Al";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C77FE451ED;
	Tue, 17 Mar 2026 14:29:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773757787;
 b=0k7vv9XJoF59DkJb7cwZYTSqa3lai3JMGvrhD46s73eBspQca7rTNsOnrrLhwrYFG47zH
 p0VfFchftN6rwxbMRW0WYB/3PAqNko/kHs3wzChosOaf+glSPCw8nDZdvQdhJEGSHvUAZ46
 DXDzMAWMfEWO+84xZ9Hw8EPhd+NlpSOm2vO9/DviBJJxtmzNSX10IcjCiCEHyNYqJCvE9l2
 sOrbQRKqhSG0DoeuvCcIVW8wwqe2AALnAO1UnjT7P4XtYYpFrLJjGH8oueOpyr1VhTP930S
 yIDFRFolgDvs5GnQdL/ktUd0C2e5YyuRDFTl0f0xVXaAAfpF9eYeGzjH6Bww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773757787; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mY/tSeUe2cvVqs/8GWb7UZvn9GzDby72c4vPPZWRlZw=;
 b=D95vpCj8HUzw3e6C99eH+xI0Gt/bKP/XcvjfDF6xj3zlb0/+GsmCGAN3PiM6uPY6TsdVG
 CXyfFbwkHUe93gzVsUgcLKR0yHQ3ABvaqYc4mULISz6ev6TO9gyjKavyq7Lu+dMF7HIoqBE
 RliXoG4lVOpwTYo54o9aLMsmtJTbaWiTO/uStIL58fCxOOCnmYOLoP4TNY7s39OoS32jFX5
 IsNKlfhsCntG7po6kfDor6eXu6DC7ovMJSo1jEYqqrD1VLU5jVLwLsqgaqnX0AV97VUx2Vn
 1RVYVpvH5gHTOf9jitJokPL9nA4askQE3zISJrrN0M5980jh+xsFZAaBgxBw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F1567451E3
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 14:29:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D706410E259;
	Tue, 17 Mar 2026 14:40:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15E4660018;
	Tue, 17 Mar 2026 14:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8DAC2BC86;
	Tue, 17 Mar 2026 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773758432;
	bh=EvYCcTW9OZ4w+eYnCud94ZVVBQFcEHeOk0Qf21v1cWs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YET4X8Al0E7xW+qNdPitpEBKm67SGfBeakvvFwPWtHFId/MrUTmacfbxc+Dvtprp7
	 l89HGwLfRbb6UNAOtar9lV10fYIY9tfSp2yohZK/tLKjgJ2Fxl2w+vYDgYbHs7piq4
	 7et28Wse4LWMT3UF5yDw6KlqDutJ/VxXIED6eesTZVsCerJSN1+x6i0D/b83uX9qKB
	 6ykLvlCHefbUiVxdUo2c3SWCGT363ZQZ0xekXjun0eLrlRFBXZPxjL8yRaA9dCUwcs
	 ZtCa2MkNk1ReLDHuZBhvC+39B0/Hj8mR8tTAigYX8f4GM078sQ5rYPvGV03tah/F+m
	 lhT176bR0fCtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 15:40:28 +0100
Message-Id: <DH54VWW1RXMQ.34MLWMQ1ZE0I1@kernel.org>
Subject: Re: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory
 initialization
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-5-dakr@kernel.org> <abj6I9c_2IR0cKJ6@google.com>
In-Reply-To: <abj6I9c_2IR0cKJ6@google.com>
Message-ID-Hash: MZD2UPZN7U3F4PEUKVWUEFVQTWVI3XIN
X-Message-ID-Hash: MZD2UPZN7U3F4PEUKVWUEFVQTWVI3XIN
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com, driver-core@lists.linux.dev,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MZD2UPZN7U3F4PEUKVWUEFVQTWVI3XIN/>
Archived-At: 
 <https://lore.freedesktop.org/DH54VWW1RXMQ.34MLWMQ1ZE0I1@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 17, 2026 at 7:52 AM CET, Alice Ryhl wrote:
> On Tue, Mar 03, 2026 at 05:22:55PM +0100, Danilo Krummrich wrote:
>> Currently, dma::Coherent cannot safely provide (mutable) access to its
>> underlying memory because the memory might be concurrently accessed by a
>> DMA device. This makes it difficult to safely initialize the memory
>> before handing it over to the hardware.
>>=20
>> Introduce dma::CoherentInit, a type that encapsulates a dma::Coherent
>> before its DMA address is exposed to the device. dma::CoherentInit can
>> guarantee exclusive access to the inner dma::Coherent and implement
>> Deref and DerefMut.
>>=20
>> Once the memory is properly initialized, dma::CoherentInit can be
>> converted into a regular dma::Coherent.
>>=20
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> overall LGTM
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Gary and me concluded that dma::CoherentBox would probably be a better name=
 for
what this structure represents. I.e. you can carry it around and use it sim=
ilar
to a "real" Box until it is converted to dma::Coherent in order to make it
available to the device.

Is your RB still valid with this rename?

>> +        let ptr =3D core::ptr::from_mut(&mut self[i]);
>
> &raw mut self[i].
>
> Alice

