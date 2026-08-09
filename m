Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AD2C5AD4E
	for <nouveau@archiver.kernel.org>; Sun,  9 Aug 2026 22:44:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD54910E114;
	Sun,  9 Aug 2026 22:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OZxTofa/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 365ED4765E;
	Sun,  9 Aug 2026 22:27:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786314478;
 b=rDojtezyzz/w9Qi3vc4Iewj0IIF5ljKxhZaQRE0t9nXiTa199HJQkyQHcDes134RIATxy
 PqZPpjI/D3ZqLxEKlGHTz8En27ePlu+JfTbzInO4bOOhqpFDN5QoLhLH5J7tCN6PYMYEiyZ
 IpdHYnji9s8hv86CgPOlpfpPssHAUDeM3PWvdLFQzqZSEwbfE187luLXeWFD1ULu0L2/Vlu
 m5jcgOzH8oTuRrwB5bofR43PzL/+nJoV2wGkAw+lzISwM5jFodL8SWr61jybSs1c9W39B2M
 43irAtOzhIB+PgdktmB2dOanc6ZgSzro5bl90nKddbFABo3nrcQwwYxrg+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786314478; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UmqVXZ8uahzPyx1266WBfqTL4VwZVxprD5k6ycdBqMA=;
 b=YYMoj26/zohqQaI+d37p4BoIevJcWIWd/aBu42cKgvb9sEu1HAS9hcKH4hmwtk2LEk78I
 qKaj57LPGf8eyI1l0tXnKXsr36wjmAPDmxcBw29s9Pz553YEDAJmcWZbKnF5fvfmRrzX2xa
 c7Dm4K1jNxY5/ggAWz+UQmxK/Xh1DcZx2aGFDvr8s98rH3PEoyy3FqsR6pzS4TDACRcMIb+
 VW22RSJZKPJaod+Yg5FKoFmh2X2wjzctmTVlKHI8J3egPi8GWishC8RsX+jcEdsYUM0np1Z
 kpGHtd7TamX1f8w0OnfOOyLMjyfJZqyq6ne2j9n3H4Jvv+F36coTesWAhjCQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8F12346BCA
	for <nouveau@lists.freedesktop.org>; Sun,  9 Aug 2026 22:27:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D2DB410E07C
	for <nouveau@lists.freedesktop.org>; Sun,  9 Aug 2026 22:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786315445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UmqVXZ8uahzPyx1266WBfqTL4VwZVxprD5k6ycdBqMA=;
	b=OZxTofa/lxE1Qo0tL19ROJpZCwLSaFC+GJHFIRRnmJs/kMc1hhkLqbOm8k5UZnPPrGE3BE
	s7xnlBEPCZRzCnwtZflAmWztvYO53DS3gazo+V6n46U3YeqamMhAOg06PUhQibzPaAVUmy
	HTjNoJL5nK8ooH7YjiMvyeJMOn7tQ/0=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-Aw8eah5lM1K9-VLzn-zVyA-1; Sun, 09 Aug 2026 18:44:04 -0400
X-MC-Unique: Aw8eah5lM1K9-VLzn-zVyA-1
X-Mimecast-MFC-AGG-ID: Aw8eah5lM1K9-VLzn-zVyA_1786315443
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cca5e0a0c9so29542175ad.1
        for <nouveau@lists.freedesktop.org>;
 Sun, 09 Aug 2026 15:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786315443; x=1786920243;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UmqVXZ8uahzPyx1266WBfqTL4VwZVxprD5k6ycdBqMA=;
        b=UyDqj630wP3LtvqgWqMdXelsYCfpKkqpAxIvTBNA/fKDz1FXxtfShEp7TcgAOdCl8B
         CxrM6XB+Pdojup2R11ImzWvuZfNvfwZHyCdiQW9nZRQAHt4P5Qc8qM4gwBp+tUrtgEgT
         YmUSK0dKwmZvTFBnKtxSVILlQsv03WYeEiE2RTGrjfR0Iw2zJ2m7eCmVbXe0wVVHLqln
         +V7ybF8y71l8kyASgL3Y8gLMyH98/0oRYMK7ESHL6kE6MKzwAamFcNbuOFgG7K6bEH9d
         STNkEHyIQKb9JSg6TLR8lB8aycYpv4hSmcTJFtB10MBBG2I/fk01FfC1EEELdWR77vkr
         jXNw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoxfvLuJTB3gFQUE4ixDnNd5N/+kAKRluLyycEoY2H4XAjlf2KTtEczfbZQfAsecG5lRVFwhfql@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzULHFENLvKdDiHlCOQwbyklywOM4OTXeAiPbZElZSqTX1czT4y
	CEmgfK7yGccIJNfD5uYeHi+hmT+hNozqJeyf1xM1R7RhumgPXcvw7cjNajDzQzu9fvq1c/T4Wcv
	mT305UO82IfDZmGU9nZjRH3rkPqrdp9idPY9SD0j4na6GELOozpxeOsvOnxB8muSPV7rI+yDPR2
	HG66usYcKcZQv4q3e3ETOI11ZjuyVBZ5XBEGs5OXgpLQ==
