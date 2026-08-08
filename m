Return-Path: <nouveau-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2646C5AC67
	for <nouveau@archiver.kernel.org>; Sat,  8 Aug 2026 11:17:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE7810E4D7;
	Sat,  8 Aug 2026 11:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EfGyBpIY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DBD5E47635;
	Sat,  8 Aug 2026 11:01:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786186876;
 b=i9Ox9wu161mYfX7VCKWRgOFsQJzsoN8A7D2O2UnUeezeMRxJfsPBwIyCwpGXrOVH9fNTv
 o/DIMhjUvsJYTdFQIwyb0JKQFJSiNxtuXtNcJYbNSBvg9VQMTRd6yY6lSEIml+aNP8XjeSH
 aDzdpXh9DzQzdZcxQ6MjZ1fzaoa0S5WoWxqCoCYF3QjqgVKBweungTmATml/2hRS0S92JJ6
 FsuA0Vg8FpMxW5YjKu0haHpL8q2lZbdMsiEzsAY9mqf6KKcxy0YeISNrxyLnK8pvMEXVJZo
 3F+vWVdupDtLxTYDX4AMIvf93aQOJxDU2UsqohSi6PfWHEs3YJwgGh6ug1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786186876; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CcefgqEO9+vKIOJ/dOq6RRWc1XSpCC0ZTuRzsMghAAE=;
 b=ivnvH6XHNySIjEClzCMO+ca87XzYsnO9IjKLy/F2g6QbhStTOmhbgyRaoVeg3m++JhFvQ
 WkLsxQt8oLDe+7ab69YHXuJ46Aindmnp5SiY5TmojNnGwC2Slfm3vxnHdXyWTdqmH1qsNL9
 29yyIvRgnsbs9Y3U4E33TnHZTfCAs0o1ZOJ6zUpqjHgfkmbgBX7LWD6JFa2jbX66Alf7sD3
 Ta9Amv/Tc/ZGZRRBbpjtwLufBpnGItnQr3Ui7xzJISCqPu5nhNHZusyWd0tOejKLqj69pgk
 qkjYn+fmg7JVq2uRASBL2QrXnRJf4y0GD7OqV3S4yhoAbb6OebVcUfPzkK4Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 01EF047634
	for <nouveau@lists.freedesktop.org>; Sat,  8 Aug 2026 11:01:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1456410E02E;
	Sat,  8 Aug 2026 11:17:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A060600B1;
	Sat,  8 Aug 2026 11:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBD26C2BCC7;
	Sat,  8 Aug 2026 11:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786187837;
	bh=Om/3LNb89l5Tvle5p5zEHMzFRUHsmhJIUWlt5g2z0Sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EfGyBpIYtKGE/KXJdOyVvpMRWqZVEjA2zUkSmqfH+67b+ShOqFIoaOoFrQUxtOJT+
	 +pW/tSj+wqOZ/B62grdX1rJFj6UvIOzioTKQ7iXStXOyF3179uIjgRAb6Qx6mu0tBI
	 /Rqw5hF3x9T3w9qFuKMFSEgyac8syTsHwp3vxIor4yPBN+8sWKpYGnjdDWnt9C7pw/
	 1sZZp3r1OW/iZp2OqV6/qsoxgFZOZRgkCuAHXDqp1XVFAhlQ8c4gHeSjlvJ2XpjTTH
	 xOdiMdJaT/f08IiLZosM5oWTJRfpOdcy/WUd87bEJhAOZmMVH3XkXtpRGSv21Qyv9B
	 JecDylwkXIO2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CB0C5AC67;
	Sat,  8 Aug 2026 11:17:17 +0000 (UTC)
From: Junrui Luo via B4 Relay <devnull+moonafterrain.outlook.com@kernel.org>
Date: Sat, 08 Aug 2026 19:14:17 +0800
Subject: [PATCH 1/2] drm/nouveau: bound sync and op counts in EXEC and
 VM_BIND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-nouveau-fixes-v1-1-c3ebdc17a89c@outlook.com>
References: <20260808-nouveau-fixes-v1-0-c3ebdc17a89c@outlook.com>
In-Reply-To: <20260808-nouveau-fixes-v1-0-c3ebdc17a89c@outlook.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4929;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=/J/SpTfGUfN//kW/CFeXf5X2Ys5xRXob1tq0NKDsF84=;
 b=owJ4nJvAy8zAJVb4wiKgu++DA+NptSSGrHIBiw3LsjR1vkVcLPZoXmJtyjGd2XudWuW5jar6T
 wO8/uypfddRysIgxsUgK6bIcrzg0jcL3y26W3y2JMPMYWUCGcLAxSkAEzmtxPA/dDM3m+YUxQyJ
 ax9iw2Vjxe6xhC9hktj2yTY/7i7/k5tHGRmuSfh8Cd+9J8OqrSQiNeQGh6LOYsFjZ1e76ik4BSW
 6rWIHACkZRQU=
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-Endpoint-Received: by B4 Relay for moonafterrain@outlook.com/default with
 auth_id=909
X-Original-From: Junrui Luo <moonafterrain@outlook.com>
Message-ID-Hash: 7T52URJ3SYO6GRJ5C4UZSVF2EULCYUCF
X-Message-ID-Hash: 7T52URJ3SYO6GRJ5C4UZSVF2EULCYUCF
X-MailFrom: devnull+moonafterrain.outlook.com@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Junrui Luo <moonafterrain@outlook.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: moonafterrain@outlook.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7T52URJ3SYO6GRJ5C4UZSVF2EULCYUCF/>
Archived-At: 
 <https://lore.freedesktop.org/20260808-nouveau-fixes-v1-1-c3ebdc17a89c@outlook.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Junrui Luo <moonafterrain@outlook.com>

