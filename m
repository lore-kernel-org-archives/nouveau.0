Return-Path: <SRS0=f2/Z=JT=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B50C433B4
	for <nouveau@archiver.kernel.org>; Thu, 22 Apr 2021 16:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E971D613DE
	for <nouveau@archiver.kernel.org>; Thu, 22 Apr 2021 16:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E971D613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9386E3C6;
	Thu, 22 Apr 2021 16:00:04 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81EE6E3C6
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 16:00:02 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id o16so52434595ljp.3
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sPqtDg1MZKEB+gxfdYzkKUY5G3irXGW+JCmp2Xo0atU=;
 b=H82XkYFUeDTasimM77WdCIe4a8YFV3S6Zo1V0E5Cp0PUh9Lsytvdgrx3TXlvH/AuDO
 arMSqqF/1ZLswSCC+kwsr78W++fFiMWkN1WMOWzLKeZSsSnhLKyn4/6dkRT35C2yWrlU
 kfsLP1LuEZmb1f9frtBothfrDSTCLPgez/lCN00jxoYXZX89zZRuLbIJbstXeqy3UktA
 2JCAuJkb6vg96NBL+0TttOctexMehDbIGwdFlGeLaAR6yCO0kwc89o2HcKQBAJN9Flrw
 8urc6i/Il2s4VnolTjv9DBahPGNnZr5+ZfAi1cA4n4GCJrLnwxlf33b39UTqjo5ZCNSO
 +I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sPqtDg1MZKEB+gxfdYzkKUY5G3irXGW+JCmp2Xo0atU=;
 b=Y6RMDbP8atDa8VEwVEtLpdtXlfJxIWcVqK5ETVtlgz+9QIJIVlu1yp1UaqDuleH5tS
 DJe6t2m0s7va/CPxlRP1HlrUiQM1ipIq54vQAs1ElJJxRZBTuR0Uq/r80MmlLV+vRPo3
 jXgGNp5YkMl4a/kU4owdgZRb0F8Qg37OrEt3z9Onkod5nQ9hyXQ8RLh9ruNRyXjEo8yx
 59oZVCeDaCBifmrsYYiFG+EE63F4MUXxXq3tWbx4LpH5r8rB7iSC+1Tqx4hS7WeZE8xE
 oeY7hg1VMsbqist7KrigDfGqwiNJe2HvEcaASjiI01vXGakVc1Suq4NexcNJ6DhfbYVC
 K72Q==
X-Gm-Message-State: AOAM533PvBYmDr+GqojUWFnI9i/ssi8HS4hLyvQutky9XZonSFAw+Eew
 vXTEMNWjH7gkBTkdLPBdBSc103pTfNXnyDW5V1ieEtVaqNsdVw==
X-Google-Smtp-Source: ABdhPJzwpD0nbCnW1tscMILhUtP6e/g1oGvotbcsZt0WJpvX9DWaimeNHta7iCzdRwG+CJPvnC1YsjH5qyCVJ6ZIfFw=
X-Received: by 2002:a2e:2246:: with SMTP id i67mr2847042lji.396.1619107201252; 
 Thu, 22 Apr 2021 09:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPpdf58cSDz-22biF3Zyn7brchnt6Nrju0cXq=ksMBhOSqihhw@mail.gmail.com>
 <CACO55tuRxKQh_OsjPCrzTY1To_gmAiCLqtmk_YXWAXMW8zyHDA@mail.gmail.com>
In-Reply-To: <CACO55tuRxKQh_OsjPCrzTY1To_gmAiCLqtmk_YXWAXMW8zyHDA@mail.gmail.com>
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Thu, 22 Apr 2021 10:59:25 -0500
Message-ID: <CAPpdf5_h4ZGvLaJnVxPx30REuDicnSxaZuEC=YD1Oq1T426X6w@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] Bug system problems
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 9:30 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> I've notified the gitlab admins, but maybe you can use the social
> login (google, github, twitter, etc..) for the moment or would that
> require the confirmation email as well?
>
Apologies to Mr Korol - - - - I hadn't used reply all!


It appears not to.

Successfully logged in.

Not terribly useful though - - - - I wanted to edit what I had written trying
to make things easier to read and I needed to complete (one of those
incredibly useless) recaptcha gizmos which was not visible nor could
I find it.

So apologies for the poor formatting in the bug report.

Regards
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
