Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9068C531D0
	for <nouveau@archiver.kernel.org>; Sat, 25 Jul 2026 18:59:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3940810E031;
	Sat, 25 Jul 2026 18:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b6qzDmLD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4153B473C7;
	Sat, 25 Jul 2026 18:44:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785005058;
 b=0kkCQueNt5DaB0IGW+L2l3w7m8tZBFmkGmpYriD6N+zSsitawf9lTWU7OuovCYsCQAXMx
 +CK3TkW9vI0ACzDGV3zYDQ9CHcddGTZIa/UxadUHEmnXoRa0zvNA0rpy5S1XvoMNjhCm1DH
 HUmnztP6IAo1/+zpEZvsAYV3EK1mK61d0Uwj3NoF7pBIGGfhdCL8VYzYtoUUgXL/Ze1nKA7
 Uiv9hyXz+Ia29b+ZBgdQpu2Y9ckz8Qi817XeVOrV4YLYGrfHuiS1/N1wsPW0fgFvkeTU3T3
 jIUV8aw96EX/GLSrItF0AtPb2LHz86vlEpPPEtaltDjJ0yCM99qJ4V00IPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785005058; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tM1JtjrYfwKl1JR6ayB3jShTzcrA3cap4jFHq8xO7i8=;
 b=LHRjr6QdNFa5EHwui8d8GmNqwW8s4HuUaRiQgfn//vzusQ2kCYuarfSrzobbAnmC9Y8QG
 5FevXTnH6Qy0U8RyVFsd5XgvjaHcFafpD5Kn0wg1Y3EW5gwOsM2Uwyv/VmqYKIg+DVJfs7y
 JHmXKyBZNI6nV7H5AhaXHt/PiV0vJS2bXfj++H8hkLJNwG23WpGihFYbn+4R2bgSwrRpIeq
 0CfPZb85JIOJye24d3y6Fe4MZ1Wg/XWhmYnvcMkWactgt9lQNyzv52dkzg+Kwlbe+EBfOjm
 1RUinX0tqINGpmlpHDxQJmpfLvVAUfLGhPN/JmsncrDhSOD4sl6rQgly+xBQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4079E46EFD
	for <nouveau@lists.freedesktop.org>; Sat, 25 Jul 2026 18:44:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 07F2210E031
	for <nouveau@lists.freedesktop.org>; Sat, 25 Jul 2026 18:59:52 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4954c08a7c8so2142115e9.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 25 Jul 2026 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785005991; x=1785610791;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tM1JtjrYfwKl1JR6ayB3jShTzcrA3cap4jFHq8xO7i8=;
        b=b6qzDmLDqs7goSBmO53L5SJncC/6/3a1GMAbqKkY89Rmesx+lEXJh73tmSFtVcQGya
         5mGqEMLUFwb+SW7dvlH17KZdnRwZTydh5y0lq8uXVJzePbtuspQRbduiilO8fDtTAGCV
         O+yvBRQABdkbw4qcQ19RffiCeLwc6saWMorAhmgJW25q5f6uGsVUJyq/bZeYO6kEPir0
         +O6MfAx41Lg/m2QI+9aGKYgcwQqcDFpadJ037uasA6HP6/GC2Jhd8w+36xTwxbBM3L/c
         HNLWU7Dg9FVbyKXEKdBgK0iiPdXGJqTRjkq+RJUULaY+hvVZtPuSN9DRjx0W06/PY9UG
         BTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785005991; x=1785610791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tM1JtjrYfwKl1JR6ayB3jShTzcrA3cap4jFHq8xO7i8=;
        b=k9QgD5Frpn07i1Gieid9FTy3QDTymUnDnaNxChvoSD8EZtYrbO0XNGoo998wYrMBFr
         j2TN0ko5LxHrVOek/SOLBU6EVGXuPt/GAmL5fmxe8AIP0NGrSHDK6iPigyW7w2LpEfA1
         jgG5G9gs9HqT4UpjyWIwv5JFU7hxq8RR/4c8/kgw9pTZuMM3zkHxqoMOIOcGx2X94b1L
         y5QskA/J200iPSJF9723Df6C3sqIDN2PTakmSRDRXSxYE2tCR3EO17hz96ype1KnvDSP
         ljQu4p5iLMCUcZpbsMJ24VvuNLLhCBACLz936y/9nENW8jE7oJCh7Vptwz8z0RVAFzte
         P6ig==
