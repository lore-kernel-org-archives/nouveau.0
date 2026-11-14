Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C87606A32E
	for <nouveau@archiver.kernel.org>; Sat, 14 Nov 2026 16:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRH/He+r
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E93510F059;
	Sat, 14 Nov 2026 16:35:35 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C509F49322;
	Sat, 14 Nov 2026 16:15:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794672949;
 b=gzJD6yo3A9FONCmrHrump9p0c7PISuVwEDHk+U/Oe+DUlbtw1tK94r9heZ6WnkN87kCXx
 Bub6u1ctQ5pdXvx0XpK6IQ9XoxnRmhsHWXOG6rjUQBsuRsuq8rjguf+LOkHaLylzrHKxLIM
 8daPb+x8xPqUDBY86XwDJORs3VAXgXtViBhaKUuhhMNpI0OSaR1dd749FBiU84V5ukR4q3Y
 eGQkUk1kgMENw95Sf1yjtmWLR+iLzFZGWMWzuq5CphIBdRfPRSZqul4TxK+mVfyt6UoHuLO
 x4x3ncyAU397epv2t2mMaV5KVYtknd/1YqP38RLg/3m+7tynoJ0NS1GHOMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794672949; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DiDcxP5ac6YkeYjA21NF5sNzCAmKzyT92ze3FWnxVUo=;
 b=dHWJGdpyjsDHA8LVOC814hLr8VVJN4lkhZ8akZJahPrUzsInVJj8RBQyshQI6kcmiOs5p
 SqLV0sfc8RQ1CH8zy/pGeqP+Bdlt4867pkh3M4IVVflbqeiWXHSbo1GwctAuJJ5RMN4iIP7
 404Wq7vosinyP+H6AUJFmNUokqAnfP85IelIgXQ2CXC6ZFKyLuW133p0py8qPrdMvgTyS0h
 uG5w/gIh47QcgM4VEw1rVCZ3IyMiBiMBXEkc3AKfufg2rv6dndsa+dzh5ijiat+gBhv+kzr
 z0MERciQZNYfefDjHz19lSRXEppv9JKnQiNS+r6X57eGNB542BGVIec1RXKA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D7EC149319
	for <nouveau@lists.freedesktop.org>; Sat, 14 Nov 2026 08:20:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3D910E22D
	for <nouveau@lists.freedesktop.org>; Sat, 14 Nov 2026 08:40:07 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso10364225e9.2
        for <nouveau@lists.freedesktop.org>;
 Sat, 14 Nov 2026 00:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645606; x=1795250406;
 darn=lists.freedesktop.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DiDcxP5ac6YkeYjA21NF5sNzCAmKzyT92ze3FWnxVUo=;
        b=DRH/He+rNEoAzf6YVGkKaQVDNNQx685TmKH4GNf2Iap9Fd7MfZ20Qj8HS+l+q6wK6K
         qRrjiRdUCGNWQseDZRrGJoW9heGugBAAVjdPXd1bkCbqPXQdEzI5aBuSrLn4qQYsq7/f
         od6f7spUKJCjJNt+DtK1iXoOfNzLli0n2I/BgN7JYbfSiSbB9E7v7m06v8fx+KTfJu1w
         wiSGY8ZzuqCmRZhUKIYK9GVOzHC8D39xHfrcup4zXIYGq0taDt3qd1VHN+U3enzr7S1G
         bhQcgV6k+9Tsva7/c5z3uYlBr2O4WI4FUFBqiusiRSvfIxZSj5eHoxF8ohobW2TeuVB2
         W1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645606; x=1795250406;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiDcxP5ac6YkeYjA21NF5sNzCAmKzyT92ze3FWnxVUo=;
        b=yQnIwNYRyEoqfCspYojiiuloDaoVd2RVR/JFcJCiyja4NJolMX9NsK5942n9hiJnOT
         Ixw0p7tRgyCJWxHp3wX5jEUHS31LbnYqwi3skvMIIaFXiAKNbj+6JxEoY07DGsDNFYcZ
         xmlAbzxEFkRrO618R3wvtaOPMMKRZnGYLwvRRtQzhGyNb1zppCARTNiE/SS63bAiI/Ab
         1Zc0LkeCHhfJTQWcC3cgwjl5hr4bxALBfxnmRPW/S2ngiBJEh5XVfZ8IEuaIA8MSp++t
         NWf+08QTalx3WeLed3g0RsIrqPFVcXD51sMwAUAutW/82CaPjyK/+pB+496Qwr7KswT3
         9fFQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFBbXKpAk/C8ufuFJUkCxKTiAkuusBPjFCKyYvZJ0ObGltGDeBZ1jVQPWgfi75GJl0IeDgGsHPZ@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9iryZBMT0VpvpvwLmHV6NoE2TLJlaUKr9DvsX4WVSj9C557qze
	Uq6MBxyMENM+7HvnJkpS2YHOvgaKuiFS6Rv8TuoViCM4ZQjh0NIH7EG9
