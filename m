Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC439C5DF81
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 23:58:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF8C10ED0C;
	Tue, 18 Aug 2026 23:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LpeSFfYo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B9E9C47947;
	Tue, 18 Aug 2026 23:42:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787096525;
 b=HoHI5mQ4+Kb2m55kixLhXzcxzbji1Ouc8BQVWLKFj3kC/YfvhxI1O0cDniLJ2t+oovMRw
 h7UTkNwFe60ihFdcLLuwefyU59knVqQ3K6tOUH3iUwjPya3enpYB8ExMK+scqgSWablPVxh
 plZSqViE9t8l7CWZxR4D/vNU3NTn6UpIpn9eZhK74db3B/Mmceyywi9XCj7O1YpYLtwJem9
 oeQbtG+fOCafwoSADNbUXbCzBtBjuOM+iszjnrNlVkftCrzJya80aikvsO+YIs7G6Rowm0k
 WgHoVmakLPYH+f2mb+T895vPzjNxubbIo9S6fJj9l1v+sxr/3M7kjtiAQbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787096525; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tz/yXH3YIXKsxVZ87/WPseHbbbdSG7a6l6OJ3Eub38g=;
 b=JnALXTZnUSR/jDy8YlqGxNqHuYJJeovc1LjQWtCwRl8eYpzFg7I129AWGRTq6Z6iOCCGG
 MVlIfUJBGYPIcIqbReUzh85PRyVyU9bDCzrX7rGaNbiNvRmU1JjZ5HiE4Ytbn1Pgrmszo7g
 DoeJx5vt9uFL9Vc/FbKNnMmSNOW+MV09jY41XS4H6VAVdN+wUW1JreBRfo5DolLyVXu03TG
 el7bPKS9afcttSuXXkuHtojlr29CJoVTlYwOV9fSIoDjXhWuxLHNOGu65A4Fc+xKVT4L7mX
 6OFH/0DXZHaxK9TJWX78dYilF+whN/L+/L3R7ZMbjTNoHYlfOCWQPe2zRq8w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BC6E247932
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:42:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3175510ED05
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787097513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tz/yXH3YIXKsxVZ87/WPseHbbbdSG7a6l6OJ3Eub38g=;
	b=LpeSFfYoDylpGMCM3najpsWxdWM7lZIZ1PJlZsN9Kt7CWNjVhvTguLheaE+Ajweh0Vy3tm
	tj5jZBGXfXdFqhhGEgBkQ2+GrVaLqGv45OFHc+VBGJPj2g4bs54jioGXBtoHBAOoouWow4
	MMQtG/RSrAbBxgGZsj9UoPHISHJsGIU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-pfZZ4rVkNrWJ8LO8KEoWUw-1; Tue, 18 Aug 2026 19:58:27 -0400
X-MC-Unique: pfZZ4rVkNrWJ8LO8KEoWUw-1
X-Mimecast-MFC-AGG-ID: pfZZ4rVkNrWJ8LO8KEoWUw_1787097507
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52827090cc5so4817111cf.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 18 Aug 2026 16:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787097507; x=1787702307;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tz/yXH3YIXKsxVZ87/WPseHbbbdSG7a6l6OJ3Eub38g=;
        b=nQ+nKb6iqxj90T2IW8KNSxd5zvGQ/DVxXamUTtd8vDoqYorO5qsinmCz0yI8UfUjQf
         Jt8yHtIFZOGZuSLXeNX39Si2nmoaP4Xvdwpaf0Z9/hMglfI6corsA87GjNbnSRj7Fbfr
         NppU4NUNMqAb+6KTow6ivD9mvVCa24SWxpLmpMbsuzvNZdJ4efo81B1wS1/QhiV1eVAB
         3UmBXRr2L4ZGdbnG0PHmyuw+IVahjs3JOB9SzX4oVf0LDlywGh6xU+uO1HHO0R/FkC0T
         pCqddOmyJv0Sahwq5dreTkh6SpEcVYPe90G30XlPcfD/c6bVuquCpPeOjtAwhG2ygbUN
         IyUg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr+fBaQL5mVe+KVfJVhJ8pP93z2FkSs4ruI4+cX+wbiFZ816hz8lk+de1144KscRVCfcDBdJuP6@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxst19exwDbhfm9b0tPqWJAAkqu2Rh0eVQneYPoAwhTvzxO2/0w
	1aN5+QjNZ8MKpKHEZ9t8UR3/zhwX1DS3f3m2CQO+3+4+gyXF2WCJSCLQ1cI0SxbHsJv7f5aZHDf
	Kn8Nq5w8pATFkskFN7aXFMRs/Jki8gny5RifQ4f6LSmSUL3MK4vHkHF2FloJ+gSe0BPI=
