Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C51C624CE
	for <nouveau@archiver.kernel.org>; Tue,  1 Sep 2026 01:06:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3A04B10E8CC;
	Tue,  1 Sep 2026 01:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ncgf/PbL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 84F4745E0E;
	Tue,  1 Sep 2026 00:49:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1788223742;
 b=UkY9goM1Zt7lwivfhYcEMk151G0iQABcxaiaoc+Gd9yT1poHKl9jE/31/M+Y6c62YY7CO
 VOhUx0aWYfXmGyxXLabijgOM4cKVZZwxf26sfgGbFG1Y9v0MoWp2dkl9iXyX3MaEvImyyj/
 Kr4ZkQsTTOY4AqXlt5/CEXDfT3wx0z5iUtp7A22e9sDGiAi5RBxF3kSC3yIzPOeTm9miphP
 Et5df+whceIwddq32m2Rmayu5DlERpcTJt7gDJPSG3MqmyfVrqlpt0ZvRex8zV5fTDMBe/9
 NSVo9vbquld7kDqfucxvkMYMu9z6Z5lb9QjcNZw2GnqneUuuxtMlo18rAVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1788223742; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NwjaNs6IUndl2gXpaLfGpDskp0OgoGLOd1KybhPijWY=;
 b=Pww9hhTltI8yt5BuiR/jwinx+vEvRuHXUSsUAy82T8aaQR0NyYPPCya4xN8DreY6TkFr7
 aYp+JoNYXpwqoPBrvdlwP69pW1ZwsqC032mcxv0VFgLfQccvFD8MtKe15ETVwG5BfRzfGVV
 kDQ6tTJp6SkxP9hY3lez9QeEezWE+Yvkza52WfJ1Zjqx4XSB7FItJV/Sk7WuqO9hdB4fjDd
 cGS2H+a5YEhBNPvojfuQl4Fct+Z2tTI5HlEM15d0t+biTpsnUfFWM6A2+yIiFBlNdVXm/kM
 o/zUEwZt5b+GwihSTCMYxPEXILoSUsmwwB8WhdpNASYDr/uCNA1rrT3Wqq1A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3ACAF47CF9
	for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2026 00:48:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 261D410E9E7;
	Mon, 31 Aug 2026 16:19:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F0E060120;
	Mon, 31 Aug 2026 16:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CF21F000E9;
	Mon, 31 Aug 2026 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193186;
	bh=NwjaNs6IUndl2gXpaLfGpDskp0OgoGLOd1KybhPijWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ncgf/PbL9mAMPP15SJ91zuU/iSX+9MjHVDRnPLQD8MwGrotWnWSlwB3QfmX4rOXKN
	 qnmZrcaCG4RF1GtEkWBspTbA8RwQ2Q5v1HrzoguDoC9VlHfh21feWbXocddDxku5l7
	 wpvJ6gpOMP/Jq27kjRZDrj605HK9td2D8V/S/PmlUS4GMHkdF/ALgKPEoJvC9XM/uQ
	 t7QKUrHXNAK+nOgK+4V88TpQSDjFKyg1QtYnHZxcb/4v5g0GkztSoe9iixuhjM44AZ
	 N8zLln9+9aWzOLtvkFEpVovap0VTTTyqHCJhkbISe/+YApapBK3UM2hiD5ZIVY3PnI
	 9FIlS7QaX0PKA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 31 Aug 2026 18:17:48 +0200
Subject: [PATCH v3 32/40] drm/nouveau: Convert to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-no-more-plane-reset-v3-32-1877c7aa57b3@kernel.org>
References: <20260831-drm-no-more-plane-reset-v3-0-1877c7aa57b3@kernel.org>
In-Reply-To: <20260831-drm-no-more-plane-reset-v3-0-1877c7aa57b3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6859; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Q+C4TrUeYvtnn+F29bUT+4DVtypeetMRonq1BJqna9c=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlTV8qxnlTUDfPbUPnj0qpPbssmrnWq3H96ivTks58Fb
 JyXTV/t2TGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmcj6asc5IUaG0+fR3plnR
 bzf8uza9+f7vvMd77ZUDxTa251kf7J6b4zo9tDJRnJtv67Uc+aZJjIwND5YxH4rPE5LcwXeA/eO
 lhYqXDr/g49UuF7f2FLjSuNyb5RVvcudHQ1VpMbnWRx08ARkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Message-ID-Hash: YGMBU7PW5DUTZ5WEYVM3MLZNSXMBEX44
X-Message-ID-Hash: YGMBU7PW5DUTZ5WEYVM3MLZNSXMBEX44
X-MailFrom: mripard@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 dakr@kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YGMBU7PW5DUTZ5WEYVM3MLZNSXMBEX44/>
Archived-At: 
 <https://lore.freedesktop.org/20260831-drm-no-more-plane-reset-v3-32-1877c7aa57b3@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The plane reset implementation creates a custom state
subclass, but only initializes a pristine state without resetting any
hardware. This is equivalent to what atomic_create_state expects.
Convert to it.

The conversion was done using the following Coccinelle semantic patch:

@@
identifier funcs;
symbol drm_atomic_helper_plane_reset;
symbol drm_atomic_helper_plane_create_state;
@@

struct drm_plane_funcs funcs = {
  ...,
- .reset = drm_atomic_helper_plane_reset,
+ .atomic_create_state = drm_atomic_helper_plane_create_state,
  ...,
};

@match_struct_reset@
identifier funcs, reset_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .reset = reset_func,
    ...,
};

@reset_uses_helpers depends on match_struct_reset@
identifier match_struct_reset.reset_func;
@@

 void reset_func(...)
 {
 	<+...
(
 	__drm_atomic_helper_plane_reset(...);
|
	__drm_gem_reset_shadow_plane(...);
)
 	...+>
 }

