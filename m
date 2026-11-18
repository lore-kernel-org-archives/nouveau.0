Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7030606A31C
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASrpcuCE
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E4D2211209C;
	Wed, 18 Nov 2026 22:35:46 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B62714955C;
	Wed, 18 Nov 2026 22:35:46 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795041346;
 b=XCuVOFk4sC8iXXiRRWlj6TANmxDxdpTaPiymuYOBxicRDN6B/uEox2H02VDuoXyfigYz3
 Jm6dQx/fx7lRHBebEhokem3OY4bASpqEcYVZBlFGau+fp77Nvz74fJ9qcax3RClSHwwwkKD
 wo/MuP308yYJiSOh9rRAVyKgDo7DQDc8U1LERbP0WHQJ+mg2/tY0LZ/ukCNCY6LfPRuCtoB
 YRcRA1yaDKNc9AYyoklDTImLZu75M+n1FNbl4hzjwsIkFhqHyb/NnJl4TaiS02Zs3gJNUY3
 zAXaNmfxRt9P+IEFowBtyMfGviTo+44OlHCom5o/UfFg6x8tep9tcgB8jFmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795041346; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=023EV3UmscqrU+3CKH4pWC/ZjtyGVf4mSMvlqbUYUjk=;
 b=uZ1BppxAO/DTAaeyzm59UcoSpTvZbXUrNDQ4HA9XsR2ZPcuz3PzOY3PtiHDN9jA2kVQlM
 wSS4cpXgoRlw6eLd8NXxwflSNxofPEeYZpG8TjBmU4rY9JTnMOxCICKJMWOYJrUj0iD+Wg7
 muW7g1+BruIqeC6XT2CQHmS1GsCR44V+StDsFpRWKNRlVCqGmdIZH5IFeUws+xZTPTj/PWc
 OWT163jw10rvSuvszSGKKAD0dAAxcvMHiXr4X8rCK9J3W1ppvkeed3PAtr23cetd7IeaHdb
 8RGpTzMc+/ql5MQobd4VBOYx8OmYn8PBGfWIQWarsLqrjfv8mmf7QltefLkA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7E1B645805
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 22:35:44 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAB710FFE8
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 22:35:39 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-945e6d9ceeaso140651485a.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 18 Nov 2026 14:35:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795041338; cv=none;
        d=google.com; s=arc-20260327;
        b=cf9jUVnPkUX/+BE/lq+JK36APMR6SitMT6PzUvALq0kgAznh01bfHH4gOuGjbgQRQC
         yTZ6EWoLkOmLUv/IsaDvd3B28EtSr85ckWTSp6ry/uxhHfap+720jxN48ud+65cV6XIH
         4jdLemzcsGSv4Q/qeRX8cATAVEaBkHtj/2dg9nXvjqM6fMYAdREwUiJo+jXUiHdXgRe4
         /3Vm0k0JTCE+6MPd/PWiCboaVVJTBoxf/d0PXsreXggpFo/YgoEmLrm02Fn8ZlgtdOh2
         raalFkf0SZ667cCjNROscmbhK01MsgUa7U4jYhfLKrBdzk3qC0ygQD087BD/eROlHyXE
         jrMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=023EV3UmscqrU+3CKH4pWC/ZjtyGVf4mSMvlqbUYUjk=;
        fh=l9D4pAeMUXie4v8QoHbhjJrkBQ0pzdcUgocL9OimpX0=;
        b=l/+eLfC5zVyFHZgWii0sQuphLDIewbGd3eOjtcIKX4wMY1KZzNu4oY4bsmrYrHabSk
         KapMq6hRHcCTIWuhS7qBgyL8B5pKvx8v1HGGzZBGWhOvRGYyvjRmbxZA8MqMlXkMA/s5
         fF3sz5ziZ1bKLYCmaS3z4IJ01qQxkizLUKZT8S2uykhadhN9gyx/gJZCikXB3hFZDKTu
         yWLv8zFOOIKKOtXSDKRWLy7hwJrz+/rvePyd3vjjQ3nc5HvvUdUE9joyZ++iV2M88/YQ
         UOd9lRaiLBvtk9Mlfz7nv80vpcC174q4RALbQt6PGan/5dLx7tdHnmHyRPDetTY3ifmK
         k81g==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795041338; x=1795646138;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=023EV3UmscqrU+3CKH4pWC/ZjtyGVf4mSMvlqbUYUjk=;
        b=ASrpcuCEgO1oa2vIT2fGDkRU62Kh3JvuKBos+WwNTH+1Hvbh60DVOE7/okgN1X2ts8
         wfj9LkZExDZ3X+7PCkR/ljAE3nv7OCSzZ+VOJrxSYjVSuS/eO8gmapQOB02SsbNGygaC
         Y8mafBX6Kt5pGde6/wb/VtW7nYpLIfg5dZvwHQvG4iMAWQB8pWuOua30RrQhF6fE9ict
         xq0H0ooAxJsPKBnftE3RrrwO+fyvXQsA/aBMEeB9HiK1czABIXLzaQuTtPaA0WmBhc/B
         FWEwW0Vd8CxrGW8/waW0gLD+3j8nWZxN+To88EGXq6ZY4/UmIqalT1B4DVQMCJHwpd+4
         m2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041338; x=1795646138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=023EV3UmscqrU+3CKH4pWC/ZjtyGVf4mSMvlqbUYUjk=;
        b=yUU2adejKExJdAeHivbUfs1pcvxUVJzsSd2WzMlsAnqX7urXOVv8pNb2rGTUvb22e/
         vQju/+Oc5lBv43JFX2FsIDMH2QHrB3ft5nLZh1GVmGjjBWrxG1ZZRSrQyrAHoQGkN8Wa
         zUqf4BanL8QwxN/TgBefd9eY8Gr32oQlJgGuzrqXGZRtllhFAMEzlekvlc5cLVsV+jyX
         PtFsTkkxdWqVywh7njo8FD+7Plg2sP4VjZTMv1foKhj21tfEnsId621e9Ozo8ozaoJBy
         A8eJKGFmnAtFlMM2fJLOVq9bYwwNUyJbAuvz/cEi33C5jS1gab0lnpJY6G0jijPoG0SB
         OiOg==