X-Gm-Gg: AYBFou1R0/oSrvlzU2uS7munpLm4jnuwuK+R3co7VEOP6uSGLPEQcBUwoSho6OTvTFI
	c7oXGex7zK0WWJhZ3XkHzZ+XyeXFBnoFkOqJAWHMJX9nluWYZ4wCdPxsuOgVhpqI05Fq2HlTN++
	x4RKzD5tf10wxZMnpNOyPhAx1H/eg3QVdyGQ5IEManBxn/2ti4qnRbzJr5XREpcnVR3zimjlYXP
	PmPqGBsIRV3gqf5XCClhv6ymDnnv3xyC1ud71bkT06mz61reoyxPUz0ZjMqOhBCGPiEwBnvHG2R
	qH0VDO0LPhWSH5p9sZsfr9jmFOFMZTd0v4wGBzTZ0BIQWQ/6YYtcTZZJ14f8l6XrisSjQr8q6QY
	MvZdAvH6ytUtPcc6Och0UbVtTRee+uXaN0OxATbFyt2ktV3cvMi1eSvPPjUWeAyoeZmHAFBzkhr
	RNzYsqa0qYdPAwWnxVpCeC7tbzMJlt86p/O8QODcdBgE8B9WfnuUUdHFygGslerjH7j0Llahi3/
	9hS66h533jP7747xuQx5xCTSVff6FywtkfCFqggDLLA5kJS6z4ADL/B/yrkL85M+j3CMzDMJZz5
	jOptNNQcVtV8QD7jZQ+TFkY+ZJm0h4S26D1pyWX0Uw==
X-Received: by 2002:a05:600c:8b8a:b0:4a1:9078:911 with SMTP id
 5b1f17b1804b1-4bb55abbadamr104311415e9.31.1794645605614;
        Sat, 14 Nov 2026 00:40:05 -0800 (PST)
Received: from [192.168.1.44] ([156.208.106.196])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb571cfa2esm114312485e9.2.2026.11.14.00.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:40:05 -0800 (PST)
Message-ID: <8b360042593f7efa4f7891ba81c3735b4aabb329.camel@gmail.com>
Subject: Re: [PATCH 0/2] drm/nouveau: fix GK107 VDPAU regressions
From: Youssef Mahmoud <youssefma255681@gmail.com>
To: or.pajula@gmail.com
Date: Sat, 14 Nov 2026 10:40:04 +0200
In-Reply-To: <20260913201225.5975-1-or.pajula@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MailFrom: youssefma255681@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: AFZTFECNMSZCNMTUCJCHBUE3ICKFKSE3
X-Message-ID-Hash: AFZTFECNMSZCNMTUCJCHBUE3ICKFKSE3
X-Mailman-Approved-At: Sat, 14 Nov 2026 16:15:47 +0000
CC: dakr@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AFZTFECNMSZCNMTUCJCHBUE3ICKFKSE3/>
Archived-At: 
 <https://lore.freedesktop.org/8b360042593f7efa4f7891ba81c3735b4aabb329.camel@gmail.com/>
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

I have tested the patch series on NVIDIA GK104 (Kepler) using a Linux
7.2 based
drm-misc tree:
  drm/nouveau/fifo/gk104: fix legacy video engine context mappings
  drm/nouveau/fifo: use global nonstall event on legacy FIFO

 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c | 14 ++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c | 3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)

Tested with Mesa (including patches from
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45340), mpv
(with
VA-API), and Clapper.

With both patches applied:
- H.264 1920x1080: PASS

Tested-by: Youssef Mahmoud <youssefma255681@gmail.com>

Thanks,
Youssef
