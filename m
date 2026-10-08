Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FD0CA6017
	for <nouveau@archiver.kernel.org>; Thu,  8 Oct 2026 22:32:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4E010FDAE;
	Thu,  8 Oct 2026 22:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bWyl+jJ2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CC76E489E1;
	Thu,  8 Oct 2026 22:14:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791497650;
 b=hakQqXM6lg/SuoIVKMDkSvZy59BIYQHRGsh++0zJ6yo1ZedD7y1ZqpZDUJDSYc3e3tQ57
 xpflXHLWz/Py+hih1sWixvVGU6iNgytNpE7MnXf4vXCBoqmPnLwhU/bzvyEUN88YA/C20mX
 tKCZPenfBKLz4QkGAq2H7KIiS5yDnB096/ZmqtDk+W+fXqXq6LAUIZYnRrqC94Oc1M5wiv/
 oNq70VXz2uPQDtI4XZY1RWI10UWJ8ZIxVqtEX9xqwE0yzPyelQ5llCF1dktxzpUhUvZnGgQ
 mojf9KH/OUMSXuFNRDVL9Pz8mjle6kheDCn5duR84Dkxc9w69gr3ZtVHpMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791497650; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SIc4iwA5XrGPQ2J5CyhQjre/d7+7alnceRYs7l0hTO4=;
 b=KCbmT5g+6p9Yi/xCo3fBE6LZFalkfZlkYD6C3o68No4WXnfOKSuSZF+21HNRKvPUqOM8h
 niksa1kdxu2uMNi7ztuzKLNfa0KY5I79AnGfvSn8DZUfmsKCJNGQdHCNLr9w/n5fLbZkJf5
 IQ/rgQrnjXMrIuT/eY0wLhIqbHUzcM0OZTFPLGitCRTYzVmdyFP479ESAnVkmIOGgneyzlr
 g+m5CXCG2wOLW9vWZcGJlzVSmnfMOT6khgPJyjYeeelcCrKkV1Qu9JLTCOxEnJ4jP7XYi+M
 fX7JWIRcMcCOvOiNF6a8Iyl92X5kxrpdjuzdykUC/y7sDZ3eBmeJSMBQy/kA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 19EFB40634
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 22:14:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8A710EA4A
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 22:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791498752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIc4iwA5XrGPQ2J5CyhQjre/d7+7alnceRYs7l0hTO4=;
	b=bWyl+jJ2pB3KHzW6jXVOADPvy6rN8wKXy0QK9P2jYtnjH/lTFjstiq1ZUT7bR4P9etNUnB
	tRz645CCuBbJCqthT9cOsS4Po4QBhrB0uo3VW8+n77NKYGeRwsqg59RhXY6yUn7CNRO3Zq
	2goVOqfJDMLV/Kp5qBWgzL8/nSs2gfU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-mkGrylM4MXqPWtW9wyypSA-1; Thu, 08 Oct 2026 18:32:31 -0400
X-MC-Unique: mkGrylM4MXqPWtW9wyypSA-1
X-Mimecast-MFC-AGG-ID: mkGrylM4MXqPWtW9wyypSA_1791498751
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93cb98809caso853046785a.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 08 Oct 2026 15:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498750; x=1792103550;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIc4iwA5XrGPQ2J5CyhQjre/d7+7alnceRYs7l0hTO4=;
        b=nAP7nt8m/plYJc1XwooLfkLsLu0fxDjtW9J5w+xkZbpq+gaG2G5XJVf4A8Asjn5W5Y
         L5AKAnclap0BEDA1W2NraE0KduRvWl0jFTx3UodUiFKy9JrDz2+M0O45fP7umwnZoKE7
         0jT0ibLLK3sGS91V1KuRnYqg8Tg99KlsPeL+Zn/u+01HMIVqDP9/8oocdmbqvlNUfUgj
         +Tsp7mZMiMxsOZYFJwQwM+O9hDZG+tvc8S46Y1nKBMtynmeOTz53CE5BL8LouFpcV2N2
         UcEo6cRr5gjUfxSAStLtZl08gN2Y3V86IMtSYkMU41p2rMOkuLAEF9I5M5wZtcIjtLVN
         2IUQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByq16jWu4pwpuxjwfSHPXBkTDzg7NcIIt6Dv5L1QaDYZfxSpCbYjoOAT4wgqPf0oewQXP7FuXMz@lists.freedesktop.org
