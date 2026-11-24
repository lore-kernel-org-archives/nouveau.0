Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283AE606A31E
	for <nouveau@archiver.kernel.org>; Tue, 24 Nov 2026 11:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AGWcwVqO
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7C510F52F;
	Tue, 24 Nov 2026 11:56:07 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E2B15403B8;
	Tue, 24 Nov 2026 11:56:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795521362;
 b=ruKm/HZXJS1xPps1t1ne5dzrRXcVjNsWCMgSnOj6JJ+xGEaRZDd2C5tK6dqL7OPHrz+YG
 3nwkgCHBqSkY/2gSatbnbMW1a7ucR+su9Fpqge/BIIcSeNpx2xwFMPjAw9UYnsSZyvWfsZZ
 KMcN1wFNTRlSk1iw4fpbrvyXvFTx2ZnEUJJPejgzuImYIn/7G0S6BHLlgyNuFhaOpW6AxMw
 OXj2QHlh9Z+5qloN6RANvbiG4pJxUOYHJEnVZ5PdVTRO/law1xA8qA8vo4KjzZVP3Kn/a8Y
 zfPjRm/p7vz+8PayWqI3lze0uufeaAzDdwl+agote8+wdFPcUGy+usk5TLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795521362; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FCk4hJGWPUnhJXWJTDgKqX8nTAjZ6DEdTfpvOFD9mxw=;
 b=wp/cBSRA3u6/UAky1KYNlNog8k7GyqI+ZfjJFfjW3RQZ3Zn2zBXcK/O1kBjl40sgupFFk
 M4eU+fEIPseeK36FG+s2h4cIjJiVbJ9hAaiJW0kWQtFU99L9tW3SDgtkqplm9ij0PTXc7Gs
 aG3RI5fYooDheBHv7KJknQVvx0hBQZf5FPB7LJ1VcRvj6rulgEFoLcULptBeiGbVsBUwm9M
 6ch6FhPqf8T+KOZzH1VOsxOX8FAVy1hDBZyn+5MP6U/pernnQ8CYCDHRU4ytGNUm0Q6E1uz
 ymLeY1s2MriR316QNNVn+VjsXYyUxPvg66hmQIJWFpf/fFyTH4HToD53JT7g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
 arc=none;
 dmarc=pass header.from=kernel.org policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 31BF340218
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 11:56:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 057FD10F508;
	Tue, 24 Nov 2026 11:55:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D961762614;
	Tue, 24 Nov 2026 11:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB161F000C0;
	Tue, 24 Nov 2026 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521353;
	bh=FCk4hJGWPUnhJXWJTDgKqX8nTAjZ6DEdTfpvOFD9mxw=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=AGWcwVqOwcJ6k3arIAzYlO9cpSUxeGk9cZPoWHw7uVO8GhDTUho/5pxLOX4Z+pSEm
	 oNnRJHGLiW52Y8pLS4JzH3xmeJ2hgT990g8+NnhslrZDLXkH/JemRE/zie3Y5DOriE
	 yCplNT4VpMlbCOgvGtrHkzuH563IEwGja23JKNhbIJx28Y1oqbvaVXvVOe2+EjJSGS
	 TYUpWSlpa90tBIPQLeD3dvXzEEObPyP+YhcZafpbdA7ZzmwOT4twe7DvCxYap0IEng
	 yn+5GohlXJPjek9mNpC1hSc0dE4VSIk2IHzXja+jJUeUEo40ucs0w/DhuW1YQTxuRL
	 6Yz6rWD4EuFNw==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 12:55:50 +0100
Message-Id: <DN3F7521O232.LXJ8JBRTSTPQ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 3/3] nova-core: only bind to GPUs when explicitly
 requested
To: "Dave Airlie" <airlied@gmail.com>
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-3-5e8c27aa8555@redhat.com>
 <DN2OVF03FAL6.2EKLEYINW79YO@kernel.org>
 <DN2QWVWVB2FP.2DL4ZSBMYRXEC@kernel.org>
 <CAPM=9tw4_Kn2+q0JTZ5Y6+m6PFORJSgq4qSrqtutwWJniusgvQ@mail.gmail.com>
