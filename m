Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B7DFB5E83
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 22:36:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5289E10E3FF;
	Mon, 16 Mar 2026 22:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pnKEb25w";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A29B7451AC;
	Mon, 16 Mar 2026 22:25:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773699920;
 b=JFGiPRSIEvFjpupyO0B8MxI+TfO19SDNFksL3ackGKoDs7AAsribhZSpmmMuPse5U20lf
 hPBb2+TD+a4ux/Gbd9UsnLHn/EiOEbBz1aWymjTaue8tYmJuk/184ygx1xJ5Dz4wBA91Z6z
 FlH3g4OOgjSjkuAJwVTW2BO4CK1NenTUK2Z8TvSJbmmTl/QeYGRs1cRq4jL/bXZsq8uMAhq
 7Kz52+/YMWUmGhXRT8+RdvwqShBL1naKEYZs+M/pieTpm0EAIkUliGVU6G+A3i3mfoXkgAe
 sdaVz7Gr29iTp8M/AeOizW2bKnh6h7XIl1wiUUarY0YmuvfNOgwYl+thZrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773699920; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TOF6dJBRYXVDvTCwAhqcu6cKHx0I22Pb91A1OOMIh28=;
 b=etR2fIq99ESJnTUzFxr8DZiSvqBGXMPafIb4zWP+iP62wtt4YPf+LVXfLT1G0DNJxsI1n
 JNKw8pamBE+qxN8MzwFMG3P3DS9oGL6xZrU6lW0tlg9jThSZRRILVOrZQhOPGBp4agAnnwm
 b2Uv0JM6YolgkVEhLUi82YBFJj0GZxgCVp0j/DWlqSwV1J3IPgH7pOkL4Ag1cZcHtQHqoKH
 Y6CBlFVyFUhvTr01F8CDQnk9WQoV8NY4Cz7jjdpbp5hqAhFwhxJmYHbajx3RC6MXMeQGI1j
 cKa+l/p8V9eKOQAxvxNT6Rva5CjWNcluM4x7ECXznFDlLOLH+YZdERJMbznw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4757940696
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 22:25:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B823010E0E3
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 22:36:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E31541818;
	Mon, 16 Mar 2026 22:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E674CC19424;
	Mon, 16 Mar 2026 22:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773700564;
	bh=TOF6dJBRYXVDvTCwAhqcu6cKHx0I22Pb91A1OOMIh28=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=pnKEb25wpddQ43pgq3xrYHXC660KC+qwC7cDIXg+XJidPoDWpd6coMihLID2h1Xu3
	 ZodVTREY4CkRdj5uYlPUUOz//vjowDU8xOrFpLz+bubkzkCHtpk2pX7OH/peUHojnu
	 Q0cD1vvE9IybXUSOt8u5wohnrJJblMCZMRVdswrqpxb5xTBCmWo0OdmtRtZRtIk0V0
	 tp4BdMa2FoD/YmHx9vL2ZEa5KKm1g2EZJzjxI75KdmBjJjz7yLrC2NcN5TuOnP/VT7
	 5FIVQqlQOdy7/Pbt7Hi0ZJMHmKrkSNmGQ/rpVlqMm/FaFmrpDfodK3wkT4FINW7YP0
	 W4FR6qLO6wV+w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 23:36:01 +0100
Message-Id: <DH4KDGXZF3XU.R94ADYNQ8RUW@kernel.org>
Subject: Re: Nova developers: avoid nouveau mailing list until it is fixed
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <2a914258-bf58-4b46-99a7-d8c76fe52671@nvidia.com>
 <bc2517c2-6772-4cbd-8fd7-6dbdcdd13eab@nvidia.com>
In-Reply-To: <bc2517c2-6772-4cbd-8fd7-6dbdcdd13eab@nvidia.com>
Message-ID-Hash: UZLLPMYS6GCMOFV7HTH54PHLGOFQVNSL
X-Message-ID-Hash: UZLLPMYS6GCMOFV7HTH54PHLGOFQVNSL
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UZLLPMYS6GCMOFV7HTH54PHLGOFQVNSL/>
Archived-At: 
 <https://lore.freedesktop.org/DH4KDGXZF3XU.R94ADYNQ8RUW@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 16, 2026 at 11:24 PM CET, John Hubbard wrote:
> And if "someone" wants to fire up a new "nova" list, that uses vger
> like the other kernel lists, I wouldn't complain. :)

I considered this already for other reasons, so let's just do it.

(We can't get a vger.kernel.org list anymore, but a lists.linux.dev one sho=
uld
be no problem.)

I can send a request for nova-gpu@lists.linux.dev later today.
