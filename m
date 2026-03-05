Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A369F33A87
	for <nouveau@archiver.kernel.org>; Thu,  5 Mar 2026 15:10:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC4C10EC36;
	Thu,  5 Mar 2026 15:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="BmSS3awL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A48E444E96;
	Thu,  5 Mar 2026 15:00:24 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772722824;
 b=Ns8r5MPHCrccTPr5n6nB76bwvtTWXdB2XeAXNCERAF19c/eKPBWEbxR9QB19LaGcz+A45
 HM0DZH/U2/KxxLKZ90STRrW9w8uoIrVnMrTRxI0nMm4v2uOtocrEyqO0P55omDMeXwVuk44
 +jNm16D8+YLTEgfKWDXj13vnj1kyPC22swkOc3K+Zq5AWhTvGBrhaphFboBpEy8yfR8OLiT
 ieuSn5jioNPWv2jtoXBS2DWqY+aETaWJXpitU54q6dDSbP1imGeGWq8Izrk3m90cDg2RtX6
 GU4qALFXg+t6XQcC+3uM7qdWJ21Vbs9V+QZEwslS5/8x5PMVoWZ51gm3Tp0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772722824; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u82NxCxMOoHokl6CWFUxRda+nqKiH6ew72AuZPbDCik=;
 b=Lmg7ii3Unix5whQHnMXuwKHYFBDWT1ZSHVbj3ZjvN4grN+wg9/EPlJrWUIAY5qHDaW9AL
 fLzi3zyOw2BTBpmnDfBfNQqnG+D1nHZhzW7+imMwV8geg+pzu4OqfO+yEfYRwt65O6W4LIz
 yl6BCNMy3AO7Tf3Z211JoTFBHfIz4VQpid4gM5H5/+Rp4NInRLeZEMM7vq75MuJP9m0PDn+
 vmUyIqHjXqdzwQPTYAANiJmPWoosqJQ0CAm2FL1tzT6zn9SHWrKCcKEpHOCl1x6pFq1VhV0
 OgCA0+LNw9j1ChHf9//0RKItJcgC2beGhil/+FWfkN2hpZFChH9Miz+yRRDA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=suse.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=suse.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=suse.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7DF4044E79
	for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2026 15:00:21 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D1D8810EC28
	for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2026 15:10:43 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5a12cd0bcd8so1209550e87.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Mar 2026 07:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772723442; cv=none;
        d=google.com; s=arc-20240605;
        b=NqVhZ45bVA5zkg8RHK9CwfVfDNfnQA7vfs30az1Vr6Nuh3fpZhDQjOuN6VPDnOQOxo
         ex9s2iRKCHzWG2jshrM4vbA+Ns8UnT5lJ27pCpBbC9JTbQf1BjxGPBZzJyyuS88vWMwt
         Ka9k8L94gjEb6WMBtqZhZ3OK9SVW1mWLQSjokaRWYFJqYlRAV3rFSzmeKmB7lW060rn5
         o0unN9TuD7LsTS45c0yI7uv2kmfYJeMvyzrxmPxqUMZRJU1nF0gdZzYrac4swTWwZ7y8
         Tg3H5VjzJkAsTHMJaHrfTrGnLsJo6T3efjG3kyvXjs9A4PfbTRO+MuOL/2DZBhIaM7sE
         ZGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u82NxCxMOoHokl6CWFUxRda+nqKiH6ew72AuZPbDCik=;
        fh=E6enaBI3JSzrBmrPBU4Fjy7P/Zk1iwIBOyNzeu2sBZE=;
        b=QCyzRoT2oNMebNzJ0/DNm+h7s1quNsiYlSeZrGdyfjkTeAq8IXTxxN9Tw0FeH7xMRL
         qIL+drJWgIfKUqxEB5Df1zCFQdBOiMIlpWXzLcjkJN8sCf/grFzp0YLm5XUvJL1qaRD8
         S5YY6UuvAEiBhxo4EB+K9MWOQXKWpEPqHb97BWzX4U2hBlLr3e9uQ2z0GGX9ZCKLyWk9
         ll/loe0KwbzbA28PQZThcd/JOLFSBvn1SDo8c4Kf/4t8QhHGH/NK3yHzDZB9IsH+bKfn
         MgP8NzyIN3lksX/GuG0aqUdyKXvCPmsrnHLCKogZHTkpGOjtleu3OUOFNXBt/HI3jb10
         +Zuw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772723442; x=1773328242;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u82NxCxMOoHokl6CWFUxRda+nqKiH6ew72AuZPbDCik=;
        b=BmSS3awLfKUs1YbgobuzZa+MG1wX9lRyOVnX9lQ130fxzgW+hDK6+74PSP7TW3Vg3E
         TufbsNIvca7b83OTyAJf0zVccjFSrZfxSGAbt8BPTrwhrnc0YW3WG+72eOUvhDaeEdrq
         gfAl51BOyvQQ4Mtq2b5/swgOLDH512aT+TKO+sE8/YDwTG4tta8OFtM0viK45k3OWj3m
         E6tNrhQavTGr9abefqRi0c66G7CkmkaPBU8sa4yvh8Bdf14+GGPrWy1ETUDnYDibbwhr
         MOK09PgpbyVXkxbpRB5tSTsR91sDbK9aa4VtDTlW8PVuNRMMUHUfkkg1Jsx3Ko19vkTK
         GUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772723442; x=1773328242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u82NxCxMOoHokl6CWFUxRda+nqKiH6ew72AuZPbDCik=;
        b=dlazlsJr0F65LtWxxy326y6A8bF3wXXBzL/7dEIBb72e1jpBlYh58zLRKiyKNI/Zl5
         z5vbdmzuE4zFinM4Z4gY9ACcIpVPLDJDL+AvZtLasMBG1cD9orgMR7z7dnMP1Y0HFZuv
         3BURAV+9a9KRAh3XHpW8CdUs/5I5m0xSoMDupJi8raD2f1o/oLweg/CRy3SMxP1LJHbE
         x1PAh1I0vCe4DtaEjCahyLDHxCcP8BpWj0nkR3A8gr7YQYUujNXaGeS2yVXPYJDVZ+gp
         7vfljVzF8hh6iPzLc0bigrgDQcc4ddbHZeCHNg7x9a74v6YMtiSkI8lAAgNGgu9uBUy4
         ADwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUN4wSNRVXw+ogzUxNVWsIxGSVVRfyKUGFPtqxs23PA3E9MUEYOtCRkCR8DsxusP0uFV6pUPla@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGVTloRVKIT4Ib/1bu420P+7NJszvJ2yoEiH3fT8k73ZrwylWn
	odVMdQw6Vo8fXv463g3bjLTJ6tqXi/dOKQzeJ+INK0RfpR4tdaUF63xFhzMxl61lje85tvwLBkg
	4g6718LffHWH0+XSwfyPJGkL9AZPnsV2POMUXQbZGCSPbZyXUAzwb
