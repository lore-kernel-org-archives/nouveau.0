Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C94D606A31B
	for <nouveau@archiver.kernel.org>; Thu,  5 Nov 2026 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CIT2t2t7
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0E82511225E;
	Thu,  5 Nov 2026 08:40:57 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D382D40261;
	Thu,  5 Nov 2026 08:21:31 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793866891;
 b=cZ/NhcAztSXDxxrTQxb8GFtH+gPLxIaT2aVu+k7Y6jgcTBXoHcr2/CdYbhTRjQ0Rb4jXv
 1s7Dpwhc8dnw+fngfvlh9bHdg3/WVlB2NAQg8J81jsGeGGs/TSOWa4LEfqV7VxUpoibprBn
 oh/vYXzoMDAH4ZMOuhuVDv94Ul6wZh33BvEdt3MuqE/GpLjCCiepnaGokgmIcnCfqdFHEH+
 zPrLafKpvpOMpe2ZqLUSbdFIsXrOvcEaLqs9qU8+MUBnssfI00+FFmlvPAYbYjMcy5F634j
 vtFjibMXJLU0h4S0+Tb3mhVdr+KPeiSAnfk2LU1ywtG3ZeBdkZUG0ptkMMBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793866891; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DDWemAYLpFySPEhpz6MZnQPpQ/I0i4/WwxV7qkmL+Ig=;
 b=vHxDRKDw2xoK1nW6QxDvkgZVoGDoYJ0KhbxAFjsE0oD9sxmUcH3nIED4OdwXgROqkJxJ+
 O5HC6KmW/XwdYwakYE7B6A0FABlMw9c6Y7SSe2S7nq9yMHTGC9tQSlTvN0KXgLRN+3GqY8w
 Z44J/bJyJ7qsiAajVthHhMnyXHPuXZAUx19VASLMEfS3IccOexUQHU+77r8sYDeMqs+YAji
 6jGBX4S7TBGdfXSOpnci/kC+i6rawG3VmFx0eya032hQN4Utjsm6zeffwKQvOfShBUWxmce
 J10kwchXwikgeuBH36RjZb5ur3ViJbZgXUsYsjmBVvSPX/xCysUqhYI8xwRQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 69DCE40041
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 08:21:28 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 524261121E6
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 08:40:48 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-930c0f9c1b1so171136485a.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Nov 2026 00:40:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793868047; cv=none;
        d=google.com; s=arc-20260327;
        b=VXPi/fcxrCL8Lnrgur3TZhJzxvdznnbqkerz9iTMgCApQV+mscm7nY5vF/yjPjY1HS
         DdV7ssM84TGdYk0ZcPykOv3+zKOxtYLtuy38UuzYbAMwcHKMuy7uSZOtW2CPtkO28Sss
         +2+O4eUuMXOyNfGXtf1tsXGPQ6WDu9E44FCSzPU9WTn7HaHcb6DeqFcLrj1gmgtO68DX
         wQludR+9SWcmGwn4NFe1eMvJX9DMXMw5RZa1eF7MkJH3mjXrwnT3RKOU/kqd+/K/hEsu
         vMkp3g1Zw5OiLPsyfV1GokJdJ+ORYp285rGyhj+RuGIFFzFLGXcOjlBdRC9AooiY5JrY
         Sovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DDWemAYLpFySPEhpz6MZnQPpQ/I0i4/WwxV7qkmL+Ig=;
        fh=udFLRhBQanaJfCAQDlrhUjGy7CnmAnFC2+PdHmYF+z8=;
        b=AOq0uN2m7UrTJ8hNQwPv0OpH86Qp0SfaCETi5saWhnQlGd0OYqmLvtW1AB/8ck+bkd
         vbvJipQlo7s5ifbh+Qhpd6oPoS5klv7KOoipeIlrGEVgx7M3hQCZzjh/wlY+PZO8Q9uK
         PdKX/k9y6XL/KlFoTcipK6XmcnE85+BmDm5EXp2B+BEM1uClZJG3k/nMyL9nsVDIu+Oa
         rEo5auHzTlondkGzrHusSY22VH9GHvUVpGwrCYgDxpK3cV8TGz7tPXxLrEU0XSo7yotr
         SO3Il7w0bE9tgONEjezmn+7wEZ3oH/JjPtLQb9+GoGUd6PzcbPboLRL6iVdQjBsPZkRS
         n+bw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793868047; x=1794472847;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDWemAYLpFySPEhpz6MZnQPpQ/I0i4/WwxV7qkmL+Ig=;
        b=CIT2t2t7PvEMgSUDNczWOo2CZWEU5h9hmwQ0PDngInupApOz+i6izWELwXNb5BrARY
         mbT61xRs1tS1kUX6tnHdwsh3QbO0Ak97b00ZuX1Zx7QJfXri0OYMV6gaBpJgLnTn0Kaj
         IVYRzZBySLDIYLGOoMUgMHljOJRHULC9YITTEBntPVue7Y/YqOwyN+iJrdG3BqrV2Piv
         I6P/mnQJmykJZ14iaEGi4jsdfQ6i61hYcnWWJ0hrKP8eU5PXCsuSSZgbictGbSfw6bWY
         1uvM9YE6TCTwLaLjMDV+M+lQWlzkgpyegaWm5Dff4ObpJKgWcu+iL4XgrfEGQajgmFEk
         Vnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868047; x=1794472847;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DDWemAYLpFySPEhpz6MZnQPpQ/I0i4/WwxV7qkmL+Ig=;
        b=R9TfZR2jTao+7fxSNVD740kKNiUoUkIoqAqFU0BoCIplt5Z9tJl7N+WIKsMqsRheIR
         8hTKUe5r014YOc4UsZ9yTD27H9X2iS5ltVQMPa1D+2SLP3cnXZ13j9DloB/mTi+Kt/GD
         VTYFj6/7ximHOhCBEve6pC6lJDI2BBOSV51/sDP7dH5gOs0u3SAR4SXHvJ99kVsrs/od
         PKtNZJ30hNHsGSAVSdb7q+hU0CisHzPp+yHuY2seOO5xHutzyrx/c1iI1B0F6qch7vx2
         N44Agflcqf1e/97efUouJU5D6pKNAXXeEYmyGTMtc9NQ5mvrQLXOWAEX1NzOvv4mJMHt
         Qy3Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBz59aOjdq0EKkerW1gLdJxJAxKcroo0WTboEz8Ng4DrG4WI9RFW9Ehh07P3aIi6Mwcikik1VFM7@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/9qflPkP+an2Hf7kn/cMCVKiHacHePOOmXb+UOPiOUpfOUZQCc
	3X1cdfCVUzLWM0+GmhbFUvQk1ly4F8ADuUoL1AmjUtVbu4iAIE0IBowNYzJQ8nEPAmCFcis7HHC
	4ntV0XHaPsuoHU9xhZY478RJ4Zg3v4M8=
