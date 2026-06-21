Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D05CCD98F0
	for <nouveau@archiver.kernel.org>; Sun, 21 Jun 2026 14:07:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B904410E3C0;
	Sun, 21 Jun 2026 14:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FXEsbNYs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 92AD646BE6;
	Sun, 21 Jun 2026 13:52:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782049972;
 b=f1iUZLe94GwF6TamX/8qBRaJOLjhmhVFi4F4fSCleb42WRHsP0HaqdmSXCiQ4nQJkJAhX
 suODxMGg4ZhSIDPrDqeVaucpASQ0RuHJyq9TwtKZdVRrDNJWBgzekaPXj6SAl81H77ObrRu
 1x+Bi9EfBCSZFrf/rQS5emPlqGzwJSWs6hZ09qZlRe5aAgcSCk56dnV7wnbOBd5O3CjNKdJ
 4WYSfyQFpM04XhwTLDIwBW8i7gbgNh8SjIAPQztDutPqgBZmi/TwUCV6tnMlD9r6GoIE1Mr
 zX7nZlsbYGzCXEFN0jiwCuxVyMtl1zrtoOtvMuSeRGP2SJGeCfe6eH1Rg8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782049972; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Y2cgyHfbek07AZHYJxVDvRYBpvV/pT8ewpQ26OswMew=;
 b=IpNzp+2L8bxkEIQS81/iw/Tp2j5QuQNsHHXGDdlr1f9fVXClT6itcxKOI85qobIMJOcgD
 357DIg0OnGgt63C56xKI9Lb+jD0FD81trao5mvz4Vtevr38KE9yeg5ZxfWa/+fzTEXuU/Tt
 //fJv0JdaZPiLokmUv77zxs5h6H27DtWhH7yCv/LuPPSrvu3GfAbspH2IIg9OlAqjmMnjFk
 M1Quja8q9UakasX2YZgyD58yfjFb8OgSFldUlH2bwXjN1f6lTIkI1NTfZKaxTeZJJ/KSt8L
 Q9y5gGKmtgQOPaJPgVcmrZsglf2PdEZ+D/plbWn1Oh+OsRlR1NO9sJj0qlDg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F7ED46BD1
	for <nouveau@lists.freedesktop.org>; Sun, 21 Jun 2026 13:52:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 386B310E3B5;
	Sun, 21 Jun 2026 14:07:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 831F044412;
	Sun, 21 Jun 2026 14:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA001F000E9;
	Sun, 21 Jun 2026 14:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782050830;
	bh=Y2cgyHfbek07AZHYJxVDvRYBpvV/pT8ewpQ26OswMew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FXEsbNYs9Os1uNb4cUJCsnW4UlhUPtPc/MtpUUV/w8nspm1kjXw/1/usx7poYizDT
	 Ztp7TYOzsKiVWk2D2WWgeL8naVd2S0gCX+4usCDGqelvlVdbZU61HPuDMrBIRN6fPX
	 lGsmOgaxWM2E5vJp8LOs2v3UKwLwuIogaWdsnv1arXQImZqLaKqDp3ZcJp0HfYuN7r
	 LkxtFnuw/PrtTZQEEEQUzMA58SD9wIekaxGSwkliVozEdLfe0cbq6z92HwOxXD+dmz
	 m/xJgQsyMQ1yykcGF2uBoKMUloJ1bk0qWHYH9FQFya1dWD+G1eAoytOtqgprvdFU59
	 QL8joYg4n1Xog==
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] nouveau/vmm: fix another SPT/LPT race
Date: Sun, 21 Jun 2026 16:07:02 +0200
Message-ID: <20260621140702.9656-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615044737.3419585-1-airlied@gmail.com>
References: <20260615044737.3419585-1-airlied@gmail.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HBLCVEBCZPMUQ7V5NVA6FYYMROOO4BC5
X-Message-ID-Hash: HBLCVEBCZPMUQ7V5NVA6FYYMROOO4BC5
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HBLCVEBCZPMUQ7V5NVA6FYYMROOO4BC5/>
Archived-At: 
 <https://lore.freedesktop.org/20260621140702.9656-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 15 Jun 2026 14:47:37 +1000, Dave Airlie wrote:
> [PATCH] nouveau/vmm: fix another SPT/LPT race

Applied, thanks!

  Branch: drm-misc-next
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/1] nouveau/vmm: fix another SPT/LPT race
      commit: d008141ed4ce

      [ Properly format commit message. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