X-Gm-Gg: ATEYQzzKS2Zzis95hTfN0+sS1N7Hl/rJEC3saHY8osuEoRyfacRSApMmQZ/y5cxjhKu
	KnuZ97fWsMoY1Q4XMXSuY6bImPAuOD+5cUgcGFvqDHDxsaL0E0qyxDfk9rNWUa7HPaN5YoVdFSB
	ohhFoakFzjvf3RsLSI8Y7pPmu6RCfcceqa4LpzTiiKcVXLh70ODWa1S4EZvRp8wStKpNJYlgiSw
	Et/LLsF5lj49h4tQvQEeH0jmBrHsJwWN7RtCNIP9xWJE3jQLOoVeYoG6EWvhQfnkq5nK/L6dt9j
	aqTY8v9z4Ha5Pf/3/KLUGmt75fXCf4GP3nlKgWC2
X-Received: by 2002:a05:6512:3e12:b0:5a1:1da2:24b with SMTP id
 2adb3069b0e04-5a12c2816acmr1053014e87.13.1772723442127; Thu, 05 Mar 2026
 07:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20251031102020.95349-1-marco.crivellari@suse.com>
In-Reply-To: <20251031102020.95349-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 5 Mar 2026 16:10:31 +0100
X-Gm-Features: AaiRm52evNzWnBtnAD_gcyRavCdB7Lu4vnujQaOXLWgRass72odpOCItfms1g_Q
Message-ID: 
 <CAAofZF6i2+4oppY3Ga_hAppAe1sVOnEYu6Yq4iAe0WTpbVcXjQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] replaced old wq name,
 added WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QN27JIZFCM27ZXECGHVGSPYLIVLMWKJW
X-Message-ID-Hash: QN27JIZFCM27ZXECGHVGSPYLIVLMWKJW
X-MailFrom: marco.crivellari@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QN27JIZFCM27ZXECGHVGSPYLIVLMWKJW/>
Archived-At: 
 <https://lore.freedesktop.org/CAAofZF6i2+4oppY3Ga_hAppAe1sVOnEYu6Yq4iAe0WTpbVcXjQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi,

On Fri, Oct 31, 2025 at 11:20=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> Marco Crivellari (2):
>   drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
>   drm/nouveau: WQ_PERCPU added to alloc_workqueue users
>
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
