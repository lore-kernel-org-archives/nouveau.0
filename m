Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009CDCA9EC1
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 23:22:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 36AFB112323;
	Fri,  9 Oct 2026 23:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hRK8LJUg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4867948A41;
	Fri,  9 Oct 2026 23:03:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791587032;
 b=j1+Po3It0xEhzrXQ4uO21hKruyF0TqvPkcQPv+Ca5NuTZBmL0DGcYJDMsFICApHoYIJ1f
 vGbY6XQ5xsIYOUKI3LGfYqQ616Q49y4DIlaYfB6GlxWqZ9OsKT+RLHWT58sewp/JROdjyiq
 sZgDO4pngK6TkRcFPhy3zf66Gpx1cM8lPIPxhnUon864unx/ShewkPrdqPmFjyt/OrBLzQ+
 1pmRKneB/Re1Mm6Q7ANfEm0/KCMYweDJPWq1iqSS/reQUJdv7fzWDHumZ5Y+8tQ5YTFuBW6
 7tLpGbTHAsAYRHnPWeUlGW4QWnKYJg58ZrNFXHXGw7r3SAHxE0QWUinx/Ldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791587032; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=90QDk9UsK++TfeFt53Yn4L9GDOFPMNUxZr70RksJ3Wo=;
 b=EZU70fBnllofxBPmzQo0rkYSmn2ph9GquwFA83XVNIq9ecZ4KCxEPQ8RBWHtG/ncxtvlM
 E/hhHSrpxbY5KGTMPq4KEVeIDR5A6O3TQ4BxRnM5U1+GhvwcQUv/waTuk2mlCPiAOLOcScb
 cWpr8AW0aV+E0WX/zZbLPkCJFpYepaVHJxUsd6raxWif5WX6Ek216M9gcjTHjAy2i5ne3Ct
 JwdPq+3Emte5sQBH6X/sBl0Ymk/oF45T177xJkR9op8PavtLfWsx37ye+M8C+i99bNdoUUB
 zFxmg4xCJuhZqOzMv9gfN3CCSwDoz0MARM2Sb+ftUIB66qGuLw+CA3rHdt3w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E64C748A14
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 23:03:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 751F4112315
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 23:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791588135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90QDk9UsK++TfeFt53Yn4L9GDOFPMNUxZr70RksJ3Wo=;
	b=hRK8LJUgvYLlCucJ4nAynAi03Gsms65dAx1FmdKRiMmMekOb0fWggjkcGe9lhm1yfXyC3r
	SnnYWqZ+2t2G+Tiqr6xBbfsXA7853UvpalNcA6ELLHNPso+YpYNev5Yy3zO5xGy0akLqtZ
	F52pKgjo9vZlNQ9yjCEMPjX/xOWHYPc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-mQNwOQh9PpOLXAJNrIg6MQ-1; Fri, 9 Oct 2026 23:22:14 +0000
X-MC-Unique: mQNwOQh9PpOLXAJNrIg6MQ-1
X-Mimecast-MFC-AGG-ID: mQNwOQh9PpOLXAJNrIg6MQ_1791588134
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9308eafb465so49741285a.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 16:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588134; x=1792192934;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MOkSafKPWfgergQn1PH0zCTo27W7O5llrWCsPU5yGRE=;
        b=T/UrAXIhj9uQU53J1JugjRCM41PuHcZNuOnjy70Ju1YT0U+9hWyakal0eY8rNFmxWR
         YV9weXd3x/KiA1WqYXkBfO50Z/glfzGQGr0ohYrq9d3oudvF8JAa5J/q/Ps3hSJ35WNS
         ZTnaRRXzSPQubSPuPhOXDmqjmSsiC/Ij4xM2aC1Q2+bBl6gr/BaNlPQeVqbMN5UxxXdS
         J75/UX/14OLtR6C4r8TPqXrwQWQXkBtgmVLUFUh2OR6xqw0Fj6gOwQ8Zcag23l99FQUK
         3XRAN68mbayNmPyu4yK0ZRBC8ke/sur1uTb2WnzMJmyXCkElwyrKb/EFWooxWM62btm9
         zr0g==
X-Forwarded-Encrypted: i=1;
 AKwUvByy/Vi12+9rlbJmIay6CczEh1DWy1GmAPb2sMMYkQVxS6R94r750v4FZw6uH5OVisR3LfGReyRV@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKMy3ziGNbV28Ke74jCHkIT+94KHA23pPO5aOF76hYVWnORRQlq
	n5WllRxB/+/tucBgH6KQVrfqciNRnBEyvCgOBsEdofaeS4QPWVi+jG0eCKEhttVyDDYnjawPy08
	V/o9cM48rp/c5RQ2gXMwM8EDYU7zKQds1dfebHmpay5OwCEaCLQsOfURNs13AP3DAoeM=
X-Gm-Gg: AYBFou32pAoCD+NJtcZ4OrOI9NpgUhDlVwyXtF6s839Ir3hqzi6QgWdYlYLib3H7snb
	kgRnZJZY+i3Jr3cIIBqOCDuZLEWKPzoeUvu0rY0eE5p5+jQTmG9cwC3yPVDvRKc1lbq+oNmYDX2
	wNZcU/aHJrcd7MTfNfmKx1XtNPhlv9J9NdR//0R/bzLiSmuqGugAw33UonaBnqEn+AtiUifsJ1c
	Q3+6CJzuGE0HGFTbRfCAU+aWO3PbSP7veAmzrq+fMqcfFzfcEfK6Fi02//mPY5dlcdzcC7tCQG0
	tTFfypDm/6/4fm1RKkmv0b31E5a99Vci4aAnF7vCjwQokRpkfQNNc1XPw7okyfaGsNNlaBo=
X-Received: by 2002:a05:620a:178e:b0:93c:57da:4ef0 with SMTP id
 af79cd13be357-93ebd2916eamr545877285a.56.1791588133662;
        Fri, 09 Oct 2026 16:22:13 -0700 (PDT)
X-Received: by 2002:a05:620a:178e:b0:93c:57da:4ef0 with SMTP id
 af79cd13be357-93ebd2916eamr545873585a.56.1791588133188;
        Fri, 09 Oct 2026 16:22:13 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb984889fsm300130785a.13.2026.10.09.16.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:22:12 -0700 (PDT)
Message-ID: <929077046827f363bc32f6f59e760de27a48b5ff.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/sw: prevent NULL deref of disp in
 vblank methods
From: lyude@redhat.com
To: Zhenhao Wan <whi4ed0g@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>
Date: Fri, 09 Oct 2026 19:22:11 -0400
In-Reply-To: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-1-7e057f6aeba0@gmail.com>
References: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com>
	 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-1-7e057f6aeba0@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ABOFWLoP_zdA9MIKW1AnYZq7derHuMBnyvMPQMN94qk_1791588134
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MY4S6EFLF4OXNG7PUO2GPUWCOT2DFKQ5
X-Message-ID-Hash: MY4S6EFLF4OXNG7PUO2GPUWCOT2DFKQ5
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MY4S6EFLF4OXNG7PUO2GPUWCOT2DFKQ5/>
Archived-At: 
 <https://lore.freedesktop.org/929077046827f363bc32f6f59e760de27a48b5ff.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a moment

On Wed, 2026-08-12 at 23:00 +0800, Zhenhao Wan wrote:
> The NV50 and GF100 software-class vblank methods nv50_sw_chan_mthd()
> and gf100_sw_chan_mthd() evaluate "data < device->disp-
> >vblank.index_nr"
> to validate the requested vblank head before allowing its notifier.
>=20
> On a headless card the display subdevice is absent:
> nvkm_subdev_disable()
> (strap-driven from devinit) and the -ENODEV path of the
> NVKM_LAYOUT_ONCE
> device constructor both leave device->disp =3D=3D NULL while the device
> continues to probe and still registers a render node (DRIVER_RENDER).
> An
> unprivileged client holding a /dev/dri/renderD* fd can then create a
> software channel and push method 0x0408 (NV50) / 0x040c (GF100),
> which
> dereferences the NULL device->disp and oopses the kernel.
>=20
> The channel constructors nv50_sw_chan_new() and gf100_sw_chan_new()
> already tolerate an absent display ("for (i =3D 0; disp && ...)"), so
> no
> vblank notifier is ever registered on such a card and the method
> handlers
> are the only path that assumes disp is present. Guard the dereference
> with the same disp NULL test the constructors already use.
>=20
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c=C2=A0 | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> index 0171cdf6f639..4cf8cd120c76 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> @@ -72,7 +72,7 @@ gf100_sw_chan_mthd(struct nvkm_sw_chan *base, int
> subc, u32 mthd, u32 data)
> =C2=A0=09=09chan->vblank.value =3D data;
> =C2=A0=09=09return true;
> =C2=A0=09case 0x040c:
> -=09=09if (data < device->disp->vblank.index_nr) {
> +=09=09if (device->disp && data < device->disp-
> >vblank.index_nr) {
> =C2=A0=09=09=09nvkm_event_ntfy_allow(&chan-
> >vblank.notify[data]);
> =C2=A0=09=09=09return true;
> =C2=A0=09=09}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> index 0cfb1eaae6de..b202e11238a5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> @@ -69,7 +69,7 @@ nv50_sw_chan_mthd(struct nvkm_sw_chan *base, int
> subc, u32 mthd, u32 data)
> =C2=A0=09case 0x0400: chan->vblank.offset =3D data; return true;
> =C2=A0=09case 0x0404: chan->vblank.value=C2=A0 =3D data; return true;
> =C2=A0=09case 0x0408:
> -=09=09if (data < device->disp->vblank.index_nr) {
> +=09=09if (device->disp && data < device->disp-
> >vblank.index_nr) {
> =C2=A0=09=09=09nvkm_event_ntfy_allow(&chan-
> >vblank.notify[data]);
> =C2=A0=09=09=09return true;
> =C2=A0=09=09}