@match_struct_destroy@
identifier funcs, destroy_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .atomic_destroy_state = destroy_func,
    ...,
};

@script:python renamed_func@
old_name << match_struct_reset.reset_func;
new_name;
@@
if old_name.endswith("_reset"):
    coccinelle.new_name = old_name.replace("_reset", "_create_state")
else:
    coccinelle.new_name = old_name

@update_struct depends on match_struct_reset && reset_uses_helpers@
identifier match_struct_reset.funcs, match_struct_reset.reset_func;
identifier renamed_func.new_name;
@@
struct drm_plane_funcs funcs = {
    ...,
-   .reset = reset_func,
+   .atomic_create_state = new_name,
    ...,
};

@drop_destroy depends on update_struct && match_struct_destroy@
identifier match_struct_reset.reset_func;
identifier match_struct_destroy.destroy_func;
identifier container_func;
identifier P;
symbol drm_atomic_helper_plane_destroy_state;
symbol __drm_atomic_helper_plane_destroy_state;
@@

 void reset_func(struct drm_plane *P)
 {
 	...
(
-	if (P->state) {
- 		<+...
(
-		drm_atomic_helper_plane_destroy_state(P, P->state);
|
-		__drm_atomic_helper_plane_destroy_state(P->state);
|
-		P->funcs->atomic_destroy_state(P, P->state);
|
-		destroy_func(P, P->state);
)
- 		...+>
- 	}
|
-	drm_WARN_ON_ONCE(P->dev, P->state);
|
-	WARN_ON(P->state);
)
 	...
(
-	kfree(P->state);
|
-	kfree(container_func(P->state));
|
 	// kfree is optional
)
(
-	P->state = NULL;
|
 	// plane->state clearing is optional
)
 	...
 }

@drop_destroy_mtk depends on update_struct@
identifier P;
symbol __drm_atomic_helper_plane_destroy_state;
symbol to_mtk_plane_state;
@@

 void mtk_plane_reset(struct drm_plane *P)
 {
 	...
-	if (P->state) {
-		__drm_atomic_helper_plane_destroy_state(P->state);
-		...
-	} else {
 		...
-	}
 	...
 }

@transform_nv50_wndw depends on update_struct@
identifier S;
@@

 void nv50_wndw_reset(...)
 {
 	...
-	if (WARN_ON(!(S = kzalloc_obj(*S))))
+	S = kzalloc_obj(*S);
+	if (WARN_ON(!S))
 		return;
 	...
 }

@transform_kzalloc depends on update_struct@
identifier match_struct_reset.reset_func;
identifier P, S;
statement ST;
statement list STL;
@@

 void reset_func(struct drm_plane *P)
 {
 	<...
 	S = kzalloc_obj(*S);
(
-	if (S)
-	{
-		STL
-	}
+	if (!S) return;
+
+	STL
|
-	if (S) ST
+	if (!S) return;
+
+	ST
)
	...>
 }

@transform_body depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier S, P;
expression PS;
@@
- void reset_func(struct drm_plane *P)
+ struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	S = kzalloc_obj(*S);
	...
(
 	if (!S) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (WARN_ON(!S)) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (S == NULL) {
 		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
)
	...
(
-	__drm_atomic_helper_plane_reset(P, PS);
+	__drm_atomic_helper_plane_state_init(PS, P);
|
-	__drm_gem_reset_shadow_plane(P, PS);
+	__drm_gem_shadow_plane_state_init(P, PS);
)
	...
}

@update_early_return depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	<+...
-	return;
+	return ERR_PTR(-EINVAL);
	...+>
}

@update_return_plane depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_atomic_helper_plane_state_init(PS, P);
	...
+
+	return PS;
}

@update_return_shadow depends on update_struct@
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_gem_shadow_plane_state_init(P, PS);
	...
+
+	return &PS->base;
}

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: dakr@kernel.org
Cc: lyude@redhat.com
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 15a322422f4e..378095138d12 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -750,22 +750,21 @@ nv50_wndw_zpos_default(struct drm_plane *plane)
 {
 	return (plane->type == DRM_PLANE_TYPE_PRIMARY) ? 0 :
 	       (plane->type == DRM_PLANE_TYPE_OVERLAY) ? 1 : 255;
 }
 
-static void
-nv50_wndw_reset(struct drm_plane *plane)
+static struct drm_plane_state *nv50_wndw_create_state(struct drm_plane *plane)
 {
 	struct nv50_wndw_atom *asyw;
 
-	if (WARN_ON(!(asyw = kzalloc_obj(*asyw))))
-		return;
+	asyw = kzalloc_obj(*asyw);
+	if (WARN_ON(!asyw))
+		return ERR_PTR(-ENOMEM);
 
-	if (plane->state)
-		plane->funcs->atomic_destroy_state(plane, plane->state);
+	__drm_atomic_helper_plane_state_init(&asyw->state, plane);
 
-	__drm_atomic_helper_plane_reset(plane, &asyw->state);
+	return &asyw->state;
 }
 
 static void
 nv50_wndw_destroy(struct drm_plane *plane)
 {
@@ -835,11 +834,11 @@ static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
 const struct drm_plane_funcs
 nv50_wndw = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = nv50_wndw_destroy,
-	.reset = nv50_wndw_reset,
+	.atomic_create_state = nv50_wndw_create_state,
 	.atomic_duplicate_state = nv50_wndw_atomic_duplicate_state,
 	.atomic_destroy_state = nv50_wndw_atomic_destroy_state,
 	.format_mod_supported = nv50_plane_format_mod_supported,
 };
 

-- 
2.55.0

