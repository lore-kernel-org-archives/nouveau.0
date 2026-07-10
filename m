Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DF5C43458
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 22:12:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A458C10F9C4;
	Fri, 10 Jul 2026 22:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AeTioDYW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9FE9047086;
	Fri, 10 Jul 2026 21:57:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783720654;
 b=WHmlHawsWgqsOWBYzlSbDV3EO6TgVgbtxkeouj1LKXWJQrNKMpq5h12NGsLqOhQYXp30K
 cHsR9r8UirrtzUwC0v4uAncoRRUwm3N3SCeTtic8PLD8puK2oqmVeQ3KfxYrrbVvKBemmqU
 L+BjSn/TH7FjNtmgMqGEQyM1zOrsAAk5dQ9+PYWfWeuMsGUXovHxWBxGmOYWx966GN6waig
 q9EZqb82rnPnc07bQ+5LN6PIAYyjuOH5SZOPccr2E8sSkaZ4OMStPUQLfpjW/DPha5rhNlJ
 sROF3/BjhbXAsu7zfStXddxGGjK1SjE5SqAu+3GsA4chfBzJ0UmswPgQJ02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783720654; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=h9zolevYOr3IrqkJ/ylvovmm1VXhDuPtRxmyw6CyQR4=;
 b=WIXJgwRqw1S8eFAuj92RppIhftSZviSxFnmDOQFG4PCid4Horv14pSB9mI0NlwcdBr81k
 iBp+3ncXujA7o2M+aBkGF4TLFbmhlBW5qFbPVZFwe/7MT43wUlPoKsHg7agA+18puOIA9W1
 cysFhQ6p78NH5/YtOUckDTnlPxinGBbZ+B79uE15N5aiRmqKvvRHr8nMjryBLF1p13RYoGn
 8I3XBnD0GlYFVI9KWab1XwQ+NC49uOoblqvxhmGMxxir65a4THGx+cBPRKm2fR87AgLBqRL
 EdYldLiXE7MpkyTi1zqEms3RC0klOdtb+rO1pLRmN9LJubkXcwgLjSm88cjQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 58D7546FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:57:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2E34510F9C9;
	Fri, 10 Jul 2026 22:12:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A68E86136F;
	Fri, 10 Jul 2026 22:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A1C1F0155D;
	Fri, 10 Jul 2026 22:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783721555;
	bh=h9zolevYOr3IrqkJ/ylvovmm1VXhDuPtRxmyw6CyQR4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AeTioDYWrCLtodpdLKC5SAj9nqcYsbMSqw9BPHz7Xp2PX5apYbRRe+siKb7EjWd0t
	 QIIb4EtviMqnln6uNXpWNIHF/AvpVC7rQIw6R6ljeF9y12krwGSjA/IkoF5qty/C3W
	 mx6Rw+J0PVzeRUM3qJZMk8JGx3kO2l6ngA985HRY=
Date: Fri, 10 Jul 2026 15:12:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v8 8/8] drm/gpusvm: Use
 hmm_range_fault_unlocked_timeout() for range faults
Message-Id: <20260710151233.4ac5ca774cae46dc725de505@linux-foundation.org>
In-Reply-To: <178371883977.900500.2198446134676328631.stgit@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
	<178371883977.900500.2198446134676328631.stgit@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3U5C4T4472NYEKWAVGLOTLKN73NVBZXS
X-Message-ID-Hash: 3U5C4T4472NYEKWAVGLOTLKN73NVBZXS
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3U5C4T4472NYEKWAVGLOTLKN73NVBZXS/>
Archived-At: 
 <https://lore.freedesktop.org/20260710151233.4ac5ca774cae46dc725de505@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 10 Jul 2026 14:27:19 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> +	err = hmm_range_fault_unlocked_timeout(&hmm_range,
> +					       max(timeout - jiffies, 1L));

1UL again?
