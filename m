Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44E1606A32E
	for <nouveau@archiver.kernel.org>; Wed,  4 Nov 2026 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=thelittleman.net header.i=@thelittleman.net header.a=rsa-sha256 header.s=20140415-thelittleman header.b=kXdgrsbh
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 76A2210FA05;
	Wed,  4 Nov 2026 14:34:26 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4EDB048D26;
	Wed,  4 Nov 2026 14:15:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793801701;
 b=uj3ep22fa+aYexepvSUdxh9nHkioG3E3eyQBMM+B/GUEQQzKVSdC/J/blla2w1csDUW1T
 xDJJuLUOoOXGgUzXoo9vvnLuSQa0EWrV+isB3H46X33swakSy7l+JaBaKDpnJXCawNCXVq0
 cPtnHS5r2i9SjAmSsAi2CKIfp5qXzyxOIgpy9Siufyxai3OnBxZlszKG67wfqaFOrbJrmoB
 7W1a66c7Bewscx7ptozAQGkI+i9sP+4VCcxzFC5ck+rA2JKBgZ81M9hVnclNGM1Yt+MNQZH
 +mhbdmOT2sq7mTyjh08ivh6b33tlYYDPGKx0VKMiysZADH1F2X5ZLAn5/+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793801701; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ExnzUTE0DG5TrCl1w+XLfuekZrkRHbiJ/wFV76Oir+w=;
 b=VpjIaci8/wK+GFXAo5+8U8yKGrDVKy2SElU8zmaWvhfBS5Zk8RT4qKZKleH8yigM/wGhd
 qImwg2EUVgP4rnIv/oNmO44bE8S+RDQ/5itaYqU+cuutVn5Q4KmdOx1htRy8iYL0Fev5xFk
 t4PE//AVmAaX0ScoEBoX6btNBf9qk6P8+z7tteIfiiOSgzFB7jO2EF08VbTLsiUICkCNh5x
 f4NqS8d/19gX9HoSWiwb6kRRsRtl5patqugfF8jYzi7NgwTwIy1X/KknMjeQD34pUy2X4ly
 LsdNK904GAcFoDKRw+SKbBrBYXFohAnL0C1C0DnhQBOp0Y8GxH44anAI/3ww==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=thelittleman.net;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=thelittleman.net
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=thelittleman.net; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=thelittleman.net
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C799448A90
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 20:37:23 +0000 (UTC)
Received: from mail.thelittleman.net (mail.thelittleman.net [91.99.148.243])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E57388BE3;
	Tue,  3 Nov 2026 20:56:40 +0000 (UTC)
Received: from mail.thelittleman.net (localhost [127.0.0.1])
	by mail.thelittleman.net (Postfix) with ESMTPSA id B10755F92D;
	Tue, 03 Nov 2026 20:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thelittleman.net;
	s=20140415-thelittleman; t=1793739398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExnzUTE0DG5TrCl1w+XLfuekZrkRHbiJ/wFV76Oir+w=;
	b=kXdgrsbhw6IZn8qhmccYCYjphpymPYJOcr+RIR/2drcT1ks5n9oTt7iVulLu+hS4rl/sRW
	Hwli7fwhQdy38u1obI9j7dQAFs96Mo7EVDywtivrDBu/NlQKOvUNvXnnTZzBg1Vuln5bO7
	dZgDIDnujPlFgluNcy3/U6zccEDAZKE=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 14:56:38 -0600
From: "David R. Hedges" <linuxdev844@thelittleman.net>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 5/5] drm/nouveau: don't let an IRQ_HPD hide a plug or
 unplug event
In-Reply-To: <sashiko-outbox-195933@kernel.org>
References: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
 <20261103-nouveau-dp-fixes-v1-5-892f4bd357cd@thelittleman.net>
 <sashiko-outbox-195933@kernel.org>
Message-ID: <201c6fefc6ddaee3915ba10ccbde80b1@thelittleman.net>
X-Sender: linuxdev844@thelittleman.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: linuxdev844@thelittleman.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: X2FKNS3IBQHREBYKAHXJHUPE7OH5YJJI
X-Message-ID-Hash: X2FKNS3IBQHREBYKAHXJHUPE7OH5YJJI
X-Mailman-Approved-At: Wed, 04 Nov 2026 14:14:59 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X2FKNS3IBQHREBYKAHXJHUPE7OH5YJJI/>
Archived-At: 
 <https://lore.freedesktop.org/201c6fefc6ddaee3915ba10ccbde80b1@thelittleman.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-03 13:45 -0600, sashiko-bot@kernel.org wrote:
> Can a separate plug or unplug event still be dropped if it arrives 
> while an
> earlier NVIF_CONN_EVENT_V0_IRQ is already pending for the same 
> connector?

[...]

> Should nv_connector->hpd_pending |= bits be moved outside the
> if (!(drm->hpd_pending & mask)) check in nouveau_connector_hpd()?

Yes. Since 016dacb60e6d ("drm/nouveau/kms: pass event mask to hpd
handler") put the event bits under that check, any event that arrives
between scheduling the HPD worker and the worker clearing
drm->hpd_pending is lost, and the worker can sit in
pm_runtime_get_sync() for some time first. That predates this patch,
but it's the same problem from the other side, so v2 will add a patch
that always records the bits and only schedules the worker under the
check.

> Would it be better to always run nouveau_dp_link_check(nv_connector) 
> when
> NVIF_CONN_EVENT_V0_IRQ is set, and only guard the continue statement 
> with
> !(bits & (NVIF_CONN_EVENT_V0_PLUG | NVIF_CONN_EVENT_V0_UNPLUG))?

I'd rather keep it as it is, but I welcome feedback from the
maintainers. With only this series applied, skipping the link check
loses nothing: nv_connector->dp_encoder is never set on nv50+, so
nouveau_dp_link_check() returns true without looking at the link. The
follow-up series that makes the link check work again [1] also restarts
an active DP link with a full modeset whenever the sink drops or
reasserts HPD, which covers a plug or unplug that comes in with an
IRQ_HPD. Running the link check as well would only add a second
retrain, or AUX reads from a sink that has just gone away.

[1] 
https://lore.kernel.org/r/20261103-nouveau-dp-relink-v1-0-7ee88c7f1e8a@thelittleman.net
