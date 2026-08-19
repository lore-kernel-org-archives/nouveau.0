Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A03FC5DF85
	for <nouveau@archiver.kernel.org>; Wed, 19 Aug 2026 09:39:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 06A7910ED99;
	Wed, 19 Aug 2026 09:39:12 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6071647975;
	Wed, 19 Aug 2026 09:22:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787131359;
 b=Z2w+oT8ZXhrGV4O6wMocvE77zfxVmxCZqjXtPYdZqlBvBN1f85RIc+6yG7xGER/Uj2IrR
 8qJTJqVX0EBJoWsVbo1okfoV4tehZXqQ6zflwEhbzNj30BeI+US3+5wMmJxmaFJyNO4RAW+
 E7Dtxz56on8Io06smVLmzUkFDvPRykYHkkjr/Rf2DrzmY5OgewEbuWCPTNnOD/0CW/4oXiP
 u9njzOZBIGZtnP46iPV2eWDtXXt8vphImaaQ/nie1nkh2wi8U/3BCS0yYsomIssOYx0Vf6x
 OvktFPB91HCcT/JeSii5fVFQrRKaqX7jnvC/UapkOqVoDt98YjbKw6bx/16w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787131359; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dIMgKn9ssmwMdJVgg9MfbDylpozJGdyvq0xNOf3CW1Q=;
 b=gH1c6uVBlIFc9ketbE/z4Z+MXSI20DZtRWS0jBimvEH5C/SGt8KCp5XNeTewRZvuI+3yG
 eykoIRP5qQswiJOt45JIqdQQZ5KDH0VQlvTXlNNExLt8b3Q36LDNYFhM7P87SIKo8QroQAd
 Db2IFQ9zjXFIR9FPN38DBCFs2rZCdahUJ22IKcNIxnh8C+x94Q0JTiYAwqScHNn/0yAfW6S
 fBSEdnWUzSz6uG4GB5vD7hoSJUmXk6AWQvgqKXJA9QzlJlwbFwQ6sloZSYayRhGDc5QH17O
 Y9ztptKVv2RCUZhupp9aZvdzB6NHCptcXbyG4UqJhw5+nZkTO4hIEnqnaErQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5BD77450AA
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 09:22:37 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C3C9010ED8E
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 09:39:09 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-747355a8565so243499137.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 19 Aug 2026 02:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132349; x=1787737149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dIMgKn9ssmwMdJVgg9MfbDylpozJGdyvq0xNOf3CW1Q=;
        b=GYIcNLNslc7ATfrw+z4uA2+OBwGzYhFPDKZ9pwvFK58bbjNvwp3TATtVnfAei2icJL
         jBJL3EjNb6BhAeDxNgc4xmoEkz1gm0b+FLIATZaF/97Tx6g/Pb4nfTdhVAJApKZLvVIg
         v9pLGPvrFLLNbKiXY6PWUMIC+jTmRu7Zh3MBjgSeTcCQkhPBNK60pPj8EDXOpjsDd43Q
         6ExYP9Zpv8BvVLCdsRSyESthX+vwm3eDh66+5nejhX7SKpB2b0V3RU7Em6pWIcLSZQ7J
         JH95ZcBIoEVsN5JqTjTrbdQXr9EV/6U/eFITSo4H0wnXJUy7viqed1QKGA4r9gPhvpis
         NDOA==
X-Forwarded-Encrypted: i=1;
 AHgh+Roc51ZpAofhBDv0CyEHr0TzFscfYndHGE1yW7Ii+4YfapDVTXvLEKD52nMvSOWRTT4nNqF3UPAa@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu+I5qDW4SIqZvDxbN/1Fg9ZAAzAXxnc9q3Xfkr/7FPGF/IfA4
	9mKSYEBHcPUR6S7rC/6HBAPHUAjXiIxneUJVysXoIdHEajZb4AprEr+iENlTGcl/ybQ=
