Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB05D606A31B
	for <nouveau@archiver.kernel.org>; Thu,  5 Nov 2026 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOUiZPlN
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 62362112265;
	Thu,  5 Nov 2026 08:41:33 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4B62C4056B;
	Thu,  5 Nov 2026 08:22:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793866928;
 b=g0GRy7myjiER0CA2eDnEVN/84vQliKiFvO9uWadP5qzZN2UbsUAmfHS0DNd+53F5fQXcm
 PwudL1NjDIyi2+38+XxFJP5oQWPk0HXfsQGbz6iiYRjRlhTF0hb6vhAo2jEUDoGQxjH1XUs
 WYThOEIA8uT5Z2lvynySZR4RpR1jc7wI9KA5o+bmBrbYc5qR74rOu8Zr0ZXrOf1ZsuNiLRV
 N+17Pk/Fglv2oTzBokykSV9OxL6KZWJlW5Q6d0GIpNcoYy1MGyBjXmzXxjIKC39NO9vlKXr
 jrnKCJ20W5hQHxRNLtFWTVENeJaUiimkJuCrMnaYB8Q/kRkTe+c79C+XLYmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793866928; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=93jv87Iwyy3JRzOhRq5Cce/h8tGYeWiXhCqgOwKlqf8=;
 b=ujf5xFv3Si+EjtbEkhwz9PXZwB+JwYm+sHHmsMH1FLPPnOTKAT0SbTSnrrUnZBJ6BKPts
 lHCJXIUPofpubh9GTXSx8+Ag2WOIufaMy481ZLODi/s6QnO+DBzhbZfc0csqiNBBbrq3Fvf
 VEro6V+Hk/SBwQenG4XR7juXGR6H8Z1bIMhUUUawv2tqV6BCZ+PnQdQp43veE1dsiJrGRkl
 JqDZZUUN3Lc6j9eBEGHK18/8EFK9nDpT8ywJowEzxx13UkgddbAj1jo58jwCVpRj1TXABg3
 NPSnv0He+z/E38rRkniHGjUyMGhYE7SrwU+9IwQu4nCwVJW+vRUCLmSVFFCA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8CE4B40041
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 08:22:05 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3E311222B
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 08:41:25 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-917a707f37eso17162166d6.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Nov 2026 00:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793868084; cv=none;
        d=google.com; s=arc-20260327;
        b=NY1kuIHZdMo/4siS6n0F0x+ifIINNf4GzhS26VvbzMwX9gc3adHX47AGFMBBB906YH
         7X9SgCRllTzae6sHTHkQFYNHPwvAex+t/hsnH/v5HCDxEy3LQUf8QwDgfJOggQ3wG6Vl
         fp9Wy0OWFOqcnR+zLK5Q1k917XzGc2MzwTMUAwZrfrwIz0Eax72NKiVIcYPBlQecXNou
         JasJXBN1Sr+sVtRArt3p6gliwmuOMuCbok31I/m/HQkwCV2OZkBRexn9LCD1Uwme0g+j
         pacD92RAgaCEWRyN0R46JhdHw+tm4rtiwDy/A0tWZ0rpJDGdB/C72GLYcnaZ7isW2kS1
         GQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=93jv87Iwyy3JRzOhRq5Cce/h8tGYeWiXhCqgOwKlqf8=;
        fh=i9ThHMjMYMQ6lU/gMqu5TWRVGWOM2EWOmnk6P9Kb+wA=;
        b=s1iLsKwXxJ2mUvsExCfxfVVtgb06aumVHO49j0VEzyXpVLKQ4tY3S3ZZ+GZ0Rjspnc
         MpsYllrbQIcINfU24irnvQJoUPz4OBKKgkoCnPESl3oD4xUAi8iPgPTp/37SVjibgQit
         tOf7LDZ2meTPk0fF19hx7emQdcj2bDWFukHy4RRoEK6Ig8EwQl1gJKTVBgcecdOAt8vl
         wIr/4xQaFf27sWlDz5wkEgM5XFof5ZXiJGkKneWVgA094unub903BlN/KQ1ES4tR5/FD
         09moXauJt+uE1p5D+FrbtX5sr+yfMU1RbMOcoMmq8vxX0c3IlkeK9REz291Nh8uyfc2i
         WUQA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793868084; x=1794472884;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93jv87Iwyy3JRzOhRq5Cce/h8tGYeWiXhCqgOwKlqf8=;
        b=DOUiZPlNZdtFHkLpRnWWkx7JE3QNhFtDI5yVOV62hznR1RSI4ah5ZKbmu4y3bw7odZ
         +dCE1NkZDce2Ng7/l0K3zFG14OpBwODPzE9ASWr+8e55RLu62DYh9g5uXsUWey7nGQm/
         Zi/EndtfT3PAZYOaKjImOb5StF3Lh6WR/VynQbpuodo9y3fR1zLtMy+1+vZSgmmB6JXL
         9Wdt3nZDltxukwrSnNO2ywAaWy7ISRZLeIOFDi41AFt94Lknwh+Fb7hzbBnWevCfVON1
         w6KWciooLQ9H7Rj87EvqLmmkdxcATJ3K4WJCiYHXnjyT8RoPXPPcY22pJgsWyNKgbixR
         V8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868084; x=1794472884;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=93jv87Iwyy3JRzOhRq5Cce/h8tGYeWiXhCqgOwKlqf8=;
        b=oild+qRaqasr7g7R4yf899ka7uH9tpAEmJwbA4C/9tzzz8Sts8xvvAIHykm3KHJ2Wj
         ycs9m0iQizdSb8kzvhqmOF371PIFBn+oqZNhohDx9KH+LfD4wLOrfVFd2H4sguOnJ7mr
         1v5msBsLQ/5+6hlFf+ZiEcgSZvhCDjDEZ4fpo3Nu56AO2/J2wJB1Q985z9tQ4/uEZWnx
         Xl6Mq8YibO3jtqn8PHdtLow2xtosXtJxn87K8EGBhncMeOw+L8t266bUbmJLgC33upQj
         kJsENegIDWNqqhHy5SaoI4MAQhS1xgZ0O9EFe2Wn111G0aY8K7bIwzS7LoNR9xmLBNaz
         ITNg==
