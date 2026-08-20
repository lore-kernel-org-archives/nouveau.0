Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE1DC5DF86
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 18:28:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DF18C10F164;
	Thu, 20 Aug 2026 18:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YQQYThKV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3B3EC47A54;
	Thu, 20 Aug 2026 18:11:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787249490;
 b=t60ogBSlO9xLVot0BFLekZlFZrmCqc0odaD1SVjtGzvPIe35kDB6KwmOi2pnyy8H4+zGR
 h0vJeSA2oBlMNsOhbjLUip2dVJ3aZylafY0roQ9f+tnv8Tdq0AOmcBWWO0b9QappH27ftZt
 Z/pnrpx/hjS3sQvN3x0aiTvLY6oGak6zYb//AiT3QThDHmq1jaroHFnauCFbzAMs0Iwi8lo
 3jM+SSzqh9Gv4w/KKNXGTGDffijXS4JAgWmZvabLE/NvRf+kiK1/tO2GJliWRBQBzcuxRpO
 Tz4No9eZwDhvrpbT/RF1Lg8ZjoxU1ew2ol/g9ES8Yxk8aprvKnTKWHnxfPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787249490; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ioDl19YMAvkax5adWxSHFRx0OcBttsxIoujuyuuFzRs=;
 b=fqTuEft2xtn8Xa+Hnb7nS8JsYVPMuhI3uvgLDFcZcL6wm2Gcjnxy8SreUshSmPOZW7JZ3
 s0Uo+h6PvhymC6BXxhgMRegMRVv49Qs9dn/fSQTUgaTChsVV+ERV8Ilr4AsL1wCVo8auqzB
 raRAScXkZZaS9Xq5IwDCL8kQ5OZYcYfcyIjaitKX+7xuFIy0MJnS9MIJI/eZ3sYFkDWY3X9
 r6plrcq7d2gQCr1J0yoFyskEm4+mxBJ7C5R9yWXm/PH5DLiccxcjxr25i8RM0JbG9G5aaZz
 X77emotN+DHD0AgzATb+6JYzhMxRBO8YxVG3FTGtwlgTGGyPt0DAZv8LiQSg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C53AC47A41
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 18:11:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 20D9610EE01
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787250481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ioDl19YMAvkax5adWxSHFRx0OcBttsxIoujuyuuFzRs=;
	b=YQQYThKVOEKySyiRNKq1iPKchNjs6Np9mn1ckeROts3shFNtQWm15kSKEIaZdGXj+b0oE1
	/V8xSPuZvkIgFyacFc//54lQ+Anan5xYuaSh3YWiCTQdpOkH5O716Y7twqaYvMV2a0a8gK
	9+hctL1DtqEkeCIxbRaTUgDBBEA3WL4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-gu_MkPjrOrasm94WpFYZVA-1; Thu, 20 Aug 2026 14:28:00 -0400
X-MC-Unique: gu_MkPjrOrasm94WpFYZVA-1
X-Mimecast-MFC-AGG-ID: gu_MkPjrOrasm94WpFYZVA_1787250479
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e63df032bso143359585a.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 11:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250479; x=1787855279;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rl/GCSC9mrxRzZFL9EE5o5Bx5mzQPkItraIxAO9n+xk=;
        b=JeoqcY9mttC8XhYWai9yT4VgjIDbiTZdYIsLiM1/DL3gV+R2aIO1y5Z+iya7jeGShN
         bAF5aT5w/sw8/0yiIoM6Q9tnK9Jp7oMPGdmu8Vc9BHWOTXeEGV6ktlqzuwjRYPspCjvK
         NDjDfSAHk0vDh/Bspkuun9M9tnahxpsuBrQzfE9BlODpyeDBFJOtQa//BLOQOMLsErMu
         p7knVlpi7ft/U/wtUUK7BbMMagt3WOiKQu2DxtBRDXb+KxRnjzCkNFqkNlrPc5EEt3vb
         bFhhgpADgyZk3gnn8bkNFjVx8foYqEkZwqBfUqVMupGOMSrLzmgbeSf7E9rRZKZoiR2I
         PA5w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrqNjTKNiGqiV8o1oZvMp/tvEG5AC2VHmph7NHdXkgPXLO/346od2RYFXD+CrfMtEOwgQoWxYbg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI4Td9ItwciWKYi45Sxx7xJklKo3zaPv7lptUPhx+NcXjhluNA
	RoMS2Iz73LAoKwMsstW92bzfqpRBX5j0Spmd/r886/Tlm+mbQ/Yuq5LBbmlrY/zWloG2XbxbuDj
	EMVkPZ3A7260TAAseC4R7AqZtzTUZGQKixL0vmZIYWyQnkGGZYz3OJUfdRV3w9OvAq1k=