X-Gm-Gg: AR+sD11f3Rqlmqp1gobtr8PVtBVBBh1jt1mYqIHoEYKdv7LJbBCzjGhYAOC+hDVDuib
	R3AvtWhUZITxG07ih0cJ16LtiEhlE8kaV9oPyf5CB0fWFF27LqN03quF+4KGfbFVEum+iNXyc0n
	HoQ1jrxXV8U7UkOZdxbVcvwBy09fPt000Otj1biCAGyw4VWNQzKpTS7PZ+zHhNG9svDjHsAbt38
	uaZc2i/aTGVzZZqyvjdrWCKqe+dKYivOGagUkvU3UzjZzmLVDN/qv/KEy9c8P/2gnRXfEvlEgm0
	iCmxNVhf6oeWeDHXS426jzu/cUwVySAnCxUNGRjl3aRaDX1Ni5hKkIaHUwVN7msUUeML9nqB
X-Received: by 2002:ac8:7fcc:0:b0:51c:1ea:e290 with SMTP id
 d75a77b69052e-52dd4970d83mr7644951cf.17.1787097506692;
        Tue, 18 Aug 2026 16:58:26 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:51c:1ea:e290 with SMTP id
 d75a77b69052e-52dd4970d83mr7644631cf.17.1787097506193;
        Tue, 18 Aug 2026 16:58:26 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52dd872a9e6sm382701cf.20.2026.08.18.16.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:58:25 -0700 (PDT)
Message-ID: <3c85782ad840395622a93e9c30f151296dea838b.camel@redhat.com>
Subject: Re: [PATCH 0/3] drm/nouveau: teardown ordering fixes for events and
 work
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Tue, 18 Aug 2026 19:58:24 -0400
In-Reply-To: <178682366001.3748010.7798811159846779765@gmail.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MLMJUFKeWz-SDsrZtKJ93F80KkHysgqBgmPlvMabTrc_1787097507
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DRDGIKT3ZYGHSZFQU5XTSP5Z43X3XG77
X-Message-ID-Hash: DRDGIKT3ZYGHSZFQU5XTSP5Z43X3XG77
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DRDGIKT3ZYGHSZFQU5XTSP5Z43X3XG77/>
Archived-At: 
 <https://lore.freedesktop.org/3c85782ad840395622a93e9c30f151296dea838b.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Thank you for all of the submissions! JFYI - I should be able to get to
reviewing this one tomorrow

On Sat, 2026-08-15 at 21:54 +0200, Marek Czernohous wrote:
> From: Marek Czernohous <marek@czernohous.de>
>=20
> Three teardown fixes in nouveau, all the same shape: something that
> can
> still run after the thing it points at has been torn down or freed.
>=20
> Two of them are not my finding. The Sashiko review bot flagged them
> as
> pre-existing issues in its review of my nv04 FIFO series,
>=20
> =C2=A0
> https://lore.kernel.org/nouveau/20260812231330.705425-1-mczernohous@gmail=
.com/
>=20
> naming nouveau_fence_context_del() and nouveau_connector_destroy()
> directly. It was right about both. 1/3 and 2/3 carry a Reported-by
> accordingly. 3/3 is mine, found while following the irq_work of 2/3
> into its handler, which is nouveau_dp_irq().
>=20
> 1/3 nouveau_fence_context_del() cancels the uevent work first and
> drops
> =C2=A0=C2=A0=C2=A0 the event afterwards. In between, the event is still a=
rmed and
> =C2=A0=C2=A0=C2=A0 nouveau_fence_wait_uevent_handler() queues the work
> unconditionally,
> =C2=A0=C2=A0=C2=A0 so a non-stall interrupt in that window re-arms the wo=
rk that was
> =C2=A0=C2=A0=C2=A0 just cancelled. The callers free the context immediate=
ly after,
> =C2=A0=C2=A0=C2=A0 which leaves nouveau_fence_uevent_work() walking freed=
 memory.
> =C2=A0=C2=A0=C2=A0 Destroy the event first, then drain.
>=20
> 2/3 nouveau_connector_destroy() drops the connector's two events but
> =C2=A0=C2=A0=C2=A0 never drains nv_connector->irq_work, which is what the=
 DP IRQ
> event
> =C2=A0=C2=A0=C2=A0 schedules. The work can then run against a connector t=
hat is
> about
> =C2=A0=C2=A0=C2=A0 to be, or has already been, freed.
>=20
> 3/3 nouveau_dp_irq() looks the encoder up and dereferences it in the
> =C2=A0=C2=A0=C2=A0 declaration block, five lines above the NULL test that=
 the same