X-Gm-Gg: AR+sD11kDHIQ6OZFrLWpHHrnEwMUpOpEdz9TVb68ZlQueHGHw1ohkLiRTGgrUwq1cnh
	5+1Rs41YQWLek0Rudwc8MnG8+eAamRUy85M1Mhmcu020pRTcwFtxGLb6zXEeYKo/RmU7l0MVMdb
	sGYQXJbSyrVUxQX4Hs1rPOSZk8EGpuPscIOEFgJVJhR6vAHccza/Wbb/Gh13zQpSiF4im9Enxm5
	xLjSqtjKZzKm+kQ
X-Received: by 2002:a05:6a21:99a3:b0:3b4:7b3d:179b with SMTP id
 adf61e73a8af0-3cbce751791mr16468969637.12.1786315442959;
        Sun, 09 Aug 2026 15:44:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:99a3:b0:3b4:7b3d:179b with SMTP id
 adf61e73a8af0-3cbce751791mr16468925637.12.1786315442375; Sun, 09 Aug 2026
 15:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260808-nouveau-fixes-v1-0-c3ebdc17a89c@outlook.com>
 <20260808-nouveau-fixes-v1-1-c3ebdc17a89c@outlook.com>
In-Reply-To: <20260808-nouveau-fixes-v1-1-c3ebdc17a89c@outlook.com>
From: David Airlie <airlied@redhat.com>
Date: Mon, 10 Aug 2026 08:43:50 +1000
X-Gm-Features: AUfX_mz-ETmvSuEhXYjQJVDLUbKw4YbP9zK1G66hyeAQkHRWyBsRWGvM6OCpIUM
Message-ID: 
 <CAMwc25qozGSRw8KKNzVhakH1jCNWsFS_z=mFn9hswxjdNNX0GA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: bound sync and op counts in EXEC and
 VM_BIND
To: moonafterrain@outlook.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m7xjbsUIX8_QlzPmeDUzzUbf0PJdYpWcBqL1nOrNuSE_1786315443
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 3VJ76IIU5WFUUS6WKZBE3LMJPZ77BZZQ
X-Message-ID-Hash: 3VJ76IIU5WFUUS6WKZBE3LMJPZ77BZZQ
X-MailFrom: airlied@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3VJ76IIU5WFUUS6WKZBE3LMJPZ77BZZQ/>
Archived-At: 
 <https://lore.freedesktop.org/CAMwc25qozGSRw8KKNzVhakH1jCNWsFS_z=mFn9hswxjdNNX0GA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

> From: Junrui Luo <moonafterrain@outlook.com>
>
> nouveau_exec_ucopy() and nouveau_uvmm_vm_bind_ucopy() pass user-supplied
> u32 counts to u_memcpya(). DRM_IOCTL_NOUVEAU_EXEC bounds only
> req->push_count against push_max, leaving req->wait_count and
> req->sig_count unchecked; DRM_IOCTL_NOUVEAU_VM_BIND bounds none of
> op_count, wait_count or sig_count. u_memcpya() itself only rejects
> multiplication overflow, which on 64-bit never triggers for a u32 count
> times a small element size.
>
> A wait_count of 0xffffffff therefore becomes a 64 GB vmemdup_user()
> request. Since vmemdup_user() allocates with GFP_USER and hence without
> __GFP_NOWARN, a size above INT_MAX trips the WARN_ON_ONCE() in
> __kvmalloc_node_noprof(); below that the kernel attempts an up to 2 GB
> vmalloc that GFP_USER also leaves uncharged to the caller's memcg. Both
> ioctls are DRM_RENDER_ALLOW, so any client holding a render node can
> issue this.
>
> Reject the oversized counts at the ioctl entry points, the way
> nouveau_gem_ioctl_pushbuf() and the existing push_count check already
> do, so that the client is told which limit it exceeded. Sync objects get
> NOUVEAU_MAX_SYNCS, matching both NOUVEAU_GEM_MAX_BUFFERS and the value
> xe settled on for the same field in DRM_XE_MAX_SYNCS. VM_BIND operations
> have no comparable semantic limit, so NOUVEAU_VM_BIND_MAX_OPS is set
> well above any batch size a client is expected to submit; it exists only
> to keep the copy-in allocation finite.
>
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>

