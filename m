Return-Path: <SRS0=dzIU=JQ=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B0FC433ED
	for <nouveau@archiver.kernel.org>; Mon, 19 Apr 2021 11:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D80061090
	for <nouveau@archiver.kernel.org>; Mon, 19 Apr 2021 11:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D80061090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A2C6E2B6;
	Mon, 19 Apr 2021 11:50:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECCF6E252
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618833001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OeTmn3FpbFUKffAvSBuF9L9RSoOACTtnRhAzQxRMNI=;
 b=ZlBbfp0klhF4Qd/5iwSm7PtEjR5KcN/fLfNZWhG2D0YZRgwKL8v+GvcxvKdZi6ouer7Gk+
 3RKnIca/2O748IEX8HabsQ3PBZQF561BVjREY52VQpOhW0aGS2mFdGlJ/BC1cv/GJjYHhx
 De8wd18PtUhDBIRjwPEBMCc93alb4Qw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-K4lMeX_sMOGM60iZyKpmfg-1; Mon, 19 Apr 2021 07:49:59 -0400
X-MC-Unique: K4lMeX_sMOGM60iZyKpmfg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c3792b0290128219cbc7bso4484285wmr.4
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4OeTmn3FpbFUKffAvSBuF9L9RSoOACTtnRhAzQxRMNI=;
 b=HwxJ9N+i8A7zaeHa4oj3N0fxLsbAXEaJEhQN9+13euvN4qwm4TiM4WIOrPCUEYJpA6
 iG3786VFOVJdZhpSZ0Qv89jTaDkPr/DP6H8n0HYwz7iX+OdDk3ZQMICzJxpk+xtaM/U3
 VKUQsKsVHH1fK40lFQpLgqTI6ZoX6Gh+i/sfyvyHlwTxgwZ0GxuRPlHD+4EN5rWAS3Nw
 r9iCnvzXSS+eHAAVeHRaR8r99/ElhVCSmuS51vBnFsr51SVFe0mzydtRVV306MoVM0df
 mgZ9TaLFkB0/UdO34p5CRUcixutRPx/7duTl9KIFxYVjjgNmlW+IJqBTLzGVHGBS//Sl
 onNw==
X-Gm-Message-State: AOAM532G6BrqTZiLAOQVY+BYT9yt6zPMTKOIJ6wpCrLSkspuGGZIECnA
 IlS/tb4hSTkT8i38eiVkwFvsYd+9y3h1pb0LrTW4SfcFgqwpdLAbSGT1/RzDjl9lfaeCMYtET7H
 MVRpR9E/zQbwUz2FhaurPd209AUWTj6A/p/gKRzC9Ig==
X-Received: by 2002:adf:ec42:: with SMTP id w2mr14074903wrn.373.1618832998770; 
 Mon, 19 Apr 2021 04:49:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLwKcD0/QfFrXTpG9Ze8cVc8PUyBjsNLwD4wylL2K1NJkkTxya259K5+FXuzZ/wkYrN2Jsdk/SsSVasMPFFAs=
X-Received: by 2002:adf:ec42:: with SMTP id w2mr14074891wrn.373.1618832998608; 
 Mon, 19 Apr 2021 04:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-14-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-14-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:49:48 +0200
Message-ID: <CACO55tu6B5kQM3HKAeMFNQ7TF3vKzsgMVC0J18h+UNeJi-O36Q@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 13/40] drm/nouveau/dispnv50/disp: Include
 header containing our prototypes
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gRnJpLCBB
cHIgMTYsIDIwMjEgYXQgNDozOCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3
cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
Ogo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzoyNTk5OjE6IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYbnY1MF9kaXNwbGF5X2NyZWF0ZeKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRo
YXQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2Rpc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+
IGluZGV4IDM1MWY5NTQ5ODk1MzAuLjQ5MDVlZDU4NGZmNDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gQEAgLTY4LDYgKzY4LDggQEAKPgo+ICAjaW5jbHVk
ZSA8c3ViZGV2L2Jpb3MvZHAuaD4KPgo+ICsjaW5jbHVkZSAibnY1MF9kaXNwbGF5LmgiCj4gKwo+
ICAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqCj4gICAqIEVWTyBjaGFubmVsCj4gICAqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKi8KPiAtLQo+IDIuMjcuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXUK
