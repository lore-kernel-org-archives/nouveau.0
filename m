Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE736C43458
	for <nouveau@archiver.kernel.org>; Mon, 13 Jul 2026 20:58:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 44F8010EB0E;
	Mon, 13 Jul 2026 20:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jgebq3gx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AAEFD470E1;
	Mon, 13 Jul 2026 20:42:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783975370;
 b=k4bsR0DkuY8Se82sJe2/yh9geVVGP5Rf/V9M/DsnCxyFXsqmjALE7Xg/jA+tzIp+Apsep
 eNbFzy4McGL6qKjexQUQIqnYetItt9oC6EymjtxYJXsuRKulArIK4C7k+iHvPH/gxihuh/F
 K0kwcjvuIANha02dLj10GESBQ67tgv+kS23Z8W8DHzWpnOJXTY4BwqemOSvB5nEbTH+KYSp
 1YgAKnrJ6Yt0U/DD/aPbB47S9mGYvfFwc1cAiwOfeZEYingJtoWH26WHtjjEqnAUvnehdb8
 YoJDEl/pH8PuDDmXzE+SUz4LqgCDMS2qz1s+fj48ZB4HkYvL71V79cqa9y2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783975370; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oNqruOZIzwruIpGvkzB4DJORZxeTGWU0clCn+vXfCzI=;
 b=Wv35fmyP8/HQDp7vId+vOzo22zGIe3hp1s2x5q0uILtucVlqNNLCuJU4bGGtDQmk9bqlJ
 CDdHQYsXsSbQMpGkKSD6wjyz6y3UCqiXpREpk+AoK8SUWQgt5B0f9bXeNyV8iD27AvfGjZ/
 Z72UIZvPlbrkCsVnRvkaeewftpr1qfXQC8Vv0VEuaZ7rwtJCv7UmkhXs/4dQ3Aa31mnwxHK
 i6y7N6g4B2EQkdP9AXLFqaW5sALs6QHGJSb+d7kfNmX6898bUqzRCH/hgIVgUHaJswartda
 WHom7UWXJW6wjo8j80n9SJw9g7tl65p8vidH3pSXYadbylUaBxdjYNEbmrnw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 35A1C46DD6
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 20:42:48 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 98AD210EB0C
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 20:57:59 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-38e07ebd263so242063a91.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 13 Jul 2026 13:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783976279; x=1784581079;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNqruOZIzwruIpGvkzB4DJORZxeTGWU0clCn+vXfCzI=;
        b=jgebq3gxPdtPfElJHmkd6gNzn7TKR4g7uiAYLeBenpeBY0uZDc1gecA/kdihMva6/l
         lRiQp2Gk43IdKQBD/t23QRXk3Xdyobxmfej8mHtCczyQNZJZDBw05V4WjqTXV+vAcIHg
         vqBNFrriONnM6VjQMNDTx12jRseOjZyjk2aD+yoPCq2FVKRhip7vjNf4iR82NW90qVcS
         y7F4hqCjs04VatzDdCny0sD/cNVf2LMOA1XisB0vgm/+P4BSJD9VIwCtJbIGtU51E4Em
         8XSosJB4cGI3m8807t0zOrIcJpLgW3NNpUOl0dKLEpFGXZ6Xh/0JgqIxDgg4dxscJbo5
         5pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783976279; x=1784581079;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oNqruOZIzwruIpGvkzB4DJORZxeTGWU0clCn+vXfCzI=;
        b=gQ0dZTApYm/cXmv8DVD8LEXNFxiQCcYocsiAV2fPF5kBsD1KrDOxTsgSkRg/GfTrpc
         wTasznFKJryJ7/aRG3Ju6JgzjHpmrrn9qPW8B88VWayR8gX1/6AM6wWv9ic12d/R3E8q
         jwsTbX/GrBoWLqhmR7hZ/gt6UijyfKsxU/wZO32LNV6kXvjtG72dj4mVPAEpsZ1NtXja
         wo+uanGoBvWN/3GwndEFXBK8FzCdzNvxdkrWRHy2D70sQx4Dbyu/pLWIf9SB3+iRxSaO
         LT+IGjB2ki25QOXvX/OHrB9v/8MdR0A1h45Xch4UAGwgS/vKmlTUCG6OanYbaBdy8+lL
         MNRA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqpVHGMEbdWJMoLP3hMUmHK4/x/YtFkVqXrpMLDTi6MVXhNoyo2Ht2XQ+/9xFb7qHvGKwcaSavt@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv+FVUpxh9AW8uHIzQSE8TuT2q8PT1uQ4hSXXU9FYBeBbVn1pJ
	2Eesr+rKHeuSwEHpMfwxbow6hkb3Gj2fKtGzl3bTEkkyIQI+zxeWL92/
