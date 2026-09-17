Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2865DC982D0
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 20:26:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 005BA10F0A0;
	Thu, 17 Sep 2026 20:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hyp29NaH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E01014822A;
	Thu, 17 Sep 2026 20:09:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789675751;
 b=Epk3sdOfdZzNYJOX9W3cJV/DRRIKzIzSkjRpc2cEwvSbolwCoFmrf5Bto5mGwy6MFReuO
 dpwDxwar5ti4MMcJhNPGc+jg5/AcE9D/kIhz3ME088LjczW6lj8+kdBWAIZLBWxNUbHvGjP
 NHJw7SKgqA6fCe5o1gbZLTLCf3rVAg6Vh7+OsEGwbTzzfNS60iysETOStuYPDH5FKp++44v
 HnUmeIot2yxZqxbqTFQSmYd61N7jRHksqZq5zAgRP3ldRQlzOlanZtG/8wbl3B30JCox5dE
 S/edpMCE6L91P3gVg+TH5hSil/XUraIJ8HzVEr399U6NmM1sAvoX7zn5Wtsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789675751; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ya+cIlw22G+pUR3u7ErvGhK75QjcpcCjqrMDeSWo6yw=;
 b=y7zjWRAdGnZcOwmnEQ3gr+c1q7EG5f9/vNJJsFb5mCZry0IhjltOhi/P7ThP2omX3skp8
 ifI71HVFYPe93PQidebt8OkCG6KovRVxoTwJxdzsBsM3Nc8Px0Nx+Y/vvYs6yX6UxrWfhOE
 6/N3PoNSLaeLBRW8ZaYN88t/bJNYM/9D1f+yxKU82GMfPNuEElAIKICGJOiknmCr3FZ2g2e
 MmuomowO0dOKlI9aro0iHou5Auq2xaHXmFpLRHISENr8ctRIfaxOVdjb5fa2K1nuz8NJUF4
 NQgmusPx8BZ1gfzI9rtPL/EvEBpZmW+589qyr0FqDooeuFAVslWn9Tc9MfOg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4FB48481F4
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:09:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EC9AC10F076
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789676805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ya+cIlw22G+pUR3u7ErvGhK75QjcpcCjqrMDeSWo6yw=;
	b=hyp29NaHyZlOgkDHgmbmNYOe6bCBS5j1cJfFeAY/sRcguEXVoK7GSGbLNIvx5SmuWsfGEy
	bA0r0qltyRY1CWwWNtRJssBy4ykZ8OvA5r2zmcHy9FP1RR1atYU0qYEWa9qFZ1Jmx0BlRL
	oLZQDwCe+dah/JQ6Wag8naXsvqMci3k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-oc6DftTlPE68ztpyv3ZRYA-1; Thu, 17 Sep 2026 16:26:44 -0400
X-MC-Unique: oc6DftTlPE68ztpyv3ZRYA-1
X-Mimecast-MFC-AGG-ID: oc6DftTlPE68ztpyv3ZRYA_1789676803
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-90e8341cfb4so2541026d6.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 13:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789676803; x=1790281603;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ya+cIlw22G+pUR3u7ErvGhK75QjcpcCjqrMDeSWo6yw=;
        b=HsIgurQmeXh9jNe4XnZcMxB3KMFpLVbN3t/6Cn2h7zwPkucwa193PxyLGeN+YFSXSC
         yEFDs22VctU3vvdghByTDCzwpolHXTd31pmYUK1p9vFTuvICVvirVRI2WTKURUTiysLG
         5sLsVu3NIZjNhye1cLMK78gPIckROAuqEl+8z2mtv4lYrkdki44FuGDGvI87eTMOcB4k
         hW8TkO7KiUpgQLVE4c8kamze47+0LbksSTYFSzgX9Zr8AmxKLOn3/vqvG/MEbVpJlbOK
         Mssy7eVp+PcyHKCWmEbygaokBpDe3d7MO+5cdmCaIL+bsFqxv+mQU96zV1WA5fdMCZBQ
         fjUg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz33v9VdIxrAeC62o6d0CQf32s4VVJh5C+0IBstrRyK7v6231RXuw8qZWFJgOrHHKLRTmZsJ67c@lists.freedesktop.org
