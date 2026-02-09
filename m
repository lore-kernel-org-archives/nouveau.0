Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F95E7E0D9
	for <nouveau@archiver.kernel.org>; Mon,  9 Feb 2026 20:17:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 799A910E47D;
	Mon,  9 Feb 2026 20:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fnj5TRgK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E012741CAA;
	Mon,  9 Feb 2026 20:08:10 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770667690;
 b=jHCRQQZ/soKuQG2Bh57J3e8gH8rDiJZrHOY1edugY+6QvECdrm/ib5sezTJZbXXqy9yVW
 HP7N6sJ8AGvpeDQqwlDpwsF2wNBR5XFtz6o1EanWO241jNDY3Umfgey88TiJ0x+N+EGzmNC
 wJerFicyOTKCHsR+km3BrVrWWcBYeTxQGuHA3S0LGimCAKsVO8Iaf5vOVAcj3IlTLpTmgpK
 wiweG/WAjDEtijsfN0CHoIrKbv59Ok6GJ0upgmNJ/tNe3jUgt1RdYC1NOJTuaM0O++Sn1be
 AJPqWnR2Rmm1KpxQw9M97V19c+ExCSagD+J1uP32AuAdftOCXN5Xa+TVrNMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770667690; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JYWZ+GCkY2AkGjh7uhkMr4psIVWpC2lTVDCLIlZ9QsA=;
 b=q6TGamoCLpuaaAqutgP99PwjSa6hLIbimW52mxBc/6QDWcfeiZgay2cMAYWYkCDbprYV9
 rbPeBl6K7gy2Js5RLTBP27DihwgKs1te3/zD7LLv/0gezHBP3TTfsUeAdmR92XHXP7xvkzy
 AqlzpFWjUU2Z2KtSQBWf9L0NYLtIShlxwgJnfXP7uCOcAZlGqFE3xgMYFr0GloJ2+bX8xt5
 kRTez5CeTULPIzqWRMLU4yVxhf3+LrDMBSv4KQipKpxl4UJDc9RAt/9EXFmCm3FezM0j4Ye
 KqD3hovLfmC2dfjajV5EVkWhoWgfjbv+DfPQL6/YnCfQagIoItgwjT/R5B0A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A2042402B7
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 20:08:07 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 095D410E46C
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 20:17:37 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-8947e6ffd20so69637316d6.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 09 Feb 2026 12:17:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770668256; cv=none;
        d=google.com; s=arc-20240605;
        b=PUH1o2zaJjs2X83auhCnIcvdzjSH6Zx4Ne8c/zIiB9+YjtW+sZ56/mfszdGfxQNp/8
         hOTgUg6E3DL72Tem8m77esMBTQluVCwp5Oe1Hiwlz6uk1DNuT5lZiQx7Qd/xGiqUjmH9
         zGhjQVSQhr+BDrntzzbo8+BBMrtj+dH5AHHDwFEgcnuQBzt1jVclEBf8Y4GRx2h/M/0K
         efE5fUxGPiolgf7KHxqhyWtxiRf7JCXyWEv2NtITXeYEhI2bDrXFDSTFbtDqTISRI5Ws
         VfaLfIDM4BBntl0VB9JryDW3XCYGusLKo98l/o4+qGvD05IuyjMsqq3ykvReIRzSHV/L
         jipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JYWZ+GCkY2AkGjh7uhkMr4psIVWpC2lTVDCLIlZ9QsA=;
        fh=RHrVNZ+tAEGBujgfM4Wl13uzfq+xEmMcbxCagPr8V7I=;
        b=CRA9Dlv7enqrxAqSrniRdt7oA8oF5DHENQApY+DyZtCDzSM9kmPKnrZKcgw82/8LHD
         GwQ9H9+fV4cfzWMw5atZuQjXavy70T4RsPp8wZOomTe4TdLFQRsP2XQ26XeS2D9EmOxy
         vRlcdVKDCb8em14GFRP0pZI84uxSfX+aVP5Qc2IWQMtrtgcQGPLLi5PyqBWNw/dpnaZP
         yCsQ8Wrr4YqpKD040RXYgNKXSON0ceRItfI+z3QRmBRHchpITilsKJTlaaTyEIUjkgy1
         9ml0X80mo/Q/DCmH3tUouEXaGYCcNSVD/vzQybviqnwN3BX58bthKtZdsuBaDKHURagv
         x6YA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770668256; x=1771273056;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JYWZ+GCkY2AkGjh7uhkMr4psIVWpC2lTVDCLIlZ9QsA=;
        b=Fnj5TRgKtr5JQ4GqduEJ8Z2Pui6aw+FGvIANaZ883v13FtyzL5xMjd0Y2mGWbydiY6
         GqS09liagHELO+rBedbS8Uf27cjkjznKmJ3+Y8Ap41w84Yd9nyZynVaWEyVsCsleLDHU
         y9tcl/Wv7XtDNL3SQbzm3qIRX1yp3jwuHlV4xuTZJ/SBBB1HRdWpuLVIgHJ1IhrGdVcD
         iwqeUJr69P5ftT8GHmLVPlpOGphHL5WOfASdXkzukOLFppqPI3SlUqK7uzvf9igC8/uC
         jEdOJC8JuW/Jx2yiJ/xWXIQsOC2KXCNPJFQ5lU6JVwSRGyvYzIidHpwgcyAtlsY8l0+/
         CfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770668256; x=1771273056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYWZ+GCkY2AkGjh7uhkMr4psIVWpC2lTVDCLIlZ9QsA=;
        b=HYEVniyRCNkVfzMvZyZZ+X/Xu64V1A784f2+uW7NYjwSQI4wr15ucdmyNif/4GIVOo
         BGMEhrsxTps0UkvEJVdMFo/nN9RcQC+Dt3ShCYGU4J/sOIVGl2qGuv5H7tLb1CH2PRK3
         MDMLeG97Nfm6fyFiHmt5zx81E5GTjmDaEYg/DmaOdfrVWppgQY+eF80lQ/iihYMV9pid
         yZDoBkn3U8NiTKx9pS9a740dtEIIBmkuTQLkSy/UTbLOnXs0To9UMSpzKgQuAIO9mT3V
         rpuVmIIDyNLZsqHiw86bUf3fQ49Cjp92QILVGOz2ZM28P+odrDoUgPIWLIs0FfsgoZ8i
         Oa1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe/+jICj1DBPMPoQaFwD82DXr121VpEWhwnK8tHpGfEoXostGRQSLJmpzK+HOkLMU1b2nMqM9+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGy+2NH6cKrENJw1TSI312Gmhz3JtoJY2UUkYk1j0D+dHOfx33
	WbD4E4dGZWfc2bYaBhJLiwAUV7iBpGwRzjg0OOOugeO9AEweMzX7YJgi7SHx/0Ko23uNtek+7w4
	GvM82PeSBCq1nrfuHh+fZAVOz+VgUadg=
