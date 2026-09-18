Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1171C88E75
	for <nouveau@archiver.kernel.org>; Fri, 18 Sep 2026 04:53:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 70B6410F182;
	Fri, 18 Sep 2026 04:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NZQ6hzNU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 950EC482B1;
	Fri, 18 Sep 2026 04:35:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789706134;
 b=x39hKc1uUhcTOx5QrZc27Cazg26GMXVLvqAhFMEakV+KfpgR/L/RDT0cVZyvck17Dkn0T
 TuaIoO/5dRFnGOCzmxVdVRZsuRhG4Tts0sms+UQfnyUSUdESr1Kx0QmPvCtbKgkI00KQ7T7
 sn0Yz4nSTw8M8ENQwjdIWHRBl2NDWu9gkWgCyDcRQZ6CkqjTLe43Tgml/eib2CFJR4w9nqY
 PYh/OEFwxtAabHdOUECo7IivZppOKWlBUcI/tr+8bVG+q5F5Iph0jFxEqUlVPzKGQCHLpg/
 RuKSKX4vrkGhnyaMUoqFZGmh0XLYAVSHDsWgHnRC8eI6HbS9wLZhymJS6xyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789706134; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=z+CZ17DpPcTIMS3JOrKadGqKlhsKxoet5cv2gSH16lc=;
 b=TN4QYXNWA7sXc3fFmsaEqpa5sK/8SwIzMmxYUmPFdlIdkVaXnl2VUP3YRhED/u9vFMjb1
 mDWuScRyooruwQe5UorqRIiLblY12JN99StKk6Nt2q5G4/Z5B1dbZBvvX3sH1eYvCTa+K/d
 eQdMkREMrRVGAFmvz4SxPZCKyKZTGFLc4QwdmeDG31RkFHPe73QGpN1mionfLphS5KLwBrs
 8cLdBf/ncnaef4Dn+Ppw4s7VYqWY1xrBtatYTe0HkAprNtkChkDA55TaSYviyFUTy+nutDC
 5LpVveApwCxzCYo0xFLErwlhiSZg96dG8+mJISMtw9zIOpl3bBuTTHVYkYTQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EFF1B482AA
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 04:35:30 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com
 [74.125.224.140])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 95CE710F178
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 04:53:09 +0000 (UTC)
Received: by mail-yx2-f12.google.com with SMTP id
 956f58d0204a3-66e4aac929eso392985d50.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 21:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789707188; cv=none;
        d=google.com; s=arc-20260327;
        b=SgWcsvex1TgC7xti8f4DmrGIoheesg2/onQJazS5rX6tMJNoWuw0w1+9pNCNqqTzch
         8bZMRgoehKZe/et4ewor8bdZvBEh3TbkjMVYXSa9n2Xe487qsvujHz5RY8bFdBAgWkQk
         Y8Y1VNJwOpxIGN9QSffMTx6Q5exvd+1xlAt/QpfIeTNo06NtNPluLTWsOA2QPoHHxVUI
         2Z8Px4Ot4pCD8wbDw+18L9BJmd6r4Uq89tR7RDyCZAPtWr93UysLu7PAHv9jtFKzcxMN
         WbTtuUZTvqj1b5kP3mfSUCDTx5i6k4szTXuuxkjj7913rTXSpH1lhPyKMg0KkIcW1lrs
         ZzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+CZ17DpPcTIMS3JOrKadGqKlhsKxoet5cv2gSH16lc=;
        fh=+RKsQaeDDG5oN0XlfvnHv9BuQFtgYliPlZn3UQR2+pM=;
        b=X4YFmriEPdL71etO6xCNJ9NzXnjgTILnwZ3jes8rKaEZd22Now18+2P3+oc3Q+Rs/2
         wOA4HML+T7gTngYcB+hlp7cJ7o3yYTS59BQb4iXFZYbzmgKKylzTnukaGWwnOncxrjjI
         jcYgZXVoAC5inZUqNZMjdlLXXUo8r2TCjTc5wMoYohlb1PJN7J73zLHVuHd2cN9H9G31
         2dD8McLQqhtDgcneacvDhioXHS2/qDsiF2sIEDkgExdoTGy97rn4bV8patTuteDo44/b
         IcR4z40Hwo6aaPZqs8jAreF0peMRUNDUrOG7qUMWnmJgBWQaqipmsMtj+8/7L1PoeMM4
         CRbg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789707188; x=1790311988;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+CZ17DpPcTIMS3JOrKadGqKlhsKxoet5cv2gSH16lc=;
        b=NZQ6hzNUSb5U5sHKjLLBZR9mD0yzQ2ZrC8956XAUMZQt5h9xuKu8YRgiE7kVkf82VF
         WG5ETOAAQ+mv7Dbo4y3Ht4hHQJvJKt0HZNh02q6284TGXfblzBaMDe2Jxrcajl/wn7NE
         eSjxSTBQnDkgb5wC3x7uwA3D+LdVoWbQJyOzJM+RiIXSDaWZTHI4bwkltbAIQ16UtIp2
         RgBOIykCvAclE4O+GRy2Q21VHXrfAJDlBox3Z5+RB3RLjzLTU4Pa4vIAWkhISNHfH7mK
         uUMJO11BRXyFT5LdQh6WxbVgloExeahCM5G2qDVzGrNIyPfDyNx2mZTkqzukDHtfDReT
         TEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789707188; x=1790311988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+CZ17DpPcTIMS3JOrKadGqKlhsKxoet5cv2gSH16lc=;
        b=Z+vBW1qnW5QdjQebjwD+pKfBQtapIPStA4TaxfqZehclScSJCW9qkLoPUpPFRhedaq
         Lq6sJyHMlnbx4B9lFzvsXQxR93EJY5X0qiyfrr8CYTzsbqGiSKBaBN/rxcjcPx0HVUNm
         J4OyWck5IfmIoHS0QZSmQ6CPy5HZbDFfpqonKfqMLyDH20/g4BKZu+EXhKOfSWoZItxV
         mXciO/vEMdTiauNFKhgCHCdCOSBy8EgXlsUN/Qf85eE85FN/Oz4HLVM+dLlRyit/4NwQ
         hxLHTlN8QK5yT68VjtRVdEhVCnm2Rg8sYsZu8p1vjpyE8PIovCvBh93IPHuLh3VY44Mt
         J6sA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwA5h48QKykJ0OoKzS+naaBVjR9voyjqcSVa8/csd6DpTL2WqA/xG5T9L/JA+Et8karvUJr5H90@lists.freedesktop.org
