Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C197C982D0
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 21:51:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 055B610E86F;
	Thu, 17 Sep 2026 21:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AyDmWgQI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CEE6048270;
	Thu, 17 Sep 2026 21:34:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789680854;
 b=TfEZwpH1FSEk+8QxLuWgQrFZ48aX6A0ydWc5Q5mEhGwlfE7ExxrXRpI87IODKw4PGQo9G
 bXzI3D2/Z+qjJHPIj6Ku7H+r+uoI0yQn3i3C3p5RV76TDntqQt4ZPQFji0DbbtTpPzW+T5K
 lxQinwtd1b/GmpSaIq8B0xt0FaI/eNXix3GUvuME4Nphf15uV2Jg+T65PH/+R7F45T/0+7P
 hqJXSovQdvWCGcNG8OIQ3TlA1LA9Dj7pXWsTD58p1n9mSO3RW9ulS4le0T/D84KhqPwxX2z
 uno/V7O8ZMTgGIMWI3O4JaHrfXt1cux6urd8RGlT2KSFh9dRPW9gotFXo6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789680854; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5OvxCFItIFtD3/YQ1DNKRbPAETGxIRVmjMNCoI1VGNM=;
 b=UDY54409ql8pBziRDvtLL69pqQ8y89s3AwqCd2FrWg8mWpOZiOH1s4jfUAThjsBLa689h
 QuyaJp9YGv2yzahKUBOdoWs+fZsaIraa+2NAmUtCKchiWjeXeQnNq54CX3HvDcV8MMQuPvO
 tA7sWXzpMW7hGAZkqPyW7cHGF0m0Sp8L5/gHeVvIewjFLBJBTWvMvATi46RSLqm9fXVhwqp
 gRqweL9ICtNwYfIHkpndAKFyQgDUJn8czlJq9u/l9ZX2efQYZBy4vm+llzs5qGNWyYmDuXX
 BLy0XXIx/7g2uDPvN0GCdcOLZXsDwArHbKr38bb4JGfARKnhf7SevCbS1NmQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6A39C48233
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:34:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 42D4E10E4C7
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789681908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OvxCFItIFtD3/YQ1DNKRbPAETGxIRVmjMNCoI1VGNM=;
	b=AyDmWgQIIhtMnHLpDDOD5KGYgk6VHgn7YWicCEW30ocEkUP+Ha5+Jlj7bL2J5bKgjWfK6F
	xcyt22SiV0oFLkokhhoweff7/Yf+jiVKLKBrHxjIEzywPeJAY2eeA1vGldVBCH/faYB0J3
	X4ANzlH5n3XAPf8/pCGx8fL/IoeI35M=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-OhvUStZSPa27ydgW4KyamA-1; Thu, 17 Sep 2026 17:51:47 -0400
X-MC-Unique: OhvUStZSPa27ydgW4KyamA-1
X-Mimecast-MFC-AGG-ID: OhvUStZSPa27ydgW4KyamA_1789681907
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-9104ba8bf51so4223416d6.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 14:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789681907; x=1790286707;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tt8WLUmC8MzD51c/rGvlTmZw5aHynyLZDMykNoT0CLY=;
        b=D1D3FNk0P3h4g3k3yOrLa4hrtQXwEymwV/AxD4d9LVzjzvxk/LBt8WjD92IVDVfaMH
         4C0GxAcev4p2FebdvKz1WrX9KqdYQfTJwTivEUAIBlpLK0fiaB0hoy/38P0NW+EpTfgR
         T0xrCtstKGzLie8FMrdk/h/YpctJSiyonVzrdiRcr3I4nRKu8SJDQo7Kwpr5Bp9PB4zy
         EjDcNNKbi6A7zHbEffP8pmxm0d7OcNwXc+OL1csLoBnydVT6H77bjF2FRTfI4pT5BBqJ
         nClW+YQAlAug1jJ4CdAL0nUms+tk9LBjsiqoUTDTFaf0mJZ7sYZaP0hfBWOs7t/hziQm
         IATQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxu6mVVssAiOZT9DpfreM4xjmTXqxb46SEadf7iuwrEwV4hOyoTQFp++RxLxwboC0aYrVZ7zgV6@lists.freedesktop.org
X-Gm-Message-State: AFuF++kpqowWUm0lCS9SfBTaSmkChkr9Jce4xfeKBESOmPAn6VEFKBlR
	Ak5TB9mq//8op1NcWyHdt9D/RH3+E1gJ1jtNSHNEtbQtxUz0JagM3hSrb3Tdrfbl9perfxqBjUH
	y41mqezYWpdaQC2JTtJ0bVHxFOlG8hdUkM4vL5QwZ0OUyeXpdigiC2LtGNABdR75bxqk=
