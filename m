Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D261FCD98D5
	for <nouveau@archiver.kernel.org>; Thu, 11 Jun 2026 12:06:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 334A010EECE;
	Thu, 11 Jun 2026 12:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j5S4pfgy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6867D46A5D;
	Thu, 11 Jun 2026 11:52:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781178751;
 b=bJ4dx3WI7YymzzjysBqfiG8ZEazSaFyUZOzCEN9LVABkQBz4JUzXF8mmf1Bc4ydrkQpaA
 Kmm3UB5i2l+l/EH78y1zd3V1mNoTYRjWK7Ch0Us0as6JUcp7tMn5MV0KSXh0ZeNSOWlBIOV
 K6S3zsOp1llgA5q3jdrHmUCw8rba6Vg5hg0jW3owzlWSVZV6dABRc32+f2p2d+8qv5Fw7mD
 n7NXFRg+PDBMQ+NyikidPwvDSLJE/oI4n5nZD07JZSkK2pN4UOzYgGpKtIhbCN4/AHc9Ojh
 bW9zgBmAT0aeOOdjdY8qRMRcOgg7g0/AbxRMlTFVl23HAAMUTaWGeu7Lznxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781178751; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vcsE+Ll4t6tOK0zqdhAk30KTSJNudRT/Tk/a1RVLDDw=;
 b=Wzi0c7Tzslxkho8r6PxXA7Koyp9LGQwrO/tmuXZj385dqs5Pvcxf2cj4e7Gb76FoK5mU+
 UoaH0iVOG8MLeAgGYcKEqu4C8F9hirTvrAIJxalX90BLALA9lSxpuFF4RYD4GtGgjECsONF
 gFvmzcwuJTNiGWXVwQZzS0k/NvTVwnnPQMTRlfPQZWewJ0pKiKIM71WiZB1fl+TD3C0kwW8
 RhXCAePuZg8PFycdZzoJ4P7zAXVwemnJ8RMskU8s/SqcUpz1sIxLqW7XChiltM8cuLeIvFE
 2++T9MvpoffSTwZ/pmopT319Dzs92R8O0CLifIJJba9hF/7jqoAQO1Yhe1Hw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9F8AC469E8
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 11:52:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 01B3910EEC3;
	Thu, 11 Jun 2026 12:06:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 369766001D;
	Thu, 11 Jun 2026 12:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6BA1F00893;
	Thu, 11 Jun 2026 12:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179586;
	bh=vcsE+Ll4t6tOK0zqdhAk30KTSJNudRT/Tk/a1RVLDDw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=j5S4pfgy1wTzVXarkvRi9GoSaldgH2pdXFoAaPR8hHN+mZ0G4LkNezvYKDuiufKey
	 iy74qmeGvmGgZcLb8vDjpJE8qv7lbN+Rx83wc7oWdoeVsSH//4tEUTCp9bwR6S0DsJ
	 kAF/FD1e3BiDyIyTHo1/HXbO0N5sS9IAmShv8NZLq56bOKknMMiZ3wuqlEU8NmgGbf
	 MqrHiYJDZDugg+pcZaOi8BI+FPSiryJb7wrU4gTwid89+e6YyS45ZuaPwEIPEbXvrQ
	 SOMM+nl2R5xy6KFnPVGttNmZox3lr8VH57pxHXGoAA5bv3wKd7iQW+xXdTJ2n52Fyu
	 dPULNCiXLWWvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 14:06:20 +0200
Message-Id: <DJ67GR3JEXOK.1ZSB4X97BV0MM@kernel.org>
Subject: Re: [PATCH v20 0/4] Rust bindings for gem shmem
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260610162433.923550-1-lyude@redhat.com>
In-Reply-To: <20260610162433.923550-1-lyude@redhat.com>
Message-ID-Hash: MSCVDX34XBFOQK6APBXC4JK6O5JYYAEJ
X-Message-ID-Hash: MSCVDX34XBFOQK6APBXC4JK6O5JYYAEJ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MSCVDX34XBFOQK6APBXC4JK6O5JYYAEJ/>
Archived-At: 
 <https://lore.freedesktop.org/DJ67GR3JEXOK.1ZSB4X97BV0MM@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jun 10, 2026 at 6:21 PM CEST, Lyude Paul wrote:
> Lyude Paul (4):
>   rust: drm: gem: shmem: Add DmaResvGuard helper
>   rust: drm: gem: shmem: Add vmap functions
>   rust: faux: Allow retrieving a bound Device
>   rust: drm: gem: Introduce shmem::Object::sg_table()

Acked-by: Danilo Krummrich <dakr@kernel.org>