X-Forwarded-Encrypted: i=1;
 AL+hErHnHrDmFc1WJk5a9q/HHQk25fXiGSRBHybaxRtNDTLjF579oE4Cu07p1XJiV4bN4cXHDLYYphzP@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9felie4RsfS4nc4kPlmlUNSEARCjpOSFl8AT5Kk4fKOwLhPzDi
	jKbg3hUuM1S/UwnC3GDiJPdBStVB9cRwgflBFEcc5UWzWfYYgAyHhgOAF/i2ajVpM/r9JFYA3mv
	eZw7uwblhGtEQ0vAk6BrBF7pDj3TXFXQ=
X-Gm-Gg: AYBFou06CPjre79lVkcOYwcqyDSOxaz66padNUwyIJZsqY8xXIVcEm5IP29uRLQy8vY
	WXCclMGmwo/S2SZL6usBo6LVj3yltiQhgq06JYovI6rXfOjJpyxeBY85wQGhGhMRcmuHiPnAM21
	+3GLnUZkQ/Mm8tNyBEfOyOarA1fDLB+UBQs9wWlUwgazrjNnzVAl3IvJmm+xE6UttHehAfL+9MF
	jJHU5gdIoTRikFmnQ/5U1sX/eRRbtQkzuAbL3baGR2VfxW3NARnK48DP8WS9VMoc4wCSJ1T8lh7
	ZINsWTsWJxHUOYWJyeZn3M5zpKIsqsZs9GYcwmE6lroVrkVh3tg3IK8I9LxpQ5YAhIN4NB2nqv5
	xNHrkeydq6Pe1zGIKScOg0qxZL3AB/J6TD1p6Re3KfewGu8hvyxWvLBoDBIIXwmGe8AB5OxMc2x
	b0BtQaAicvPYQcwUq8FwvRdw==
