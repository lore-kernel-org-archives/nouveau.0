Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A027DC44501
	for <nouveau@archiver.kernel.org>; Mon, 13 Jul 2026 23:18:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CB8CA10EB80;
	Mon, 13 Jul 2026 23:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="nZler/ys";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 037BB47118;
	Mon, 13 Jul 2026 23:03:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783983793;
 b=uh9nbdGsSQ4zjwYT3chFTdovJxTJhIZ05cB5tUkwqu5LUQh6N843UTG+n4u8QUqt+ocft
 jJq8alj25Z/vmtX1/gosu4mXhvdg5CRTlL52abphG5eXC9bCDJJgLJ2h30WXIcWuZ9wyApD
 OOy6Mk9lr7Qw7sNOjv/KPVV8EbInZWpCfmPO6a2maBP0AUQTYUFzHpwXamYBt8qAq3ml8Sp
 lGosT57MshXTZNkbz/54POsaA5+s609k155MvQYRU1JmYu7DUBQ93ymb17PkH+6+o+1M/Et
 Xb/1FXVkCFB7u7pTMGl7twLXnJTz/FQMV16+2Bg8IXOkRHHtGEg8rtPdh3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783983793; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=f5EDysaFuDNgPurWzUMZsX1j7CfSV1oHh5QC4rjPyqo=;
 b=fa0nqmlmeq15BvvqOj7wzOgZp/ZxTWthSoZeEY3HbQ2wgQloCj/QDHAU6bH3IvP4v3Xoc
 i3LvPYG6wQ8VQC5y9u6bfiklpdkgVUSeiecgtPMhfQWVSUZmVOCVxT2lAclIphy2WjLWamR
 0RtacinM/PMvhtwsvBiaT7QPlVZYtFiNX1DE9vk2+oA1w+mmwsFAd7UIdbD87QNXAIo0rgt
 bXV1R7mNH8iWqEr3DASaSsOFaVI+R0Gu0a/DBatFANZcfJxAxbqI3dHVKnootFycMIJVNAv
 1YS7D9f/ds82sQWoUyhyM9j6F+PqAuZmIsS+Cvy3WhXK11EsStDaCmkZOejA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3437646DD6
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 23:03:11 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C67A310EB6A;
	Mon, 13 Jul 2026 23:18:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B6CC4170A;
	Mon, 13 Jul 2026 23:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E807B1F000E9;
	Mon, 13 Jul 2026 23:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783984702;
	bh=f5EDysaFuDNgPurWzUMZsX1j7CfSV1oHh5QC4rjPyqo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nZler/ysO6IBo934carYd2XqUDIMaFaeiUMVtZhtTP9n+0D4DjPtZs2k+yOsT1Fx5
	 TLAeqjC/pvL6zMH2/jytpd4FVcVHGbYHPanj59p1Zh69G+c1G/sD/6MLodFGtLct3E
	 XADqVu2KrZngtk7/bOTMrI43ujnTM80o4BDpBedk=
Date: Mon, 13 Jul 2026 16:18:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v8 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
Message-Id: <20260713161820.8f72577b91c730a2e853f6a5@linux-foundation.org>
In-Reply-To: <alUZZYIPY-UkhpY4@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
	<178371881847.900500.8789369230260725500.stgit@skinsburskii>
	<20260710151222.ddb35eab9c81a8720491464a@linux-foundation.org>
	<alG1k3JsoywE2CBM@skinsburskii>
	<20260710224833.9caf2a0a9906f0515e326a45@linux-foundation.org>
	<alUZZYIPY-UkhpY4@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KP7W3ETIT2RRD2XRCQL33PDWOS5ZDWA2
X-Message-ID-Hash: KP7W3ETIT2RRD2XRCQL33PDWOS5ZDWA2
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KP7W3ETIT2RRD2XRCQL33PDWOS5ZDWA2/>
Archived-At: 
 <https://lore.freedesktop.org/20260713161820.8f72577b91c730a2e853f6a5@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 13 Jul 2026 09:59:17 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> > > I'm not sure... The "timeout - jiffies" can become negative.
> > > Won't 1UL convert both of them to "UL" and thus make the comparison
> > > overflow?
> > 
> > `timeout' and `jiffies' are both unsigned long.
> 
> Yeah, I’m sorry for the sloppy wording.
> 
> What I meant was: will "max(timeout - jiffies, 1UL)" correctly handle
> the case where jiffies < timeout?

That will return `timeout - jiffies': a smallish positive number.

I'm not sure what's intended here.  Perhaps the code should be
using time_after() or similar?