X-Gm-Gg: AR+sD12+fYrCArSI6GTEslhSUe9Vk9UR3yL2ZpczNpeO3bUoiOXVrLdLn51Xt3uHo3e
	5d0BDQs1u47RhSncDITmaVnhDiinZs5j3wLkCASggLfrF8nOeYWz022ooKBn2GtX37NELpzGnR8
	g5tU34XPJNU0DeCBR++4RDdWVE+PG2iNVK7+1NGcAJrYbbfUHRkIw04CCG9dCegB8lO8FpUjSnm
	MUQAdMwX8qlScXqui6LseUKqHxlmVPrVlqX4ci3N91MEmKA/COyM6TSHZLtUbfvxErKkqo/vQGw
	ZhY2bJZe0k1zSfqTR17gHA07IoHn0+7oEzLPEnsdbd00MhIEHp1GAu+J++wtND772F0OCzoA
X-Received: by 2002:a05:620a:28d4:b0:929:f78f:6bf9 with SMTP id
 af79cd13be357-93728497619mr773547885a.16.1787250479125;
        Thu, 20 Aug 2026 11:27:59 -0700 (PDT)
X-Received: by 2002:a05:620a:28d4:b0:929:f78f:6bf9 with SMTP id
 af79cd13be357-93728497619mr773478485a.16.1787250468774;
        Thu, 20 Aug 2026 11:27:48 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9372056b78esm422216885a.30.2026.08.20.11.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:27:48 -0700 (PDT)
Message-ID: <5a22c376eb0ded8e1cefcc042176f8c77f68658b.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/nouveau: cancel the DP IRQ work before freeing
 the connector
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 14:27:47 -0400
In-Reply-To: <178682366002.3748010.4096452389040554615@gmail.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
	 <178682366002.3748010.4096452389040554615@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oiQYjthIgKParHopWJ9YbM1jYRfKK-tR0REZEaeeNRU_1787250479
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4GOF43LN6IQY3OFQRSJJMYLLR4456YTZ
X-Message-ID-Hash: 4GOF43LN6IQY3OFQRSJJMYLLR4456YTZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4GOF43LN6IQY3OFQRSJJMYLLR4456YTZ/>
Archived-At: 
 <https://lore.freedesktop.org/5a22c376eb0ded8e1cefcc042176f8c77f68658b.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sat, 2026-08-15 at 21:54 +0200, Marek Czernohous wrote:
> From: Marek Czernohous <marek@czernohous.de>
>=20
> nouveau_connector_destroy() tears the two nvif events down and then
> frees the connector, but never cancels the work the IRQ event queues:
>=20
> =09nvif_event_dtor(&nv_connector->irq);
> =09nvif_event_dtor(&nv_connector->hpd);
> =09kfree(nv_connector->edid);
> =09...
> =09kfree(connector);
>=20
> nouveau_connector_irq() queues that work unconditionally:
>=20
> =09schedule_work(&nv_connector->irq_work);
> =09return NVIF_EVENT_KEEP;
>=20
> A DP IRQ arriving just before nvif_event_dtor() therefore leaves
> nv_connector->irq_work on the system queue past the kfree(). When it
> runs, nouveau_dp_irq() derives both nv_connector and connector from
> the
> work_struct and dereferences them, and goes on to take
> outp->dp.hpd_irq_lock.
>=20
> There is no cancel_work_sync() for irq_work anywhere in the driver,
> so
> nothing else covers this. Add it after the event teardown, where no
> further work can be queued, and before anything is freed.
>=20
> Reported by the Sashiko review bot as a pre-existing issue, in its
> review
> of an earlier nv04 FIFO series of mine, and confirmed against the
> source.
>=20
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Link:
> https://sashiko.dev/#/patchset/20260812231330.705425-1-mczernohous@gmail.=
com?part=3D1
> Fixes: 773eb04d14a1 ("drm/nouveau/disp: expose conn event class")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Marek Czernohous <marek@czernohous.de>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c
> b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index b0b0ad9a0c24..e49dcaa6d210 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -397,6 +397,7 @@ nouveau_connector_destroy(struct drm_connector
> *connector)
> =C2=A0=09struct nouveau_connector *nv_connector =3D
> nouveau_connector(connector);
> =C2=A0=09nvif_event_dtor(&nv_connector->irq);
> =C2=A0=09nvif_event_dtor(&nv_connector->hpd);
> +=09cancel_work_sync(&nv_connector->irq_work);
> =C2=A0=09kfree(nv_connector->edid);
> =C2=A0=09drm_connector_unregister(connector);
> =C2=A0=09drm_connector_cleanup(connector);

