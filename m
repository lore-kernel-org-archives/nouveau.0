Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9338AC4452B
	for <nouveau@archiver.kernel.org>; Tue, 21 Jul 2026 20:36:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 221BF10EB3B;
	Tue, 21 Jul 2026 20:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RRHBCP9T";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CA262472AA;
	Tue, 21 Jul 2026 20:21:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784665275;
 b=L+DjY2TrFBGrDdK6dBFGFja30j4B3ZXsIqwxVcx4tE+hLhiVUCMKEP6iINasxCad+IZey
 ktgFzgDE1Mg/LVtvZnYsa0kQ/bGNlnkS1Qm7KpdWqQiSIpiCrVbPTWUd3A26YYdk1E8YX1E
 q9P8ntrY9IFivi8juFARv3DsjKzJyzGG8fJ7S/ow2OWOSEzW9OYlMA5dppf8ebSdCRaY+1P
 +3r7vo0S6YdW0MmshCj/o0H+fPqT49I26ceUsCLuuiHZBLAEXVXzXvdUUQbs5i26lBuGSIt
 0V5uy8OHB3oUx3I6jlvffSbjerPUOwr9YEHCrwQ+jxNoIhvk9lXb0FItD7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784665275; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Zux0FQwqS5dqbu+u3nZlsMBVqV5QPwfWD3UCTLe1nKU=;
 b=c+PM0AwFfqkSE4H6JUS1GGSq/4Zfue74gTTCzOEe50rQpe6dSGu961WSiyIewA1D3QrPX
 ckCmfFk+klcUSYhyId+8WSl5ONqvv/nASwmOdIHmHMJ7ZjV6Bc2TAfT1LHJapqsSzVOxZyY
 eQwzHBj5cGPCl4sQMXYFXYHUiWLblGovvWbwVQvr8DRyRoFurUZeufNt9aweliWI6zrdns6
 YuhNGdzHbGA5T7gJjcudiAmyN/Zqk8MmZDpq4NC9h/AomeI9kjbazF8Zs+mFaOG1Va1P1Z1
 /B1TNA6jtCI3ueCUF8/7KDyBSPr9WUPb88ACsJ2UhWPBnlroFod3kLp2J2vg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5166F47287
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 20:21:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 33C0F10E3C3
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 20:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784666200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zux0FQwqS5dqbu+u3nZlsMBVqV5QPwfWD3UCTLe1nKU=;
	b=RRHBCP9TWuvIBlmuT0Fw3LT8qMEtgx9SUH0FkGdBG9nk4fF6f65y+0vMde4ZypB3LAiXQm
	hCYcMwfa9m12i1jSe3op3MkVA/kS40TzOyURcjztRbulP4R7/KLpAcVfrMElSEY+OBGX2D
	cUGFcu3Eb3+L9ipRV7r6WB1DS7+P9ko=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-7bDcpMIgOHqhCKi7iEyXiA-1; Tue, 21 Jul 2026 16:36:39 -0400
X-MC-Unique: 7bDcpMIgOHqhCKi7iEyXiA-1
X-Mimecast-MFC-AGG-ID: 7bDcpMIgOHqhCKi7iEyXiA_1784666198
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c01ff996dso94443151cf.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 21 Jul 2026 13:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784666198; x=1785270998;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zux0FQwqS5dqbu+u3nZlsMBVqV5QPwfWD3UCTLe1nKU=;
        b=n9EGUI1xNWPQ7gFtIG6EQIa0T7CcxNuH/zwzJmEsAry8dULaKldCKTvLm1VweSlAuI
         wnY/295EnTz8QL35oufJfdrRw77NBDRGyaems4IwYHuNM8L7XeO4cCUmIL7HHjd1i8fG
         y4D9tKTv6vDR2LMFSxwVWPus6qMbrexLUvvZg9gNw/qB41BFYXL1lHxA9987Mbpc0ZZN
         Ssc4GVQhSZh6THNVBm3+ktGdE5OZVh7SA5cqWcmn9/uyBLCQ7eLMLM3/Y67dC5b+PIWd
         QYxXJHajNSLbWUGDF6QLcheuMEEFwD9vrwODgEPJXnabZqJtVCKIJ5lKDohX1NHtUI14
         62HA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqCWcycsZ4SnSyOasiTtGkwCLGXDBAyLasC5Un8KHvI7t3MS2eEC+aNUNNh2dk3jqwUQyZP7Jjz@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp38fEsJpAmk6YFT5M6ge0RDy/2ayE2UV1Fi3IGE2wgUoKKhtz
	/SiC+mDmeDBycO9fyxo1AN9ampkng1bZC9FcqZlfp8peRvJKg+6cJFNS3QuzeCEm7hjdc5i1Qnt
	xaas1F0CfR2nY2ln9VHh8fhlT5cMQTR+Bq73IOkGY1ZzaUaeSGoDUE/ChSnUynaiuRoA=