X-Gm-Message-State: AFuF++mVcsMubpOnMEkR66yfdGZbVNiQJ4MNaOYfDtylheZbOWi/OerK
	NZ6QYfQR5jXYHjeuwVBaw+MP1APgRQ4OuPExIhCJBy0wzWTkQZgm+mfBexqOSA7XfGROMKOLusM
	FISPH08LITGc5cJRcsEKact9WRIp5Xn4=
X-Gm-Gg: AYBFou1eBYYiD1dWOJ2U2sio5qPRhWU48QQqv4p1kPb+JTSt2mPzkpY5RGIhBO4SOdj
	lHLgQTyjvSgw/ONa5gZ1dzkglhVAKY1UrLKOSGgcdihWJp3c5cp5bMcc2/x6tGgfhLkjh6ZfmAG
	yYq5t05Gn55qYhiHgJJYP7XW/HAaXqdFUGuiOjtRSslpDegUIVnc8scE3zmp1tsXXs+ur+2Fon8
	J54nz7XGCG6xyT1wMcbxc5APVh1WoclUM02HbmkuchrkaYcEqa75V62W75wReN1eAp5FR2/CCju
	SOAu7Nr0GMCYSFL5IgOEEZ+FtiegyjU+xwkGFJuTmzCzgb0VmWvyTi+Omnw5PCDMA9HnqqPfUTu
	OJ478GX+54KUhaQDJuVQgQt8fZwNW01ZXbDveR/ZEx1ux