X-Gm-Message-State: APuU4Z94SfmPilKD7n/STnpgsTTmARROt2u+tesBdtHe3eZiqlaiPjrW
	oZkLiewxEG2Dx860QsUN7zKXFQGVRvpL399ERSAcc/c9iGZNr8peoEVCp+lFn2lxIUGoHQ3WDqv
	vi0TSFW16UplI3hQWvYHePvDtOG+KU81tJw==
X-Gm-Gg: AYBFou0ExRjz/Lcf/qItHm0l+BicWRTa5tXIHshS1HRzTP2K/sdQfyydN+LZMqXiixv
	DlSPzFQDLoto/4qtCHc6LaSmbbJfjiQjHVH37Ap/H69z/Mn06W2LFEKf5+1SmyBdriF1yvT76q7
	3vMviYr5pFzrrdaXugL6j2IMLvKjFvVVa1z2ImNS3Gf5U8Sj9n5i+dWEYHVAAgAxEAj6ko5qkvd
	cLEgauaNRs8sYYottbIO0uPTHa3Ex6Ml6a0JS0r4pRL7IgYkZAeQFjDRe8mB3q7Rzc0cRn6Ujds
	fKd6N0L/y87g0UnEWf5CqId5sIOVhIEFwv8N4K7leHWa64v5eAS9/D+7nE2SKKRk2JHC+v0zY/D
	BTPrM5S6e3NvsbhG8zr4Un7w9EORlNF8iPSB2Ld7LDrGy4/IdRwx5NalAyPUmYKi4/X4tz/O52V
	0bhYUpjRkYI/tUTqyLsmEQ3sNXG+80ZV2CQfdrEkwtmQo=
X-Received: by 2002:a05:6214:2f93:b0:91e:97f7:c7a2 with SMTP id
 6a1803df08f44-91e97f7cacemr17909686d6.11.1793868084037; Thu, 05 Nov 2026
 00:41:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103221529.585436-1-rosenp@gmail.com>
In-Reply-To: <20261103221529.585436-1-rosenp@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Nov 2026 18:41:11 +1000
X-Gm-Features: AclHuK_Xgyxbeq-Ri9AU0jIyOpkBmLy-X-m-DhPanCxRRFlqIAlhliusmaAXcBU
Message-ID: 
 <CAPM=9tyLS7z5BF573bjRsFPjh3+nmE+nqF_6Rwr+qCF4JZgSwg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/fifo: map Kepler video engine contexts
 non-privileged
To: Rosen Penev <rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 5JPTFMSKQH3EACY2VET7O6P5JJY5FEVM
X-Message-ID-Hash: 5JPTFMSKQH3EACY2VET7O6P5JJY5FEVM
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5JPTFMSKQH3EACY2VET7O6P5JJY5FEVM/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tyLS7z5BF573bjRsFPjh3+nmE+nqF_6Rwr+qCF4JZgSwg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026 at 08:15, Rosen Penev <rosenp@gmail.com> wrote:
>
> Since the engine context rework, gk104_ectx_ctor() maps every engine
> context into the channel's VMM as a privileged page.  The MSVLD,
> MSPDEC and MSPPP falcons on Kepler fetch their context with
> non-privileged requests, so the first method sent to any of them
> faults and the channel is killed:
>
>   fifo: fault 00 [READ] at 0000000001050000 engine 10 [MSVLD] client 0d [HUB/MSVLD] reason 05 [PRIV_VIOLATION] on channel 9
>   fifo: fault 00 [READ] at 0000000001051000 engine 14 [MSPDEC] client 0b [HUB/MSPDEC] reason 05 [PRIV_VIOLATION] on channel 10
>   fifo: fault 00 [READ] at 0000000001052000 engine 11 [MSPPP] client 0c [HUB/MSPPP] reason 05 [PRIV_VIOLATION] on channel 11
>
> Before the rework, gk104_fifo_gpfifo_engine_ctor() mapped engine
> contexts without the privileged bit.  Restore that for the three video
> engines, and keep the privileged mapping for everything else.
>
> Fixes: 8ab849d6dd4c ("drm/nouveau/fifo: add new engine context handling")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Appled to drm-misc-fixes

Thanks,
Dave.