X-Gm-Message-State: AFuF++l0cDjxiTbOU/KZeKr4/2A8tuPZdnNRlmp/IzQa6qSMX2lJTzZH
	vXXayXLYNAg85iNW9pHY+aYDd6ZVFT+NWeOLhn6VLw0jNoaXqymsZI+moCsGFZparxtZF2QSrjx
	JhLqe2pmugNuVKV34iociUQ+Z/EmtHymp4euOseLRU8X+888Fa2cLkZeUqn05UHJR0Ls=
X-Gm-Gg: AYBFou3oT9tynHvPnFLzEVnE5zmpNf6ie/6+slqyiRXk81zzQ+9gh0YJYB6Xam3c9MD
	gWFVBUyOi9JhA7gOw32mYTBw3JphigQW0Ns4hLE0PYR+sK0U7gV0oWsHq7mfz8bCzOz12e0bbl3
	I84Y8sS3jrMammtNanB8V0L4cInTDZpnrlSp8oLUd0d62eXCYU+6RURl07B4JxFGCAI6//clKfM
	OLvgIAlDsrVg0HBkoHqYhE9wAdfbqpKA7WeSxk+TctI6l9HYMYQ2SAz2u9IAXG0EA/uvxuzj5Wo
	mvE4SLjLl/G/huDAuK4EdREYqN9EN1h6CSvNYnJ/FYpFXi/4RwqnyWj5XwTOp6Tkf+lHURk=
X-Received: by 2002:a05:620a:31a7:b0:93e:739a:7ca0 with SMTP id
 af79cd13be357-93ebd22937cmr7031985a.18.1791498750519;
        Thu, 08 Oct 2026 15:32:30 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:93e:739a:7ca0 with SMTP id
 af79cd13be357-93ebd22937cmr7027385a.18.1791498750001;
        Thu, 08 Oct 2026 15:32:30 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b550d394bsm1890416d6.41.2026.10.08.15.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:32:29 -0700 (PDT)
Message-ID: <57528a486e149dc398d0ca443b33b16f805ea4e7.camel@redhat.com>
Subject: Re: [PATCH 0/3] nouveau: fix 3 null-ptr derefs
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Date: Thu, 08 Oct 2026 18:32:28 -0400
In-Reply-To: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
References: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -UQUcHA5rfXxu3Gv0zGxYt7R2slKxxU91JSXDwl1zJM_1791498751
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NW6N5TP4NBHWYAWUEQLLG7A2CFA3GDNE
X-Message-ID-Hash: NW6N5TP4NBHWYAWUEQLLG7A2CFA3GDNE
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NW6N5TP4NBHWYAWUEQLLG7A2CFA3GDNE/>
Archived-At: 
 <https://lore.freedesktop.org/57528a486e149dc398d0ca443b33b16f805ea4e7.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Actually - sorry for going back on a review, but before pushing these I
realized we might want to do a bit more of a concrete fix than just
these patches. Why don't we modify nvkm_gsp_rm() so that it also checks
gsp->rm, and then use coccinelle to convert as many instances of open-
coded `if (!gsp)` as we can find?

Would you be up for handling that? If not, I could just modify these
patches, update nvkm_gsp_rm(), and send out a new series with your
modified work included.

On Fri, 2026-10-02 at 12:09 -0600, Jim Cromie via B4 Relay wrote:
> These 3 patches fix NULL ptr derefs I hit while booting kernels with
> unrelated work (dynamic-debug) on a 2019 amdgpu+noueau laptop.=C2=A0 One
> of
> them is possibly hard to reproduce, the others are "dependable".
>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> Jim Cromie (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/nouveau: Fix NULL pointer dereferences=
 in GETPARAM ioctl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/nouveau: Fix NULL pointer dereference =
in GET_ZCULL_INFO
> ioctl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/nouveau/gsp: Fix NULL dereference in n=
vkm_gsp_gcx_ready()
>=20
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 27
> ++++++++++++++++++-----
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/device/user.c |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A03 files changed, 24 insertions(+), 7 deletions(-)
> ---
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> change-id: 20261002-my-fixups-324d25f3bd05
>=20
> Best regards,

