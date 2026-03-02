Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1F9E9B36D
	for <nouveau@archiver.kernel.org>; Mon,  2 Mar 2026 12:28:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0468F10E4B8;
	Mon,  2 Mar 2026 12:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WZZjyldL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6986E44D5F;
	Mon,  2 Mar 2026 12:18:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772453913;
 b=wuB8Xd5RRHnXC8uaqWZCVxPmJgafKmIMXMq8G503/o+LJVX2FZR/Chl4YZteUomaXaoZo
 6VZDeuqbMAAldLC9phoG2v1AJJuojrOMHxqdXyEtpq+TFQMs782zWFMSFOCtDkRDDgPAfso
 c7f32/+x1AyuXVcUhEGh1oxZVDDx76PxP7jQkTbTtP5PZsxV9n1QLoPHfdtd1lCpDwlK5Rk
 oqR6OXUS4dmy2eY3NMhxjO87sZu+/hN3bTGja6o/sUkB48mp3aovOoktwCRo9EHhI7TS0Tm
 Kh6imSi3nmU7RMb68Q+YVwtqPsBENBTsngvpSzKB4mN6AD7TvDQ12XEGGL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772453913; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pppJWZhqbO+BUwuoj7YQnasfi5j/ybVZ9hiQDJe1kZE=;
 b=xgY4fDehpYYeA9odlnx9t8B4F5NnVxA3q/8izGWjczKvFN0YuUg0JyTa7BjJdSo+KGTQm
 2Sm3/BuqrWoWK6/7tZdBllAPAcQJCjOFzAejVmww+WO7XZHtYgnRDrrsQYbUFoNXXE9/B9x
 DZXpXkfeGLls8sG7NhwO7OoQvB5gL3+kYuLDoWQwXLc+pEpcWRUpjSP6iiYHKtSsVWgqVmW
 p+U7aagZrOJIdabvLpIXQI/jwfUNSik934ExUO1qonI6AHipr6oQKAUSSVeikIomM8iYR7Y
 q2Sd5jcYewaS2K5d8t4salfl8NbybvGUJmvTa6kl3aVkxUXantwRetoSjldA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2AEF940368
	for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2026 12:18:30 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72C2A10E132;
	Mon,  2 Mar 2026 12:28:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71D0360008;
	Mon,  2 Mar 2026 12:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26D6C19423;
	Mon,  2 Mar 2026 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454524;
	bh=pppJWZhqbO+BUwuoj7YQnasfi5j/ybVZ9hiQDJe1kZE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=WZZjyldLowkrRJk4nqZ8neKZ1gp3bXcL7erh2Trk5534OmoeUIICBCuLg2YNg4JMg
	 O/JFkFD8lE0VCnjgNx59+mZlikEllYv3TNK183PropYzKXpcH9NSEPlgf/dnrLdZgj
	 R84fdRrB7C91/cWCFj1eqpdZsgXWQ//uUopW2Xt/3j1mK9o0gs/OMZv7FbuU9xbvkR
	 WGovIrGBeadpBHmE43iHYE2n0H5fSgt1ukaslvmVcgnO0ByBZSMvue2bp7DPFtZwEp
	 ZqsoGxcEJyM+r8lqOJ4TchyvCtF78uqEmeypt5+8VpvUtNjTEW3bh0zm84m/avzoh9
	 hKPeVibgn942Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 13:28:40 +0100
Message-Id: <DGSAOTM95PZ4.2JGBBMNRSJSNN@kernel.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
In-Reply-To: <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
Message-ID-Hash: RTK6Y5BGEC2ULGS276M7FSP77CQ7DZBX
X-Message-ID-Hash: RTK6Y5BGEC2ULGS276M7FSP77CQ7DZBX
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RTK6Y5BGEC2ULGS276M7FSP77CQ7DZBX/>
Archived-At: 
 <https://lore.freedesktop.org/DGSAOTM95PZ4.2JGBBMNRSJSNN@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Feb 28, 2026 at 7:11 AM CET, John Hubbard wrote:
> The sync/async naming that GSP RM uses is a little bit "off". I
> spent some time discussing it with them, and the problem is that
> sync/async is a concept that is somewhat independent of whether
> a reply is expected. Usually, sync means a blocking wait for a
> response, which is not necessarily required in all case with
> GSP RM calls.
>
> The naming would be better here if it reflected simply that
> a response is expected, or not. I don't have great names for
> that, but "fire and forget" works well for what we have so
> far called "async". So we could do create a convention in which
> no annotation means that the API has a response that will come
> back, and some abbreviated for of "fire and forget" or "one way"
> added to the function name would mean that no response is
> expected.

I think the relevant information for the caller is whether the call is bloc=
king
or non-blocking; i.e. do we have cases where we want to block, but discard =
the
reply, or expect a reply but don't want to wait for it?

So, unless there is additional complexity I'm not aware of, I feel like
send_command() and send_command_no_wait() should be sufficient.

(Maybe send_command_wait() if we want to be a bit more explicit.)

As for the specific commands, we could have traits to control whether block=
ing
or non-blocking submissions are allowed for them in the first place, i.e. t=
his
gives us some control about whether a reply is allowed to be discarded thro=
ugh a
_no_wait() submission etc.
