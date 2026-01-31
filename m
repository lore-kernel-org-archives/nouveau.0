Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD756E6BF3C
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 00:21:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8546610E1A7;
	Sat, 31 Jan 2026 00:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f2ssAfrO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CAE2940F63;
	Sat, 31 Jan 2026 00:11:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769818315;
 b=h+oGpSISSl20WGhDPWUe8F4cQna/3ySKd/s3bVOBCYC/VQdIQwXEaVdZB7Qbf/Vbn4x4/
 25oZzsQ+/IK85N0NPrNPRNpeP38ZAce0CYjYI913aH3+/EUtujvLMFquEAD2ZdU9DOVo+/c
 AvaEq4I70FuPJFgs30rKVEfaekK/oF6FEnkLVfEqRru9hIcLgsCkpdrVspYcyHloF6cX0/N
 vhwb+iw2/uS5hB5BMFEwtYekwKH5/FMFu8kk83nFGhENopnnKIOGAnIuNMZ2Y2ojImsOmis
 Gs0XezfotCy/gYVWpTml1iP5AE/04JU+b5MqNfwObY+358+ulMELOuux6/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769818315; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zX0eDJRO+oU/bF//okRc9YhTFyjxZrSBK9wYVv61K2A=;
 b=SivhyXTk15YNLJr6O8tqbGKfXC7Pjtvg8qP/62dk++t5X3KqeCrHI+QvJV4SzLwLUGypE
 8JKr6q1xRNDKce9nvw8j9kW2shsCwNehIaNq+Ne7k3iegL1bu+KmJ+2Sr4B7K2blqPR9sch
 1FAm7YGiMd9uHasRwBd1QMhfDjK0NW3rw1sbSAabfiL/oWUlUKopvtF0yTa4ZRBNtmi3xHC
 lk+K1C5DBpSxL9shAkcSXJVGY5oYehKAZeV3QfGdcyob1AmkoGvQMHZVvVSyxlBn8UdqVg0
 H94L90RSx9BNYgwD+tx6ctYGQCB0iEvUPkf70FVdS2lcSm+Y/S5t/N/tIIhw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 496654015A
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:11:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BBB9510E109
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:20:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7029F40DA3;
	Sat, 31 Jan 2026 00:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC98C4CEF7;
	Sat, 31 Jan 2026 00:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769818859;
	bh=zX0eDJRO+oU/bF//okRc9YhTFyjxZrSBK9wYVv61K2A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=f2ssAfrOZHgDR6sg2FWzY+ho+uGHbeO3TD091xzCj9KaIGZ62GfYuRsvzMQyusKF4
	 IA1JAO0fSG9fbGQkrx+hPgV+1LMPChUJeeXUFFuG5Y78AzmFSzdsGoLqJpD1qcaIf9
	 X00peshcaJMmI9LwfqYK8ndsyv2kYsh7XjWeYGocJ1KYi2ieV/IcVSUFlbhVCbT0su
	 zdE7JhPmpK7OnSzFAA11RICJRUIy8turwhZJvqTnS/10xrD8159slO6EnM/FTKuHqg
	 f7R3sD/7x5HUiTlBPKrvLOjGg7GqoXHJycm23a9EQA4eul7o14T3awCJ7lNDPhNMcL
	 UxoqEjtf+oxag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 01:20:55 +0100
Message-Id: <DG2CFA6SMAMO.GR68NA4YLW76@kernel.org>
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-8-ttabi@nvidia.com>
 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
 <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
 <ab90ca9a-a721-41a5-9b28-2af73fda3212@nvidia.com>
In-Reply-To: <ab90ca9a-a721-41a5-9b28-2af73fda3212@nvidia.com>
Message-ID-Hash: 7SVNW3J7I6DLA6KOG5NACCN2U3FOVVV5
X-Message-ID-Hash: 7SVNW3J7I6DLA6KOG5NACCN2U3FOVVV5
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>, "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7SVNW3J7I6DLA6KOG5NACCN2U3FOVVV5/>
Archived-At: 
 <https://lore.freedesktop.org/DG2CFA6SMAMO.GR68NA4YLW76@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 31, 2026 at 1:16 AM CET, John Hubbard wrote:
> On 1/30/26 4:10 PM, Danilo Krummrich wrote:
>> On Sat Jan 31, 2026 at 12:58 AM CET, Gary Guo wrote:
>>> On Fri Jan 30, 2026 at 11:36 PM GMT, Timur Tabi wrote:
>>>> I think there might be a problem with this code that I don't know how =
to resolve.
> ...
>> There is no need for CONFIG_NOVA_CORE_DEBUGFS in the first place. The on=
ly
>> Kconfig we need is for retaining the GSP log buffers after driver unbind=
.
>
> Interesting. And in fact...I think we can live without that feature,
> especially if it complicates things here. If someone is debugging,
> and they need logs, they can usually (always?) find a way to leave
> the driver bound long enough to get them, or so I believe after
> some experience doing this. Yes?

I guess you could put a long enough sleep or just leak the debugfs director=
y.
Not sure how much it hurts developer ergonimics going for multiple iteratio=
ns
though.