nouveau_exec_ucopy() and nouveau_uvmm_vm_bind_ucopy() pass user-supplied
u32 counts to u_memcpya(). DRM_IOCTL_NOUVEAU_EXEC bounds only
req->push_count against push_max, leaving req->wait_count and
req->sig_count unchecked; DRM_IOCTL_NOUVEAU_VM_BIND bounds none of
op_count, wait_count or sig_count. u_memcpya() itself only rejects
multiplication overflow, which on 64-bit never triggers for a u32 count
times a small element size.

A wait_count of 0xffffffff therefore becomes a 64 GB vmemdup_user()
request. Since vmemdup_user() allocates with GFP_USER and hence without
__GFP_NOWARN, a size above INT_MAX trips the WARN_ON_ONCE() in
__kvmalloc_node_noprof(); below that the kernel attempts an up to 2 GB
vmalloc that GFP_USER also leaves uncharged to the caller's memcg. Both
ioctls are DRM_RENDER_ALLOW, so any client holding a render node can
issue this.

Reject the oversized counts at the ioctl entry points, the way
nouveau_gem_ioctl_pushbuf() and the existing push_count check already
do, so that the client is told which limit it exceeded. Sync objects get
NOUVEAU_MAX_SYNCS, matching both NOUVEAU_GEM_MAX_BUFFERS and the value
xe settled on for the same field in DRM_XE_MAX_SYNCS. VM_BIND operations
have no comparable semantic limit, so NOUVEAU_VM_BIND_MAX_OPS is set
well above any batch size a client is expected to submit; it exists only
to keep the copy-in allocation finite.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 drivers/gpu/drm/nouveau/nouveau_exec.c | 12 ++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 18 ++++++++++++++++++
 include/uapi/drm/nouveau_drm.h         | 18 ++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index a08ab1cfea9b..7bdccbae53b1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -389,6 +389,18 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
 		return nouveau_abi16_put(abi16, -EINVAL);
 	}
 
+	if (unlikely(req->wait_count > NOUVEAU_MAX_SYNCS)) {
+		NV_PRINTK(err, cli, "exec wait count exceeds limit: %d max %d\n",
+			  req->wait_count, NOUVEAU_MAX_SYNCS);
+		return nouveau_abi16_put(abi16, -EINVAL);
+	}
+
+	if (unlikely(req->sig_count > NOUVEAU_MAX_SYNCS)) {
+		NV_PRINTK(err, cli, "exec sig count exceeds limit: %d max %d\n",
+			  req->sig_count, NOUVEAU_MAX_SYNCS);
+		return nouveau_abi16_put(abi16, -EINVAL);
+	}
+
 	ret = nouveau_exec_ucopy(&args, req);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index f5e4756b4de4..bced1481674e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1807,6 +1807,24 @@ nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev,
 	if (unlikely(!nouveau_cli_uvmm_locked(cli)))
 		return -ENOSYS;
 
+	if (unlikely(req->op_count > NOUVEAU_VM_BIND_MAX_OPS)) {
+		NV_PRINTK(err, cli, "vm_bind op count exceeds limit: %d max %d\n",
+			  req->op_count, NOUVEAU_VM_BIND_MAX_OPS);
+		return -EINVAL;
+	}
+
+	if (unlikely(req->wait_count > NOUVEAU_MAX_SYNCS)) {
+		NV_PRINTK(err, cli, "vm_bind wait count exceeds limit: %d max %d\n",
+			  req->wait_count, NOUVEAU_MAX_SYNCS);
+		return -EINVAL;
+	}
+
+	if (unlikely(req->sig_count > NOUVEAU_MAX_SYNCS)) {
+		NV_PRINTK(err, cli, "vm_bind sig count exceeds limit: %d max %d\n",
+			  req->sig_count, NOUVEAU_MAX_SYNCS);
+		return -EINVAL;
+	}
+
 	ret = nouveau_uvmm_vm_bind_ucopy(&args, req);
 	if (ret)
 		return ret;
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 1fa82fa6af38..35ddf97ca873 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -220,6 +220,14 @@ struct drm_nouveau_gem_cpu_fini {
 	__u32 handle;
 };
 
+/*
+ * NOUVEAU_MAX_SYNCS - maximum number of sync objects per ioctl
+ *
+ * The maximum value EXEC and VM_BIND accept in their wait_count and
+ * sig_count fields.
+ */
+#define NOUVEAU_MAX_SYNCS 1024
+
 /**
  * struct drm_nouveau_sync - sync object
  *
@@ -332,6 +340,16 @@ struct drm_nouveau_vm_bind_op {
 	__u64 range;
 };
 
+/*
+ * NOUVEAU_VM_BIND_MAX_OPS - maximum number of &drm_nouveau_vm_bind_ops
+ *
+ * The maximum value VM_BIND accepts in its op_count field. There is no
+ * semantic limit on the number of operations a bind may carry; this bound
+ * exists only to keep the copy-in allocation finite and is far above any
+ * batch size a client is expected to submit.
+ */
+#define NOUVEAU_VM_BIND_MAX_OPS 65536
+
 /**
  * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND
  */

-- 
2.51.2


