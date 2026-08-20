Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3A8C5DF82
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 18:26:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 900F010EF06;
	Thu, 20 Aug 2026 18:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OgFKxRes";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E564447A4F;
	Thu, 20 Aug 2026 18:09:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787249389;
 b=l8zENzqS7zxZlQdeupmBgf+K4rhGVJvkF7gxO47GCHtXGc9ZnJXkUXhXUOpX5OKWNkT96
 RDuX0/rUTBozvCUdFyE5gNLbwJ4zp8ma8LmiNhO6jQbOuo5sp8R7Q37DVH92wVIqF+dw5LE
 N6ylBVT2pJyxR2J2G6ioa8ulx6+L/6rkZYfZFNqW1vQASJ+7aDdPChWo+fxTMF6Qqr1Zp/0
 KzBvVsmYMkB3kR05QNWx+htrT0J12EfdBZnPguDlGAKaF/Al5xHuZCHEfVkInEBeCaACk50
 MsLR3NSJehGlYammNBYSz5G5KqhH7JsAqmTR7l9gTYHSvVXbyPsHZ5FbUQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787249389; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0cPAiw8SZK4VJABSJWXID6c8H+dfAlzI9Es1HSEj/Po=;
 b=Hd1GCM8Z+IKlojZ/j3X028dhAAlLFE/KdhLnposxzU3w1C+t8LGchtUesXH2vSPIc4Cup
 eMS8TQj/vYTHf2wghIIgwPdv3WNZC6Go6eR8d3fuVTZxKkDiJmYcFtQxXoGdjq21JwhXugo
 eqN790ljuX2VFTENn0TV58KLr5yFOF2gd+Sq39oJ9jh88KiSi2BD7HXX3E9L65b8HFrBwGM
 GxnKPJLsyQaCpRVr8mnDP0MMTePyobv6t5cc0k2CtPFi3/Tm9zBrIFjja4fS0EhDNRi77FM
 +TpcjoDkkGYfObmmQIzt/UA5dxpVmdf8OZZZS8PGDpzQXyRoD0aDfX98+6ZQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6CC5547A41
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 18:09:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BC66710EC16
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787250382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0cPAiw8SZK4VJABSJWXID6c8H+dfAlzI9Es1HSEj/Po=;
	b=OgFKxResum8+c46IAe/9LkM/QN5OmePJil4OhQL7pnyHq9Z8Mq6POr22FNxAgiRZbQQWhQ
	7GOyqRnBcmIptyiM2mQnIolZzLlpbG1yJmnsNUtFJIQCchXvPLE0kL/fsFEjHc7cnutWoK
	C6yzSN0Vy9zkeAA+dMuLe24Hjow8qPI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-3-ePvomCPdu6Spynol2AqQ-1; Thu, 20 Aug 2026 14:26:18 -0400
X-MC-Unique: 3-ePvomCPdu6Spynol2AqQ-1
X-Mimecast-MFC-AGG-ID: 3-ePvomCPdu6Spynol2AqQ_1787250378
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52d9cef8d15so2162581cf.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 11:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250378; x=1787855178;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cPAiw8SZK4VJABSJWXID6c8H+dfAlzI9Es1HSEj/Po=;
        b=Yzwl/acf1n+wPOxVhTmNIC0YZtypnZy0NPFKbWwu2ACaweHpbnOh7KbURWu/rkynAJ
         jkfGKbs6EKmAedhOngSvYjv1NWB4H0K2XxxJ3wetmvw67Fb/3Bnc7n6iWyfqmZFEwmrT
         fpOwzaKKd8aE7jGPWyAiKGpRL82aMqgGNRiY6OHRDKKT3FBXO4WwIDei6qOik6fbXofD
         wLZZMh8V+NFvtAppT3zJr4Y0OlkiF/tBlXStse0ucBKPBCQpgy3lS1zoR0HWOsjPVnJe
         8A0m+LLDyJtgmeQhMCZoMu2XFenuuNe/H0UfNNGJm3H2fPTVjqm0MarmVDG2TXR1//7j
         HhPg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro405PGijyILH6QZFocop6n4imy4TpNvEJbK/natHcyiFtPRHt6WFUw0v28Leu3S5Mr+eKwPwB8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPHS1fBwOmNcMPLpJL2EH5nRZUyYsAu/L6rzAo83qHsmg/cvC6
	eLm6W1JG3Y6ia/A7lEE3WuJBqZ7p5hVhFu1wVh3UvyNMon1NkYREWJxX9P9swJbSAwjZUmV2e9m
	xfzef3PTDP+X4pfaiC0RIzpF03njzmhvGKGBEVcSwBNel7pCT4QBqtosxiLbxKdvdoyo=
