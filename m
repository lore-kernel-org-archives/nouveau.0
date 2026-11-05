Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE178606A326
	for <nouveau@archiver.kernel.org>; Thu,  5 Nov 2026 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ih307SX
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BD0D4112261;
	Thu,  5 Nov 2026 08:41:55 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AC35B419A7;
	Thu,  5 Nov 2026 08:22:30 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793866950;
 b=iU6jJsDznrT4RjW2LQPEtjqZYp5Qkgd4YCkeaSa+Rr33PaOepMkmBSStTgVSufGmBpcGm
 7j0wz0D+1lfLoD5mbEdXlAXrb6HLQMC97ZpGJmB0jSvrUfDarslc5nLjWaGlD/fBiBv8O6C
 c9gC1wmV5jqOrZUVYucXOvVY59/IwY42I4u6QlPIYtIl51UIjK3al6dDzYKlxYiVKovqC6o
 65n1vcG+CVQPlQdjZUiM4sM9dMQIjw0CCCg88AMpO5uUTwFva7oLawHcIEDHGO0OD0oKJFU
 anjgREbTCVcS7stBMK2iTTzvGv7MBPj+YysvGj6vcq/S4kIY1ZmPLHoqZG2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793866950; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+LZ7gEkfFBWbsyE8LX9YD8wYeXwI3Z2u8xYCO3dSD/0=;
 b=ld2qug9TN5qQ8DHhLgmD+E1UglMjLnRZUPuBnOwmaGLcMex8OJoeVWCw+WkxR635op0Zc
 nV7WOFaA8CKIY6Kjd2CxR2sf4ck6wWGtQuXSNOq29f+vzzJaEQ1xnlmC2EdSehf5bkWhpZH
 xd1mCmbx+t5cNyjPUHhJnXNc3sWRmV6g3Jm9eA7T7lNpWae7v5nNEAvQr/9jwrO7PViG+Gu
 uPBMUgb/2H5EpxWvtj3m9bvKVOH2/HZHDvY63FalicD8VsRYnd5jQE0VSwWrkv9C/c9CUSa
 x0XuHg6Lh2hLCK2JudJ48HXfyS6g3cm4ufiuAHrhHYyI+w7XNvAeRIhDUOKQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C91F440041
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 08:22:26 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B6793112260
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 08:41:46 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-917a707f37eso17165016d6.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Nov 2026 00:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793868106; cv=none;
        d=google.com; s=arc-20260327;
        b=hs1ZWe8sR1SdyYnQeu7Wq0lRhwXQ3v175uU9YXf8Fm94u1Pz/aqyIwTijTf+ImKAfL
         jF1mJFRngAmYeGn03RC/v/nCYu9hUNHvvgR90ea0MKu8VIcBk/W7fYwJDlb79eGAGvDQ
         BWtaLhtX3v/Z8zWeuv1iqIrjC6ieZ7nuOZZ0f+XyABrMvTxyX8TomhnDhhOqsbk+uoLz
         1r2edGODi/vlMyP/193RrM64PWp+pZqnHpsA8lhLxUHL1RdEfarzHtBsXoN6L08sZIxv
         cK3iY2Q0EWFDoVZXc53Gy5Xxn0xHr6Y9RPXYS1oqTAXtETY1qOtgNaqVrELMXSJe2Lx4
         WUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+LZ7gEkfFBWbsyE8LX9YD8wYeXwI3Z2u8xYCO3dSD/0=;
        fh=i9ThHMjMYMQ6lU/gMqu5TWRVGWOM2EWOmnk6P9Kb+wA=;
        b=syf32xkUJSQeuCS3/sCkfm8fzqd8tKTCrU3EDLo1HapZnb0VtkbrMhvN0J17Aa7OGO
         1ixVkR+ryvbfweFI+go1BzoKPGGowaYmE8E7kymYKKK192dgGxh3gPkkA3IM2vIgoSZa
         tnplm/JvQQqH0VA4xcIqpj9UcoP9LElc80yWVAsbLB2Y8zVfSKAimElszRX+/L7yahtz
         M7rnOketHyY1FSBhbNbV/nsn8jyrR2YY+JCO+IFkD3BVcZ6BXCSo9kvwhm7dU28/EAiN
         M4baA/vuvOoRStdSQXnFMhb+uJklQ8/WYiuA7PQ1MrJyL4Ibk2gxKJdnwde0Jd51Ysdn
         yhCg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793868106; x=1794472906;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LZ7gEkfFBWbsyE8LX9YD8wYeXwI3Z2u8xYCO3dSD/0=;
        b=0ih307SX746IjhIgG7MS7M9B20TtFWgVb+TagZgUrU8yf5cDlTzlqtGrtp5+2T9iyY
         nGbPEVGltlMFfZMgwdS75PMtQEHN9IbfHIKaFPd06IuNuDgdHl3fjLg5qdUWRY38J7qa
         y79brkDTQhMCgc+ZjyFdmtgcRipMP4nI6ghrYcTFKP66YqqESyg87EYLpc5i+0uX+vlm
         snqdBBflbYzkU+ju/TerVrfxonOJDmeXYkWPclPewXYiM0zOBHSvMEgTQe1lrqq++toh
         zZzQmPdu8aHLPIjkUYdb2PoyyLUYft1HyJ8QGYYplvDqVvuE6vn0zipVFEYbabqzjOFx
         Ms7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868106; x=1794472906;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+LZ7gEkfFBWbsyE8LX9YD8wYeXwI3Z2u8xYCO3dSD/0=;
        b=aNlXU2VoT4lW5dVziE0P0aUleKbIDd6HbeFzhs3INKk2RsYGPnm6KDzvwjtauy3F8F
         exS325YTF6dahRxwns+0wRUvIbQbhxQkNbY1agYjI0gtgrvjO3GxATUCFT8ALLE59lyl
         U0wHN+5S9gMw3KW6DgALMW5kvRrwfEg8zY8Xd1JcGJM7unOdg2DH1jWWOIPJnoKC2BcE
         pdFUIEHa/RNWmOetfr0ixzbuXw37+m4HjaZkB8k5ftyZCiyqgLkTzHQWnWulS1ipx8V5
         80IiMHthlY2EvYi0KtDgTJ5n4hjg25T5JDDVuxWa4tvwr2Y9qOi0gZMyLIN56cLJZWKy
         sQrw==
