Return-Path: <SRS0=eiXg=OL=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBF8C433EF
	for <nouveau@archiver.kernel.org>; Tue, 21 Sep 2021 17:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D9E61050
	for <nouveau@archiver.kernel.org>; Tue, 21 Sep 2021 17:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86D9E61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC78289FCC;
	Tue, 21 Sep 2021 17:05:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E533589FCC
 for <nouveau@lists.freedesktop.org>; Tue, 21 Sep 2021 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632243908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+K43AcWplqnp2X8aj3NhUHQa0QVf9DhQMxG1XUs/wlw=;
 b=V1B+8BIGikMf0mv7tAlAYe9Im4EZMBSrmjhE7ciUeZ+S7a49NQG2M8ZV4n98ZiIdmuQQf9
 EfpCvjng+8K6SpCc5Fn4/IqZObpDxN3szqRWRLM3oGzR6n1BWX1K2osvLlW+cZzqa7b/Ns
 k1ppDhxCeXiehmNMRWkuEG/f07oRsPo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-pn83rPmDO0-Gg-eqlizzdA-1; Tue, 21 Sep 2021 13:05:04 -0400
X-MC-Unique: pn83rPmDO0-Gg-eqlizzdA-1
Received: by mail-wr1-f71.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so9359422wru.15
 for <nouveau@lists.freedesktop.org>; Tue, 21 Sep 2021 10:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+K43AcWplqnp2X8aj3NhUHQa0QVf9DhQMxG1XUs/wlw=;
 b=iynxRNnpVlKPPli1pLUsEPQ9a0zwtjqKfez+e/0iaXmXsA4E0EtKH7M2Mrr394mgt1
 ACJYyrqoglwEb/x2sUcRNq0DjGMpF/FJUft6t3X81LrCtxik40suymYV5GTx4kgLXAUG
 wmNAA4tBKoGoJt7YXl7By1da2f2f4skdtW/MI5SdSeoUQUcfdZg47wZ4Rn4QwbPMC4Z6
 fzPNLjlZYKPaKf+tartBFcEpE2pPut6lhMO3Sem1z51va+jO0npEjtO887Irsh+LJJ2u
 pXVoj76k9+AhjAu6ykXAXvylVumvzNXeonLvS5Zw4KVbFFdbGQwwxI6j+EGpd32NOSGA
 c86w==
X-Gm-Message-State: AOAM533OV8Vp04rN7VahNSsm2dTAjxBiJLMQkphbtX0eNs6dNWGZJlNn
 VNj8BwEPIQ8xyq2UgXouqT8jkRfGFwbE/8yCV4HcnkOd7TZ0lkRlHowW6078C2jlAGCVggJJerE
 8azkpVci6OUkmxHHW2kPMZ/KBco/KMRwb3J7stCk9iA==
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr36387593wrr.142.1632243903357; 
 Tue, 21 Sep 2021 10:05:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaz/S4wUWUqYo4MpIxRwNCgZRTLCpuh23wCE6rowhu4l9hroFXOVhd89jdtrXnfkxp8SsA3qBW3lI+GheLhoc=
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr36387566wrr.142.1632243903168; 
 Tue, 21 Sep 2021 10:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210920181647.22156-1-tim.gardner@canonical.com>
 <CACO55ts0kJaHr0QTzqy5r9Gq4vbV=8bMokuVHSCAqMVEOKAgDw@mail.gmail.com>
 <9b778fe8-be29-f8aa-a40f-b640e9d31cc6@canonical.com>