X-Received: by 2002:a05:690e:bc3:b0:671:541e:2bc7 with SMTP id
 956f58d0204a3-6717fd8de49mr381411d50.58.1789707188354; Thu, 17 Sep 2026
 21:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260815-null-fixes-v1-0-0df9dda951fb@gmail.com>
 <20260815-null-fixes-v1-1-0df9dda951fb@gmail.com>
 <bd730e30c96bea38d8430460ee73f073e280374c.camel@redhat.com>
In-Reply-To: <bd730e30c96bea38d8430460ee73f073e280374c.camel@redhat.com>
From: jim.cromie@gmail.com
Date: Thu, 17 Sep 2026 22:52:42 -0600
X-Gm-Features: AcwNN1WDOVB-bJ1pAJB3qllpj7DcCDRyteoOendxDaWbzrIb47hYb-rm-3IA-rQ
Message-ID: 
 <CAJfuBxwq83qUNd==gu+uK73guPfohN24q2-9iNamincgpt=EOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Fix NULL pointer dereferences in
 GETPARAM ioctl
To: lyude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KUN5WD36IHXY64PNV5S352G2MQCNBDOH
X-Message-ID-Hash: KUN5WD36IHXY64PNV5S352G2MQCNBDOH
X-MailFrom: jim.cromie@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KUN5WD36IHXY64PNV5S352G2MQCNBDOH/>
Archived-At: 
 <https://lore.freedesktop.org/CAJfuBxwq83qUNd==gu+uK73guPfohN24q2-9iNamincgpt=EOQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Sep 17, 2026 at 2:26=E2=80=AFPM <lyude@redhat.com> wrote:
>
> On Sat, 2026-08-15 at 11:30 -0600, Jim Cromie wrote:
> > When hardware or firmware initialization fails, the graphics engine
> > (gr) or device functions may remain NULL. Attempting to access these
> > during the GETPARAM ioctl (e.g., NOUVEAU_GETPARAM_GRAPH_UNITS)
> > results
> > in a kernel NULL pointer dereference, causing a crash when userspace
> > (GNOME/Mesa) attempts to probe the device.
> >
> > Add safety checks for 'gr', 'gr->func', and 'nvkm_device->func' in
> > the
> > ioctl handler. Return -ENODEV to signal the missing hardware state to
> > userspace, and use NV_ERROR_ONCE to provide diagnostic proof in the
> > kernel log without risking a console flood.
> >
> > RFC:
> >
> > These crashes may not be repeatable, they happened while I was trying
> > to build nouveau as a builtin module, with binary blobs in the kernel
> > image, on a laptop with an encrypted disk.  Gemini tells me this
> > won't
> > work, so I punted.
>
> "Gemini tells me this won't work, so I punted."
>
> I'm sorry, what exactly do you mean here? And could you clarify what
> LLMs were used for in writing this series? Code generation, analysis,
> etc.?

Gemini CLI v0.50.0 - or earlier, at that time.

these were drive-by patches I did while testing a patchset on HW.
The bootlogs showed a null ptr splat
I threw the logs to gemini, it tracked down the bug.
the null ptr b4 deref was rather obvious.

at time of writing there was also some FW churn going on,
and it felt un-repeatable wo screwing with fwupd, which I wasnt gonna do.
Plus the test scenario felt like it gonna fall apart.

Since then Ive been merging it into builds for HW installs,
I recently forgot to merge them, and one occurred immediately

