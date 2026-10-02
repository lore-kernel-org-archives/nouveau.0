Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F476CA5FE3
	for <nouveau@archiver.kernel.org>; Fri,  2 Oct 2026 23:30:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B166510E6E9;
	Fri,  2 Oct 2026 23:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cd4svtH8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 32D154890E;
	Fri,  2 Oct 2026 23:12:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790982722;
 b=0MSu4H8b9u8nqNoXtPT/4oOlJYzEK9425TajNJTa6lYf8f20vLouo+uCMMX1NfXThAT8p
 HrdiXXfX7U6PyzjtRhcRY85ZvogrfjedUZylMurejezH1Hj3tklIzoJq8R/+bU6GqJonGds
 glJPfzYFHD0OKDjcdJ9SLQnWAhYmE3BQOxp8r3yIb+SUby1id/VOPtB5fm+8V2tpJ+Hb7js
 2bUP/k3UQBSHX6W7elbRP9VqWVOXs89SMlS0m2OHzy1qgxS+xaZdw6VLBu/XBYMz6jHQA+7
 8QuRyceyREHWfwiFPRk+YbhpHEkfwQfIutT5v+NxDJMbgSFANeSHk8ox3RpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790982722; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Bovas2WAEGD9Xsa1cngl8uKLJL1gfGRL2y54+LLnPkg=;
 b=d+b8ANyX+uXNOSGsx850yjDjiSDyjN41n+hWB1f3jCa2ZPrBmH+mQN0ps6rL+jQAwcD/q
 p3NNWfjveChhN1bQRQffMvsT29X22fEQQGPt0/U4p/4RE3McNvayL23mqBfOeRGNoVtvPn1
 TrnUxDYfkvDyoHBueD3y0IBbhowkiUs98v5HelVHKMa1Lhik1WQBuOkWhTAQky73cwsXgBw
 CmrGOx9gxi7K2aBbt+XDMiFF0iJ+a8ZAHcgNoWqSY6yOX6HaMBaqywht73pPdMD7VABrlw0
 mNUwOOu/BgcWwD49/+GV2rdqup+QkmBUZPG1coNnI8Pj2fmWvfpMsQATKgrw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3237C488E5
	for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2026 23:11:59 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7569B10E501
	for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2026 23:30:10 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-93cb71532bcso6579385a.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 02 Oct 2026 16:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790983809; cv=none;
        d=google.com; s=arc-20260327;
        b=Sxe56WcfkwPTXyc+MHoPQU/XlMJvlydv8sxcRrsXzhqKDjYOqiPisqLVPTrabToGey
         ZRwvKi4ukWqHsw46dUmzUBmKQ8wJgbLyj2Tz3A0aBSrW43wUtxCJr7R1+IS4QfqD+VhQ
         3CVts06yw6OUFFV9bJNz4Jhy7RNbAb7nF726xiXxLHAprtVttuRadXYo8T5EtdQWdvYy
         YI5MVmUPDRlFZ3V++7HKudi3XYVfHmyvfS1W9dW2gSGfBv+a5W8zgWreT+on7fKoV4vL
         Bvj6uTir3YvQH4D7XnQg69NModh4wC35TLTZvAAFBmL5e4UIkTwJUauzzlbd1BuqIZ3D
         P7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Bovas2WAEGD9Xsa1cngl8uKLJL1gfGRL2y54+LLnPkg=;
        fh=RzJ+8fvI8/UKr5nagFQEOzj9/0sWjpTIKZTvYc3kR2s=;
        b=hXlnk7o1BxT/49+aJeskI0ykIGzTTk0q/44TDZaFxxXhgzORjl3G67vpkITpohlL4L
         7097giMDhbq7kwnFDP2WyCiV1uz6TroEW0IgF2IMjWe1tsIyfUhwsUo9ie8DkWQhoOpt
         Za35bAEo63vaCwoDjogtsp8xHxJNfen+UJ8bDZr2IGaoUHLMyZvd5cUkR0YOBk70nEYv
         DVb0PC6NRKPxYXma0RLynl38aTNu6EPTDLL6VD/BO1vUO9SE1LymQfCkLohJSzCgd9/s
         PyrNPXjtMHDzbmxxU+RyNrwVCr3OXGQYV7n1o7ujaawySNhlsP2DFiVOxrdk4wYFXtjD
         T/MQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790983809; x=1791588609;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bovas2WAEGD9Xsa1cngl8uKLJL1gfGRL2y54+LLnPkg=;
        b=cd4svtH8jdnn1x9zacpLRg2ful/24zl+TxzYRkOQg3zndUopbiN0p8gZgNqudwMXaF
         bcn3MWiWbySSrZhcJDfPRlQPK5L5XyvRldlgUp6AwfEZxZYGemCzYAjMEzZJ+Agdkf6k
         cksy5HGeSUmkW7BhO1Cbgn+dfZecFP/DmLStET65wHy8J/x4HvSpHrdTrNdyH9Jh2Xx0
         3eOEjHpHhy8u8hspxM4NfU+hYpyiU651ZGx1Xbr0y5xyOkDCUUE5A33/ZEKXQS/a5QQp
         qB6DSrX2vFu64s85fdGr45ij1P+HsCOWuCi1nt3v53vjeB03vYx9FZiZQz1ETHwmo7jA
         GPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790983809; x=1791588609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bovas2WAEGD9Xsa1cngl8uKLJL1gfGRL2y54+LLnPkg=;
        b=DYc6vWeWKMAcu1UaXsaBRD89OuFcTKB1U3Dns2YhQCgj2FrZxQJSOteFHtumwIAMZg
         10MQ4q9vabRbegj5i6PaWVT1eJOBSAVu0PNCHqtqN/PGxogEFLA+EB0flLP7OVfvCO5X
         qZq7tKxKloPhy8XTrCoVYbGK++mHIx4FDFUjl+xz7+B/tP4cyRVKftke+7/4yxZs7XdZ
         8UVNoOqFGkaDTNtYN1a2ZFCHCGklgm/MZaj6p/u3yji46NO6P1scjOIhyoa+Mn519bsS
         +nDmQ1z8PbVj6aHLO0Y0IsjZMJwg0hbzTIiRr5Ji6A/o58lI9bW3eACNVAq+Uhd9TCZQ
         qx2Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByGxw3Jzi4bbJMERM+xdHS5idwP/HtA+bJktIXRsZCcBfuKohTYuPZ7cFRQ331tUQWMvkq6solo@lists.freedesktop.org