In-Reply-To: <9b778fe8-be29-f8aa-a40f-b640e9d31cc6@canonical.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 21 Sep 2021 19:04:52 +0200
Message-ID: <CACO55tt-j6cPD0zT2Gk3fu2rNYk=h8=zy5bq8=EJ25f8QsXb6Q@mail.gmail.com>
To: Tim Gardner <tim.gardner@canonical.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/ga102: Free resources on error in
 ga102_chan_new()
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 21, 2021 at 3:22 PM Tim Gardner <tim.gardner@canonical.com> wrote:
>
>
>
> On 9/20/21 8:07 PM, Karol Herbst wrote:
> > On Mon, Sep 20, 2021 at 8:17 PM Tim Gardner <tim.gardner@canonical.com> wrote:
> >>
> >> Coverity complains of a resource leak in ga102_chan_new():
> >>
> >> CID 119637 (#7 of 7): Resource leak (RESOURCE_LEAK)
> >> 13. leaked_storage: Variable chan going out of scope leaks the storage it points to.
> >> 190                return ret;
> >>
> >> Fix this by freeing 'chan' in the error path.
> >>
> >
> > yeah, this is actually a false positive. I ran your patch through
> > kasan and got a use-after-free as we deallocate the passed in pointer
> > after calling the function pointer to the new function. One might
> > argue that the programming style isn't the best and we should be
> > explicit about freeing memory though.
> >
>
> So the caller of this constructor has to look at the error return code
> and decide whether the value stored in *pobject can be freed ? I guess
> if the caller initializes the value at *pobject to be NULL then it can
> kfree() regardless.
>

yeah, so *pobject is set, hence the caller freeing the object on
error. I am not a big fan of this to be honest, but Ben told me he has
a bigger rework of how all of this works pending anyway and I think we
should keep things like this in mind so it's easier for others to
understand if the code is actually correct or not.

Anyway, this all happens inside nvkm_ioctl_new. We have the call to
"oclass.ctor(&oclass, data, size, &object)" which ends up calling
ga102_chan_new, and on error we do "nvkm_object_del(&object)", which
does some cleanups and calls kfree.

> >> Cc: Ben Skeggs <bskeggs@redhat.com>
> >> Cc: David Airlie <airlied@linux.ie>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: Karol Herbst <kherbst@redhat.com>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: nouveau@lists.freedesktop.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
> >> ---
> >>   .../gpu/drm/nouveau/nvkm/engine/fifo/ga102.c  | 20 ++++++++++++-------
> >>   1 file changed, 13 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> >> index f897bef13acf..4dbdfb53e65f 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> >> @@ -175,19 +175,21 @@ ga102_chan_new(struct nvkm_device *device,
> >>                  }
> >>          }
> >>
> >> -       if (!chan->ctrl.runl)
> >> -               return -ENODEV;
> >> +       if (!chan->ctrl.runl) {
> >> +               ret = -ENODEV;
> >> +               goto free_chan;
> >> +       }
> >>
> >>          chan->ctrl.chan = nvkm_rd32(device, chan->ctrl.runl + 0x004) & 0xfffffff0;
> >>          args->token = nvkm_rd32(device, chan->ctrl.runl + 0x008) & 0xffff0000;
> >>
> >>          ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->mthd);
> >>          if (ret)
> >> -               return ret;
> >> +               goto free_chan;
> >>
> >>          ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->inst);
> >>          if (ret)
> >> -               return ret;
> >> +               goto free_chan;
> >>
> >>          nvkm_kmap(chan->inst);
> >>          nvkm_wo32(chan->inst, 0x010, 0x0000face);
> >> @@ -209,11 +211,11 @@ ga102_chan_new(struct nvkm_device *device,
> >>
> >>          ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->user);
> >>          if (ret)
> >> -               return ret;
> >> +               goto free_chan;
> >>
> >>          ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->runl);
> >>          if (ret)
> >> -               return ret;
> >> +               goto free_chan;
> >>
> >>          nvkm_kmap(chan->runl);
> >>          nvkm_wo32(chan->runl, 0x00, 0x80030001);
> >> @@ -228,10 +230,14 @@ ga102_chan_new(struct nvkm_device *device,
> >>
> >>          ret = nvkm_vmm_join(vmm, chan->inst);
> >>          if (ret)
> >> -               return ret;
> >> +               goto free_chan;
> >>
> >>          chan->vmm = nvkm_vmm_ref(vmm);
> >>          return 0;
> >> +
> >> +free_chan:
> >> +       kfree(chan);
> >> +       return ret;
> >>   }
> >>
> >>   static const struct nvkm_device_oclass
> >> --
> >> 2.33.0
> >>
> >
>
> --
> -----------
> Tim Gardner
> Canonical, Inc
>

