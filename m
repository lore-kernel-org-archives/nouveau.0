Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75B3C5DF89
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 17:49:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 930F010F164;
	Thu, 20 Aug 2026 17:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qa2N9n89";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EBE6147A35;
	Thu, 20 Aug 2026 17:33:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787247191;
 b=RlHg8ns1yeAtugI/YvsOPh1Ap3J/Xdsko/oTrMmcL44cXCrPrEvyX1B7FN/6WE+sRrCq0
 oTTreXupBxia8KHD5/GROtnFSjh32ahVieM/LcQFdL91uvifoNlBUj4vIK6QtcOg60xebI+
 yzMmfpIDR+ojft4d/TEST7Gb3m7hSjf5sJUu+0M5QyvUKNJfcffTSPfqdUGNPQHpzudaTuH
 eO/qn3oddfzCQUCqOU8uKtU6L/zHADrEpceH2Ac3GqSf1RZboIMgtehk28p98JkW50ITF0o
 8GdNSNQ909oVsL3G5qN8uv8LCKco/uR5lYRhszsVnPr1hAtEU86r02Ivck2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787247191; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6+qiRA0Rr68w6luARuut3h/5z5IL9+5qPOnuZ1Bth1E=;
 b=MzqNJGXEhrq1AVGI1UqHxHs/tUarZ9pd7mIG345Jbrs8FsKpJXATujZRXKjo0nTDAv4wX
 4EuC3sVLo63cFYAtuDkC3ifyiWzhO4AT9MVJLCR7y/fcq6Jbdm6iYwtd9qE9eZIUx4DYCkD
 W0CXNxe38QarQ727Rtt2rbR9sFIaEBP8rR+2iTGEP7DKUC18THMTKxV0BS1KkOF68wZQlPL
 dC3rXFM1bIBc1vkRyrZraYwp1ERmkp+5ScQb668pVqINyviIRqdIL/InZT7nAIcbcobXh/n
 ZsBJKgEJhLUow3Uz11mmmSYDJg54ShjsY6WtLSxBALE1hU5I00RYP0iPHouw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 29D7D47A10
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 17:33:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4785D10F159
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 17:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787248183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+qiRA0Rr68w6luARuut3h/5z5IL9+5qPOnuZ1Bth1E=;
	b=Qa2N9n89qzL7LHK1UmEu5L0TouYM7HY9V/YhR2cDJC5yWPXSFcAGiF5BRPJH43wThkwFq1
	uCRaQR4D1FX0ZmaKzUWqT/aSevBu8DyW9s3fm3pUm5yMHM0XUTjHQxpE3e/o7UhTDAMNs/
	7+pX/5Pd+yBVaAEerh/G077lLZWBblg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-6nyfEitHPPOkN0AaZEjz0A-1; Thu, 20 Aug 2026 13:49:42 -0400
X-MC-Unique: 6nyfEitHPPOkN0AaZEjz0A-1
X-Mimecast-MFC-AGG-ID: 6nyfEitHPPOkN0AaZEjz0A_1787248181
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-47f810c8aebso90779f8f.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 10:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787248181; x=1787852981;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+qiRA0Rr68w6luARuut3h/5z5IL9+5qPOnuZ1Bth1E=;
        b=P44Sg8OxEHEdpmozxyunsz72ibgnQ2MzoviABK0vaHFO2gW4J5n3uA7Jjo6LKIiGBp
         yY8Pcvw6Yt36c7/tBbOW0djC1abg0muLJAF4lwxPm+CsYdMxv2tEK4jpUf4kQp5tdSVU
         q4DkS6nev7Jn1GnZSwjOhG59suC/ViFKzyTlxTiDziylV9Z2Si9bgpmSkRyv7DkNyDlL
         iLVDSoTwUK6NqXXQvRErqVZJAtF8Hj2yqaOSmSpTY1MOChWO0Z60eqQw+3l75aXQyIy0
         Ni/jCAtWSB3Hh48/ukp18ZhgN5VCtpu6/kOp+R1UY3m38xZHwjrJq5zSrT95Xg3pexpX
         LgQw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpCe7TbEbswvUTlogh4ixql3IdCGOUZLqSa7JhvpD5DMNZacUScmqIZLoU5h+QpQ/QeE730NhxI@lists.freedesktop.org
X-Gm-Message-State: AFuF++l/WuRx3G3dfuNjQtsz6thHEwdgTVlCph7M6lgwWjKBXx6A4d2K
	AvH8plI1BNNB6YPSJ8gcZxl4C+gXde1UT/Q+8lrO8Ui35GOvlqtsSDj4PdiCN7gm0gb7cbAKipe
	CxJgU092E5WCCc4xiU7dCM8rm+hKfiXqJnSjtkd6O+rWCw3gOw5zdq6jxlVTGrX3NQ5Y=