X-Gm-Message-State: AFuF++nmilGMCeFKqUg1+UNvX55D7u8n1S8ntQt/nVojrAyNrplctDhD
	vfUjrBWJUnYjijVtbrmK4NP/qR6YGhbxDim1R3Nux0RaZXPDAIyGZx5Z8PpQO7fIT5ouhVzoNdk
	+3F4FBohdZ41S5m0Dl8wHaXwNnm4WqTI=
X-Gm-Gg: AYBFou2gL41/FTyZUBkLmnwU6tbyLkvgKx1d6lOWarSHZz02yFK8iGHtnNScYWQ4t1a
	st8iefTNaCoQlcRzrSBKhtTdJwUf1UCHdAy0lKbAq+IBp3X7VG0tVMYRgeS/wiTKlprS19e8Y6o
	8zwDtVgOeK3SmAU9OWptxYXTDSYmfg8ij5xyR15ctLPCFtTmQ7oLbmpSolvGinmIgGxe8IiAwYF
	lAgKrEezRhr8waMyAnioCVu2vluNHXUa+SRDrGjCf3O7Pnzt/YpExsaRFPRHH9fVxD5oipEBOSN
	tqRqFx2xbIvBSJn9BpxDI5mVSocYmfpBCR19NkcM5EJEmHWxFzA5VPSdt7JXQWZnSRu/cpph/G0
	ZE4Fx5rShfjc5w772h8V/k0MJTGVt7szV5/RSyQUHGA==
X-Received: by 2002:a05:620a:172b:b0:93a:2e8:5afa with SMTP id
 af79cd13be357-93e50feb9ccmr188518785a.30.1790983808980; Fri, 02 Oct 2026
 16:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20261002212833.9674-1-fzeruhn@icloud.com>
In-Reply-To: <20261002212833.9674-1-fzeruhn@icloud.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 3 Oct 2026 09:29:56 +1000
X-Gm-Features: AclHuK9rjOUUMpjG387IHnEilLqBy4AfDp78Y1XLf07vnG-EkqsHFL56vRwAE6c
Message-ID: 
 <CAPM=9tw91hPiAfwRP=y6Dr=CFgYboO+Z94_1dVwt41exGokj5w@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: keep MOT set between messages when no_zero_sized
 is set
To: Finn Zeruhn <fzeruhn@icloud.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: VFL6O2VJDBMH7ZOA3W3IDOYSSN4VJH7K
X-Message-ID-Hash: VFL6O2VJDBMH7ZOA3W3IDOYSSN4VJH7K
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VFL6O2VJDBMH7ZOA3W3IDOYSSN4VJH7K/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tw91hPiAfwRP=y6Dr=CFgYboO+Z94_1dVwt41exGokj5w@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 3 Oct 2026 at 07:28, Finn Zeruhn <fzeruhn@icloud.com> wrote:
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
> that added the option describes. With this, block 2 reads correctly and
> the native 7104x3840 modes are listed for the Dream Air.
>
> The same problem was pointed out by the Sashiko review of the patch that
> sets no_zero_sized for all DisplayPort connectors in nouveau.

nice catch,

Reviwed-by Dave Airlie <airlied@redhat.com>
>
> Fixes: f0ddbb1eed18 ("drm/dp: add option to disable zero sized address only transactions.")
> Link: https://lore.kernel.org/all/20260827015758.0B4FB1F000E9@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Finn Zeruhn <fzeruhn@icloud.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 488fd123a01a..7676285c19f8 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2192,7 +2192,8 @@ static int drm_dp_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
>                         msg.buffer = msgs[i].buf + j;
>                         msg.size = min(transfer_size, msgs[i].len - j);
>
> -                       if (j + msg.size == msgs[i].len && aux->no_zero_sized)
> +                       if (aux->no_zero_sized && i == num - 1 &&
> +                           j + msg.size == msgs[i].len)
>                                 msg.request &= ~DP_AUX_I2C_MOT;
>                         err = drm_dp_i2c_drain_msg(aux, &msg);
>
>
> base-commit: bca45af5998a05f34b13a2ef11e639bac9c62643
> --
> 2.56.0
>