Have you run a complete Vulkan CTS with NVK across this with no regressions?

I'm weary of those limits being too low, but I think the only app that
might push them beyond CTS would be Forza Horizon 5 or 6.

Dave.


> ---
>  drivers/gpu/drm/nouveau/nouveau_exec.c | 12 ++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c | 18 ++++++++++++++++++
>  include/uapi/drm/nouveau_drm.h         | 18 ++++++++++++++++++
>  3 files changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
> index a08ab1cfea9b..7bdccbae53b1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -389,6 +389,18 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
>                 return nouveau_abi16_put(abi16, -EINVAL);
>         }
>
> +       if (unlikely(req->wait_count > NOUVEAU_MAX_SYNCS)) {
> +               NV_PRINTK(err, cli, "exec wait count exceeds limit: %d max %d\n",
> +                         req->wait_count, NOUVEAU_MAX_SYNCS);
> +               return nouveau_abi16_put(abi16, -EINVAL);
> +       }
> +
> +       if (unlikely(req->sig_count > NOUVEAU_MAX_SYNCS)) {
> +               NV_PRINTK(err, cli, "exec sig count exceeds limit: %d max %d\n",
> +                         req->sig_count, NOUVEAU_MAX_SYNCS);
> +               return nouveau_abi16_put(abi16, -EINVAL);
> +       }
> +
>         ret = nouveau_exec_ucopy(&args, req);
>         if (ret)
>                 goto out;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index f5e4756b4de4..bced1481674e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1807,6 +1807,24 @@ nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev,
>         if (unlikely(!nouveau_cli_uvmm_locked(cli)))
>                 return -ENOSYS;
>
> +       if (unlikely(req->op_count > NOUVEAU_VM_BIND_MAX_OPS)) {
> +               NV_PRINTK(err, cli, "vm_bind op count exceeds limit: %d max %d\n",
> +                         req->op_count, NOUVEAU_VM_BIND_MAX_OPS);
> +               return -EINVAL;
> +       }
> +
> +       if (unlikely(req->wait_count > NOUVEAU_MAX_SYNCS)) {
> +               NV_PRINTK(err, cli, "vm_bind wait count exceeds limit: %d max %d\n",
> +                         req->wait_count, NOUVEAU_MAX_SYNCS);
> +               return -EINVAL;
> +       }
> +
> +       if (unlikely(req->sig_count > NOUVEAU_MAX_SYNCS)) {
> +               NV_PRINTK(err, cli, "vm_bind sig count exceeds limit: %d max %d\n",
> +                         req->sig_count, NOUVEAU_MAX_SYNCS);
> +               return -EINVAL;
> +       }
> +
>         ret = nouveau_uvmm_vm_bind_ucopy(&args, req);
>         if (ret)
>                 return ret;
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> index 1fa82fa6af38..35ddf97ca873 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -220,6 +220,14 @@ struct drm_nouveau_gem_cpu_fini {
>         __u32 handle;
>  };
>
> +/*
> + * NOUVEAU_MAX_SYNCS - maximum number of sync objects per ioctl
> + *
> + * The maximum value EXEC and VM_BIND accept in their wait_count and
> + * sig_count fields.
> + */
> +#define NOUVEAU_MAX_SYNCS 1024
> +
>  /**
>   * struct drm_nouveau_sync - sync object
>   *
> @@ -332,6 +340,16 @@ struct drm_nouveau_vm_bind_op {
>         __u64 range;
>  };
>
> +/*
> + * NOUVEAU_VM_BIND_MAX_OPS - maximum number of &drm_nouveau_vm_bind_ops
> + *
> + * The maximum value VM_BIND accepts in its op_count field. There is no
> + * semantic limit on the number of operations a bind may carry; this bound
> + * exists only to keep the copy-in allocation finite and is far above any
> + * batch size a client is expected to submit.
> + */
> +#define NOUVEAU_VM_BIND_MAX_OPS 65536
> +
>  /**
>   * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND
>   */
>
> --
> 2.51.2
>
>