In-Reply-To: 
 <CAPM=9tw4_Kn2+q0JTZ5Y6+m6PFORJSgq4qSrqtutwWJniusgvQ@mail.gmail.com>
Message-ID-Hash: NDBDYRNTX3TYYYIO2YFCEWTY4XGVAN24
X-Message-ID-Hash: NDBDYRNTX3TYYYIO2YFCEWTY4XGVAN24
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
CC: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>,
 airlied@redhat.com, Alexandre Courbot <acourbot@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 nova-gpu@lists.linux.dev
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NDBDYRNTX3TYYYIO2YFCEWTY4XGVAN24/>
Archived-At: 
 <https://lore.freedesktop.org/DN3F7521O232.LXJ8JBRTSTPQ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Nov 24, 2026 at 2:53 AM CET, Dave Airlie wrote:
> On Tue, 24 Nov 2026 at 02:54, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> On Mon Nov 23, 2026 at 4:18 PM CET, Danilo Krummrich wrote:
>> > On Mon Nov 23, 2026 at 3:50 AM CET, Dave Airlie via B4 Relay wrote:
>> >> @@ -30,3 +30,24 @@ config NOVA_CORE_SELFTESTS
>> >>        logs its failure and lets the probe continue.
>> >>
>> >>        If unsure, say N.
>> >> +
>> >> +config NOVA_CORE_BIND_GSP
>> >> +    bool "Make nova-core the default driver for GSP-capable GPUs"
>> >> +    depends on NOVA_CORE
>> >> +    default n
>> >> +    help
>> >> +      Make nova-core bind to all NVIDIA GPUs it supports by default.
>> >> +
>> >> +      By default nova-core does not bind to any GPU and leaves NVIDI=
A
>> >> +      GPUs to other drivers, such as nouveau. Say Y here, or boot wi=
th
>> >> +      nova-core.bind_gsp=3D1, to make nova-core claim NVIDIA GPUs
>> >> +      instead.
>> >> +
>> >> +      nova-core is work in progress and may not be functional, so th=
is
>> >> +      is intended for nova developers and testers only. When enabled=
,
>> >> +      nouveau must not bind to the same (GSP-capable) GPUs, i.e.
>> >> +      CONFIG_DRM_NOUVEAU_BIND_GSP=3DN or nouveau.bind_gsp=3D0 is req=
uired.
>> >> +      Otherwise both drivers compete for the same devices and
>> >> +      whichever is loaded first wins.
>> >
>> > I think this is a bit unsatisfying, for the Kconfig at least it would =
be nice to
>> > avoid the possibility of being able to configure
>> >
>> >       - NOVA_CORE_BIND_GSP=3Dy && DRM_NOUVEAU_BIND_GSP=3Dy
>> >
>> >       - NOVA_CORE_BIND_GSP=3Dn && DRM_NOUVEAU_BIND_GSP=3Dn
>> >
>> > since I wouldn't consider them valid combinations of Kconfig options.
>
> While I like the idea, expressing this sort of thing in Kconfig seems
> to never end well, I'd prefer to just keep them separate until we can
> figure out scenarios where it's screwed up.

Kconfig can be tricky in some (or actually many) cases, but this one seems
simple and correct to me.

Is there a specific concern?

> I'll think about it a bit more, but I'd rather not encode too much
> complexity here for fear of one or two people screwing it up and not
> reading dmesg.

Honestly, I think that the proposed approach is even simpler, because it
constrains the Kconfig to exactly the case we want it to exist for in the f=
irst
place.

In addition to the two odd cases I mentioned above, each driver exposes its
binding-default option even when the other driver isn't configured, althoug=
h
there is no choice between them.

Consequently, we also force that nova-core defaults to not binding even if =
it is
the only driver configured.

This is not the end of the world, but it's another inconvenience and also
becomes a bit odd once vGPU works.

I think the proposed option is sound; it is only available when both compet=
ing
drivers are configured (either m or y) and defaults to nouveau.
