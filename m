Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D075606A324
	for <nouveau@archiver.kernel.org>; Mon,  2 Nov 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NXgjLjZf;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7k/A6mMB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cjPW10Q1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3I6pl88n
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A98910EC3A;
	Mon,  2 Nov 2026 08:36:50 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 05A2248C74;
	Mon,  2 Nov 2026 08:17:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793607451;
 b=WOpYhHt6lXx+NvZF/a689jch1nXwoJ9N6Pr6rA7jwA536iNVsEn5uS6evlqNvbgBdXkQm
 mH9U6jP4YHAbMi/EGiYaVpsw0YdpNcN95hF3yyOm8XLkM1bWCM4Nl20+FiScE/PNN/mtdO2
 a+OscgEhoHovNrrbLTY+SCQvYivSbwiyZQB823d/p0D+BpBzwKt5sV/m/qGstB5bhtSEQds
 hd4TQf8o9g9p2An/YoCjb/5caOdkzPiX+Rset5ATtKRI9E2XQh6OKoL4Rom1PknDRAZa4s8
 bOegoAoDDuoIi7ijVIAVDyod3uO6Sg++wEFa03pbTooidnwM4430RCXvA1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793607451; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PaMnGP+qVZ9H/IkTsdXNRejL6EdgnoVvkvBOAg/mURA=;
 b=owB/6XjEX6Tx8O5KwlAzaxzwCHYOlasjSiB5a6+4Zv2YunorrH6I3ITZ/Jppu/vSEmqXY
 PYc2gDlUU6Odv5LeeXTJi3K7acNro+JIGCjERaaidsso6oPWDXK8/p896zLC/kg3/dv71YM
 ROtLRM6t3DJMZDc3CQ90DF/pVjcujKctLAVI9Q+i5VSfjQUrt30a4bVp5SbnFdWfes5wq1W
 2+i5KMISB5jCQSjxKASq/PY8GjhqzUDwSBvraI6ajlR9KE7CdFgcjV3Un6FHm1cVRKDo/Gy
 6k2+8TFJAuwAwZoPfXLZvpZpPKZhFE5T701VSiyt1e1X9i0GjXVXdVeGFdjw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8E67F48637
	for <nouveau@lists.freedesktop.org>; Mon,  2 Nov 2026 08:17:28 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9A310E5B8;
	Mon,  2 Nov 2026 08:36:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D93391FCF1;
	Mon,  2 Nov 2026 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1793608595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PaMnGP+qVZ9H/IkTsdXNRejL6EdgnoVvkvBOAg/mURA=;
	b=NXgjLjZfpaWDy+RFEUbWUWTT11BcSyzUO1G0PysPisEvVg2Ztt+2+TQ9CbYKTZw7+1dUc/
	FTbZtmjIkjEuMYtS2Q/nO3PiidQqjBmU67opS2NedYz39Z1FOTp9Gwuto0Pyufgyva6rSS
	DoqptCsFqCjYfL/PkkBQFzUo5pmJe5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793608595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PaMnGP+qVZ9H/IkTsdXNRejL6EdgnoVvkvBOAg/mURA=;
	b=7k/A6mMBET8hMS3SOph4XNwdfRBwo3MaLOuyKFpjCJuB/oaRCw86+IZqF7Uc/hGKf1YBfe
	vFG/CzMApk8p0MCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1793608594;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PaMnGP+qVZ9H/IkTsdXNRejL6EdgnoVvkvBOAg/mURA=;
	b=cjPW10Q1xaEEifTk34SRdf9hvwW2uRkFEuosg/NQkF/VEaYe9y1VHWRVZUWlhuszcYwfTW
	scmmIfi5NLm9+zJXSWjK8IeAkt8FPpakppSiaieL+KZEuXK6Gmn0QloGielhNIEdT2aoBM
	2IGEzmGeJTmSHs17l5HbSKtNenopgmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793608594;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PaMnGP+qVZ9H/IkTsdXNRejL6EdgnoVvkvBOAg/mURA=;
	b=3I6pl88ne4Hfd0ksCNd5L561gMJNFmuoPlJfjCvOkmd8jBZ6RW2pmEGeSb1uiVq54aAtMu
	JRrrv0n3jhCdNdDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71D8A134B8;
	Mon,  2 Nov 2026 08:36:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nSShEZJL6GoyOgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 02 Nov 2026 08:36:34 +0000
