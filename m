Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB43BC982D2
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 17:16:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4078110EFE7;
	Thu, 17 Sep 2026 17:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WI03lNYF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7683B481D6;
	Thu, 17 Sep 2026 16:59:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789664358;
 b=eLr2lmSWWUMbBnSZau5557JoIq8VaLPzMS8FroUNyyQ2bo+sbxf31B9T9MxjLJV1EwnUe
 yFiiiOAVnEOo3FaHR3Hz3ziypnn2UQ01q15LjkVVqypTaeqVORjIvcT4Zo6IujRZ9rUdHuM
 SWgxtH7oZhoEnV4+NeU406l3uxoUryPKf4IldcvVv/giltsjVe+u0xNYPJLgmum6jL5eHIx
 dNB7Yg4Y83WQzkuCkEbiLWjYWM4KARSJ3TkninXGtwehsFraeaKPf09w2K6eayKte8kgBql
 mTksX7yUYlMxE6buJ2LCglNzksSkVcEB5kFsOwmp+iKcRYOLmP8Du7U1ewfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789664358; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3MvyyPGMzfOwx0JelbURKpCi5LDNjiPyXlUunrRmX44=;
 b=GZqiBC67p+bAZWJm+WXBLruzJUyEODHBXFBMlvxNOk8cYK+MjYy188HQL3DpXmZCHNuxK
 DNQWWuu4OCyPwXdf3qaQW/kpMD1zpwO4HVcNGge/t98gjUs3GDNt2/rCpn+IBmmaDGqTflo
 /3yeryTsAh/X5WxgETKOne32UFt6AoLSc6d1z6aBAZORreCVcl1XRZU0Wykeph6GFsPYTwJ
 xmJOQHCmYrX9rvdLlH06xOcj74shvSAq7ZSBMF7KBdrx+bE7ES5+Z/DEouzAgo+G7Vxelio
 AWdYbn5Bl81i519wutb28T4GMAf0FaFq9N1O/rZ0zg3suQseA1aD0bJ6r/Lg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C153F481A1
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 16:59:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3371A10E77D
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789665412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3MvyyPGMzfOwx0JelbURKpCi5LDNjiPyXlUunrRmX44=;
	b=WI03lNYFRjwv81y+1QYhP4tTsk9slgZTPCr/LhFh1O3hRfDNePxbkNlW13Iy6qy5WQkk4z
	WOc0m9+YlR4o2cExBnpoCARf/kf7tt6czFURSV+F6vwJ/dqZZlUmGsfnoW2rHrXY5zjb8z
	5bu8xVU7sk8MgqZfQCINdDqMCBEWXFI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-n4h1nzUlOR-qjCTZknQiyg-1; Thu, 17 Sep 2026 13:16:51 -0400
X-MC-Unique: n4h1nzUlOR-qjCTZknQiyg-1
X-Mimecast-MFC-AGG-ID: n4h1nzUlOR-qjCTZknQiyg_1789665410
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-90e7de22fddso21138466d6.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 10:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665410; x=1790270210;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uC98k1DYNd0VN7AyfHY1vWTx0QXpdNax6z4iHwpWNLQ=;
        b=btrz+bwncYe80JwX4qjxd+KceBvJuBioR2ZMY7DgdEVcCLU1Zg1EKCQHWpTyulBEJW
         TOwmBFwHHIqpQwNMdVrwTwDlEdlzvKyhWRxR4COpGvGZZ27y19huis2slYa/0Yrum8Ha
         oTzzStwaUu2AqmrEy9w9fvE6FQbLda8/poV92+GpYCm+Zvlnto6PFWpA9DWMwygujwga
         /2ZuJaf9SP4LzWABaEdcgjQqoBObjXtHzYaPg6j3rRhCbwdjJPRcvz977JFmaTtQeQnE
         x9tgoDDRsvEvsX0cEzyroAAVKfeJIO56kInwFBVM36GXQkG1ceJhAoB/cAuF4QwWuF6z
         wpNQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNbifIIzWSI/Bv97aVab8IeZE3hVbR9HYbVCPUgy5M3+KwWTVPqP5SMbnwfQSl1dJhMBkLdRHN@lists.freedesktop.org
