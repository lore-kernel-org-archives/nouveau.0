Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2A8C44506
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C27110F154;
	Fri, 10 Jul 2026 16:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="PqMi8Yx5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 02AB54700F;
	Fri, 10 Jul 2026 16:32:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783701164;
 b=CmpwtrpROV8AuFuR3BhkdhysrMMn0GxNwMSfuHLJsMKt/i7afRFSziaJjhISN2eAyXmfo
 /COZB6kR+zNKzjlXviTZQ+vR8pBRir9WTyKpLdGay8vWo4sy8WZMtCWPkx5OteDs597X1c4
 Mg5VgX0Lmt6bDyMkYX97SGsQl5pmP/ROIFVUNl/HBrZdeCbLCDGOeb5NtN4mtqg4ZNemJaa
 7Rr+2LEHeK92OCpzg/EzEmthn/zncc7mHYbdBZamxLmiyRFc32VNS7GXcbwlOiHYA1EHOjN
 2QOINw4n5j4KG6Uyrh0wcWuhYDr3tq3GIFa5oLP5DQfA+cc9GzL2z9O8K7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783701164; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ldYpDeT5zs3T98XMfsT8ni9uE73SXe2oYxwTATvCf1s=;
 b=zdyebJnLwn29I7I72R1ccxyQt5tDcAy2RSBGsmgvsOkKdA0tdYMzaJNYdlMd1RYNuyKh5
 9j3t7ChoMWL3AIUQYAj2A86fPmdize2qCTANw8Q92UZFS28kexTOtrkdQgBVpBsK9BD/x2D
 u17dTNNaZxOzEdgGvIRidYE6I8J4ncClEOzH1NO+nHFW+r6Nm8ZrCsOSJlMYB3KFdkryBUr
 VSAOpLYLtrUlW15N2KMH6o0XqDXaqKGiA396EzSo19vhQXAc0GXfz/anyrP+989gRYW/lvi
 WxyUumqKOSb8SKt9wnLvhrzRzSlVp64Q2Jz26OYFASq1SrMKv4AJ9bgG7rXw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D239946FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:32:41 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEA210EB08
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:47:46 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-92e5c9211d2so86058285a.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783702065; x=1784306865;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldYpDeT5zs3T98XMfsT8ni9uE73SXe2oYxwTATvCf1s=;
        b=PqMi8Yx5YWe6HeOiDa2LLyY8lAd3khqR+MZgLO4P38qIN2ymRKKHEK7QZcmoAjrhAj
         2qR2jZFyJp4NPm3TOexw8N7iJaECOXRS8eoOL6qpHMo+adpbUFhwFRPDlp9pFolF8Z24
         QoCbjSrdT525sUoyor/Bq1bRRb+P044aBDPbkF+Yqlk8/0z1fwgdLb9oNKbUEHLq170P
         6JAqplJx7qzNFzk7HvyUUlX2v5J8in63ACULFXhSHIVlatOur2WxdP7iOoNAjYP/tPtK
         LV/iJsjU789K2cnnX8p5jP8PlPenRi9JlVOaXfyLt2wJ75USWsXMQRBUAYYUpFhRgnO0
         7r/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702065; x=1784306865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldYpDeT5zs3T98XMfsT8ni9uE73SXe2oYxwTATvCf1s=;
        b=aaHzXXU2JujK1Dew3r+7zxpViboso86UP3bpheDb+a4H6t7flFgUXUQUgykvQOQTN0
         dUQjI28rTEy6lBDZpsKqQs5dbi+W4fss1Nc6Obb66XEkwDuZDykG5TD7oYQCpwQWoDtT
         lf8ApdxXA32YVhJYfktIoLzi25PgeHY/fpRLMKyzfyK+esJIU2uybLfsf0w14GSOY1UR
         lUBPlvobM+dJKm1gDgWbX9ZVwPX6uUs3eVvbDu0SCGmLd0Jy5jRbnqJAAzDWK+4Isun1
         JqOsATGyC5xoQm60ZxYLk6VZreEwwl/VNKopCcbXkGPNuiUY8Rb4GT39IA1uEHvAOEqU
         MVDw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rres+ksIiKrf1umh+TxoUjHhlhx+exwdzZNxB0stwtoYuDUAlx9zgr2jfP9RTvUUZFFWYFMxPjn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQSQ6JYGmjm3VUqgCo92bfMiN1aFvOkLYRlsjb6qM6S/mv0ns+
	YmicXSHeQY27UAcN/p54WFoyj7eF+NlZUmhOpQXfW8NF7n0xiLZtZfeK8KeJN8OkuEg=
