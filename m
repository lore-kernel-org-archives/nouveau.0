Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A346C88E4C
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:26:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2D310E387;
	Fri, 11 Sep 2026 08:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="dUNzDW/o";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 89DE540106;
	Fri, 11 Sep 2026 08:09:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789114149;
 b=bOk2qRZpHWxHaozqriQuqn59PaVnS6BdsAcGIv+BC22HC1J/2ltb5TchCiK370f2zRTDz
 6YWtGOCSWo041zRPVcqvRyRo1zRB5V2Vjkks4BLPR97Y1LksgzSbbNxEqsyYOWmoiwXvgnf
 FeWQTdHAGCrOJSYrtp0/0HF1YX3vZza3vvg6bMqGictIUWyS+hnXlBhHQn/kZ/D7aF6vywZ
 pG1z7AA4L0isg6ClNXL9yn9E/xP2fL63nOpSqaQbF8lpynOsaXdAgO2lmItId6nkyHPYHlU
 gZtHRfoEfuF4skz5V/WbTI+vSADz6GFZAJqBKzW+Eha8nUDx5LZ5HmR5IkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789114149; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aJhDJKc9RhifU3n4P1nGqlePMPCOS8CsZN4corcuHao=;
 b=dwqRJ4QpSaQeu0QQ35w3Nv4+yzEj4QXd1hbct7naVGMFcxsmTp4EyOV70m+2Q9A8DnE49
 sv7ic/vCirr/Xj6DU9gCRnSmO9kRY9LK15ZfxINqUo4nUxNo6ZUQJBXArZ0YPMlIemJdXsu
 o+xhRoxXX+1k/Z9Zioto2Kr02ukb2hPGJ9CBLrCUcMAUaoRx6SZ+X2gF9fS1FzU3Y69GwuS
 06mpkP8rbMzZqsNTRaEgArPyNYGecRdKaj+cTvQgto3JfZee2wzuc71UzVHe5RZpmbIYXxz
 DlLwamFPql/KLtrebnAK5H5jzLmgzgn3mAjGZQng6Cx6/xRx50y6azemKg5w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=arm.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=arm.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=arm.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=arm.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1CED840029
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:09:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDAD10F56B
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:21:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7F2B288E
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 01:21:13 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 723583F7B4
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 01:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789114877; bh=zJtaryYqa/C9k3EO/Gny1L1VYdmh/q+o7VrPEjvE2I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUNzDW/oEXtcjJldlNXUYGHbLdIGUv61k/hCpI2hagXGCx4YC9RTUjMSMFD6BzwSY
	 TtAvS1zlcJrDzWxWI7HhHgTnpYh96giagVFiW74yauQAbBjfPZWrz/YP2H7S6Wg2YR
	 1r9QDOR7wsKwWtvgDP5qklQ0eUpFVaKZibgAmbMI=
Date: Fri, 11 Sep 2026 09:20:56 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Zhenhao Wan <whi4ed0g@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panthor: Treat a zero-length VM_BIND op as a
 no-op
Message-ID: <aqO56GMt4i3bXqk6@e142607>
References: <20260902-drm-gpuvm-zerorange-v2-v2-0-da63269c6ec4@gmail.com>
 <20260902-drm-gpuvm-zerorange-v2-v2-1-da63269c6ec4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902-drm-gpuvm-zerorange-v2-v2-1-da63269c6ec4@gmail.com>
Message-ID-Hash: KOSVWCCET3WLFKVATQ5GIEZMYYI6K2AC
X-Message-ID-Hash: KOSVWCCET3WLFKVATQ5GIEZMYYI6K2AC
X-MailFrom: liviu.dudau@arm.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KOSVWCCET3WLFKVATQ5GIEZMYYI6K2AC/>
Archived-At: <https://lore.freedesktop.org/aqO56GMt4i3bXqk6@e142607/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Sep 02, 2026 at 08:28:42PM +0800, Zhenhao Wan wrote:
> panthor_vm_bind_exec_sync_op() short-circuits a zero-length operation: it
> returns 0 immediately when op->size is 0. The asynchronous VM_BIND path
> has no equivalent guard.
> 
> An async MAP or UNMAP with size == 0 is not rejected: only alignment is
> checked in panthor_vm_bind_prepare_op_ctx() and IS_ALIGNED(0) is true, so
> the op is queued and panthor_vm_exec_op() calls drm_gpuvm_sm_map() /
> drm_gpuvm_sm_unmap() with a zero range. A zero-length map into unmapped
> space then reaches drm_gpuva_insert(), where the GPUVA interval-tree last
> key addr + range - 1 underflows to addr - 1 and a malformed node whose end
> lies below its start can be inserted, corrupting the augmented interval
> tree.
> 
> Mirror the synchronous path and treat a zero-length map or unmap as a no-op
> in panthor_vm_exec_op(), before any lock is taken or the GPUVA tree is
> touched. This also keeps the async path robust if the core drm_gpuvm range
> validation is tightened to reject a zero range, which would otherwise make
> panthor_vm_bind_run_job() flag the VM unusable on the resulting -EINVAL.
> 
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index e592a8ebb478..93542f59cb5e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2591,6 +2591,15 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
>  	if (op_type == DRM_PANTHOR_VM_BIND_OP_TYPE_SYNC_ONLY)
>  		return 0;
>  
> +	/*
> +	 * A zero-length map or unmap is a no-op. The synchronous bind path
> +	 * already short-circuits it in panthor_vm_bind_exec_sync_op(); mirror
> +	 * that here so an asynchronous zero-length op does not fail and flag the
> +	 * VM as unusable.
> +	 */
> +	if (!op->va.range)
> +		return 0;
> +
>  	mutex_lock(&vm->op_lock);
>  	vm->op_ctx = op;
>  
> 
> -- 
> 2.34.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