X-Gm-Gg: AR+sD12+Rckm6E4tKNZmy0lzPb97Ou7EvfloFOFZoRBSyCd8bPgWVTDNfkaz4eiagQm
	nOCsurkBDwEA2lSZhKo+P0a5l4o/5Jw3R/JoNFBhgn881RqJ3uOarfcqHqgiNgDFX5OBM7UOEb6
	3mEtdkbKL15JZGBRgxjkK5dsgykpXUaZPBp8OqmKxF1tivmd7nodBpnHgDRS7iuJSXn8H2rTOr9
	9ThLC1xmRY1qMyMS4hGK0YOf9d2/6D6T4DOB5lymElxsPbgkDQqDcdHKDoORhBV/GfoSoTyZgZ4
	7CAVbt7OlAC44Fb5CmNeqorU0bCr9vVet8tb1QMZoTSa2oN9w76IK33oXqIu5iYZQz6h9T7XJVx
	rL6JiO1gzDggLt9CFX0bjbE0WcWuBzfnRGAlcpIcchZDEvg==
X-Received: by 2002:a05:6000:184e:b0:47f:f339:556c with SMTP id
 ffacd0b85a97d-482c0b4a40dmr705164f8f.2.1787248180696;
        Thu, 20 Aug 2026 10:49:40 -0700 (PDT)
X-Received: by 2002:a05:6000:184e:b0:47f:f339:556c with SMTP id
 ffacd0b85a97d-482c0b4a40dmr705081f8f.2.1787248180291;
        Thu, 20 Aug 2026 10:49:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb?
 ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b145d31bsm13853815f8f.16.2026.08.20.10.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:49:39 -0700 (PDT)
Message-ID: <e4da5ba4-9a02-4080-9a83-19d401017910@redhat.com>
Date: Thu, 20 Aug 2026 19:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/panic: Split into core and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20260818125012.468092-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dtK2ClgIaHBFmJ3Xm1ka_K7Wq0XEj4cwQvMZdb-ygsk_1787248181
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XBURHQ6FLHHK6XNTU3WUJPY52SGC7K3R
X-Message-ID-Hash: XBURHQ6FLHHK6XNTU3WUJPY52SGC7K3R
X-MailFrom: jfalempe@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XBURHQ6FLHHK6XNTU3WUJPY52SGC7K3R/>
Archived-At: 
 <https://lore.freedesktop.org/e4da5ba4-9a02-4080-9a83-19d401017910@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 18/08/2026 14:27, Thomas Zimmermann wrote:
> Split DRM's current panic handling into a core and a helper module.
> The core is still part of DRM's core library. The panic helpers are
> part of DRM's KMS helper module (for now).
> 
> The motivation behind this series is to get panic handling's drawing
> code out of the DRM core. At some point it should share a single
> module with DRM's other drawing and format conversion.
> 
> With the series applied, panic hanlding follows DRM's established
> design pattern of having a DRM core interface with an dedicated
> implementation in each driver. Drivers share common code in helper
> modules. For panic handling, the DRM core still contains the panic
> entry points, the parameters and the debugfs interface. All drawing
> is now located in the panic helpers.
> 
> Patches 1 to 4 improve several issues in the current panic code. It
> makes sense to fix them before moving the core around.
> 
> Patches 5 to 8 put handling of all panic state and locking into a
> single place, drm_panic_display_panic_screen(). It is maintained by
> panic handling's DRM core code. This also enables the test cases to
> work more independently from the kernel's configuration.
> 
> Patches 9 to 11 split the panic-handling code into the core and panic
> helpers. The former maintain all state, locking and public interfaces.
> The latter handles drawing and details of the involved framebuffers.
> 
> DRM devices that offer panic handling provide a single callback, struct
> drm_plane_funcs.display_panic_screen. A new initializer macro makes it
> point to the existing panic-drawing implementation. Hence there's no
> change in features or functionality. If panic handling is configured
> off, it all clears out to NULL.
> 
> Patch 12 reworks the test cases slighly, so that they can be build as
> a separate module. Do 'modprobe drm_panic_helper_test' to run them.
> 
> Tested under bochs with debugfs and test cases.

Overall the series looks good to me, and I like the split between the 
helper and the core.
I would just drop the first two patches, as I don't see much difference 
between static allocation or kmalloc() at init, and I think that 
memset() the buffers to 0 is not useful in this case.

