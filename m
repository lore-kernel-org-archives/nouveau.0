Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0903C5B567
	for <nouveau@archiver.kernel.org>; Mon, 10 Aug 2026 18:57:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9834210E987;
	Mon, 10 Aug 2026 18:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dGjCopdH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1033947678;
	Mon, 10 Aug 2026 18:40:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786387253;
 b=Icyx2q9mMsQ5wWGHudvu+sCrp41oAu1ZurHU64bunSZ2JsPN7u0G2sdsNTPt0bkyNdB7H
 TioBztvvVe3MapOkeQSebZhIadT+aAxObUm5N13mCcrdPkJWgLuziuqsTu5kjDJn3a0Fok+
 7tH2uyRhFNyf0srN9ODVkyz25804CvEbgv8y/J2Bx3dzekMClH76tHX8csiFCrZkT5wUM8h
 0JDtJn3bI4pgC43j1mdXhoFoZmFqcnh9coDK+kEerZq08Y+iLm/Itj02hcfJr5q7J9yP/15
 G7uLDXUSzx1odXBu4BBdgQEj0TYX5lft26813DNFi1UZ0R24HoOVQHogajbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786387253; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DgHH11rbBugxycgVfllDqGnSiJw+pTYpQUpXBdKD4ec=;
 b=gnW+JLsuCUI/Ckx/P5utTbqCHZ5hispQD54N26FxKuITMXkE66q6pVRiTcS1g6xDtZnyl
 EhOafEPx5VFYtWuTCu9Es36xovYI+y9VA07yc2SpkJhLANqdENMya/Pz+ZPdWbzG1t6PO/Z
 lrhHxVvm/KhHkT9SeWBDGF5UDApw6ZE2EEyRA1MkMQNlKhMFJtJgY4JqTFSeg5l7s9mkZ9Y
 prlaeLUg1UTqjfhnZxBLvkQFwhTsSV9NP1T2acg1XkLwTfYdrJSTnH+vYrKdTLddNBGvRd4
 TUdKKOsaU1WyX6KI3OS/agLkM6LKMJVxGI1OLU0w72YmUmAWEyPrMRaA6DvA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F9F045559
	for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2026 18:40:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB22410E982;
	Mon, 10 Aug 2026 18:57:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C2F6600AD;
	Mon, 10 Aug 2026 18:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937911F000E9;
	Mon, 10 Aug 2026 18:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786388222;
	bh=DgHH11rbBugxycgVfllDqGnSiJw+pTYpQUpXBdKD4ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dGjCopdH5Dh+u5udlFJdn6uvtThWYmJaM5Eb2jrmqTmlPXe5UlQ0CRphwRoBIJAm6
	 F0kU/FDdk2naDL4p3srV/lxFnEfrV9izlK0/eVoMoRzHM6zEAlb9GpeWNPiLSHMibY
	 7/DPwPPVatxqKpZv+TfYsfmRCGlQLyQIHN6gqgSCuosDQKnkX7zFjgBI0zLwi3MUEy
	 whMrR+qxXWlWfsydnEdMuQYTG3VOiaRpdN8MxbYzSZLGHi/ErGFwHRXNVMMZH+h3LY
	 9bzRCWjMFzLk9BevIJ+7lY7vmKa9eVcOTLJ3LnT1A3hINcRRz11t4KUr+PC1fbqo0Y
	 U7y9rB8HQKU5A==
Date: Mon, 10 Aug 2026 11:57:00 -0700
From: Wei Liu <wei.liu@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v11 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <20260810185700.GD2496954@liuwe-devbox-debian-v2.local>
References: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
 <20260723142242.5d3f87208d47819d873ae458@linux-foundation.org>
 <20260731211728.GA3243658@liuwe-devbox-debian-v2.local>
 <20260731143733.6f74ec9b9023f898c3c260e1@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731143733.6f74ec9b9023f898c3c260e1@linux-foundation.org>
Message-ID-Hash: 3TC4TY26E3PTO7HSAGXMUDJWUWZDK3Y6
X-Message-ID-Hash: 3TC4TY26E3PTO7HSAGXMUDJWUWZDK3Y6
X-MailFrom: wei.liu@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Wei Liu <wei.liu@kernel.org>,
 Stanislav Kinsburskii <skinsburskii@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Long Li <longli@microsoft.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3TC4TY26E3PTO7HSAGXMUDJWUWZDK3Y6/>
Archived-At: 
 <https://lore.freedesktop.org/20260810185700.GD2496954@liuwe-devbox-debian-v2.local/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 31, 2026 at 02:37:33PM -0700, Andrew Morton wrote:
> On Fri, 31 Jul 2026 14:17:28 -0700 Wei Liu <wei.liu@kernel.org> wrote:
> 
> > On Thu, Jul 23, 2026 at 02:22:42PM -0700, Andrew Morton wrote:
> > > On Thu, 23 Jul 2026 10:36:32 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > > 
> > > > This series extends the HMM framework to support userfaultfd-backed memory
> > > > by allowing the mmap read lock to be dropped during hmm_range_fault().
> > > > 
> > > 
> > > Thanks, I've updated mm.git to this version.
> > 
> > Hi Andrew,
> > 
> > I see this series in linux-next now.
> > 
> > I'm curious to know if these patches are going to make 7.3.
> 
> Probably.  The series is incompletely reviewed at this time.  Perhaps
> you can assist with this?

Fair point. I'm not an MM expert but I will try.

Wei

> 
> > We have some work that's dependent on this so would like to plan
> > accordingly.
> > 
> > Thank you Stanislav for continue pushing this.
