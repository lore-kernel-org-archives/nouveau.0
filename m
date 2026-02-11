Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D25BEA3F27
	for <nouveau@archiver.kernel.org>; Wed, 11 Feb 2026 09:24:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AE4E210E35F;
	Wed, 11 Feb 2026 09:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tskr0izw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A44ED41E96;
	Wed, 11 Feb 2026 09:14:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770801268;
 b=twFhi2jmi8K1YDBAiiNdTD7qN40ygPIimRMAOqhVmw+v9juSO1KzLKuIPE8RDQTxwO2mh
 ufMuvgTpqx4UDSbsztyhwA9n9wq8Hmnps3po/rON4iLIjFWrCiFQzzPZf49CqR0j6sbqzZC
 XxvA2lkiVClxlj/Ur2mq6FGGiTE2zl+CJE/tfUN1yHhyPBtuKyxMdF0s4PDD2P7B4nTMz+R
 OyK5Jfhh7UiSuBuheeeu4I0cSakAehj9bzk23XDzg9+cnIW/3OihiQ2MvU4FCTeySMA95at
 tV+L4E0xUgKRkErM0SZA7+w6zikrVZjd2nIgQgTbPUZEK8rMXd6a4IZ8FfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770801268; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zMMHzAbccCElgZnTTHunt2AaMFlxEi2Wrnpcdd+qN3s=;
 b=GSz26ArpFPhT6DvkCRXK61rVad/q10EmEU2rTDc+yW/s1Hss51/XL+yz27gnberPjzHSD
 pPAq+0LqywyoOq8IoNtbsG8W7ytxYsax89fVYsolYsTnj4LqTy28LKO+fKC0y5wwaVBhn72
 pTeIZkYztC51DJWJZaz1CajXPhBuPczlPezW7Jb1mfZGOuUB7j9YXHqL/FDf9q8e+/VOljX
 VWrEeRqs/fsKKfFI4D23dCk12pODWLO5h8t6R2vUKfWsOOvggRZGW2x3uF5mJGcSKbj9s7o
 jbCWFsXU2q6729P4oUb0JbT9r/Zzhx6qvtWFdDf/VXMkBmQ/+3QYefsFLObA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CB82C403C3
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 09:14:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 95E2110E2C4;
	Wed, 11 Feb 2026 09:23:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C670B60053;
	Wed, 11 Feb 2026 09:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996A8C4CEF7;
	Wed, 11 Feb 2026 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770801838;
	bh=zMMHzAbccCElgZnTTHunt2AaMFlxEi2Wrnpcdd+qN3s=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Tskr0izwQHtPS47ll8VMuwygb2B8/DvwdW0zs9mUMb8ojVZDptC61rB+AcbAm2pjz
	 nUqmYFe3UJPLOXlmQw9n66sar+7+PSp/cC8GmrS1MmQ9iG0KyMdAPLMKJUdCoxZF6I
	 9QbdsW4ZD65VV4kE1kktJCbrC6FPhk4Anm7UehAEK8qt/6YjOcQmLzp/ssYL5WZ6TW
	 MOXtvGDeRQT+oeG5fGA60KBgPkEGN7WpwC8TBKR5a0M1xmiKZofqk5hKsAPEpN4lyF
	 4Y0TF8++5DSzOgzUVPh2w+ypiVibGAMNBJsmzUnE+jpZwjzko6xDzXMyQDyWcW852Z
	 dmaT1NPn5BAbw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 10:23:47 +0100
Message-Id: <DGC0UXBRSOPZ.PG0X6KTEA3RJ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH -next v9 1/3] rust: clist: Add support to interface with
 C linked lists
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
 <20260210233204.790524-2-joelagnelf@nvidia.com>
In-Reply-To: <20260210233204.790524-2-joelagnelf@nvidia.com>
Message-ID-Hash: URIDQPKTDYG647QWCVU746NHZBZCLG4I
X-Message-ID-Hash: URIDQPKTDYG647QWCVU746NHZBZCLG4I
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/URIDQPKTDYG647QWCVU746NHZBZCLG4I/>
Archived-At: 
 <https://lore.freedesktop.org/DGC0UXBRSOPZ.PG0X6KTEA3RJ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 11, 2026 at 12:32 AM CET, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
>
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

I think you forgot to address my comments from [1].

[1] https://lore.kernel.org/all/DGB75XMWML8M.DFZY5L52EBQF@kernel.org/