> =C2=A0=C2=A0=C2=A0 function already carries.
>=20
> 2/3 and 3/3 both point at the same commit. Commit 773eb04d14a1
> ("drm/nouveau/disp: expose conn event class") turned nouveau_dp_irq()
> into a work callback, and that single change introduced both the
> undrained work and the early dereference: the drm pointer used to be
> an
> argument, and recovering it from the encoder put a dereference above
> the
> existing test.
>=20
> All three carry Fixes: and Cc: stable. 1/3 and 2/3 are use-after-free
> windows, and each commit message names the trigger, the window, and
> the
> freed object the work then touches. 3/3 is a NULL dereference sitting
> above the function's own NULL test.
>=20
> I also looked one level up, since it would have been the obvious next
> instance. drm->hpd_work is drained in nouveau_display_fini(), right
> after the hotplug events are blocked, under
> "if (!runtime && !drm->headless)". That guard does not exempt the
> teardown path: nouveau_drm.c:597 calls nouveau_display_fini(dev,
> false,
> false) immediately before nouveau_display_destroy(), so runtime is
> false there. The runtime exemption belongs to the suspend path
> (nouveau_display.c:781), which frees nothing. So there is no fourth
> patch here.
>=20
> Testing
>=20
> =C2=A0 Reference hardware: Apple Macmini3,1, MCP79 / GeForce 9400M (NVAC)=
,
> =C2=A0 Core 2 Duo, Wayland (labwc). Note for 1/3 that this chip takes the
> =C2=A0 nv84_fence path, which is the one where the event exists at all.
>=20
> =C2=A0 Build. The series is built against the stated base commit, as a
> full
> =C2=A0 kernel build rather than a module-only one, so modpost actually
> =C2=A0 resolved the module's symbols instead of being skipped for want of
> =C2=A0 Module.symvers: zero compiler warnings, zero compiler errors,
> =C2=A0 nouveau.ko produced. checkpatch.pl --strict is clean on all three
> =C2=A0 patches and on this cover.
>=20
> =C2=A0 What the testing does not show, stated plainly: I have not managed
> to
> =C2=A0 hit any of these three windows deliberately on this hardware. They
> are
> =C2=A0 ordering bugs reasoned out from the source rather than from a
> =C2=A0 reproduction, and I would rather say that than dress up a crash I
> do
> =C2=A0 not have. Each patch names the file and the function it argues fro=
m
> so
> =C2=A0 the reasoning can be checked directly.
>=20
> AI assistance
>=20
> =C2=A0 Lyude asked on an earlier thread whether these patches were writte=
n
> by
> =C2=A0 a human and pointed at Documentation/process/coding-assistants.rst=
.
> =C2=A0 The answer, repeated here for the archive: this work is AI
> assisted. I
> =C2=A0 use Claude (claude-opus-5) as a coding and analysis assistant.
> Every
> =C2=A0 patch carries an Assisted-by trailer accordingly, and no Signed-
> off-by
> =C2=A0 is added by the tool.
>=20
> =C2=A0 Nature of the assistance, so you can calibrate your review: the
> =C2=A0 assistant did most of the code archaeology and drafting. I
> described
> =C2=A0 symptoms, asked for the mechanism to be traced in the source rathe=
r
> =C2=A0 than guessed, and asked for each claim to be backed by a file and =
a
> =C2=A0 line. The assistant also reviewed its own drafts adversarially,
> which
> =C2=A0 is how two errors in 1/3 were caught before this posting: an
> earlier
> =C2=A0 draft claimed nouveau_fence_context_kill() does not touch the
> event,
> =C2=A0 which the source contradicts, and it illustrated the freeing calle=
r
> =C2=A0 with nv04_fence_context_del(), which is precisely the case that
> cannot
> =C2=A0 reach the bug, since nouveau_fence_context_new() returns before
> =C2=A0 nvif_event_ctor() unless nv84_fence_create() set priv->uevent. Bot=
h
> =C2=A0 are corrected. I reviewed the result, I understand the code, and I
> =C2=A0 take responsibility for it.
>=20
> Marek Czernohous (3):
> =C2=A0 drm/nouveau: destroy the fence event before cancelling its work
> =C2=A0 drm/nouveau: cancel the DP IRQ work before freeing the connector
> =C2=A0 drm/nouveau: don't dereference outp before checking it in
> =C2=A0=C2=A0=C2=A0 nouveau_dp_irq
>=20
> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
> =C2=A0drivers/gpu/drm/nouveau/nouveau_dp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 4 +++-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2=
 +-
> =C2=A03 files changed, 5 insertions(+), 2 deletions(-)
>=20
>=20
> base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86

