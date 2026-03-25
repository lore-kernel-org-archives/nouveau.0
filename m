Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646AD103A9BE
	for <nouveau@archiver.kernel.org>; Wed, 25 Mar 2026 11:44:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B3A8710E85D;
	Wed, 25 Mar 2026 11:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kvvAHspv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1248B452F1;
	Wed, 25 Mar 2026 11:33:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774438402;
 b=xo8Mr0BgW+ZGqvHVYvWqPb/pgTyJxwaflX4sxZ+tuOMymH9UomMii7qDMpc2epmFsaDS8
 Z1d+Sr99nQzfrutHR42NGUICgyovvkpg67DMn+vj9s/7Zbn5pAwiqR6XzW24nf7rj4GWTCw
 KAa1RVyiw3X5v2QV8H1SBEOVzDRGToib+9RxCIb/XHOrgPVaQSz+7291Cvz9amxUo9hP1eT
 0vsJ7yonffY7PpDyZRC++lWE0wDjOiJY5qtDT/u2PaAP1CiDHLIgNVO8Ee0A7e4YGVQVr0z
 wUFZxd/ETbCqGYfRlYNu/mheRXHBDqMVEa+Wnio7J2gjGMfGwGZCsZGCmw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774438402; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xUNk5DBarhia0VP1Ved6SPUtX2O9K1Wf39PDjoKefxc=;
 b=jp7K5g+aHw7hsl8uImp9DZZxfnvkTI9uTTl9aIFV2c0Vwuga+FunsQuTGaxD6jwejavcB
 08QIEDicR3lkp5dbfOYHU7+jqaTSsgexmL+UiN0qOuJZm25CZodKYHlzRkXF3NnQjKYoIe7
 Eh3nExI+YPn2P4obks3kCEzyqGcz+wTiWJY//Uehg/MRX6vdv23Vu0rDIexAb7PZYFXMrd9
 UXae3sEwctzOMPKRF+OpEc0PtjLcCx+vQwIF7WJBoYJef/HnIuUyePbVCWRln7Os3V/++hp
 +3dNMoAppXj+n4jTBV+z3cDzRo0hHkmT/VKeSDIFrUyfywv2uT10pCM+Bu4Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1289744F5D
	for <nouveau@lists.freedesktop.org>; Wed, 25 Mar 2026 11:33:20 +0000 (UTC)
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com
 [209.85.208.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7261310E7FA
	for <nouveau@lists.freedesktop.org>; Wed, 25 Mar 2026 11:44:26 +0000 (UTC)
Received: by mail-ed1-f73.google.com with SMTP id
 4fb4d7f45d1cf-6687ddbbddbso6403994a12.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 25 Mar 2026 04:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774439065; x=1775043865;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUNk5DBarhia0VP1Ved6SPUtX2O9K1Wf39PDjoKefxc=;
        b=kvvAHspvHg6SttDRRKuSQJSK69WuFc0BLUiEq2M6neGUGZXQmLRAgukcL/ux5mhUyI
         3uwclg5fWXEo7aoPhBOP3DsOnBZVvHARSJMMNJe+K+RB8ifPbBt22ynUkLluSu5kc8RW
         yHx/7CFO39wisW2+JmNXoCa2MMjOm5lZtx6DVPdc87p3+d4LOSJKGAo7l+L1OntqcnOr
         yfUywMb32m4TVgFAFfF8NCbjaWSHAqjQ9WCB9v3JPcnPJzpwpLvSrKEJTvavqzyVGz0y
         rzgBKW8FGnO2dk2ju/QD8GSPML86KhfQj2CAMPwwL9BpX8vpn8/REMMLGRFMsSFJwI/V
         iAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439065; x=1775043865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUNk5DBarhia0VP1Ved6SPUtX2O9K1Wf39PDjoKefxc=;
        b=rl8T82KixVt1hbyiciU5s6ZCVLsLBMrf/vobKf2CLv/96beq6uHocU+agav9TKPImF
         UTBes2ZCxFtH9joTw+nnYnVvk1nKxyg6A8+ouycierRwrXS39SHQDPthu0yU+OH1FBXg
         SSvi+dOgIz0K99u2FSp1+B1sSaxlIX8kfpYhbjkXh+4+8lWRpnSaVUsW9VvR00XSPiF4
         awigkGOcK81XXy7mRAkCQZF+1U7ogjtb3w1B5v/PS7Xrnr4uYr6gqy/G2nidD/dHwbpZ
         OJsjMD7roaxTevlEZ/AyV2xFtkuz+yRQsHr0/hb6VOEWEehgvT1m+e4eYRj/+71gjwSN
         ifQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkN8JZdgvnhuDO+Rt62+9Qsg292kjzK7eN7eWoPsztdmsBHZcaja/z2/tjfi8kspon6cz2UTCN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgLSfr+SsxD37L64Jr1TrRfbQZyYdEGLso1ZJIL3CsginSJewq
	/aRsuKqiZF3XVNNqd6EtOEmtSy4gb2Ad34v4EVTjw0ttrUSJmHczjHh7g4SFKjqnMxtXevQD8A3
	Z8CU0G261jp4rKsDj/g==
X-Received: from edgg21.prod.google.com
 ([2002:a05:6402:1ed5:b0:668:8a5e:6647])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2116:b0:667:7fcb:3a2c with SMTP id
 4fb4d7f45d1cf-66a826b30b2mr2152133a12.24.1774439064945;
 Wed, 25 Mar 2026 04:44:24 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:44:23 +0000
In-Reply-To: <20260325003921.3420-1-dakr@kernel.org>
Mime-Version: 1.0
References: <20260325003921.3420-1-dakr@kernel.org>
Message-ID: <acPKl5HXwd6e4Sl2@google.com>
Subject: Re: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any
 Coherent<T>
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: 3IJOO374JILGZF4YIDZFO5JKNA44I7DM
X-Message-ID-Hash: 3IJOO374JILGZF4YIDZFO5JKNA44I7DM
X-MailFrom: 
 3mMrDaQkKB5Ev63xzCJ2619916z.x9789FGzvF63DED.0CzzyzD5E9A.9C1@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: acourbot@nvidia.com, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com, a.hindborg@kernel.org,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3IJOO374JILGZF4YIDZFO5JKNA44I7DM/>
Archived-At: <https://lore.freedesktop.org/acPKl5HXwd6e4Sl2@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Mar 25, 2026 at 01:39:15AM +0100, Danilo Krummrich wrote:
> Generalize write_dma() from &Coherent<[u8]> to &Coherent<T> where
> T: KnownSize + AsBytes + ?Sized. The function body only uses as_ptr()
> and size(), which work for any such T, so there is no reason to
> restrict it to byte slices.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