X-Gm-Gg: AR+sD11cJjO8+sdrJTetIrN5odHHA8jSS4QAukJrgF/udkclJkd48fknHXsrV4nXNLP
	jEhC6YfgWyoypnU5vict/gmSm+QzDMk6CVhAEJchdbAg9CXjRAV6+ms5oPVSfq+VW+VlBS7ADwo
	OUXeBK7hLMEEHh6dP7G/DxqDHxS1ThMS2P4hB7wLlk2qVxIQjfTvJsoSru1bmxC+KzVwiTcFLKQ
	TOsia5JDEoVJMjzsn9Rhv8oPf4nwhOG+bljk+YTWsVGd0KvPZo0MVLueB7DOcYCc72LmCbZZDry
	g/tzxTCsA8GpPz/lahBQ2zG2OXM5diI/bzR0OLNJ5hYQDp6vki5eyBLsu7tFIKLr56bFxMxeKwC
	ean+rwYqJBHcFjwJv7lj1roZdIx22YBQdnflWg0taC7Mb4KUfaVHAozoud2FfJ+/Pami/jV6CrB
	jjuY0KWw30K6lDIO3F2F4ptrjJUaVlGnFIL+TZTCpNfNsGZIams0NJ+DSuXI3fr5HHrCG6+1C2o
	OTYbsyLk04/mSPwtrAX4guTzQ==
X-Received: by 2002:a05:6102:2001:b0:778:9b4:55a4 with SMTP id
 ada2fe7eead31-77809b456a3mr582779137.12.1787132347820;
        Wed, 19 Aug 2026 02:39:07 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-777dd4a7fb1sm1617868137.8.2026.08.19.02.39.06
        for <nouveau@lists.freedesktop.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:39:06 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-747355a8565so243486137.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 19 Aug 2026 02:39:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RqcNr+XnfaGiUDuU4DtUzNwjDNyEJpRFNqVl6sxaQsIDs41EmYfSJepCHQw8lHenv9r76QmeYle@lists.freedesktop.org
X-Received: by 2002:a67:e04e:0:b0:777:ffe0:a10b with SMTP id
 ada2fe7eead31-777ffe0a6b7mr539021137.4.1787132346344; Wed, 19 Aug 2026
 02:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-2-tzimmermann@suse.de>
In-Reply-To: <20260818125012.468092-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2026 11:38:55 +0200
X-Gmail-Original-Message-ID: 
 <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Uwr-MWNK1wEAyEr8Z9JNVhxk4jrnSNE7dazUpWIvLo30uHHQJP967oerw
Message-ID: 
 <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] drm/panic: Allocate QR-code buffers statically
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: TQHMFIUYJRT3UMGLCNF4SXSQA3IVC3C6
X-Message-ID-Hash: TQHMFIUYJRT3UMGLCNF4SXSQA3IVC3C6
X-MailFrom: geert.uytterhoeven@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: jfalempe@redhat.com, javierm@redhat.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TQHMFIUYJRT3UMGLCNF4SXSQA3IVC3C6/>
Archived-At: 
 <https://lore.freedesktop.org/CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Thomas,

On Tue, 18 Aug 2026 at 15:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Declare qrbuf1 and qrbuf2 as static arrays so that the module loader
> allocates them for us. Avoids the kmalloc later on. Also allows for
> using sizeof() to get the number of bytes in each array. Access the
> arrays once with memset, so that the physical pages are available on
> a panic.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -628,24 +628,23 @@ MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
>  #define WINDOW_BITS 12
>  #define MEM_LEVEL 4
>
> -static char *qrbuf1;
> -static char *qrbuf2;
> +static u8 qrbuf1[QR_BUFFER1_SIZE];
> +static u8 qrbuf2[QR_BUFFER2_SIZE];

I am not a big fan of increasing kernel size like this.
You may run (faster) into boot loader limitations.

>  static struct z_stream_s stream;
>
>  static void __init drm_panic_qr_init(void)
>  {
> -       qrbuf1 = kmalloc(QR_BUFFER1_SIZE, GFP_KERNEL);
> -       qrbuf2 = kmalloc(QR_BUFFER2_SIZE, GFP_KERNEL);
> +       /* best-effort allocation; can be NULL */
>         stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
>                                    GFP_KERNEL);

<ironic>Why not use a static array for this, too?</ironic>

> +
> +       /* touch memory so that pages are there in the case of a panic */
> +       memset(qrbuf1, 0, sizeof(qrbuf1));
> +       memset(qrbuf2, 0, sizeof(qrbuf2));

Please clarify "there"?
In cache? Not all systems have sufficient data cache, so it may be
evicted at any time.
In RAM? AFAIK kernel and module memory is not demand-paged.
In TLB? Like cache, it may be evicted at any time.

So IMHO this is futile.

>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
