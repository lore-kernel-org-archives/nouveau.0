Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D0F606A31A
	for <nouveau@archiver.kernel.org>; Mon, 26 Oct 2026 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SjT+cLJ5
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 022A310ED01;
	Mon, 26 Oct 2026 08:50:01 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DA9EF48BA1;
	Mon, 26 Oct 2026 08:30:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793003458;
 b=P4n6Y38votIzLFnRiVcQJejw8BOFQRou00kRtpAEVkKWU4FZoAe0VLJ/eliZ+gry1g2So
 NNgzsDdf1T7lpU6JTAvWKZKpDizeGkMlL8tPEzx6Ggxgj9zxbXbX9Izu4TR9xGBWbc80WBV
 bzfmYUNBfG03ntISomclzSJ0Q82+e4o9vFOZv4xQp4D6xrKsTahrig5CGWg1HQcK6a8eaSB
 V5zwGpoyUCm9ZLYIgLYU5siD3B2yrlhFh40Hiq7BaWd2PzKNyyUu/XkHYu8TLPSf+MMbVZs
 L75VLqjMTU6EM+ir9IkuHD2ijvSPo1M9tVdx8hzqkavlMSQDYJkURUbwhGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793003458; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
 b=C1xcplSN403Y/UOZDhhZmbZ2V4MCAxRfHEmglkhjEzV0vpO0iLEh+9Hhqfro5dyQ4xKxT
 DJs2m/gZFXNJHsjxLw9Op+IpRXnOWJvmd/x8SPr7ain1jT09n7oJ++9earKJrIyG3w2L93O
 EKmjIsEcOwzLnKoKCDJIXFzfSOXAU14dm7Pi6T9b81dwgNqbDu8pYwyqYLUuwVGOmnKL1sz
 Fri7Lf779QbzGOFb0ByeYGA+HPm9jhiCosfVmqt+MyxZcjkyy8MvhXrcJZMVaw/5ZwIwvJd
 q2hCuykosetd65JzXX3YnbEVtS1zUxI1OhmQUGWjEr2knDXeh8zCJ7uEFrJw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1AB144713D
	for <nouveau@lists.freedesktop.org>; Mon, 26 Oct 2026 08:30:56 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBF9210E119
	for <nouveau@lists.freedesktop.org>; Mon, 26 Oct 2026 08:49:53 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so17090015e9.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 26 Oct 2026 01:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004592; x=1793609392;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
        b=SjT+cLJ5aZe49LFSRTXTViuV5dmnwjoAoGSUtWbln/UfslQ2VEY7Iaue+svGNtwyH9
         59FCTD06o1pC9r/RR1tYLjRS8HPpW2XoKB4ArI5fBVpLRbZ0Hc3I8VS5KsQbTGyLEANZ
         9X9eDK9CqG3HPp62qJ5cF5uJoua0zl0fMJxE7eSxNTkUkcqojilYM9NysxFQD5eRA2PB
         UMABUDxsfrcqB+qk/MRkPrZeAqx/vt39WpODe75atoX/xVyciAcioAPiqf0m8d2Xa3IZ
         FJbm05I/eElX+mfCrW1RKyVkdzmZD2s2Np+UOjBqo0zMYfnColmST+K5/aXtxmGQP/4o
         +3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004592; x=1793609392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
        b=G9pTztp5OklGjZ1ulS9Qzm664pAwjE0Z3/9Bf08hODuwVOTcHqp7e+6GQVkLYRPEGP
         xwbQUuzDZfhgVaFl1E4OzxWoQxJFhGWJmZm8e8ecOBoWeibuvO+IZzvV7SUS2FVUqyiZ
         Hv8lJi17pZLakGdfyuDhTbbqaMQUSjc6XY7iO1g7uHV7dg/0L+K/aHSEQrW9UThZU5Am
         cfIpjpClfYx73kTX9mRdcvMVcUr0UtqELgfwB0HnR3Jy3J8nP4ciq5LE4OiaDVWFXtfk
         dszM9FaZzDf+wdRFCql3Tg9KJSS6/TJwAlbPAW76PUBvmB5SI94RrtlzAnmqVf2sKuqq
         ghsw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6Kvku/b2oyHlD1EDhu8OHGWKW28MgK92zWoQ/B87WuPMJX1GwNKpDrb+VZJ1BLryr7q+I7kmQ@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIkes64XNfEeK6wdsqv7spo/fAQUIbXGJzhEBhVc47bMmRhPBDG
	bTUpsAr/n7lm/XVLIUZ1yH7zL1hanMQmWJtvYwxC16AxjYu1GYvabH8MUC4ATw==
X-Gm-Gg: AYBFou3NKqhqcJAQzldhVV9U17h5AkV6efAetEbVRynSzOm9etSwY4tw7vbJt+Yujmc
	KxfTXhVTHWk+k2ACOOPXm6Iko5fa9AV9FPRwJNp+Y7QEm4isAaqBx6MhqZbPDwyYT1ySF+A5yVE
	TD7U6bWg4U51hvHbw3U7YETBNBnu9jjKzmsCUnjSonEz0hoFzRE0gOdw+29Vngr/d+lJydQToo8
	PcWSzMHtp3jgQAyZxXwIjx95tfFntEfVTIFMSUivHmtjgr3WdZxTTy7zMKPKiy3hHnKlvcrLBng
	OP7djKsTjxG/wsY9HtKl2emnNi8wKspuVYW187quk0zH8wsEb6P8lMJDYgM3aNiALwCxCNzzII2
	jwA4WXGs759i68o4uuGXNYDtYqU78fTIDDXTDKHie6HIF9bcCJwhhYRjbXBz88iysnclWCmEnel
	1lqtmUd+8KE1YKCAHxrKXpzskpI5ToW7ignWt6NUXYTdocJp36LPQhMtVDZw7c06c1tM0eUU0cm
	xBRqxijFAob9E66oVU3OVju61MXBQTO6k8N+7PaN3TvYgVDXne470nXZoMSVqVowOD5
X-Received: by 2002:a05:600c:1c06:b0:4a1:e7ce:107b with SMTP id
 5b1f17b1804b1-4a35ac407fdmr149623005e9.2.1793004592159;
        Mon, 26 Oct 2026 01:49:52 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.244.30])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a30e22csm179923445e9.2.2026.10.26.01.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:49:51 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/clk: don't ignore RAM clock programming
 errors in nvkm_pstate_prog
Date: Mon, 26 Oct 2026 09:49:49 +0100
Message-ID: <20261026084949.256678-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260727152821.128432-1-postadelmaga@gmail.com>
References: <20260727152821.128432-1-postadelmaga@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5BYCES7PFWXS5INCIL7JEW7VR2XSNDBK
X-Message-ID-Hash: 5BYCES7PFWXS5INCIL7JEW7VR2XSNDBK
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5BYCES7PFWXS5INCIL7JEW7VR2XSNDBK/>
Archived-At: 
 <https://lore.freedesktop.org/20261026084949.256678-1-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lyude,

Gentle ping on these two.  The v3 of the cursor series is in v7.3 now,
thanks for picking it up - but these two don't show up in mainline or in
drm-misc-next, so I suspect they got lost after your review.

Both still apply on current mainline (one line of offset).  On
drm-misc-next 2/2 needs the v3 series to be there first, since its
context comes from "drm/nouveau/clk: don't use the pstate cursor after
the loop" - so either after the next backmerge, or I can rebase and
resend, whichever is less work for you.

Thanks,
Francesco
