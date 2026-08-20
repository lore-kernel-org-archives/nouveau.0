Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D05C5DF82
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 18:36:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AF30C10E22C;
	Thu, 20 Aug 2026 18:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ICwYDuvD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0DC4847A62;
	Thu, 20 Aug 2026 18:20:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787249999;
 b=ZWK5j/oAMdjeRoEle4BU1sS8N/B7VKq3TSAcndVYNh5Wizh3Wcgnv+HHQX592zcSe1tcH
 REOgsWnsUzIisV/kQap80vitD/fjTE/rdgInGqYVR/Byw0hRBmE5Q7kVST+CRIP1JzQtIUx
 AMic3/lsmicbDeCP4X+sD7DcRII7tyu1yO91AKtUO2O++8dI1waygmO5y5FLoRPMfY/VSjx
 nxuTcOm5NOkwYf9i8T1BRaEjjsNS2k/DqVR+EtKgGgqKocinhobmLDFNFLCR75YkUG1e7Fy
 3ruLSfNf2wao4OouqsAUDdSLqIechgkQTZMKuOSju/nt5zTuETQSf+2WBSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787249999; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=L5nqpu3ZqFlUyLUMsvX3rrVYOr33g0gJgBhNDeFcm2o=;
 b=Izyhokhy4dqyGKrCmepnt0jnXBBpXJzAIAIV7isUZfcOPTYMrnik5WavsfOp2C1lsanoj
 /rGH5oYyHwmch99XrrANFTGS1bPpz1Wav0XuB7yVI4ngVu7d2aE/dgrplFWJ6+qQyMJPg+I
 vkivdZLoRaRPFYAPFO72tom83OzPRpg9BYpfLDmXvlI+6NRPPYMV6Yik3SdnRMiEyZBbDVi
 7SPkriiVuAMOtoaD/sKWMsINpMWOtQhEQbmiY2DgvcBb13RKCst1Te4cIT1T1d1AT9mgygv
 hogpH0/ED1jGXQF7ZXzbng9+KLSUp7xA/LS5qpS0ycGsgmxtxn4y4jefYhLQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C523D47A37
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 18:19:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC1510E20E
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 18:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787250992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L5nqpu3ZqFlUyLUMsvX3rrVYOr33g0gJgBhNDeFcm2o=;
	b=ICwYDuvDUsUUFjUMAcF8zr3VW/rIgD2YrdM65BhYHkS7RlhdvJNQTZSqCXPj+nf7JrfT/w
	WML9lrbKlPGy3DgU1VNVbjBJd3A6UaQloj0TxfC9nCjqiysL6lrKlAJ3gz59xr9BApoqyw
	+X6rTu5lA+6ED1Vh5rjN17MrWo7y1TQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-1usTE5kPNHaZGflrsFI82A-1; Thu, 20 Aug 2026 14:36:28 -0400
X-MC-Unique: 1usTE5kPNHaZGflrsFI82A-1
X-Mimecast-MFC-AGG-ID: 1usTE5kPNHaZGflrsFI82A_1787250982
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52d9cef8d15so2374751cf.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 11:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250978; x=1787855778;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5nqpu3ZqFlUyLUMsvX3rrVYOr33g0gJgBhNDeFcm2o=;
        b=he1mHNWXNKnmV8dtIIizwxvZFjeDJAY4qOH0dvCmfgQX2FI1NuXY50xi/hXr6zM9Oe
         g0Y9597brj6EaodfR5MT2uIHbDP9ZUPP51Ug3ABbaj2cg/TZbkN5Xxj0omSFW4CUu/AZ
         IiFYeQgbRNhUeHegO7FwLjWbkl/E/R+SzDXf4UWkx66XIupc7stLNz9xVrqmafnO9Sra
         TXNfstLTna3yL4Y++oGjwjoRLwUu5ysurUDzDjv+X7l1jCEjnPKZhN8fmD68UNxwtZbr
         cyHgJN0G0cAjUBJAZ5nStzZW6PuMwdIHSP2gvEO/WnHsG2KPiaLfDqSvtBKwN8WjJB8T
         A3LA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoVAhU3hxNkpVLPtD5eOjIBsocNwM1qliDYPMXohe9H1ubiOpZ9gjDcsv1tZFDb0quGrBURcuTu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD2F+p+q1crWtWcHu2ZTuCS7Zr4jcb72RdZQ6yK7xaY6rW7ybR
	d3ep2jeUvxSuHY0P6CJS22plVXmLZenIDOY9fKxPcPNB+NgT4jSX1aKH/cxKvWbtcjS5DZBHfgq
	YlepZ2Bx/JgotQDm1zCQB9Rdm/anSBAjKdVWeU9Cys5HhGoAGEx5dwCEiR3sQEnjdbLk=