X-Gm-Gg: AfdE7ckSpYmei2CmDTLGHvGniuaPf40kBJY3ZbR8SEPi2kbK2eDGOLnAGiFA0zUCoyh
	NEjb904oBA940NPv4+8kxXplS4ZlCEuF31jHVCkbqoTiuf82WD9Gwh8mEdZF7k5ee8b/bSC3+dz
	o5qSUZ5dr6zK7zIPm0wRRg3zVCPtD3MTis8lF511jUMRonFknOUjQ1yirFLC923U49ifs8KvAh1
	+TbMMeCdGr0/pz1MP6ssJbLB6QwbDHFM44wgWIv7W2AockBpFDpUuQtuBo5YdkA3kTc17wFTSO+
	aOvNhJ8fK9CetJ/DqMpTLiuCq38X75ssQdj5UYNLU6Dtiq8DgsseStj5zJ4cOu6GhWed8RUS6PY
	AgXZGzPe+G/Jena6+/re3hUl3QTiGUyGQAwW3DszHfAASb25jn/wnn3WGlrz2ck03rIzjzV4hdv
	0nyUiJSf8avpyZm3OrXcFApCznP3jUIe0qpJcmgW2xivOdcTafQnm9OyvmfvbvbjwvSw==
X-Received: by 2002:a17:90a:d88b:b0:381:528a:808c with SMTP id
 98e67ed59e1d1-38dc75e3d4fmr9572711a91.12.1783976279067;
        Mon, 13 Jul 2026 13:57:59 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38e172b6ce6sm403816a91.1.2026.07.13.13.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:57:58 -0700 (PDT)
Date: Mon, 13 Jul 2026 13:57:55 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <alVRU38lMfvmUFqJ@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
 <alG2-RSitzPWClAX@skinsburskii>
 <20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>
Message-ID-Hash: DFHA4JPGXYX47YJ6NJNAQDS2S4CO4DT5
X-Message-ID-Hash: DFHA4JPGXYX47YJ6NJNAQDS2S4CO4DT5
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: akhilesh@ee.iitb.ac.in, corbet@lwn.net, dakr@kernel.org, david@kernel.org,
 decui@microsoft.com, haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
 kys@microsoft.com, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, longli@microsoft.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 wei.liu@kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DFHA4JPGXYX47YJ6NJNAQDS2S4CO4DT5/>
Archived-At: <https://lore.freedesktop.org/alVRU38lMfvmUFqJ@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 10:49:50PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 20:22:33 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > On Fri, Jul 10, 2026 at 03:11:51PM -0700, Andrew Morton wrote:
> > > On Fri, 10 Jul 2026 14:26:20 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > > 
> > > > This series extends the HMM framework to support userfaultfd-backed memory
> > > > by allowing the mmap read lock to be dropped during hmm_range_fault().
> > > 
> > > Thanks.  This seems fairly mature and mostly-reviewed so I'll give it a
> > > spin in mm.git's mm-new branch.
> > > 
> > > Unfortunately Sashiko wasn't able to apply this or v7.  I'm not sure
> > > what base you were using.  Hopefully there's a reason for a v9 so we
> > > can retry this.
> > > 
> > 
> > I rebased this series on top of mm-new right before sending it out.
> > Should I have used a different branch?
> 
> mm-new is good - Sashiko attempts that.  But it's changing rapidly at
> this point in the development cycle.
> 

I’d like to send another revision addressing a few comments and also
replace the `max/max_t` check with something simpler.

Which branch should I base it on so that Sashiko can apply it
successfully?

Or would it be better to send fixups against `mm-new`?

Thanks, Stanislav