X-Received: by 2002:a05:620a:8388:b0:944:12d5:fd45 with SMTP id
 af79cd13be357-949996075d7mr688897285a.70.1795041338269; Wed, 18 Nov 2026
 14:35:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
In-Reply-To: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 19 Nov 2026 08:35:26 +1000
X-Gm-Features: AclHuK9S7MBiqC4XDYhBqJgsIJRtApfI62TZ3NiNQFPjGFLLLvtd6Ud3s9pP4tA
Message-ID: 
 <CAPM=9twShVfc2XGzi2EcSKAxuCE1TN2Unf_Dv_ey0z8nH+BxBA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/nouveau: fix instmem io_mapping faults and
 slowdowns
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: Z2YYZUEVPQCZMWAU4HAFZEW6N7KKBDOV
X-Message-ID-Hash: Z2YYZUEVPQCZMWAU4HAFZEW6N7KKBDOV
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Z2YYZUEVPQCZMWAU4HAFZEW6N7KKBDOV/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9twShVfc2XGzi2EcSKAxuCE1TN2Unf_Dv_ey0z8nH+BxBA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to drm-misc-fixes with stable cc.

Dave.

On Wed, 18 Nov 2026 at 07:44, Mohamed Ahmed
<mohamedahmedegypt2001@gmail.com> wrote:
>
> After the instmem io_mapping commit, some people noticed that some VK CTS
> tests became much, much slower, while others started running into apps
> MMU faulting. This was because of two issues that combine together.
>
> A synchronous VM_BIND waits for its job with an interruptible wait and
> ignores the result. On a signal, the ioctl returns 0 before the page
> tables are written. Userspace can then use the new mappings, and the
> channel takes an MMU fault. This was an old pre-existing bug.
>
> On the GSP path, the BAR code keeps an ioremap() of the first page of
> BAR2 to flush BAR2 writes with a read while flushFBZero is not mapped.
> The instmem io_mapping covers all of BAR2 and overlaps it. However, PAT
> gives the new mapping the type of the older mapping it overlaps,
> uncached-minus, so instmem was now uncached without write-combining and
> bind jobs became much slower. This is what caused the slowdowns, and the
> slowdowns in turn made it easier to hit the pre-existing VM_BIND bug.
>
> Patch 1 fixes the faults. A synchronous VM_BIND now waits uninterruptibly
> for its job.
>
> Patch 2 takes the flush pointer from the io_mapping which allows us to
> skip the ioremap entirely. Nothing maps BAR2 before instmem does, so the
> io_mapping is write-combined again.
>
> Patch 3 sizes the io_mapping to the part of BAR2 that the driver uses.
> This is technically not required, but this matches OpenRM and makes more
> sense. It also guarantees that a similar issue can't happen again if
> something changes in the upper half.
>
> Mohamed Ahmed (3):
>   drm/nouveau: do not return early from a synchronous VM_BIND
>   drm/nouveau/bar: take the GSP-RM flush pointer from the BAR2
>     io_mapping
>   drm/nouveau/instmem: map only the part of BAR2 that is used
>
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |  6 +++-
>  .../gpu/drm/nouveau/nvkm/subdev/bar/gf100.c   |  6 ++++
>  .../gpu/drm/nouveau/nvkm/subdev/bar/priv.h    |  1 +
>  .../drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c | 32 ++++++++++++++-----
>  .../drm/nouveau/nvkm/subdev/instmem/nv50.c    | 19 ++++++++---
>  .../drm/nouveau/nvkm/subdev/instmem/priv.h    |  3 ++
>  6 files changed, 53 insertions(+), 14 deletions(-)
>
> --
> 2.56.1
>
