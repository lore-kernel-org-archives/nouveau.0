Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AF6C88E53
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:51:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2A73210E286;
	Fri, 11 Sep 2026 08:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="p6jjbSVK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0AmsFUKf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LXDRxYJt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ZyyB2O4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 62FBE404C3;
	Fri, 11 Sep 2026 08:34:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115655;
 b=fToKWaQUfiaYwjyXTL4/4EHuN9Nkk1K5akgwTvFL5NKX8d+lkh1QyZsPL62A47emlBsyz
 DV11VcsDEQEfvNLF6/E1V01JSQbieX+f11GxBJSUlkNo4OMGFhZSRPWdIPMFbXuskALt2GP
 /aCoTyMrqykPCnlfaPw55tKEXB3lJDk+nJRiAy+Fc2ub7qrgVXQyA86E0D/Jams9xLlV4OC
 SCXBdo8VGbcnaB4M5TFBMZsO70UNedjare0rLDWgj2sMiQ+KmtC/jeE+uiyJ+ZGRXPclm3a
 CEzdEzZVE5+B+ayCNCJz9LtjVZZLalkivXiB1KTWlt/cFJfcLYTI9xZys+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115655; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3nuKCnqWdAEyKKIj/uvkZwA9fc4PO4FNWz091rM0KII=;
 b=KOnEae7F4JlcBG94JcBUDac7sGOa9+disDHDsy/sfs48pfeseDs3iRjreD3SBjxdIUjuu
 YxXAD15fCK6zgdyFELc/Mlf41rq15aG3s9rYtCvuNyTcewaZnTCYxsqyLp9JVzjw+mFA0xS
 zFQjrw1e4BdFAbtI3B/+wPMqwqpNvUlpg+daFwxZlFbzbS/QXVwdVI6FpXyEbAA7D1OS9AQ
 6uSv4EFOFRhd8s3FV1LxDej7KygymY8kVG5RUkulhUuxdL1rXn0m3nwkAoQJSXXaZWMszGs
 PeGsgpbaYRQM3iXl3i7MDzqB1uk9bmokbBLFuMUMByD4vujQOOkrwuHzxVCg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EA6A040102
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:05 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ECA9710E5AE;
	Thu, 10 Sep 2026 06:55:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3BA112191F;
	Thu, 10 Sep 2026 06:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1789023336;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3nuKCnqWdAEyKKIj/uvkZwA9fc4PO4FNWz091rM0KII=;
	b=p6jjbSVK0w1xH2QIVYBnHGTfyCBEps/8r7xWp0+/86ygABw1a7ZEWr5O3btOK2I07YZoUF
	2J8phltOGuMtl30HSjPmXvap3UbhnHMOXZh5FeOAxvruNe7t5HOp057oWDWLl11ogTFiOO
	7aQPO91vUc7EVCRMgEVo35v3i617CNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789023336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3nuKCnqWdAEyKKIj/uvkZwA9fc4PO4FNWz091rM0KII=;
	b=0AmsFUKf6aCwAAqovTf/bdKZmX/zNluBvpi6epNiLIXW3WePu+bKtatirgujSxONgZwUs9
	Hru5vDE7xFrphlAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1789023332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3nuKCnqWdAEyKKIj/uvkZwA9fc4PO4FNWz091rM0KII=;
	b=LXDRxYJtHMnlhcq8WzFum6m1e+AA6JUuhbwho4/luP/MhoUY4GrC8G8opwyP7G7/xY3Gae
	rFTxQ8nPYcE+Cq0RGOTOOozbN+5ueYtAQ8tKvbIQ0FYXENxMP66AWp9zZYXgsIrB5JLIPL
	SatS7wqHqMI4NRtnvqjBp7sdtnvFEOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789023332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3nuKCnqWdAEyKKIj/uvkZwA9fc4PO4FNWz091rM0KII=;
	b=0ZyyB2O4WW0sxnpPMkfC3dPVoyqhsLwEck8P134o9l/Y8L7XEc47q9TGORj7XV5YZdZzld
	Y1fD1gC1qbHdjJAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D912013185;
	Thu, 10 Sep 2026 06:55:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UYj4J2NUomqsTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 10 Sep 2026 06:55:31 +0000
Message-ID: <04aa79c0-86d0-468f-b62f-69c9c700827b@suse.de>
Date: Thu, 10 Sep 2026 08:55:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 33/41] drm/nouveau: Convert to atomic_create_state
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260908-drm-no-more-plane-reset-v4-0-a31b3fcfc989@kernel.org>
 <20260908-drm-no-more-plane-reset-v4-33-a31b3fcfc989@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260908-drm-no-more-plane-reset-v4-33-a31b3fcfc989@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:url,suse.de:mid]
