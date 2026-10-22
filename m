Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2597C606A31A
	for <nouveau@archiver.kernel.org>; Thu, 22 Oct 2026 23:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g1vizFPD
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5678510E508;
	Thu, 22 Oct 2026 23:43:47 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B464B47B24;
	Thu, 22 Oct 2026 23:24:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792711491;
 b=T/YucBQ4Pddx82ssScavIiam50HChZMSV0tu53GklOQZpAz72IpR17EWsUzD5fV7unr87
 LUNmX2S4sWWKe2WM3HsIPa2ktVxMyk5o1k5mapAUTSsJqw5YH7Nwnh+zTJTZxT6OriGWPae
 ZtX7mGIPm0to0JtH9yatI54ijoQTUseNVX5G3/ag5lu9aAHpIdLMqsdfhNg8+0dM/Op+xwR
 SOj1e4nOfVJ+DBBBsBmP7kuQIdYFDUIiEzYSXSrrFmIAb0lDJFWh4JVpsLG+vMjwFF2P8AU
 tGNIJJ33NMy5V95rg4ZftJkdk+GtWQUNPSgM+FnIwjj7QD/jxMrAkrK0t6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792711491; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WT2TOXMwrCOf5xSTdDSPXtJnpx/lq+nJmOy+mLlD8TI=;
 b=BhO8PcKrUqhXAluYLrfe8ttyQjSRLP4/LOHwFBqzYzt2/tm2VqbC7ZwP68RG+6LNUdpMq
 ldOOyA18nRAdW4xrm6OtBbbZokxJ7x+yf+7UIUq2F+gyZKz61Frg3I10cgIIaQ/LqowV4Df
 1aG30mxeP02DfxrtneJMFwoGiiS+X2a9NgPBMz4K16/uPJ0rMQNeHHntdI/X5IUDx2Mqr0s
 f52ILZRgdDQjYP6zrPD8C12KxHSmIM4TQF3XodqmrGubfJqUEr2LvUtVIPH6dAMWF09fGdB
 LRU/zgrX4zMkIS1YP0LJWioET+/iq7WDo2idQdIkMvqg81EuFzqhD7IzyyLQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F0A864713D
	for <nouveau@lists.freedesktop.org>; Thu, 22 Oct 2026 15:18:29 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com
 [74.125.82.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A2C3410E443
	for <nouveau@lists.freedesktop.org>; Thu, 22 Oct 2026 15:37:19 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-15943c9c005so2354810c88.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 22 Oct 2026 08:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792683439; x=1793288239;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT2TOXMwrCOf5xSTdDSPXtJnpx/lq+nJmOy+mLlD8TI=;
        b=g1vizFPDYX2Oo6c78eTeZElM/fYiKMhcdhYODWtipyzJqYN2eEA2k2kw+6OJK5ofjT
         PWlkVyUu7qTyuWj7Car5ZSdtj3RQATQ2cWwcrCi8JlZzH2Dc4E+o5UUMQRcXRQYAbng4
         AkAAn/oTmR6P6oyGJcF99ngZGkA4sp0NhU48gYdfqYfz7dt9rtuLQPxYRMGHstvTKFz/
         AQqW8SRDhCPJZ5prb81oHY9erWFETlDlK+PZmSdJmF52BYaXKbooau3xq7rPHgTahSJW
         ae4+FvjE24Z0VqDv83dCkQ1PD5JtJDIwljjIQT6mbqYjJXc0GeqiY17k+Ol4J2S3WfOn
         Ua3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683439; x=1793288239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WT2TOXMwrCOf5xSTdDSPXtJnpx/lq+nJmOy+mLlD8TI=;
        b=N0Hqkb2muKHiSCbJa4T1ixhX9Q4HG2JsYLHtAKqDL6fvWv8eK0TMZD/hAzragjTExT
         rcc2pYjzbj5SHhauEQGaeBVQLra7Kg6PFM66qpAKO71h4ViOPH5rYyJEFsnr1f2U5YNh
         kz7V1vx9csJ/t7JyDfROYWQvv7fGtanjANEvPG97cQfJEg2U2T6NR/l/ycEgDqUsEq44
         eM6Fgv/mSj8L6XX2nKWg2CK6fjp70VPIqN78xnPrKGJ8yzqR5HDJMXk7CS5D7cI6I+n7
         uXgYv5qjJ/wKtOLFo3Vwgz0h9VXqEckL2UQqOiaJFp1J2oWgw8OBIseBC6+VC3NvPbf6
         /kMg==
X-Forwarded-Encrypted: i=1;
 AKwUvBymnQVw2xRNbMCKpC17otjHvahAcGfHuFFVO3FGo2Y7sslCjp257lveC7HdgzEPj0yS4zTlf9T8@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJYdrx3W5GBgLKHu1s7Y3dcPbSIZ90XDNnyG2Mko54jQSVl+f7/
	BDxw3FZqJLU2OVJ4b1d3NDwmol+syiQU+bhGbgcUDRUJbmsVssDWlZAq
X-Gm-Gg: AYBFou3YEUhhBu5UqdRiGJ/hG6XElOHMsBGj9X7shUxY3tfMwUU/CwHO3undZrEaatN
	S4WfTfIKewAfPVIb2NyavsZVMSt/vQnxN9zwdKOn9riP2UMt30ktmqUs/3d6x4tuLUaokIeqkey
	sGUyDT86OXhuurIw0rZ8B9Jlda93mJYtdlxYCX2ztZ2ggEeENaB/rQwoT9WVvv5hQo7LzUUM0k/
	qxY+ZlRX0meTBmtZECc2DglqEXKDIJxutdNKLc0K0I3GHY+PDA9IfObaWBX61ccuJF6PHXTpyzs
	aZ4QmN0Zqfu9IMs6xBNJvRnS7RXw2SE2N5+9ea1iSnqBYDhTE3Dr4/KO+nLpOq6O/Y1utM/oXY3
	Xudj3L6vSW0SWVUm6wsAk6JHxJErfRQoPc0QwANIUQ1fVxyVdKmr8VQl/FI34/rhstE3hVrn5qH
	oQs0ZJFMcvsLnudu4MbrShr3Ucl602RuCmA/iqgHlIDEW4uxxdc6enmNHn2O5ZuiGbjNaapy6+y
	2iSqJwuCoku//j1kZchph0rxXqq3jPHC7nO1sfOy5QB1mlLQARFy7/FAsBHIIIYEXfZfB89cb/i
	Z3I=
X-Received: by 2002:a05:701b:2616:b0:182:2feb:a170 with SMTP id
 a92af1059eb24-190a6adcb12mr6334470c88.11.1792683438586;
        Thu, 22 Oct 2026 08:37:18 -0700 (PDT)
Received: from kush-pc ([106.213.87.38])
        by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1903bf5d0a1sm15780435c88.14.2026.10.22.08.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:37:17 -0700 (PDT)
From: Kush Chandak <kushc451@gmail.com>
To: Risto Pajula <or.pajula@gmail.com>
Subject: Re: [PATCH 0/2] drm/nouveau: fix GK107 VDPAU regressions
Date: Thu, 22 Oct 2026 21:07:12 +0530
Message-ID: <20261022153712.11208-1-kushc451@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201225.5975-1-or.pajula@gmail.com>
References: <20260913201225.5975-1-or.pajula@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kushc451@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: IGGVLGLHIJMLJZEHH34KNVCL5UF4W7AO
X-Message-ID-Hash: IGGVLGLHIJMLJZEHH34KNVCL5UF4W7AO
X-Mailman-Approved-At: Thu, 22 Oct 2026 23:24:49 +0000
CC: Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IGGVLGLHIJMLJZEHH34KNVCL5UF4W7AO/>
Archived-At: 
 <https://lore.freedesktop.org/20261022153712.11208-1-kushc451@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 13 Sep 2026 23:12:23 +0300, Risto Pajula wrote:
> This series fixes two independent Nouveau regressions affecting VDPAU
> hardware video decoding on NVIDIA GK107 (Kepler).

I ran into both regressions on a GK208B (GeForce GT 710, NV106) with
VA-API and arrived at the same two fixes. Built against the same nouveau
source, my versions and this series give identical machine code for
gk104.o and uchan.o.

Tested on Ubuntu 26.04 (kernel 7.0.0-38) with the two changes applied
to nouveau, video firmware extracted from NVIDIA 340.108, Mesa 26.0.8
with the VA-API fixes from Mesa MR !45340, and ffmpeg -hwaccel vaapi:

  H.264 1920x1080:  600/600 frames identical to software decoding, 115 fps
  MPEG-2 1920x1080: 300 frames, 164 fps
  no nouveau messages in dmesg

Without patch 1, MSVLD faults with PRIV_VIOLATION on the first frame
and the channel is killed. With only patch 1, decoding blocks for 30 s
in DRM_IOCTL_NOUVEAU_GEM_CPU_PREP and then fails with -EBUSY.

Patch 2 also fixes an out-of-bounds access. Without nonstall_ctor,
nvkm_fifo_oneinit() creates the non-stall event with a single index,
so event->refs[] has one entry, but nvkm_event_get()/nvkm_event_put()
are called with index runl->id and don't check it against index_nr.
The Kepler video engines are on non-zero runlists, so their channels'
non-stall events increment and decrement memory past the end of
refs[].

Both regressions are in stable kernels (since 6.2 and 6.6), so it may
be worth adding

  Cc: stable@vger.kernel.org

to both patches.

Tested-by: Kush Chandak <kushc451@gmail.com>

I used an AI assistant (Claude) to help debug and test this.
