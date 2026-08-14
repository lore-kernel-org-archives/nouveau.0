Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AEAC5CFC1
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 14:59:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB0810F661;
	Fri, 14 Aug 2026 14:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oTCmnJ+0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1C3F3477B7;
	Fri, 14 Aug 2026 14:43:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786718602;
 b=nsR1MQ4jvGaJMmC2bNPoG6KCM16VV24wu/MGydeUnmnf5zv+43LqDnwFVR+k7oeycU6eY
 jEuNiwr37pP2lBNT34bLyjZw22Y1O4f3A4lzTlouu3pmPPBF+7ljqt8pUlyXz1cn+h6jMT1
 pM77YE8Kjww9UphlpHStjORoiXWn2VvRbkPEmOqvX502uwRuHjQS/kp8t2QrlgSrypSj2gG
 qZUSaaFskjnZwTrkMXpEYScO9aZrGrqoq6t6ijX4/AbxO/4hH9nwgnNaAJ16lVrtLoPyeKg
 2sRh5djifuIoI+ZRaM42TrLFhQSK3wwI2K/1wu7IZA0w7+vIRcXTcHYr76OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786718602; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZOaqFRdT0niEcu6uX54i0tVOhALOKkF4fZtMulkDeBo=;
 b=uE89guNn8epmcjf/Pg56Yk1ThbPzyMLq+LFuG10dGsGGZ6K2YU/AXZSYTX5Tsf5GkhmBx
 DclHPUqfOs8lvgy/Ag+g0/ZbE+ZqccFIUb03TZBwepQO5JxNrTKgI0dvbz6GLOkpLyo6TOM
 2a6AlorCPCGLk+4d/chFygZa0NX5HadIZYh7ouVXRgRpA9eUEXwlFbtoNzOZxwFvH1HHHO6
 6Uo/fbS08BBr5s+5KApGVLrc7IffsFUKMYv1seGJHTS6wHQYIzHQQGQEIqT495808fOeObu
 H45H01Z2lecgREtfmBm3oUC0+T6BDeN3BB4cF6XzX84B4kIHgIowe2NXuUhg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8994F476EE
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 14:43:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 52E1010F660;
	Fri, 14 Aug 2026 14:59:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCF8F60204;
	Fri, 14 Aug 2026 14:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094461F000E9;
	Fri, 14 Aug 2026 14:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786719580;
	bh=ZOaqFRdT0niEcu6uX54i0tVOhALOKkF4fZtMulkDeBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oTCmnJ+01qAVTGzpCmrjVZ0K3UaIG3NhgtskBTQPDh7Iz2mlAiswVrfWPuP/mpAjZ
	 Sx8HX1klNs+9OvoH7F5p8LIp2i55gF1WGjfvk05Jwf1gZWGsnSjXcxtUOHEYo8dRyv
	 iMLAEpu5QPWK4vaqcmxCLrjfHmkfLDQSVPTPjF3pqMZZz+Q265r0YsxXPlwRD0kjgZ
	 maDenEqVfP+fsUPYFHLDN/LshKtTGsa07zRJk35gOeS4QskC4TNPoJ7pjU0JFuU8Zc
	 ShgLmyqbS5MrEXwzYcpoADnrY3I5W3z6+ZjToa3dSH6W/iCpDIsbuSeKW0INLUCfYq
	 lL33imTbORLwg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 14 Aug 2026 16:57:40 +0200
Subject: [PATCH v2 51/61] drm/nouveau: Convert to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-drm-no-more-plane-reset-v2-51-82d2963dd134@kernel.org>
References: <20260814-drm-no-more-plane-reset-v2-0-82d2963dd134@kernel.org>
In-Reply-To: <20260814-drm-no-more-plane-reset-v2-0-82d2963dd134@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6815; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Jet8SHZKlaLnRCT2VhTlGP0a+8Ew6shId0PlOml6Wk0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFn1OreOby5YZfGE64/YntNuIm+e1vK8mBO3pnFNxvxy8
 7KDyev4O6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEJi5nbGiruLvtyE21C44W
 HoseMmWZ1sgJ5mnOrp0pdqJizmYJrgdbJ91ZMl+PLWDConvJhz6WHGFs6GWJvXLB7ER25arQ6O9
 nZvAxtXpE7V6sfeqlfeOPe/dKfHOKm5esPPZ4Rgr7mZ1sKlfXAwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Message-ID-Hash: DX3XSIPNAAMQCEYFMKHBBZVTAME5HBWL
X-Message-ID-Hash: DX3XSIPNAAMQCEYFMKHBBZVTAME5HBWL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DX3XSIPNAAMQCEYFMKHBBZVTAME5HBWL/>
Archived-At: 
 <https://lore.freedesktop.org/20260814-drm-no-more-plane-reset-v2-51-82d2963dd134@kernel.org/>
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

