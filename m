Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471C6606A321
	for <nouveau@archiver.kernel.org>; Thu, 12 Nov 2026 21:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gS6/WmEB
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1447311238C;
	Thu, 12 Nov 2026 21:40:33 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4F124492E3;
	Thu, 12 Nov 2026 21:20:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794518451;
 b=CsqhcR4mOACu4VZGjLHKjKayktltWbCo6rr/PaHHPsCFE+nl7OLmaYtwxSzGChiELCDY8
 rhzS3Ipdxx5yhGoFq/L5wztC+60wBxh1FSJ957EEib0hcXxJ8k2kUvKeF6HtyXJZCaLpMrK
 5N4arYV/18xcHtqjVwPV/hsBufBslzjqJi6wL6dKsTXBpUDpFSCnS02vTUWqNq+yL4chnH+
 yit+ohzMOH0UOhzfblIEUur+12F2QpUwi7X6LafWSns1PwLM/Z39tJq2eU5iMIVNMzpSrGB
 48BFimMCOCGAbQjBsmwT2T4E2KAV8zzr0g9/q0tSl8KXvwhueW7srmuEGoEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794518451; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r7tUMESnGuHT04Vkq8tfouLXmNvcHODCZ4NpjFvO4WY=;
 b=LTDub0WcBi40bA5QfPlpx9Y9amyutvt2RTIU2mfRBpdKEpM6dRNCyejoR5gAZCHJxdecl
 dArSgK8trthnPpv2RnITzGRZSMbjzgKvTXqr0j3lg5eQ4lble41tfuS9homXoj1GnboB2yR
 p5YJm1AXRQk4cNH55rpkPj1HZbzxK5DDuF2DsjHJr6NRpsD5R/kcnPBc5K8aBqqiBGbR25W
 pbxDg6wL1A9CEXoOlkE+P4RokuAY97Y9nXbjstkHr9dUr18KiRpDY1xrrrdZi6EZSj2ZwZs
 oqbs2r9sGY63UrLp3HOf2/EG4cZoCrrE8fxO5vwb9XluKV/DoPDawFe5xTCA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 70AEA492C8
	for <nouveau@lists.freedesktop.org>; Thu, 12 Nov 2026 21:20:48 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F2B2E10EBBB
	for <nouveau@lists.freedesktop.org>; Thu, 12 Nov 2026 21:40:24 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-49355a50d11so12120f8f.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 12 Nov 2026 13:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794519623; x=1795124423;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r7tUMESnGuHT04Vkq8tfouLXmNvcHODCZ4NpjFvO4WY=;
        b=gS6/WmEBJLa+4fjNsEhKnlHKhgKZ3N6DabfpCPE1MvDbiamzBg1O9E3VBhUb2+7319
         aSkenE6vIIOo7KLXOYa7Cq0T7+9PbwNcndmCCziOSy1Nyda4Qa5/SGwoq8oa+ESStpvq
         tTRqN+jzmTD4mP2h9+gxtYSvWnu3kQz9Ssf879WXcseAfbHyoNUBDETi8lbBGY5e5JLp
         o5YqcdXWzhJz3f3OQcB6ZOH0BH88lfAMNvxzKpnAQYvWhuXBB1xVbIW6dtvdcbGWK48C
         yg7qkcywzNLbO9RQakp1JZh6/aXw+450gmpNCD0Op/K398ytz+NLrIjUkyBQEQpMyfJ+
         jIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519623; x=1795124423;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7tUMESnGuHT04Vkq8tfouLXmNvcHODCZ4NpjFvO4WY=;
        b=LLAu8aWE+fxUhL5HnULQUZwfHknWtUCdZNtI1S3H2IDiPh60CZ0uckEg09xbZ+89pj
         utz4iwH09HBU6d34ceKbDCvN+lHYTwZp7XzlVOda6U/fUCFF26WmYEC8IXy5bnC+6Qli
         VNy6sRQBtSwPDNGNZTq6Cyc15Ynyvmuf5bAjw7o3y5AGzaaOY5x5ee4FwPXrSFZslLUt
         IzoeW4hwB1IwFh4IspBQGRrMXnpVM7XCT+lLEYA8LMdvRMlVGPGRd5Pep3MjesUy89qV
         SDl0RHELmwaYToB1ArlHCuqlsmPDUIhQz/VTafxYblTKtIJvKty9fGg7MxtDQEEPYPTE
         qOsQ==
X-Gm-Message-State: APuU4Z+UhPMPZOKdBlb6lWMLOmtrYQJJa6FJXjrFRkUPy5guirgDOLrS
	NwkWArOROqm9pEWv5yBsVEAlR3duyu6ZVDve4XMIjWvzlp2eLa1T+nFJ