X-Gm-Gg: AR+sD11QunVaWtqy3gr6unLV7e+CHMM4HL308wZV+FCvAsmkeKP+lqCQaod0efQ9dvL
	CwCZiLfPF+L/dPTkUvYIjoKHuFby9jkLgcKReeOAxPWTSowPlJDB/dWkDm5RsN+zMSmOyhgE9Kw
	GORMr82r6XjpoMtjNdqiTjTKLOT34z5rhIrLiLZKEssWgokY7ygn8SMsl7Di9EB1h/A29Ax85sq
	7WzhRtK/jj1y0bdMSEj8o+pVwPLIlE0gK4TbOELIwy/TM3+7EUk9DiIyzC9zUN6zHosMYAKpxFW
	TLA8q4hGBrpqOwYoWnuFu1qwNj/axmhYahhMhO1eb39dV9+uavtlbvMIAgTUYQSjvK7lIp7d
X-Received: by 2002:a05:622a:1925:b0:52d:9637:5546 with SMTP id
 d75a77b69052e-52df5a4f8aamr3812231cf.33.1787250978272;
        Thu, 20 Aug 2026 11:36:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1925:b0:52d:9637:5546 with SMTP id
 d75a77b69052e-52df5a4f8aamr3811731cf.33.1787250977830;
        Thu, 20 Aug 2026 11:36:17 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5edb4f75sm43971916d6.1.2026.08.20.11.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:36:17 -0700 (PDT)
Message-ID: <8e39067b5dd30b8e345c55bbf156d897322c6e70.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/nouveau: cancel the DP IRQ work before freeing
 the connector
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 14:36:16 -0400
In-Reply-To: <178682657122.3795552.6920623796751043528@gmail.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
	 <178682366002.3748010.4096452389040554615@gmail.com>
	 <20260815201130.7BDDF1F000E9@smtp.kernel.org>
	 <178682657122.3795552.6920623796751043528@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: edLVCBOKL2Gu3hyrbp5AcWvEGdVLpJPClhjlK4xIhWU_1787250982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5NMFWXBWQXWFLIKMS33VOUE7UIHRC6HB
X-Message-ID-Hash: 5NMFWXBWQXWFLIKMS33VOUE7UIHRC6HB
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: sashiko-bot@kernel.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5NMFWXBWQXWFLIKMS33VOUE7UIHRC6HB/>
Archived-At: 
 <https://lore.freedesktop.org/8e39067b5dd30b8e345c55bbf156d897322c6e70.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 2026-08-15 at 22:42 +0200, Marek Czernohous wrote:
> But the wider question the bot is asking is fair, and my cover letter
> answered it too confidently.=C2=A0 It says "there is no fourth patch here=
"
> on the strength of drm->hpd_work being drained in
> nouveau_display_fini().=C2=A0 Having looked again after the bot's mail: t=
hat
> drain runs at nouveau_display.c:600 under "if (!runtime &&
> !drm->headless)", and disp->fini() drains it a second time under the
> same condition (dispnv50/disp.c:2686, dispnv04/disp.c:72, which I had
> not spotted when I wrote the cover).=C2=A0 Both of those are before
> drm_mode_config_cleanup() reaches nouveau_connector_destroy().=C2=A0 So a
> late irq_work really can re-arm hpd_work after every drain, and nothing
> drains it again.=C2=A0 Whether that is reachable in practice I do not kno=
w:
> nvif_event_block() on conn->irq has already run by then, so it needs
> work that was queued before the block and has not run yet.

Actually - after rereading this again, nah - this isn't an issue. So
long as the connector IRQs are blocked at that point, it should be
good. MST connectors aren't, but that's also fine - they use the IRQ
notify thingies of the non-MST connectors, so they're indirectly
blocked by that.

