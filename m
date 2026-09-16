Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB258C982C4
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 09:30:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B63F610EA7A;
	Wed, 16 Sep 2026 09:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YCaIdDCy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AE710480E1;
	Wed, 16 Sep 2026 09:12:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789549947;
 b=Bt4K7qEeuESX1oiRdsX0C6cMKsMjb/tOetTgYfqMZpb1ZhBymyBMXGn78nGk8CxZyD+Y2
 U1YURpp81VoM4+X+qjMT/yJTzRjtFadVBF9VzKr9RNgGTppnL45Ig2XshSz53KS15IxwSXm
 DowuT5w8QYGWLEJ7XyAq1M8C7eQWVUWsWVIse2oJFO5AKKFH1SwbOj5f0DAlSaZZowgrVAU
 iUbdn6KdZOoIf0KHP7HzJLCNgN96Dt4bcs5HsjMwqvRYdjuSbgqATou8ufh2dEqOclNKDhU
 ncQK/K75pBflYu4AwPtG5E/QFm22HxEY6P0E2nQwZd4ZIm+QgMLws8vgYy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789549947; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
 b=eKAwMHfN0IHJdm5UZpWk646eZEdoboPat1eRV0xUbS4l9Aj2Ilc/M60PdGejclgU2P+ZI
 /F3l/dl5W07pBDmMVGVbiLK0MUNDohpfxur9N3B1jYfYa1N25MVsVsDmJjjQ4iOodde5c9g
 u7HmvMcvtC8pqBmjn2lkkqluicBlf3oldXB9d20LSM38SCVTG1JZmifv84/pBN03Gn9E5WK
 B7IpyXqJU27/KUa/n2Vpvtwi0t0PREkRedyU1oDj8WhYIXenFF4ZmdCd/pKGVxOF846CH3C
 +CAmupy/FNEu80dKX3PbnU2p9HE23fwzoa1KBS+IWD1LUqsaeeAFOgjkfwnQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E00E3480D9
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 09:12:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E86E10E803
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 09:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789550997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
	b=YCaIdDCyoE93yZmBAfESVoajo49TPwa7hyUImgklXjgAUauE0Chzl86f50GNoG1YHkECbX
	uKOo7D/Pns4ekjXFNcSGeDA73JAlN9XoMn0nntR3B7692bbvQVsqyPCtGxslQ+DCgKEJnz
	UEYk9QAiKvMY6GLKrQa4HtfSFvVHLhs=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-Hkz9YwekMwqlc9y4iSva5w-1; Wed, 16 Sep 2026 05:29:56 -0400
X-MC-Unique: Hkz9YwekMwqlc9y4iSva5w-1
X-Mimecast-MFC-AGG-ID: Hkz9YwekMwqlc9y4iSva5w_1789550995
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2dd7d0751efso20290525ad.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 16 Sep 2026 02:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550995; x=1790155795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
        b=ziFW7sRB2ikv7SLqjx067qI4wD/A1tyEurpD0jXwU3zk+/K/t2ddckU7YzqWrWZ+Tu
         vJKkGWVUrApenICeizy457+b8KHMULW0slpwlu1ipw6WBA97OTcx5f6w1s9EZ/CxAy7p
         SNIas16BxAwfstXuyDshzDQJ5u0cE0bMTRbDvjcYPWMY5bJY8dlLUSxxTMzJn2eYxVLS
         LdboguAS+W67lhD+lNli8qerg/QJ5j+bA7P60HRyzMbSwi9hY9CLJHOa+rqRCFtL9p9Y
         WeLZuDPrDmAnuSZfnTqaXsojXbLEauacik+CBdWMPdDy4YU9BwTkASE3kwaGnZlcjyX2
         zeFg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzsr3jvRX8RcVQLDeIX9VnczjKWYTFrySQBihzW0t5hfmHQHPldrDNnbOZFSVYFlj23EX6qte7n@lists.freedesktop.org
X-Gm-Message-State: AFuF++llq9f63H+LAmY2XYroa4j5AlR6S7BXK2htIQ2OD/yw32G/PC+s
	1b3QGKtIFQIjdepDaI2Jyi9qryxAD6AgMENoHn6OGaXJBk5Ct/Cv2hB7P4IzTwcuwCHYu6wN2tU
	Lg8FtaTWSx+zyZjjcEdwwqoZmcaLvyo6DdDtb2R7kJNXecKPVerutX4LHEZFft4vDBKnnMiS24t
	H0ELz/YfrTaVfs47xLlHeRvPOl27lMZ7PrNrawW6nrZw==
X-Gm-Gg: AYBFou3W4TAWXvTxUeUVBv9nESF5X5Q7zHLLh2Vd6ZeYX+h52IkAD9NOsSnxS3XqtM6
	ipW0ZBmAgRmFBs4kxcP9Xa5iAZu6HNEKWFwFzWWVKZsIuI5GErNnvbdPNgIM1+n3zUYQEKaeG0/
	mKabEAuy0aGtYRXi9GUQYXhLWSe4i1ALIrxU/fbTm3dZaWwBALVPkGXY9p
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id
 d9443c01a7336-2dd8ea1cd1dmr23798705ad.10.1789550995063;
        Wed, 16 Sep 2026 02:29:55 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id
 d9443c01a7336-2dd8ea1cd1dmr23798155ad.10.1789550994573; Wed, 16 Sep 2026
 02:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260911124540.279841-1-tzimmermann@suse.de>
 <20260911124540.279841-3-tzimmermann@suse.de>
In-Reply-To: <20260911124540.279841-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 16 Sep 2026 11:29:42 +0200
X-Gm-Features: AcwNN1VjQRR608PaSU5v9yXg9eP7o3aE9lu55JInhqrDujLUhvS3kxSMIUXF4N0
Message-ID: 
 <CAFOAJEfWX09ZvnQvn1+SBeW4_MaSRO2JNLfoJRGYS4jXGr-09w@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] drm/panic: Test address from kmap op for NULL
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sIZRjNN0JR9d2WR9Qclc_zMV94dcaVHYhVzzVdlBhh0_1789550995
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: RZEFMZZ7GXT4OT4E5VHEKRT7GDOXSUUN
X-Message-ID-Hash: RZEFMZZ7GXT4OT4E5VHEKRT7GDOXSUUN
X-MailFrom: fmartine@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RZEFMZZ7GXT4OT4E5VHEKRT7GDOXSUUN/>
Archived-At: 
 <https://lore.freedesktop.org/CAFOAJEfWX09ZvnQvn1+SBeW4_MaSRO2JNLfoJRGYS4jXGr-09w@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello Thomas,

On Fri, Sep 11, 2026 at 2:46=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Do nothing if kmap_local_page_try_from_panic() returns NULL. This is
> not likely to hapen, as the previous page from the same memory area
> has been mapped successfully.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 23437509a694 ("drm/panic: Fix 24bit pixel crossing page boundaries=
")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.18+
> ---
>  drivers/gpu/drm/drm_panic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index ba21df4be338..d28ce8878e05 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -178,6 +178,8 @@ static void drm_panic_write_pixel24_xpage(void *vaddr=
, struct page *next_page,
>         u8 *p =3D vaddr + offset;
>
>         vaddr2 =3D kmap_local_page_try_from_panic(next_page);
> +       if (!vaddr2)
> +               return;
>
>         *p++ =3D color & 0xff;
>         color >>=3D 8;
> --
> 2.55.0
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

