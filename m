Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE623C43458
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 05:48:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D17E910E596;
	Sat, 11 Jul 2026 05:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zxP6H3RU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 197E3470AD;
	Sat, 11 Jul 2026 05:33:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783748011;
 b=0CIyY+/8s2pO02/B/egI9DVH72wkHxp/bM5o9IGEEsCgwrnZrnttX/D1KjYmYe0XmBLmD
 uxiFu4b7ssOwqw/pcXvcsw1pNQXKAYjV3H2gURWgh9FAaRzBAIsx9giZGWI4JeZqPt8uYyj
 f6eRl3Z90nqx1kfseMf1C5ytYwI/2ot5FdzUH8GpU8rHPt0yOZlJWFWsBTEXhiCUCxhxqdj
 jZET4cWp1FeBbFQI+EXcC0mPRUi3NPjqUJRgAHSMfHKeYDcwuTSJKJPc4iESegq9i3neBhU
 Ea9QUTxZJoG5TkFI8GJwDQH7QPkJNKt83Gx9oh4ZYtdAPcpn3LsvFHJzISZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783748011; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/bm56TdW2Rt1TzYZP4AwroZ1H/akE8N7PaZmAo9v49o=;
 b=kiuj0jmZn1WsTlrhSOsr6KOZOFphuozjujoYeP1fjo9e4ACdwCV/+vUO0jyP5BJlcEQql
 U/RTz4mPXC5+rubIZ+gdLBQvuE5hZCtQYdUjgulFheM0cFomp2uzYL/1w/OTHoEOHPUCNii
 CRz+6l1OP2oGr0u3WAlYOGHVEDSF2tx0URvYJ3h0tIeV6ebmlYA52JhDRa5Q0RfkwIJvep/
 vsXMnR1EjCjwspvyb0ZcJiavTTCtFkDB8oSrrFvMv7r7eVYuaYzRD1TtfDScwLxMndFpL9C
 xKv4HL6tXDxj+aQ6jqQ0nYZ1fKP38oExM8PiCe7uYX9bHLc9gcaaPmoLIprg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7E40646FE8
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 05:33:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1627D10E2D4;
	Sat, 11 Jul 2026 05:48:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 839E54166C;
	Sat, 11 Jul 2026 05:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B1C1F000E9;
	Sat, 11 Jul 2026 05:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783748915;
	bh=/bm56TdW2Rt1TzYZP4AwroZ1H/akE8N7PaZmAo9v49o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=zxP6H3RUmBd6ihlhUQIdRJzfv+dWAy7/NIa1aujz+UJUigwYO9G60/3Bm1HoqfjnX
	 DZhiti+OpHf6AgYSszNldBtjYCKgg5QG6160LxG4/45mDd4arD7V/RUmAhgcW9bWTx
	 E9/cf5f5XfN6+ulL7h4VwT+i3BR5zKS6NdueS7go=
Date: Fri, 10 Jul 2026 22:48:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v8 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
Message-Id: <20260710224833.9caf2a0a9906f0515e326a45@linux-foundation.org>
In-Reply-To: <alG1k3JsoywE2CBM@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
	<178371881847.900500.8789369230260725500.stgit@skinsburskii>
	<20260710151222.ddb35eab9c81a8720491464a@linux-foundation.org>
	<alG1k3JsoywE2CBM@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: P4QOLY6YUG2UNXYBUQZ55NEAYXQVSIMR
X-Message-ID-Hash: P4QOLY6YUG2UNXYBUQZ55NEAYXQVSIMR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P4QOLY6YUG2UNXYBUQZ55NEAYXQVSIMR/>
Archived-At: 
 <https://lore.freedesktop.org/20260710224833.9caf2a0a9906f0515e326a45@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 10 Jul 2026 20:16:35 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> On Fri, Jul 10, 2026 at 03:12:22PM -0700, Andrew Morton wrote:
> > On Fri, 10 Jul 2026 14:26:58 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > 
> > > @@ -683,15 +683,11 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
> > >  			goto out;
> > >  		}
> > >  
> > > -		range.notifier_seq = mmu_interval_read_begin(range.notifier);
> > > -		mmap_read_lock(mm);
> > > -		ret = hmm_range_fault(&range);
> > > -		mmap_read_unlock(mm);
> > > -		if (ret) {
> > > -			if (ret == -EBUSY)
> > > -				continue;
> > > +		ret = hmm_range_fault_unlocked_timeout(&range,
> > > +						       max(timeout - jiffies,
> > > +							   1L));
> > 
> > "1UL" here?  I'd have expected min() to warn, as it likes to do.
> 
> I'm not sure... The "timeout - jiffies" can become negative.
> Won't 1UL convert both of them to "UL" and thus make the comparison
> overflow?

`timeout' and `jiffies' are both unsigned long.
