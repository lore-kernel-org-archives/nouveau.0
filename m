Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B69C44521
	for <nouveau@archiver.kernel.org>; Fri, 17 Jul 2026 21:14:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6576810F638;
	Fri, 17 Jul 2026 21:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XbluG+va";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E20154722A;
	Fri, 17 Jul 2026 20:58:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784321933;
 b=YIAuHA+WuR92IgLuIZVdAMshr24LHi2nuHKoGiYZ2fNsnfHFcZGsD00EPJuyixMvjRxi9
 hHki9Q7X1ZROZvkrG3K+/dez0+ZQLoFbjxPX4h4pgsPFfef6+BXU2DPOHc8/VJwMpjrGkQU
 4aBL62OzFlu8Jq+I3eAwYm2b54bJtx5G2xoZOXc9rKQA12M+AudsXOiuImtKi6Dla66oexF
 yGJ/m5OUkT4R5qOSJVVB5ugVRktUUItTGK8/ow5/1FlOoGKIouJlmpG/yD9jLOrvibM1edp
 +EGVagQYn40EAPDC9MvLcwF37fCweM/5ZGH30IbBGppXr95eGVSZvoR3KAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784321933; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nbxP6xfvX5CxNHoMYiu6LalibiLgaMNPLbr1qz5t6/w=;
 b=zbjbk4iWDJ6cKTtrEteODo+C+HfD6by+1kf0KpsROAJb2b3z1iXk0P+Gj+J6jNRfaZ6Or
 fBUdFkTkkRhSHftybJX0MgKVl0p+KiZbsz8jhM/ygPbEr45O971qA8MLtU5NYCMj2+iD3Er
 miQZbsGwGG9fXY7AiimgdxKVoVDaHYBsjfiTTAIpa+zNPFkp8SDMbHxRW/nhe89YxtgxfBW
 /EIH4wDiDNLmrSsAN/uB/3kkdK5KPktu7kaAn70fFjplexRmfRyVvmmgo1Ixf2peHJ29j3U
 pmcLequvLoasF0Uf0JXnnNWz7/uAsxZClxGsZUTkkBq1AkmIW2vGO0mu0OQg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BA2C247198
	for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2026 20:58:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C6C0E10F634
	for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2026 21:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784322849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbxP6xfvX5CxNHoMYiu6LalibiLgaMNPLbr1qz5t6/w=;
	b=XbluG+va/Y1fvPzktPPlGYScZYO/DQQ4XOqEPveWhYrUfEUfYKdgur7CreV4Wbou3w3Yct
	H88kKtdTWW5X8TqpZgnWajN+gOSVYReDbIfn7yWHjm95cMi/oSmAJqqFA4b09MSjytgnDo
	9r3jJBwhdfvjKzmqdeGrN0A4F2MxptE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-D_fROnGMMTa3sBJkpzoDSA-1; Fri, 17 Jul 2026 17:14:08 -0400
X-MC-Unique: D_fROnGMMTa3sBJkpzoDSA-1
X-Mimecast-MFC-AGG-ID: D_fROnGMMTa3sBJkpzoDSA_1784322848
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e8004d60eso1077591185a.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 17 Jul 2026 14:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784322848; x=1784927648;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n8ovVroS/g0E1kqDzhNKBMWW9UR5F3sPuTt8jUlpU4=;
        b=oaJ5D2MKqSRQoAveeYJbg+vYWk5pRMPWwYc6OYMk1N52uk7KSlmloAunQcKo7BJD6E
         yPFHUmemgPzLI8pbxroYFgzMxGk8UKNQVuuIFsxzlUBA+X/iBoDwsP9eaRH5p97npSSy
         bhL68hc/UHuteXnvg4kHtcBEeK5ecPz7pe+/POUc312sTgzjW7aff2jkmBDPfYrB67Vj
         sbGcKCkGexdoLTCbzf8/PohpSQYHDXWsUqS3BDTHRBR7v/Vx+RDATT/k9IehANiXhSIQ
         QDEuWDqCmeJPm0aAoiIvTLByC9c0SBJzR1y4YjBqszN+wuGHrZeAHxnIO+V0Z+dU/5sd
         VonQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq8qm0Ha8F6K1zHlkq/jjBT4v34nt17r+QffneKl2UXa9+ngK7IUe8cDum/NvQhZEdtt/jNfQgl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweOjhdp7DcfVrar/WlZCs98BwBrQu3f8JTtSeojKMjepkBBHo9
	HiASlH+cftOVnZc/xhB9UM6MZCKh5nqavyGcJ75jvhApyZ5CHlHd6bc4Sie4E/wa/B05D78+uWo
	aG95xkQKOSJOKKP9xi9/0isgD6kGYLRIKodrwiJidIPxDbkqVJhAzgUN1LBw4EcfhaZg=