X-Gm-Gg: AR+sD1399dgeJo0Iv+FuA3e6LRykVjIYxgql3s81BbmX33ZiJbKs8cqOPLhCmdekeM7
	nvu0+Ox97r2qD47JLXtZEnUu3P4pdudwfzmBJpLScI7XHFfwiLby3Ag8seQz/bvxBlbIzeIjB8B
	v6mQ7y6NaZUmBVDHugSSBr4I367AHfFmQspwVX10aB350UDR6EiCRwfHRQ6SsEovWnk6Ty2J8Az
	pdbpU3NFBDXiZiQfhgZc3x0TpS/JKsZh07KyxbCbUny9FRcGdD9zvhcRZEGbrwE1XzzV1sEjJnq
	KkB5XTEM2rpDPB1h9UmIMFWgc+mp3QSdV8UgTgbgyN+ptuB/yPfi46LTkV1MeRG0WBWCyJpe
X-Received: by 2002:a05:622a:54c:b0:52d:8275:4557 with SMTP id
 d75a77b69052e-52df5ba06camr2537221cf.42.1787250377949;
        Thu, 20 Aug 2026 11:26:17 -0700 (PDT)
X-Received: by 2002:a05:622a:54c:b0:52d:8275:4557 with SMTP id
 d75a77b69052e-52df5ba06camr2536701cf.42.1787250377424;
        Thu, 20 Aug 2026 11:26:17 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5f2b5c7dsm44258136d6.47.2026.08.20.11.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:26:16 -0700 (PDT)
Message-ID: <1714a7c2142ac27fc5142584f0a61e9e8871831f.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/nouveau: cancel the DP IRQ work before freeing
 the connector
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 14:26:15 -0400
In-Reply-To: <178682657122.3795552.6920623796751043528@gmail.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
	 <178682366002.3748010.4096452389040554615@gmail.com>
	 <20260815201130.7BDDF1F000E9@smtp.kernel.org>
	 <178682657122.3795552.6920623796751043528@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gJXSYIHhyQ-QWPx3BFV4skbVsj7Yv7XVEpeai0jEj8Y_1787250378
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: XT7PATKP3JEAKGHPHU3FLR7X7LGPQCPI
X-Message-ID-Hash: XT7PATKP3JEAKGHPHU3FLR7X7LGPQCPI
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XT7PATKP3JEAKGHPHU3FLR7X7LGPQCPI/>
Archived-At: 
 <https://lore.freedesktop.org/1714a7c2142ac27fc5142584f0a61e9e8871831f.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 2026-08-15 at 22:42 +0200, Marek Czernohous wrote:
>=20
> I cannot rule it out, so I should not have written that sentence as a
> finding.=C2=A0 It should have said that I looked and did not find a fourt=
h
> patch, not that there is none.=C2=A0 If the maintainers want, the shape o=
f
> a
> fix is probably a drain of hpd_work after the connectors are gone, or
> making nouveau_connector_hpd() a no-op once teardown has started, but
> that is a separate change from this series and I would rather someone
> who knows the hotplug path weighs in before I write it.

I wrote a lot of that code, so I can just send out a patch for it in a
moment and CC you.