X-Gm-Message-State: AOJu0YxJtIlrSVreKpqNFYXYI0GMq8LZS/FGwrZhU9ir5IpSVJibWknq
	Ip5PAHoC5LphrE1PZRy52sXfM8kZQTsB5HwShOJsNpQ/g5r+18k6jMnM34ppijULbSc=
X-Gm-Gg: AR+sD12frN6VNeeExg+Bm+c00CWY4rk0GSbP1AOVj3mYcpyI3z6XjdxmxcpkirZFMeC
	GR3o2DAIPXOfU6jQRvDxwd0gg/cdglxHpOKJ9QhPeX/mrwTrEwe6xolrSSXxEI38TDiYCyQbL2A
	AYPmr6Eik5p57RpjjHi1J/UsTm6Dkcb5cib5FeopcE0fttqiIvywKLLbuzgVO3zeR4MFMNvAnvm
	jIx/K8R9UgxZhl1HvF/pkEWxR9WEjgXqspbcf7Qusy2XI5HnrnAsOkWzikR4d2I/CC2FOIy572O
	O5SrA879DFwbgt2IGMBto0m/7EfnYzGWIajaLkXcD2VNiE5sMFDkdXX6H572zGHd/ylcNiC2zXo
	ZBhTrPwFfRBvYkmnj96Xp48e+aOJnvHcy8HUadE35gQ5nrIORkxPH65EgQzP1BTNjQylKXBrub7
	qM/QoR39OOJOGdpfGYpdrf1Rqp6HaXWfOFHUiTmzSGev8diVvsHLw+9fFJgCSDfca2DA==
X-Received: by 2002:a05:600c:3b0e:b0:495:4044:11fc with SMTP id
 5b1f17b1804b1-496b5754493mr21338865e9.7.1785005990958;
        Sat, 25 Jul 2026 11:59:50 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957f9928fdsm120474785e9.1.2026.07.25.11.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:59:50 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm/nouveau: nv04 FIFO cleanup + recovery for Tesla
Date: Sat, 25 Jul 2026 20:59:48 +0200
Message-ID: <20260725185948.219510-1-marek@czernohous.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513175014.96599-1-marek@czernohous.de>
References: <20260513175014.96599-1-marek@czernohous.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RWK54DMOPA7NNAPZHVQ4DJDX4PXVYDRV
X-Message-ID-Hash: RWK54DMOPA7NNAPZHVQ4DJDX4PXVYDRV
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RWK54DMOPA7NNAPZHVQ4DJDX4PXVYDRV/>
Archived-At: 
 <https://lore.freedesktop.org/20260725185948.219510-1-marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Please do not apply this series. Since sending it I have been running it on
the reference machine and found three defects in it, one of which is a
guaranteed crash on exactly the hardware it targets.

1) Patch 2/2 calls nvkm_chan_error(chan, true). nv50 and g84 channels have
   no .preempt callback and the call site in nvkm_chan_error() is not
   guarded, so this dereferences a NULL function pointer under chan->lock
   in interrupt context. It fired here on 2026-06-02 on the first CACHE_ERROR
   after a VRAM stress test:

     fifo: CACHE_ERROR - ch 2 [labwc[3950]] subc 3 mthd 0f00 data 0000007b
     nv04_fifo_intr_cache_error+0x111 -> nv04_fifo_recover+0x80
      -> nvkm_chan_error+0x99
     RIP: 0010:0x0

   The oops escalated to a panic and the watchdog reset the machine.

2) Killing the channel on the first fault is wrong. There is a single PFIFO
   cache puller and on a fault it names the channel that is resident, not
   necessarily the one that caused it, as nv04_fifo_pause() already
   documents. Here this killed the Wayland compositor twice for faults it
   did not cause.

3) On Tesla a killed channel is not survivable at all. The channel-killed
   event is only subscribed for FERMI_CHANNEL_GPFIFO and newer, so
   nouveau_fence_context_kill() never runs and the pending fences of the
   killed channel are never signalled. The display commit tail and the TTM
   delayed-delete workers then wait forever, uninterruptibly. The series as
   posted therefore trades a recoverable fault for an unrecoverable hang.

v2 fixes all three and adds a prerequisite patch for the event
subscription. It is written and rebased, but I am not sending it yet: the
new escalation logic has only hours of runtime here and no fault has hit it
so far. I would rather restore the debugfs fault injector I used for the
original validation and demonstrate the corrected paths with injected
faults than post a second series that is short on evidence. That is what I
am doing next.

Lyude: v2 will carry the Assisted-by trailers, as offered in my reply to
your question in May.

Sorry for the noise, and thanks for not having applied it yet.

Marek