X-Gm-Gg: AfdE7cned570PHzWMMFTvVA+dDSu3WL94O3dcYLwLUfdZL0bVf1piiQsnoMQlC/IjhM
	E4nhdz2/jKuCyApmM7S8cSrw981rztnhl+1P7nsxRVrLZBVM29POnDVBmbiRN3RscDuckckBBsp
	2ygOpBdXPCmoJiNu4/Bp9zMZ0QL1PRmHE2zX59SER/simqK9gP2cNZMUnA9WgzP0pEz3tgWD78I
	Lqq8s+C18Rl2fo1k7M5M1qm6q1EIstGFTLQD6zdTg+MhVr8ugydiWBb6uzO9y6hPi9x21t65wDH
	EET3fN5ECkI0qBsMPL7a0nqEa+tQqkNb3FoFtjXHB4aoxcVwcRzLrywFghGmWYKWf67akXEc
X-Received: by 2002:a05:622a:1825:b0:51c:1d18:2fe9 with SMTP id
 d75a77b69052e-5213c10a2bdmr202739361cf.5.1784666198576;
        Tue, 21 Jul 2026 13:36:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1825:b0:51c:1d18:2fe9 with SMTP id
 d75a77b69052e-5213c10a2bdmr202739041cf.5.1784666198087;
        Tue, 21 Jul 2026 13:36:38 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-527cda3c2ddsm2829911cf.0.2026.07.21.13.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:36:37 -0700 (PDT)
Message-ID: <37f6625f23cc0c041d5d079dbca683d47fe9b4fa.camel@redhat.com>
Subject: Re: [PATCH 3/6] drm/nouveau: add GSP hwmon support
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Tue, 21 Jul 2026 16:36:36 -0400
In-Reply-To: 
 <CAA+WOBuLgkKy_BAgEWgN7jgxDrJYchO1D+B44u6VVMPsGJ-AEA@mail.gmail.com>
References: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
	 <20260714211429.238355-4-mohamedahmedegypt2001@gmail.com>
	 <78ca5c308ce81465956e839c82e1bba46a9f0686.camel@redhat.com>
	 <CAA+WOBuLgkKy_BAgEWgN7jgxDrJYchO1D+B44u6VVMPsGJ-AEA@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _cGJFSQiW3aswMvUKbl_HXty_9d2ZulPL4THWllQ-gE_1784666198
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZTKEIPTJAE35243QOKWZU7MWGNOLLYCD
X-Message-ID-Hash: ZTKEIPTJAE35243QOKWZU7MWGNOLLYCD
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZTKEIPTJAE35243QOKWZU7MWGNOLLYCD/>
Archived-At: 
 <https://lore.freedesktop.org/37f6625f23cc0c041d5d079dbca683d47fe9b4fa.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 2026-07-21 at 23:36 +0400, Mohamed Ahmed wrote:
> It can work but it's strictly worse than this. nvif_msec() does busy
> looping, which would be overkill for this as it would be doing a lot
> more reading for something that changes at most once per 500ms poll
> cycle, and it keeps the CPU fully occupied with every read. It also
> couples us to GPU timing while the main thing we are waiting here on
> is whether the GSP's buffer writes are now visible in RAM so GPU side
> time doesn't offer us anything. I actually wasn't sure at first how
> to
> properly wait and did go over all the possible timing alternatives
> and
> jiffies looked to be the best here.
>=20
> That said, to address what Milos mentioned (the weirdness of files
> being -ENODATA), I am going to have to move this into nvkm/rusd,
> inside r570_rusd_supported()/r570_rusd_read() which doesn't have any
> other alternative available to do a similar style waiting loop.

Gotcha, sgtm