X-Gm-Message-State: APuU4Z9PZAxtmT7uglEYzFP0zaj5viYKDNL6b/qDtt1fvNseHH3cdz4C
	tsaTNVh+tFc1jlv4PzCJ2/Hb470aew1GltoWvfXak9UFPEyXRPT5QbOw6jNOq5LtMFJYZIF4NoJ
	/zLZDE9cYGk/FU8Q72Ys4QamJC4sag+St7g==
X-Gm-Gg: AYBFou2g7irltu6by7Xm924ZZKs3aayPzaRU62CQ/7ArLU6K/l1OA0tuBDhQmjy5Ilr
	UOzEgJoafoQPge8ddQJrTjkUYCcOlAV4DXIgUWH2JbzOSebl9TOUKLo2425TEOEcDl4dcGJx0Iv
	0r+TmhPCpm3K7c82qu05WyhZAg3FfULlTAwySOpSeRJiV78L+CDq678lEuls14L6CF2CE6FUbhe
	nMc5m3pboHkLAkIR3IWfXglJlmgldD/tTpg5722TxnEnXuWbiVG5sZG+IbfzO6OdRd2vB9w7pdh
	+IY2EJg11IPxy4WhkTEFm4CdJaRaI/XTmmmdA75DZ53qUm92I7XsMZ1fNs7tplKdkOhjCJuuCxQ
	90+B0rNRz+qdDunW/y3duNhY96DhbGSFTz2z656E8g0dY5uFmQhEv1M04s4Ov97VytSBnd9u7Tv
	pAbszH4NulkgxuLUVFjsnT2Q==
X-Received: by 2002:a05:6214:5d0a:b0:91e:8cb1:b856 with SMTP id
 6a1803df08f44-91e8cb1bcb3mr50976416d6.41.1793868105578; Thu, 05 Nov 2026
 00:41:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101200428.16959-1-rosenp@gmail.com>
In-Reply-To: <20261101200428.16959-1-rosenp@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Nov 2026 18:41:33 +1000
X-Gm-Features: AclHuK9RB4mLTs1goTvN9X54_7uH3Et6Jl_r8Cy2cfziD_nx9SDo27jgCkGyM08
Message-ID: 
 <CAPM=9tzacWJenKpU_-zbCOSupybgJjXFV7SZLvT+DNBs5fZNEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/nvkm: clear use.enabled when subdev init
 fails
To: Rosen Penev <rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: CPGCFCPF5LOLJANPOA4QMRFMMIXOCFS6
X-Message-ID-Hash: CPGCFCPF5LOLJANPOA4QMRFMMIXOCFS6
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CPGCFCPF5LOLJANPOA4QMRFMMIXOCFS6/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tzacWJenKpU_-zbCOSupybgJjXFV7SZLvT+DNBs5fZNEQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 06:04, Rosen Penev <rosenp@gmail.com> wrote:
>
> On Kepler boards without the video decode falcon firmware installed
> (msvld/mspdec/msppp), every other VA-API decode attempt binds to an
> engine with no ucode loaded. The submitted work never completes, which
> leads to a context switch timeout, a channel recovery that cannot reset
> the engine, and eviction waits on fences that never signal. The process
> ends up stuck in D state, or killed by SIGBUS when it touches a buffer
> evicted after the wait times out:
>
>   msvld: unable to load firmware data
>   msvld: init failed, -19
>   fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
>   vo[5444]: channel 14 killed!
>   WARNING: drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:117 at nvkm_runl_rc+0x2a4/0x3b0 [nouveau]
>   [TTM] Buffer eviction failed
>   WARNING: drivers/gpu/drm/nouveau/nouveau_bo.c:1092 at nouveau_bo_move_ntfy.part.0+0x9b/0x100 [nouveau]
>
> Tracing nvkm_subdev_ref() and nvkm_subdev_init_() shows the pattern:
> a reference taken with enabled=0 runs nvkm_falcon_init(), which
> returns -ENODEV; the next reference sees enabled=1 and succeeds
> without running it.
>
> Clear use.enabled when init() fails, so that every later reference
> retries init and fails cleanly.  The other readers of use.enabled are
> fini() handlers that use it to skip teardown, which they now also do
> after a failed init().
>
> On a GK107 (Quadro K1100M) without video firmware, playing H.264 with
> mpv --hwdec=auto: without this patch the GPU channel is killed within a
> minute and mpv hangs; with it, VA-API decoder creation fails, mpv falls
> back to software decoding, and no faults are logged.

Appled to drm-misc-fixes.

Thanks,
Dave.