Sep 16 22:53:28 frodo kernel: Linux version
7.3.0-rc3-rhx-00051-g3078971ab959 (jimc@frodo) (gcc (GCC) 16.2.1
20260819 (Red Hat 16.2.1-2), GNU ld version 2.46.1-1.fc44) #>
Sep 16 22:53:28 frodo kernel: Command line:
BOOT_IMAGE=3D(hd0,gpt2)/vmlinuz-7.3.0-rc3-rhx-00051-g3078971ab959
root=3DUUID=3D66f47421-b9ff-49ca-9257-0216463436c2 ro rootflags=3Ds>
Sep 16 22:53:28 frodo kernel: BIOS-provided physical RAM map:
...
Sep 16 22:54:53 frodo kernel: BUG: kernel NULL pointer dereference,
address: 00000000000000f0
Sep 16 22:54:53 frodo kernel: #PF: supervisor read access in kernel mode
Sep 16 22:54:53 frodo kernel: #PF: error_code(0x0000) - not-present page
Sep 16 22:54:53 frodo kernel: PGD 0 P4D 0
Sep 16 22:54:53 frodo kernel: Oops: Oops: 0000 [#3] SMP NOPTI
Sep 16 22:54:53 frodo kernel: CPU: 2 UID: 60579 PID: 2445 Comm:
gnome-shell Tainted: G      D
7.3.0-rc3-rhx-00051-g3078971ab959 #10 PREEMPT(lazy)
Sep 16 22:54:53 frodo kernel: Tainted: [D]=3DDIE
Sep 16 22:54:53 frodo kernel: Hardware name: ASUSTeK COMPUTER INC.
ASUS TUF Gaming A17 FA706QE_TUF706QE/FA706QE, BIOS FA706QE.311
11/06/2025
Sep 16 22:54:53 frodo kernel: RIP:
0010:nouveau_abi16_ioctl_get_zcull_info+0x17/0xa0 [nouveau]
Sep 16 22:54:53 frodo kernel: Code: 00 00 00 90 90 90 90 90 90 90 90
90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 47 40 48 8b
00 48 8b 80 70 02 00 00 <80> b8>
Sep 16 22:54:53 frodo kernel: RSP: 0018:ffffd36e025dbbb0 EFLAGS: 00010202
Sep 16 22:54:53 frodo kernel: RAX: 0000000000000000 RBX:
0000000000000020 RCX: 0000000000000020
Sep 16 22:54:53 frodo kernel: RDX: ffff8c547be52600 RSI:
ffffd36e025dbc50 RDI: ffff8c545440b800
Sep 16 22:54:53 frodo kernel: RBP: ffff8c547be52600 R08:
ffffd36e025dbc50 R09: ffffd36e025dbc50
Sep 16 22:54:53 frodo kernel: R10: 0000000000000030 R11:
ffff8c5454600098 R12: ffff8c545440b800
Sep 16 22:54:53 frodo kernel: R13: ffffffffc31569e0 R14:
ffffd36e025dbc50 R15: 0000000080306453
Sep 16 22:54:53 frodo kernel: FS:  00007fa46fa77880(0000)
GS:ffff8c576ab7a000(0000) knlGS:0000000000000000
Sep 16 22:54:53 frodo kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
Sep 16 22:54:53 frodo kernel: CR2: 00000000000000f0 CR3:
000000011df78000 CR4: 0000000000f50ef0
Sep 16 22:54:53 frodo kernel: PKRU: 55555554
Sep 16 22:54:53 frodo kernel: Call Trace:
Sep 16 22:54:53 frodo kernel:  <TASK>
Sep 16 22:54:53 frodo kernel:  drm_ioctl_kernel+0xae/0x100
Sep 16 22:54:53 frodo kernel:  drm_ioctl+0x2e0/0x560
Sep 16 22:54:53 frodo kernel:  ?
__pfx_nouveau_abi16_ioctl_get_zcull_info+0x10/0x10 [nouveau]
Sep 16 22:54:53 frodo kernel:  nouveau_drm_ioctl+0x58/0xc0 [nouveau]
Sep 16 22:54:53 frodo kernel:  __x64_sys_ioctl+0xb9/0x100
Sep 16 22:54:53 frodo kernel:  ? do_syscall_64+0xfa/0x470
Sep 16 22:54:53 frodo kernel:  do_syscall_64+0xbe/0x470

if youd like, I can trim that part of the commit - msg
or just edit out the noise.

>
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