Message-ID: <52cafaf3-0d7c-4133-b690-6504a3b9d0c1@suse.de>
Date: Mon, 2 Nov 2026 09:36:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 34/37] drm/nouveau: Convert to atomic_create_state
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: 
 <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
 <20261030-drm-no-more-connector-reset-v3-34-30e71d92c327@kernel.org>
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
In-Reply-To: 
 <20261030-drm-no-more-connector-reset-v3-34-30e71d92c327@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.com:url]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -13.50
X-Spam-Level: 
X-Rspamd-Queue-Id: D93391FCF1
Message-ID-Hash: 3NSIRE45NEF3K7Q3ZXECEFI5BR63UDDT
X-Message-ID-Hash: 3NSIRE45NEF3K7Q3ZXECEFI5BR63UDDT
X-MailFrom: tzimmermann@suse.de
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3NSIRE45NEF3K7Q3ZXECEFI5BR63UDDT/>
Archived-At: 
 <https://lore.freedesktop.org/52cafaf3-0d7c-4133-b690-6504a3b9d0c1@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

Am 30.10.26 um 16:14 schrieb Maxime Ripard:
[...]
> +struct drm_connector_state *
> +nouveau_conn_atomic_create_state(struct drm_connector *connector)
> +{
> +	struct nouveau_conn_atom *asyc;
> +
> +	asyc = kzalloc_obj(*asyc);
> +	if (WARN_ON(!asyc))

Since you're here anyway, please use drm_WARN_ON_ONCE(). Plain WARN_ON() 
doesn't seem a good fir here.

Best regards
Thomas

> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_connector_state_init(&asyc->state, connector);
> +	nouveau_conn_atom_init(connector, asyc);
> +
> +	return &asyc->state;
> +}
> +
>   void
>   nouveau_conn_attach_properties(struct drm_connector *connector)
> @@ -1231,5 +1231,47 @@ static const struct drm_connector_funcs
>   nouveau_connector_funcs = {
>   	.dpms = drm_helper_connector_dpms,
> -	.reset = nouveau_conn_reset,
> +	.detect = nouveau_connector_detect,
> +	.force = nouveau_connector_force,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.set_property = nouveau_connector_set_property,
> +	.destroy = nouveau_connector_destroy,
> +	.atomic_create_state = nouveau_conn_atomic_create_state,
> +	.atomic_duplicate_state = nouveau_conn_atomic_duplicate_state,
> +	.atomic_destroy_state = nouveau_conn_atomic_destroy_state,
> +	.atomic_set_property = nouveau_conn_atomic_set_property,
> +	.atomic_get_property = nouveau_conn_atomic_get_property,
> +	.late_register = nouveau_connector_late_register,
> +	.early_unregister = nouveau_connector_early_unregister,
> +};
> +
> +static const struct drm_connector_funcs
> +nouveau_connector_funcs_lvds = {
> +	.dpms = drm_helper_connector_dpms,
> +	.detect = nouveau_connector_detect_lvds,
> +	.force = nouveau_connector_force,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.set_property = nouveau_connector_set_property,
> +	.destroy = nouveau_connector_destroy,
> +	.atomic_create_state = nouveau_conn_atomic_create_state,
> +	.atomic_duplicate_state = nouveau_conn_atomic_duplicate_state,
> +	.atomic_destroy_state = nouveau_conn_atomic_destroy_state,
> +	.atomic_set_property = nouveau_conn_atomic_set_property,
> +	.atomic_get_property = nouveau_conn_atomic_get_property,
> +	.late_register = nouveau_connector_late_register,
> +	.early_unregister = nouveau_connector_early_unregister,
> +};
> +
> +/*
> + * Pre-nv50 doesn't support atomic modesetting: the connector property state
> + * lives in the embedded struct nouveau_connector.properties_state and
> + * drm_connector.state is left alone, as expected from a legacy driver.
> + *
> + * Those connectors must not expose atomic_create_state: the DRM core would
> + * then install the embedded state into drm_connector.state and eventually
> + * pass it to atomic_destroy_state, which frees it.
> + */
> +static const struct drm_connector_funcs
> +nouveau_connector_funcs_legacy = {
> +	.dpms = drm_helper_connector_dpms,
>   	.detect = nouveau_connector_detect,
>   	.force = nouveau_connector_force,
> @@ -1246,7 +1288,6 @@ nouveau_connector_funcs = {
>   
>   static const struct drm_connector_funcs
> -nouveau_connector_funcs_lvds = {
> +nouveau_connector_funcs_lvds_legacy = {
>   	.dpms = drm_helper_connector_dpms,
> -	.reset = nouveau_conn_reset,
>   	.detect = nouveau_connector_detect_lvds,
>   	.force = nouveau_connector_force,
> @@ -1362,5 +1403,7 @@ nouveau_connector_create(struct drm_device *dev, int index)
>   	struct nouveau_display *disp = nouveau_display(dev);
>   	struct nouveau_connector *nv_connector = NULL;
> +	struct drm_connector_state *conn_state;
>   	struct drm_connector *connector;
> +	const struct drm_connector_funcs *funcs;
>   	struct drm_connector_list_iter conn_iter;
>   	int type, ret = 0;
> @@ -1459,8 +1502,17 @@ nouveau_connector_create(struct drm_device *dev, int index)
>   
>   	type = drm_conntype_from_dcb(nv_connector->type);
> -	if (type == DRM_MODE_CONNECTOR_LVDS)
> -		drm_connector_init(dev, connector, &nouveau_connector_funcs_lvds, type);
> -	else
> -		drm_connector_init(dev, connector, &nouveau_connector_funcs, type);
> +	if (type == DRM_MODE_CONNECTOR_LVDS) {
> +		if (drm_drv_uses_atomic_modeset(dev))
> +			funcs = &nouveau_connector_funcs_lvds;
> +		else
> +			funcs = &nouveau_connector_funcs_lvds_legacy;
> +	} else {
> +		if (drm_drv_uses_atomic_modeset(dev))
> +			funcs = &nouveau_connector_funcs;
> +		else
> +			funcs = &nouveau_connector_funcs_legacy;
> +	}
> +
> +	drm_connector_init(dev, connector, funcs, type);
>   
>   	switch (type) {
> @@ -1514,13 +1566,26 @@ nouveau_connector_create(struct drm_device *dev, int index)
>   						   nouveau_connector_irq, NVIF_CONN_EVENT_V0_IRQ,
>   						   &nv_connector->irq);
> -			if (ret) {
> -				nvif_event_dtor(&nv_connector->hpd);
> -				nvif_conn_dtor(&nv_connector->conn);
> +			if (ret)
>   				goto drm_conn_err;
> -			}
>   		}
>   	}
>   
> -	connector->funcs->reset(connector);
> +	if (drm_drv_uses_atomic_modeset(dev)) {
> +		conn_state = connector->funcs->atomic_create_state(connector);
> +		if (IS_ERR(conn_state)) {
> +			ret = PTR_ERR(conn_state);
> +			goto drm_conn_err;
> +		}
> +		connector->state = conn_state;
> +	} else {
> +		/* Pre-nv50 keeps its property state embedded in struct
> +		 * nouveau_connector: drm_connector.state must remain NULL,
> +		 * the DRM core expects legacy drivers to use
> +		 * drm_connector.encoder.
> +		 */
> +		nouveau_conn_atom_init(connector,
> +				       &nv_connector->properties_state);
> +	}
> +
>   	nouveau_conn_attach_properties(connector);
>   
> @@ -1567,4 +1632,8 @@ nouveau_connector_create(struct drm_device *dev, int index)
>   
>   drm_conn_err:
> +	nvif_event_dtor(&nv_connector->irq);
> +	nvif_event_dtor(&nv_connector->hpd);
> +	cancel_work_sync(&nv_connector->irq_work);
> +	nvif_conn_dtor(&nv_connector->conn);
>   	drm_connector_cleanup(connector);
>   	kfree(nv_connector);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
> index eb292d2ba4bc..02f843648eb8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
> @@ -217,5 +217,6 @@ extern int nouveau_hdmimhz;
>   
>   void nouveau_conn_attach_properties(struct drm_connector *);
> -void nouveau_conn_reset(struct drm_connector *);
> +struct drm_connector_state *
> +nouveau_conn_atomic_create_state(struct drm_connector *);
>   struct drm_connector_state *
>   nouveau_conn_atomic_duplicate_state(struct drm_connector *);
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG Nürnberg)