X-Gm-Gg: AZuq6aLyys6XVsjxB5FLJ6Bk5thUL9O1k4oexPAU0uEPD0hkznPf6JG3qwawTr/Vcma
	20RAzEohRXCnBPNAFaN0YZFx8rcARiwWcFtpsKiX26EYhWnsGgav6I+422uft9p7o3RX3WmkyFK
	Rzt9FQT6Ral+CnC75D1VISEnd//YhPWGVOZQDZzpF+d3S00G+L4mor+BV15spnJMng/40Bdpu4a
	dOTxdQD+qW9w6EtbRk8w8YtX6Xx7UM0WN3oHMFhdo7JHo1yFZ2wpno/lUoCu+wyV28dlC632Qez
	RSMgKrizU9P1GJUJ6RyZvQw7+zunnMNDuL/hXtrEFSidT/uXZcDHqHd4JTqgcP1HfQ==
X-Received: by 2002:a05:6214:405:b0:895:369c:e3e5 with SMTP id
 6a1803df08f44-8953cd956famr185712496d6.64.1770668255902; Mon, 09 Feb 2026
 12:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20260121113646.111561-1-me@linux.beauty>
In-Reply-To: <20260121113646.111561-1-me@linux.beauty>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 10 Feb 2026 06:17:23 +1000
X-Gm-Features: AZwV_Qj7lNdQXzRVBlBw-alzy0MCsWn6R3b3x1wducs68xJdjz6KdM2YooUTLw0
Message-ID: 
 <CAPM=9tz8A7KXdAbXccn_9Qfich3YOXkZJifgUEfa8kMpqq_huQ@mail.gmail.com>
Subject: Re: [PATCH v2] nouveau: pci: quiesce GPU on shutdown
To: Li Chen <me@linux.beauty>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: ZXBEOOWZKGMS4R5CAYVZKE6E5IZLRBZA
X-Message-ID-Hash: ZXBEOOWZKGMS4R5CAYVZKE6E5IZLRBZA
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Dave Airlie <airlied@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZXBEOOWZKGMS4R5CAYVZKE6E5IZLRBZA/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tz8A7KXdAbXccn_9Qfich3YOXkZJifgUEfa8kMpqq_huQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 21 Jan 2026 at 21:37, Li Chen <me@linux.beauty> wrote:
>
> Kexec reboot does not reset PCI devices.
> Invoking the full DRM/TTM teardown from ->shutdown can trigger WARNs when
> userspace still holds DRM file descriptors.
>
> Quiesce the GPU through the suspend path and then power down the PCI
> function so the next kernel can re-initialize the device from a consistent
> state.
>
I've applied this to drm-misc-next, which means it's targeting 7.1

Dave.