X-Gm-Message-State: AFuF++meBlBBiIzf0txGCDPloagG0qTDDQoxOQsWU9PV+KLgYX5eJWPW
	kyZNhCvEd3VHVhkn/QJSb55x4YwLKI621tkLIlN2lLLOEEWF25Y1bA8XSJsB/w0Yot4sCeiWJXE
	/2iAOWMP/9arqk9MKpL4AaFdYCQ085hXSuTl+FmaKvwuDUJ9EAsHo66kZOSdMqQ5YaWo=
X-Gm-Gg: AYBFou3TUPW/Ez1KAZAAlOUeiSDb0FnsEzJt4izjpPpavb7VkEyIAEf8kt7s0iyKuHL
	LA2rPgH69gPfmRFMAnGRXcwTGTtk7oC/Isag/pIcoFrWFe0dzF35IqV15NAGIFcYGLO8nIcDLSO
	HOtrgvXkE/npnrZcO/Hncb2iRA3Ory1RyRRu962jGrODFSSSMoOWzj3ugakrp7gCO4ymQYB1Ksb
	YzZOmXlx2HGzPWVfkvty7KkM0g7rNOCr7oCWf3Z1GXWBjKd/8d3P7kH6pEkTPKoLRV6VFzrWlg0
	dRT5sQaMlQqDjmYXX3ATk46XimBSma3mLHHCTOs4NvruWNhpVqFYQeTAzdheFidF2/YrZCjj
X-Received: by 2002:ac8:7e81:0:b0:530:256c:3718 with SMTP id
 d75a77b69052e-5329e4f5460mr6673771cf.38.1789676803193;
        Thu, 17 Sep 2026 13:26:43 -0700 (PDT)
X-Received: by 2002:ac8:7e81:0:b0:530:256c:3718 with SMTP id
 d75a77b69052e-5329e4f5460mr6672891cf.38.1789676802166;
        Thu, 17 Sep 2026 13:26:42 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91252c805e1sm6287236d6.19.2026.09.17.13.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:26:41 -0700 (PDT)
Message-ID: <bd730e30c96bea38d8430460ee73f073e280374c.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Fix NULL pointer dereferences in
 GETPARAM ioctl
From: lyude@redhat.com
To: Jim Cromie <jim.cromie@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>
Date: Thu, 17 Sep 2026 16:26:40 -0400
In-Reply-To: <20260815-null-fixes-v1-1-0df9dda951fb@gmail.com>
References: <20260815-null-fixes-v1-0-0df9dda951fb@gmail.com>
	 <20260815-null-fixes-v1-1-0df9dda951fb@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kjNyoN-2BhpwQUcYSc8kUL-xxKIPaJ4UsXdEINrBpIA_1789676803
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7GFZWMMARNCS75SW6CFIX3RBJHASOARX
X-Message-ID-Hash: 7GFZWMMARNCS75SW6CFIX3RBJHASOARX
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7GFZWMMARNCS75SW6CFIX3RBJHASOARX/>
Archived-At: 
 <https://lore.freedesktop.org/bd730e30c96bea38d8430460ee73f073e280374c.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 2026-08-15 at 11:30 -0600, Jim Cromie wrote:
> When hardware or firmware initialization fails, the graphics engine
> (gr) or device functions may remain NULL. Attempting to access these
> during the GETPARAM ioctl (e.g., NOUVEAU_GETPARAM_GRAPH_UNITS)
> results
> in a kernel NULL pointer dereference, causing a crash when userspace
> (GNOME/Mesa) attempts to probe the device.
>=20
> Add safety checks for 'gr', 'gr->func', and 'nvkm_device->func' in
> the
> ioctl handler. Return -ENODEV to signal the missing hardware state to
> userspace, and use NV_ERROR_ONCE to provide diagnostic proof in the
> kernel log without risking a console flood.
>=20
> RFC:
>=20
> These crashes may not be repeatable, they happened while I was trying
> to build nouveau as a builtin module, with binary blobs in the kernel
> image, on a laptop with an encrypted disk.=C2=A0 Gemini tells me this
> won't
> work, so I punted.

"Gemini tells me this won't work, so I punted."

I'm sorry, what exactly do you mean here? And could you clarify what
LLMs were used for in writing this series? Code generation, analysis,
etc.?

>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