X-Gm-Gg: AYBFou2Wh3MtafIAIpET5Xgp48Ktf5nDezCze1fWvWLPvW81Lk2qe/reuTQB1eLJ9nP
	LKRUlDcPmnzBgGbqK7xTi4IauvLK24W2nReHKboE0V4IapEqS7CyzRUDIUmWikTliljbJnjy46x
	Dxr3t3esaCTLNsmXosgkNCUFfDS351Tei3d1cpAqt/nQEUkubZGwSIIxPabMbH/72v2SbfNla43
	G9AT70IdBFmGAkDctDFZedsGgAAUSQKUyZ4XVgvf3vj/hUi16szcNPYq5XeLXFw4FtovFckr72X
	7M2iAJ5+bnfcd7179RcZO2JyNsts3OnvuK64crbed43zg55K033IdsSHTD1rlurDCmO14zVR0gB
	lnsOQO5p/EYNlYEIacDBsj68oJco1yTqJP+HJsWRwO9yhzeB8f4PW9Y/+fSM6W4VDdjcbL32fcC
	2LSYX5C24MmqIXq6DQL6AuBQ==
X-Received: by 2002:a05:620a:461e:b0:93e:f930:5ed1 with SMTP id
 af79cd13be357-9442174519amr2850724985a.82.1793868047051; Thu, 05 Nov 2026
 00:40:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261012220728.14861-1-fzeruhn@icloud.com>
In-Reply-To: <20261012220728.14861-1-fzeruhn@icloud.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Nov 2026 18:40:35 +1000
X-Gm-Features: AclHuK9rSpudI5xPUp8K5FrKXjgGz5azoUEdbeTlyuitC4ycwsyAChqMlEoBybI
Message-ID: 
 <CAPM=9twX71mND8dKKjO8=ZOKAkcVD-zcpvcMEL9hv5z5b_-k-w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: keep MOT set between messages when
 no_zero_sized is set
To: Finn Zeruhn <fzeruhn@icloud.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: TZOMT5BH36UJRMBOWG7UUJHMS3BGAQ4B
X-Message-ID-Hash: TZOMT5BH36UJRMBOWG7UUJHMS3BGAQ4B
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TZOMT5BH36UJRMBOWG7UUJHMS3BGAQ4B/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9twX71mND8dKKjO8=ZOKAkcVD-zcpvcMEL9hv5z5b_-k-w@mail.gmail.com/>
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

On Tue, 13 Oct 2026 at 08:07, Finn Zeruhn <fzeruhn@icloud.com> wrote:
>
> When aux->no_zero_sized is set, drm_dp_i2c_xfer() cannot use a bare
> address packet to close the transaction, so it clears MOT on the last
> data packet instead. The check only looks at the position within the
> current i2c_msg, so MOT is cleared at the end of every message and each
> one is terminated by an I2C stop.
>
> This breaks E-DDC reads of EDID blocks 2 and up. Those are read as three
> messages: a write of the segment pointer to 0x30, a write of the offset
> to 0x50, and the read. The stop after the first message resets the
> segment pointer, so the read returns segment 0 again.
>
> On a Pimax Dream Air (three EDID blocks, native timings in a DisplayID
> extension in block 2) connected to an RTX 5070 Ti with nouveau, block 2
> reads back as a copy of block 0. The checksum is valid, so nothing is
> reported, and the connector only offers fallback modes.
>
> Clear MOT only on the last packet of the last message, as the commit
> that added the option describes. Trailing messages without data are
> skipped when looking for that packet, since nothing is sent for them
> and the stop would otherwise be lost. With this, block 2 reads
> correctly and the native 7104x3840 modes are listed for the Dream Air.
>
> The same problem was pointed out by the Sashiko review of the patch that
> sets no_zero_sized for all DisplayPort connectors in nouveau.
>
> Fixes: f0ddbb1eed18 ("drm/dp: add option to disable zero sized address only transactions.")
> Link: https://lore.kernel.org/all/20260827015758.0B4FB1F000E9@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Finn Zeruhn <fzeruhn@icloud.com>


I've applied this to drm-misc-fixes.

Dave.
