Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2732F30946
	for <nouveau@archiver.kernel.org>; Thu,  5 Mar 2026 12:37:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A40DD10EAED;
	Thu,  5 Mar 2026 12:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DrJxUYGJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6150144E83;
	Thu,  5 Mar 2026 12:26:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772713600;
 b=K7NhEydJEqyC0E5I53cDbWqRMV4PxB3MtepyNQak3767bmxrw4/ZAjs2rDIckCYxUYjNg
 4pGVzSKSZEUT5VKBiCcwdkee1JNXegrIrAu1YbbyoasvJ4FaY77wbA3Ihi190fzT88F4zpr
 RcOv3NB0qvHsPMkg9KGyebHJwofVBp6eUyNCxVhqsHZY5hsQaNNEo4DhGc4IUyYy+Oq3CkV
 ujJR3I/Au1+Yf2tQ6DmR24l1aYOQKbOll2+rIElV4RXcd31M41JPqDlAp+SpKCu+c9sV/eW
 nPJwZmr2hc8HvtGge6bmMxzApmd2A+ljXrfUszlm/PCaXl2jbI/63pGU+PSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772713600; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IwDeOBSinEDPZcc6YZoBtnaprgrbyGBbIU/1YYB2on0=;
 b=uihAK61qS4R/wtnOEV8Ei/OFhy/01MqaK7MTYGdLKahhIaV3lALwnOyB5Q17/8b0p1hB4
 1e9wk29MYLcg6+bsWHeYk1frMe5/PUAnS99DmHNZ8NUkValtZ3J2DRsRfgIeb+lyx/D1XWh
 tK5MxYK867JXTeXJb/2tSF+lLZWq67/nETlH8s9QYd4WvXlfL7FS7BBbkcLqOJGJ5aG/1hN
 4n4sZ29B8KAGqHpESCF1tgqj38pvK3lAGTE1ozW38F9UgP0lvze9pxhmopMwgIePyK2ai2Q
 oPJCoiw61JqUOiNSeK3ybL1G8SGw9Y/Bi46Abh/UA7d9sJ5obUWhOfFQwXUg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AE3ED41CAA
	for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2026 12:26:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFDD810EAE2
	for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2026 12:36:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69BEB42A16;
	Thu,  5 Mar 2026 12:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80950C116C6;
	Thu,  5 Mar 2026 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714219;
	bh=IwDeOBSinEDPZcc6YZoBtnaprgrbyGBbIU/1YYB2on0=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=DrJxUYGJ1sLj2vgjyCHiHKafWP3wG6vaoXugGnGtnEjxDUh0IR0rQV6RDnKsGOL/4
	 +LGbzPwtePb/Zq/DBzZSKlUsvFkrJbZjiYpFYS0d2jskBYS7yJVeMUKNO90mELEPpi
	 nFBRkBKvxQ6XsLZadHS1FUKvBhm/CymnrhNn2RWbmJVWgyDnKLaySs8Y61vScmHbXV
	 +k2dzbbSJOUyOy5iroHQRdH66v7m/bW/d390z9hUxVT/+XaByssSjnmMrmIw6hMtTu
	 Lar0BGINulgRBTMq3HDmu9dPUv2J/oE2M1a1/+4qbNSj7pX2i4BTrV8Xb6e+ouBWjU
	 eKOFjXIpKh0qA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 13:36:54 +0100
Message-Id: <DGUUQRCUTQJF.15MR7PAFJQHNF@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: "Gary Guo" <gary@garyguo.net>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
 <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
 <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
 <2fe31d10-733c-414c-9936-2d892f2a4186@nvidia.com>
 <DGU8CN7OXXB4.1S5OOWY9GNRKJ@garyguo.net>
 <3ff4588c-1322-4723-bb30-9049d0b316d6@nvidia.com>
 <DGUGFGFA7FVJ.297YIFEBLO3SH@nvidia.com>
 <22041c9e-1eda-4273-b5be-6f277dec4a4c@nvidia.com>
 <DGUNQN0P5850.3E1UV2JK8WJEW@nvidia.com>
 <DGUUKFDDA1O7.29K9XVJRZV6BN@garyguo.net>
In-Reply-To: <DGUUKFDDA1O7.29K9XVJRZV6BN@garyguo.net>
Message-ID-Hash: RKCJC76MMHZRIHSP4JXSA5CCHA7F3A4G
X-Message-ID-Hash: RKCJC76MMHZRIHSP4JXSA5CCHA7F3A4G
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RKCJC76MMHZRIHSP4JXSA5CCHA7F3A4G/>
Archived-At: 
 <https://lore.freedesktop.org/DGUUQRCUTQJF.15MR7PAFJQHNF@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Mar 5, 2026 at 1:28 PM CET, Gary Guo wrote:
> This is fine, too, although I think just returning an `Option` and ask us=
er to
> unwrap it in const eval is better.

Well, that was my initial proposal (except that it was Result and
const_expect()).

IIRC, you were against this in favor of build_assert!()?
