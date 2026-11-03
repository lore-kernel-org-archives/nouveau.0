Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC94606A32D
	for <nouveau@archiver.kernel.org>; Wed,  4 Nov 2026 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=thelittleman.net header.i=@thelittleman.net header.a=rsa-sha256 header.s=20140415-thelittleman header.b=cABqwdBx
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B5E9110FC3A;
	Wed,  4 Nov 2026 14:34:26 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 36BC848D20;
	Wed,  4 Nov 2026 14:15:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793801702;
 b=X4bqfDkjXHTooYmB8yfP3YaCiWa/0lzcUpHQF9WRo5gZPXiwpFRpbI6h8rx0ePYH8JYhY
 1kL/Ugpch7X2a8DOMR5a9piMikjer4GSTo2s8t/vXPJW14R1aDwu7ajx/VoUiyxgk9irrsG
 W7A2m/dvB02YBmFv1FfA+2pgRMI/DKvG1luNbPYLcWP5DXXAAdNdU7giLYVRWrbE1oMLCIp
 9/AX/caCKfKxKqTwHBo9SHXJGq0FW3okf5Vqsps2L99gDNpJoq3JyQU7Lul4kHyflg6cqS2
 AwsI/kxBZJWRumqUsutDnCpGhD/XVLpi5Dp47MVM5UmdPHtVz7E1HD0B91Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793801702; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1+ljwUcRqPa1I8PKwk28jT3BsaQMof3yBXjCBJacyK0=;
 b=B4d2Vt3cWmASWflagLGOgVeSFC8z00q4dkxdvNe5O4Bohibf/f3su7+dWu8UgTgvlJm9C
 0HWb3bWQjNE5zoLPuSzgF5VwT9eVzXXZ4juePD6bzHQGQYs7phGk80kzFihS8TL8SCKyP5n
 NYyz7iQ+4aLDx9oMuyqHSFyblwBbtLCY3X6SO0A/3MMb2x2yWKKNvlkFGpCbtifUgSHGvXw
 D5PeFnTPAewfIN6fmolw4cOioIjpzbfE0j/552BNVkfqpS2pdvyqi0oDtcWasH56Yav3wtF
 xevfgz9Si5kJtT7P4YZa7hQW8m2es0da0rBbLt3czA83YF5EIpLt1M04T9Ng==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 503BD45C59
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 21:42:48 +0000 (UTC)
Received: from mail.thelittleman.net (mail.thelittleman.net [91.99.148.243])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A28EB10E02F;
	Tue,  3 Nov 2026 22:02:00 +0000 (UTC)
Received: from mail.thelittleman.net (localhost [127.0.0.1])
	by mail.thelittleman.net (Postfix) with ESMTPSA id B7EB75F491;
	Tue, 03 Nov 2026 22:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thelittleman.net;
	s=20140415-thelittleman; t=1793743318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+ljwUcRqPa1I8PKwk28jT3BsaQMof3yBXjCBJacyK0=;
	b=cABqwdBxjs1lavtCsxwE2XmJSpQSX2LyLMLILD+JTQ3S71NcJYV5h9VHXfPoTlnjHNqOQ+
	gEL914uu7mTRig4MKDpVEMd4kuZj1a1rrkvH0dSmkw5D+U/eTLsW4JfHHY30DdsWjvC1pg
	jEscpYzHOTYxJxmXRIuzDMCJ+BuzohQ=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 16:01:58 -0600
From: "David R. Hedges" <linuxdev844@thelittleman.net>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 2/5] drm/nouveau/kms/nv50-: don't enable a DP output with
 no trained link
In-Reply-To: <sashiko-outbox-195991@kernel.org>
References: <20261103-nouveau-dp-relink-v1-0-7ee88c7f1e8a@thelittleman.net>
 <20261103-nouveau-dp-relink-v1-2-7ee88c7f1e8a@thelittleman.net>
 <sashiko-outbox-195991@kernel.org>
Message-ID: <9c007e977c249af5064bf34a37694e76@thelittleman.net>
X-Sender: linuxdev844@thelittleman.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: linuxdev844@thelittleman.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: ZOZBMNIU4UL6ELUITBAXRC2PTVE546KM
X-Message-ID-Hash: ZOZBMNIU4UL6ELUITBAXRC2PTVE546KM
X-Mailman-Approved-At: Wed, 04 Nov 2026 14:14:59 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZOZBMNIU4UL6ELUITBAXRC2PTVE546KM/>
Archived-At: 
 <https://lore.freedesktop.org/9c007e977c249af5064bf34a37694e76@thelittleman.net/>
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

On 2026-11-03 14:27 -0600, sashiko-bot@kernel.org wrote:
> When nv50_sor_atomic_enable() returns early here on -EINVAL, does this 
> still
> end up enabling DP audio on the untrained and detached SOR?

[...]

Yeah, nv50_disp_atomic_commit_tail() marks the output enabled whatever
nv50_sor_atomic_enable() did, and nv50_disp_atomic_commit_core() then
enables audio on it.  In v2, I'll have nouveau_dp_train() clear dp.lt.nr
before it starts, so an output left detached has no trained link, and
nv50_audio_enable() skips a DP output without one.