X-Gm-Gg: AYBFou14GgGEqJ77FFNuo+WBv1vgXzSi+TgnzqaskpMk5GAWcgcvg6TwVBlkXdkzkC4
	q2ygQ8N9q49rT9x7U5QfNazxdwRIQp7xILCFLc8COUSJefX2obesCkd/B5LHtG8jTamAalrpj0p
	bLWm+nHwWQNcMitAB2aA/11I4AOOXFENs8GMZdtVC44lb/t1mBB+1MWjBdxTphSYz1/teOq7hgL
	S91rZwKPoeyrvyOjozReMCFEPZbF6gfCehlwTUjXEczhhFN/xTzgjPo/wdn8ZjwgvqY5dy8XOeh
	M7zdGMtU7TswK6UMcyr3F+WWPg6i4Pk+2kuhvxK/SRM+xgfwCoryPY0gNvcXJWB7l9XupV3Y
X-Received: by 2002:a05:6214:5b02:b0:910:346f:1027 with SMTP id
 6a1803df08f44-91254cb1252mr10497356d6.37.1789681906695;
        Thu, 17 Sep 2026 14:51:46 -0700 (PDT)
X-Received: by 2002:a05:6214:5b02:b0:910:346f:1027 with SMTP id
 6a1803df08f44-91254cb1252mr10496896d6.37.1789681906238;
        Thu, 17 Sep 2026 14:51:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91252c5bef1sm7946836d6.9.2026.09.17.14.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:51:45 -0700 (PDT)
Message-ID: <b020f35ab8adda3907ec2be57057996be40717c5.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: RCU-free the scheduler-containing
 nouveau_sched
From: lyude@redhat.com
To: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Date: Thu, 17 Sep 2026 17:51:44 -0400
In-Reply-To: <20260902012717.880724-1-malhyuk97@gmail.com>
References: <20260902012717.880724-1-malhyuk97@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LdjRLxNlczzdnNTKfCjtL5mAeTv1LLnZg6XE-d1-WuA_1789681907
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QRXRAQMYBWGWLLQZB3LMULUDOZYX6NM2
X-Message-ID-Hash: QRXRAQMYBWGWLLQZB3LMULUDOZYX6NM2
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QRXRAQMYBWGWLLQZB3LMULUDOZYX6NM2/>
Archived-At: 
 <https://lore.freedesktop.org/b020f35ab8adda3907ec2be57057996be40717c5.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment

On Wed, 2026-09-02 at 10:27 +0900, Jonghyuk Kim(MalHyuk) wrote:
> struct nouveau_sched embeds a struct drm_gpu_scheduler (base).
> nouveau_sched_destroy() calls nouveau_sched_fini() (which does
> drm_sched_fini(&sched->base)) and then frees the object with plain
> kfree(sched).
>=20
> drm_sched_fence_get_timeline_name() returns fence->sched->name, and
> the
> scheduler fence keeps a .release callback so it is not ops-detached
> on
> signalling.=C2=A0 A finished fence exported to userspace via drm_syncobj =
/
> sync_file therefore keeps pointing at &sched->base after
> nouveau_sched_destroy(),
> and a later get_timeline_name() -- reachable unprivileged through
> SYNC_IOC_FILE_INFO -- dereferences freed memory (KASAN slab-use-
> after-free
> read).
>=20
> Per the dma-fence lifetime contract the exporter must keep the data
> backing a
> signalled fence alive for an RCU grace period.=C2=A0 Free the scheduler-
> containing
> object with kfree_rcu() instead of kfree().
>=20
> Fixes: 5f03a507b29e ("drm/nouveau: implement 1:1 scheduler - entity
> relationship")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.h | 1 +
> =C2=A02 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 2cbae003d6de..48dbb851df2f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -516,7 +516,7 @@ nouveau_sched_destroy(struct nouveau_sched
> **psched)
> =C2=A0=09struct nouveau_sched *sched =3D *psched;
> =C2=A0
> =C2=A0=09nouveau_sched_fini(sched);
> -=09kfree(sched);
> +=09kfree_rcu(sched, rcu);
> =C2=A0
> =C2=A0=09*psched =3D NULL;
> =C2=A0}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h
> b/drivers/gpu/drm/nouveau/nouveau_sched.h
> index 20cd1da8db73..51ce8dcf6285 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> @@ -98,6 +98,7 @@ void nouveau_job_free(struct nouveau_job *job);
> =C2=A0
> =C2=A0struct nouveau_sched {
> =C2=A0=09struct drm_gpu_scheduler base;
> +=09struct rcu_head rcu;
> =C2=A0=09struct drm_sched_entity entity;
> =C2=A0=09struct workqueue_struct *wq;
> =C2=A0=09struct mutex mutex;