X-Gm-Message-State: AFuF++lDsmEIfXkBxVcqDPMEmbmWKm6nuYJXX/+NGznT5M2NKTfa2/yq
	g99U9lJynXX3lu5pHwqsy0M1D0XFDRKdOQQwf7HzaIinkIE3Wsa40jG8BWvMrb3QcvCsT/2MJZw
	d7n4HyOmjP9LfKdraJTgy1Rm5QYDNaOUnGc2UET52sgdY8eaMvLDV52RvvmezDPj0bcs=
X-Gm-Gg: AYBFou1O3g/3QVwQEpHjcrP/ACAHtNsnRmRKhWFsomRh0Zs92COmWfk36W7yZWKD2Zn
	0MJr/l/WqFkJBmI+k+EXCxiiESyPNyUlqGTiQa7KSlErv/xXOONG8qTJpJEnrme+KGtZ8oL5G1v
	htrzyeai2b/xHXycOn7hV1oOr6KkGcECmpBcfwohg2n4NkzmWf3E600mscbYu+TXyOAzlhYvyO5
	/645a/AXDFRy8JwAf4ZLFg2UI7UYYWIFJUyxTKoUMKfxyulJ+DXHznyJ3JB6Bt3g910hwqLKTuO
	x+E9GTbZHnHZtB/FZ8WnC6lv5w2OEL/XnSccK3AgcPViiZSREzRE1ph/3tBTh4cLt8hHCuqs
X-Received: by 2002:a05:6214:2a45:b0:8ef:4ed2:316 with SMTP id
 6a1803df08f44-9123d70ceabmr135427046d6.1.1789665410465;
        Thu, 17 Sep 2026 10:16:50 -0700 (PDT)
X-Received: by 2002:a05:6214:2a45:b0:8ef:4ed2:316 with SMTP id
 6a1803df08f44-9123d70ceabmr135426346d6.1.1789665409997;
        Thu, 17 Sep 2026 10:16:49 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91252d2b826sm2374926d6.47.2026.09.17.10.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:16:48 -0700 (PDT)
Message-ID: <6a934ca2b3caeb20f1b3d2e9d71e987d5d78af15.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix bridge reference leak in nv1a_ram_new()
From: lyude@redhat.com
To: Wentao Liang <vulab@iscas.ac.cn>, airlied@gmail.com
Date: Thu, 17 Sep 2026 13:16:47 -0400
In-Reply-To: <20260916180036.2090118-1-vulab@iscas.ac.cn>
References: <20260916180036.2090118-1-vulab@iscas.ac.cn>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RLFwqLAL35PB_5Ls76PlSBYXMfHMgSBa8Fv6mMpzxcA_1789665410
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4BR6XMWZYEU4EJ5CSGNIWEYJHK5ZKBKY
X-Message-ID-Hash: 4BR6XMWZYEU4EJ5CSGNIWEYJHK5ZKBKY
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dakr@kernel.org, dri-devel@lists.freedesktop.org, helgaas@kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, okaya@codeaurora.org,
 simona@ffwll.ch, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4BR6XMWZYEU4EJ5CSGNIWEYJHK5ZKBKY/>
Archived-At: 
 <https://lore.freedesktop.org/6a934ca2b3caeb20f1b3d2e9d71e987d5d78af15.camel@redhat.com/>
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

On Wed, 2026-09-16 at 18:00 +0000, Wentao Liang wrote:
> pci_get_domain_bus_and_slot() takes a reference to the PCI device,
> which is never released once the memory size has been read from its
> config space.=C2=A0 Drop the reference before returning.
>=20
> Fixes: 2fa6d6cdaf283c05 ("drm/nouveau: deprecate
> pci_get_bus_and_slot()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c
> index 18241c6ba5fa..4d52a158f320 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c
> @@ -51,6 +51,8 @@ nv1a_ram_new(struct nvkm_fb *fb, struct nvkm_ram
> **pram)
> =C2=A0=09=09mib =3D ((mem >> 4) & 127) + 1;
> =C2=A0=09}
> =C2=A0
> +=09pci_dev_put(bridge);
> +
> =C2=A0=09return nvkm_ram_new_(&nv04_ram_func, fb,
> NVKM_RAM_TYPE_STOLEN,
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 mib * 1024 * 1024, pram);
> =C2=A0}