Best regards,

-- 

Jocelyn
> 
> Future directions:
> 
> - Panic handling shares some drawing code with format conversion and
> clients. There's even more drawing code in vkms. Later series' can
> attempt to unify and harmonize all these implementations in a single
> draw module.
> 
> - The drawing helper drm_plane_helper_display_panic_screen() still
> implements various access schemes (map, set_pixel, memcpy) in a single
> function. It could be split up into specifialized helpers.
> 
> - If we ever need a driver-specific helper, it is now possible to
> implement a custom version of display_panic_screen.
> 
> Thomas Zimmermann (12):
>    drm/panic: Allocate QR-code buffers statically
>    drm/panic: Make allocation of zlib workspace more robust
>    drm/panic: Return -EINVAL if font is not available
>    drm/panic: Return errno codes if panic output fails
>    drm/panic: Pass colors to draw_panic_dispatch()
>    drm/panic: Pass global module parameters to drm_panic_dispatch()
>    drm/panic: Retry in dispatch function if panic output fails
>    drm/panic: Split draw_panic_plane()
>    drm/panic: Display panic screen via per-plane callback
>    drm/panic: Internalize panic locking in DRM core and helpers
>    drm/panic: Move panic display code into helper library
>    drm/panic: Compile KUnit tests as module
> 
>   Documentation/gpu/drm-kms-helpers.rst         |  11 +-
>   Documentation/gpu/drm-kms.rst                 |   3 +
>   MAINTAINERS                                   |  11 +-
>   drivers/gpu/drm/Kconfig                       |   5 +
>   drivers/gpu/drm/Kconfig.debug                 |   1 +
>   drivers/gpu/drm/Makefile                      |   3 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   2 +
>   drivers/gpu/drm/ast/ast_mode.c                |   2 +
>   drivers/gpu/drm/drm_atomic_helper.c           |   2 +-
>   drivers/gpu/drm/drm_crtc_internal.h           |   2 -
>   drivers/gpu/drm/drm_drv.c                     |   3 +-
>   drivers/gpu/drm/drm_kms_helper_common.c       |  14 +
>   drivers/gpu/drm/drm_panic.c                   | 914 +----------------
>   drivers/gpu/drm/drm_panic_helper.c            | 915 ++++++++++++++++++
>   ...drm_panic_qr.rs => drm_panic_helper_qr.rs} |   4 +-
>   drivers/gpu/drm/drm_panic_internal.h          |  59 ++
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   2 +
>   drivers/gpu/drm/i915/display/i9xx_plane.c     |   3 +
>   .../drm/i915/display/skl_universal_plane.c    |   4 +
>   drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c       |   2 +
>   drivers/gpu/drm/mgag200/mgag200_drv.h         |   4 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndw.c       |   2 +
>   .../gpu/drm/renesas/rcar-du/rcar_du_plane.c   |   2 +
>   .../drm/renesas/shmobile/shmob_drm_plane.c    |   2 +
>   drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |   4 +-
>   drivers/gpu/drm/sysfb/vesadrm.c               |   1 +
>   drivers/gpu/drm/tests/Makefile                |   1 +
>   ...m_panic_test.c => drm_panic_helper_test.c} |  65 +-
>   drivers/gpu/drm/tidss/tidss_plane.c           |   2 +
>   drivers/gpu/drm/tiny/bochs.c                  |   4 +-
>   drivers/gpu/drm/virtio/virtgpu_plane.c        |   2 +
>   include/drm/drm_mode_config.h                 |   4 +-
>   include/drm/drm_modeset_helper_vtables.h      |  11 +-
>   include/drm/drm_panic.h                       | 117 +--
>   include/drm/drm_panic_helper.h                |  40 +
>   include/drm/drm_plane.h                       |  57 ++
>   rust/bindings/bindings_helper.h               |   4 +-
>   37 files changed, 1253 insertions(+), 1031 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_panic_helper.c
>   rename drivers/gpu/drm/{drm_panic_qr.rs => drm_panic_helper_qr.rs} (99%)
>   create mode 100644 drivers/gpu/drm/drm_panic_internal.h
>   rename drivers/gpu/drm/tests/{drm_panic_test.c => drm_panic_helper_test.c} (80%)
>   create mode 100644 include/drm/drm_panic_helper.h
> 
> 
> base-commit: dc462ab791b686c48545c160ecc81be64f77a846
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
> prerequisite-patch-id: b9adc9622920a3e70168e672c2c92795b3e3a106
> prerequisite-patch-id: 5030de433a01c2e99056cadb676a8e2ba35f055a