X-Gm-Gg: AfdE7cm0MFzF8WaPZTvAHaDfdHyzDl21BWWsXrAxkCl3p7a2EXoQyNWKsr7CaOYW0DO
	Vew4Ndx+1k6LXz52UulPDly2Z/cdv7MkEh9C4TB2HCQguDoFlVejk1ErFifJ76I3Q6qLe6ObSge
	89iACEkbdiMqQapvbzwP2MPMbsr/8zggo+q9KZ5tAWt8giKJCSLpAC5wwKv80oJMLyPuIMxNciY
	45hcyw0IBcloQTJq3cTPJg5w6bHtnBasWHiA4Mofq4Csy9BHtj9x+rbIgJ+iuIkBTdWUOJZRpxg
	Z5wjfgohJtSzcNAc4a60XPGvH4WG96LP0yYyzrEsIfgovMTGABuN1VzV7kMeDhCGtUNl3++xn7p
	mkbFq4ui5wlZjP3+HdJxo9IbVTFEOh9zFmMf0RF8paVaqhF/Yqmz1lZaRnXmn
X-Received: by 2002:a05:620a:4044:b0:92a:3ceb:9cf1 with SMTP id
 af79cd13be357-92ecf68b839mr1385461685a.37.1783702065110;
        Fri, 10 Jul 2026 09:47:45 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd5bbac2asm45778726d6.21.2026.07.10.09.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:47:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEO7-00000007ZDn-3hnt;
	Fri, 10 Jul 2026 13:47:43 -0300
Date: Fri, 10 Jul 2026 13:47:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <20260710164743.GX118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710162749.GP118978@ziepe.ca>
Message-ID-Hash: UZUC2WDHJQNLBXMKHHCNY6JOAYNQROMO
X-Message-ID-Hash: UZUC2WDHJQNLBXMKHHCNY6JOAYNQROMO
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org, corbet@lwn.net,
 dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, kees@kernel.org, kys@microsoft.com, leon@kernel.org,
 liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
 maarten.lankhorst@linux.intel.com, mamin506@gmail.com, mhocko@suse.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, ogabbay@kernel.org,
 oleg@redhat.com, rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 wei.liu@kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UZUC2WDHJQNLBXMKHHCNY6JOAYNQROMO/>
Archived-At: <https://lore.freedesktop.org/20260710164743.GX118978@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 01:27:49PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:
> 
> > +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> > +				     unsigned long timeout)
> > +{
> > +	struct mm_struct *mm = range->notifier->mm;
> > +	unsigned long deadline = 0;
> > +	int locked, ret;
> > +
> > +	if (timeout)
> > +		deadline = jiffies + timeout;
> > +
> > +	do {
> > +		if (fatal_signal_pending(current))
> > +			return -EINTR;
> > +
> > +		if (timeout && time_after(jiffies, deadline))
> > +			return -EBUSY;
> 
> I really dislike there is a timeout here, HMM is supposed to be more
> deterministic. GUP doesn't have a timeout, what is this about?

It looks like you've moved the timeout processing related to the mmnu
notifier sequence from the callers into this helper. I'm fine with
that, but maybe add some comments that this timeout is helping
implement the mmu notifiers, and we do expect that the HMM part will
not timeout.

Though it is a little hard to see how your stated purpose of enabling
userfaultfd is going to work, aren't you pretty much guarenteed to hit
a timeout if the userfaultfd process is adversly scheduled? That's
going to end up broken.

So, maybe the deadline should be resetting after every handled fault?
ie the timeout really is only about the mmu notifier and we don't
count the time spent handling faults or walking?

Jason