Message-ID-Hash: X6AG33K2GWFGUEVHRIV4LD3AJMTQDOCJ
X-Message-ID-Hash: X6AG33K2GWFGUEVHRIV4LD3AJMTQDOCJ
X-MailFrom: tzimmermann@suse.de
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, dakr@kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X6AG33K2GWFGUEVHRIV4LD3AJMTQDOCJ/>
Archived-At: 
 <https://lore.freedesktop.org/04aa79c0-86d0-468f-b62f-69c9c700827b@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



Am 08.09.26 um 16:47 schrieb Maxime Ripard:
> The plane reset implementation creates a custom state
> subclass, but only initializes a pristine state without resetting any
> hardware. This is equivalent to what atomic_create_state expects.
> Convert to it.
>
> The conversion was done using the following Coccinelle semantic patch:
>
> @@
> identifier funcs;
> symbol drm_atomic_helper_plane_reset;
> symbol drm_atomic_helper_plane_create_state;
> @@
>
> struct drm_plane_funcs funcs = {
>    ...,
> - .reset = drm_atomic_helper_plane_reset,
> + .atomic_create_state = drm_atomic_helper_plane_create_state,
>    ...,
> };
>
> @match_struct_reset@
> identifier funcs, reset_func;
> @@
> struct drm_plane_funcs funcs = {
>      ...,
>      .reset = reset_func,
>      ...,
> };
>
> @reset_uses_helpers depends on match_struct_reset@
> identifier match_struct_reset.reset_func;
> @@
>
>   void reset_func(...)
>   {
>   	<+...
> (
>   	__drm_atomic_helper_plane_reset(...);
> |
> 	__drm_gem_reset_shadow_plane(...);
> )
>   	...+>
>   }
>
> @match_struct_destroy@
> identifier funcs, destroy_func;
> @@
> struct drm_plane_funcs funcs = {
>      ...,
>      .atomic_destroy_state = destroy_func,
>      ...,
> };
>
> @script:python renamed_func@
> old_name << match_struct_reset.reset_func;
> new_name;
> @@
> if old_name.endswith("_reset"):
>      coccinelle.new_name = old_name.replace("_reset", "_create_state")
> else:
>      coccinelle.new_name = old_name
>
> @update_struct depends on match_struct_reset && reset_uses_helpers@
> identifier match_struct_reset.funcs, match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> @@
> struct drm_plane_funcs funcs = {
>      ...,
> -   .reset = reset_func,
> +   .atomic_create_state = new_name,
>      ...,
> };
>
> @drop_destroy depends on update_struct && match_struct_destroy@
> identifier match_struct_reset.reset_func;
> identifier match_struct_destroy.destroy_func;
> identifier container_func;
> identifier P;
> symbol drm_atomic_helper_plane_destroy_state;
> symbol __drm_atomic_helper_plane_destroy_state;
> @@
>
>   void reset_func(struct drm_plane *P)
>   {
>   	...
> (
> -	if (P->state) {
> - 		<+...
> (
> -		drm_atomic_helper_plane_destroy_state(P, P->state);
> |
> -		__drm_atomic_helper_plane_destroy_state(P->state);
> |
> -		P->funcs->atomic_destroy_state(P, P->state);
> |
> -		destroy_func(P, P->state);
> )
> - 		...+>
> - 	}
> |
> -	drm_WARN_ON_ONCE(P->dev, P->state);
> |
> -	WARN_ON(P->state);
> )
>   	...
> (
> -	kfree(P->state);
> |
> -	kfree(container_func(P->state));
> |
>   	// kfree is optional
> )
> (
> -	P->state = NULL;
> |
>   	// plane->state clearing is optional
> )
>   	...
>   }
>
> @drop_destroy_mtk depends on update_struct@
> identifier P;
> symbol __drm_atomic_helper_plane_destroy_state;
> symbol to_mtk_plane_state;
> @@
>
>   void mtk_plane_reset(struct drm_plane *P)
>   {
>   	...
> -	if (P->state) {
> -		__drm_atomic_helper_plane_destroy_state(P->state);
> -		...
> -	} else {
>   		...
> -	}
>   	...
>   }
>
> @transform_nv50_wndw depends on update_struct@
> identifier S;
> @@
>
>   void nv50_wndw_reset(...)
>   {
>   	...
> -	if (WARN_ON(!(S = kzalloc_obj(*S))))
> +	S = kzalloc_obj(*S);
> +	if (WARN_ON(!S))
>   		return;
>   	...
>   }
>
> @transform_kzalloc depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier P, S;
> statement ST;
> statement list STL;
> @@
>
>   void reset_func(struct drm_plane *P)
>   {
>   	<...
>   	S = kzalloc_obj(*S);
> (
> -	if (S)
> -	{
> -		STL
> -	}
> +	if (!S) return;
> +
> +	STL
> |
> -	if (S) ST
> +	if (!S) return;
> +
> +	ST
> )
> 	...>
>   }
>
> @transform_body depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> identifier S, P;
> expression PS;
> @@
> - void reset_func(struct drm_plane *P)
> + struct drm_plane_state *new_name(struct drm_plane *P)
> {
> 	...
>   	S = kzalloc_obj(*S);
> 	...
> (
>   	if (!S) {
> 		...
> -		return;
> +		return ERR_PTR(-ENOMEM);
>   	}
> |
>   	if (WARN_ON(!S)) {
> 		...
> -		return;
> +		return ERR_PTR(-ENOMEM);
>   	}
> |
>   	if (S == NULL) {
>   		...
> -		return;
> +		return ERR_PTR(-ENOMEM);
>   	}
> )
> 	...
> (
> -	__drm_atomic_helper_plane_reset(P, PS);
> +	__drm_atomic_helper_plane_state_init(PS, P);
> |
> -	__drm_gem_reset_shadow_plane(P, PS);
> +	__drm_gem_shadow_plane_state_init(P, PS);
> )
> 	...
> }
>
> @update_early_return depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> identifier P;
> expression PS;
> @@
>   struct drm_plane_state *new_name(struct drm_plane *P)
> {
> 	<+...
> -	return;
> +	return ERR_PTR(-EINVAL);
> 	...+>
> }
>
> @update_return_plane depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> identifier P;
> expression PS;
> @@
>   struct drm_plane_state *new_name(struct drm_plane *P)
> {
> 	...
>   	__drm_atomic_helper_plane_state_init(PS, P);
> 	...
> +
> +	return PS;
> }
>
> @update_return_shadow depends on update_struct@
> identifier renamed_func.new_name;
> identifier P;
> expression PS;
> @@
>   struct drm_plane_state *new_name(struct drm_plane *P)
> {
> 	...
>   	__drm_gem_shadow_plane_state_init(P, PS);
> 	...
> +
> +	return &PS->base;
> }
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Cc: dakr@kernel.org
> Cc: lyude@redhat.com
> Cc: nouveau@lists.freedesktop.org
> ---
>   drivers/gpu/drm/nouveau/dispnv50/wndw.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 15a322422f4e..378095138d12 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -750,22 +750,21 @@ nv50_wndw_zpos_default(struct drm_plane *plane)
>   {
>   	return (plane->type == DRM_PLANE_TYPE_PRIMARY) ? 0 :
>   	       (plane->type == DRM_PLANE_TYPE_OVERLAY) ? 1 : 255;
>   }
>   
> -static void
> -nv50_wndw_reset(struct drm_plane *plane)
> +static struct drm_plane_state *nv50_wndw_create_state(struct drm_plane *plane)
>   {
>   	struct nv50_wndw_atom *asyw;
>   
> -	if (WARN_ON(!(asyw = kzalloc_obj(*asyw))))
> -		return;
> +	asyw = kzalloc_obj(*asyw);
> +	if (WARN_ON(!asyw))

Wasn't there already a warning about failed allocation in kzalloc(). I 
think the WARN_ON can go.

> +		return ERR_PTR(-ENOMEM);
>   
> -	if (plane->state)
> -		plane->funcs->atomic_destroy_state(plane, plane->state);
> +	__drm_atomic_helper_plane_state_init(&asyw->state, plane);
>   
> -	__drm_atomic_helper_plane_reset(plane, &asyw->state);
> +	return &asyw->state;
>   }
>   
>   static void
>   nv50_wndw_destroy(struct drm_plane *plane)
>   {
> @@ -835,11 +834,11 @@ static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
>   const struct drm_plane_funcs
>   nv50_wndw = {
>   	.update_plane = drm_atomic_helper_update_plane,
>   	.disable_plane = drm_atomic_helper_disable_plane,
>   	.destroy = nv50_wndw_destroy,
> -	.reset = nv50_wndw_reset,
> +	.atomic_create_state = nv50_wndw_create_state,
>   	.atomic_duplicate_state = nv50_wndw_atomic_duplicate_state,
>   	.atomic_destroy_state = nv50_wndw_atomic_destroy_state,
>   	.format_mod_supported = nv50_plane_format_mod_supported,
>   };
>   
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG Nürnberg)