X-Gm-Gg: AYBFou0C5JL6pcu/Gy3MGUXtyB8PiewZjrvTCFpDH53mWWBCbppDcuCEoGEY4MnaomY
	9l3rc/tH+gUSv+Kko7XFqiSq0zl4USNGijVQ9WXLu6V58dKnPcUWtjNjh5OwVXHyP/VyW+fqRLc
	nK9Qi0GuisWU3h6vQPDjgfe2go6iJU/I8FE2m0FoKbzE21cHS4HXAoTO+1Ezw+fCOv0C7uxUTtV
	yk65rWdcKJ+Nz8lXRG3yxPAKklWh7p7v+Y21n7ZWhylmFsoFp5/HKruemNK/k7xTvUsql/dsA45
	d1lVyT1G1MCnWl0BDQBbwLPnuE8NtxOEoQwYv8/6kwZJGSbITQl9zEapPVbGmKu3xnGv43fQNWD
	tsYKJD91AkCMyiItbVc+KQ7f7sDkv1dTAuvEud3YJIMfzuP8tLfffX368rj6sBG38LmfF+GYAB+
	O6LYhqlFQTw/w2UcPxS66XHMst74wWzod6/Z0UuukzrmqEeEWimpet6SAf47rK4SMQ1tipkRR7a
	uXIE1Zx5UxATteVrTSr430Rq8H+mwm1gHcvUf9CTrt278qG+wEOnZ+iz5N+ELthKhSaubR3Lao3
	7wLViiY4f6Zc3qkTFkEss+dOIpbkVUHuyDfNs1fWqNpXhX6D2db53Ot3dCC4Q+lmv4pTMDA5XCn
	9uGpcXqY=
X-Received: by 2002:a05:6000:40cd:b0:492:b1c5:6dc3 with SMTP id
 ffacd0b85a97d-49c723fc6f9mr1514901f8f.6.1794519623235;
        Thu, 12 Nov 2026 13:40:23 -0800 (PST)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c60021375sm1279890f8f.29.2026.11.12.13.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:40:22 -0800 (PST)
From: Marek Czernohous <mczernohous@gmail.com>
To: Beomseok Kim <dilddream31@gmail.com>
Subject: Re: [PATCH] drm/nouveau: Clear fence channel in no-signaling path
Date: Thu, 12 Nov 2026 22:40:21 +0100
Message-ID: <179451962164.1494544.10983579250194846394@gmail.com>
In-Reply-To: <20260928081450.19340-1-dilddream31@gmail.com>
References: <20260928081450.19340-1-dilddream31@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID-Hash: YN2VEPFPWJ34SUZ26AR2GN7F6Y72OELG
X-Message-ID-Hash: YN2VEPFPWJ34SUZ26AR2GN7F6Y72OELG
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Fab Stz <fabstz-it@yahoo.fr>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YN2VEPFPWJ34SUZ26AR2GN7F6Y72OELG/>
Archived-At: 
 <https://lore.freedesktop.org/179451962164.1494544.10983579250194846394@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 28 Sep 2026 17:14:50 +0900, Beomseok Kim <dilddream31@gmail.com> wrote:
> nouveau_fence_signal() clears fence->channel before dropping its
> reference.  nouveau_fence_no_signaling(), however, removes an already
> signaled fence from fctx->pending without clearing the pointer.

[...]

> @@ -488,6 +488,7 @@ static bool nouveau_fence_no_signaling(struct dma_fence *f)
>  	 */
>  	if (nouveau_fence_is_signaled(f)) {
>  		list_del(&fence->head);
> +		rcu_assign_pointer(fence->channel, NULL);

I think this patch fixes drm/nouveau#443 [1]. The nouveau_fence_sync()
oopses there and in the reporter's thread [2] (MCP79, Debian 6.12.43,
6.12.90 and 7.0.10) all fault at CR2 0x40 on the prev->cli->drm load,
with prev taken from f->channel and prev->cli NULL. A channel's cli is
never cleared, so prev most likely points to a freed channel. That is
the stale pointer described above: the no-signaling path is the only
way off fctx->pending that leaves fence->channel set, and
nouveau_fence_context_kill() only walks fctx->pending.

The fix looks right to me. enable_signaling runs under the fence lock
(&fctx->lock) while the fence is still on fctx->pending, so the new
store happens before nouveau_fence_context_kill() takes that lock, and
thus before the synchronize_rcu() in nouveau_fence_context_del(). With
fence->channel NULL, nouveau_fence_sync() falls back to dma_fence_wait()
on an already signaled fence.

Emmanuel Fleury's prev->cli check for the same oops [3] only helps when
the freed memory reads back as zero, so I prefer this patch.

The patch applies to 6.12.y with an offset; compile-tested there with
W=1 only. I have asked the reporter (Cc'd) to test it.

I did this review with help from Claude (claude-opus-5-5).

Reviewed-by: Marek Czernohous <marek@czernohous.de>

[1] https://gitlab.freedesktop.org/drm/nouveau/-/issues/443
[2] https://lore.freedesktop.org/nouveau/b7f523dc-fe41-4514-a1a5-747005311cbe@yahoo.fr/
[3] https://lore.freedesktop.org/nouveau/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.fr/