X-Gm-Gg: AfdE7cncwSrHvObKC1f9GA0CwZH6XYdd9l0cgTgS/DSz2SZIGPGix0t89PNiHO2JMEI
	IXJnC/XJ5KeZSjfvAkGInB9EbtFk5wDGT2YuWuqAkkAfamD5gckMbnvJ2GtoqRBhFRvVzc/wRpd
	0EOC3ZulPJtDrVg0DCeDw+Y2glW85GPTnqwN0CzFDaRCKWcgbOMSPPe+D1EkNFIopQX0KmFb6Ok
	MtKODSPjPvJamoPL8K4BVEv73Xh1/ks4eMmaTPqyZpNUTzJ9o20oYkkGWmKXOvqOZJUUOH1pA1z
	d1EaEVQO2UXyJk7Ys0wpnH3lmVDVslbzFdndb5tse37Lu9tuJiFFfqoPXHG6zqxD0dOLLHoK
X-Received: by 2002:a05:620a:390e:b0:930:b12c:158d with SMTP id
 af79cd13be357-930b3eea06cmr491921185a.38.1784322848114;
        Fri, 17 Jul 2026 14:14:08 -0700 (PDT)
X-Received: by 2002:a05:620a:390e:b0:930:b12c:158d with SMTP id
 af79cd13be357-930b3eea06cmr491919185a.38.1784322847719;
        Fri, 17 Jul 2026 14:14:07 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-930b5461a16sm247735785a.33.2026.07.17.14.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 14:14:06 -0700 (PDT)
Message-ID: <2aba63b4d22a329259f335b1a69a4642ad1ddb89.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Omit a redundant
 pm_runtime_mark_last_busy() call in nouveau_pmops_runtime_idle()
From: lyude@redhat.com
To: Markus Elfring <Markus.Elfring@web.de>, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, David
 Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann	 <tzimmermann@suse.de>
Date: Fri, 17 Jul 2026 17:14:05 -0400
In-Reply-To: <e3631a8e-b4a4-4e14-822d-2199f1576cc9@web.de>
References: <e3631a8e-b4a4-4e14-822d-2199f1576cc9@web.de>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bJ_E9Q2hNaGSa397VnsX_ah4Usudv6xRYJUmQTCP_ms_1784322848
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JQQIBYYXOZAZJV2QF2HDLXFHHITEXVYH
X-Message-ID-Hash: JQQIBYYXOZAZJV2QF2HDLXFHHITEXVYH
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JQQIBYYXOZAZJV2QF2HDLXFHHITEXVYH/>
Archived-At: 
 <https://lore.freedesktop.org/2aba63b4d22a329259f335b1a69a4642ad1ddb89.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in just a moment

On Wed, 2026-03-25 at 15:05 +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 25 Mar 2026 14:55:01 +0100
>=20
> The device's last busy timestamp was set in a wrapper function since
> the commit 08071e64cb642ae19ebd6ffeb13b4f3d130b5860 ("PM: runtime:
> Mark last busy stamp in pm_runtime_autosuspend()").
> Thus delete a pm_runtime_mark_last_busy() call before
> a pm_runtime_autosuspend() call.
>=20
> The source code was transformed by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 5d8475e4895e..62ac9593230f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1209,7 +1209,6 @@ nouveau_pmops_runtime_idle(struct device *dev)
> =C2=A0=09=09return -EBUSY;
> =C2=A0=09}
> =C2=A0
> -=09pm_runtime_mark_last_busy(dev);
> =C2=A0=09pm_runtime_autosuspend(dev);
> =C2=A0=09/* we don't want the main rpm_idle to call suspend - we want
> to autosuspend */
> =C2=A0=09return 1;

