Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108DFEE209F
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 13:28:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 48C5010E675;
	Fri,  6 Feb 2026 13:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="O7vHgqbv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 09C7341B4C;
	Fri,  6 Feb 2026 13:19:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770383952;
 b=sOLFwBZtuAFXU+omck2Nsws+6DVk1rOuK22q2d2s+785UansWlKLi1zwis90w7qXnHw6Q
 41GLf4aPO/xp69nssMQaHqitKHvqYKQqTWteehGNRWzMZceM+J2XVqdm2JROTdxRxZqvG0M
 /X2YlyhyUHvdUxoInk0d2eSFVPlBtJ5UQq0kgJyX0qFxy9lXePOE4gbncdCPEfpzWavWgPb
 oX8jSRzbSt7TiimfEtKmPC9hCbuefnc4FgWvmTybTsD95o4ulW/Qg1EOqt1QTnrDnMJR2gC
 rXVjKdhWzK6Zixtys4r9uN1K2uTbSpdJgJIclpnqrN57j52X2ZZLZfXjt9/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770383952; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
 b=Gz/a5LCcG4MenBAfHoLz7rlmZPc8BkTbNO0fGUq49BpjuZbmfyF2dk+7u0Y0gh9vUR0wo
 L7+/MUPsSa2TkZkBsBqF7LTsj/LRVStOLpgQdg6JlTPcBswsBA7nG6OC+w75aQucTrHsgbz
 xU2rRLi6ZzIrnEHjruqSYvpcJD4O5UnmXja16imiLX26DzxfYioqBybQGp3GN10ziSCDjhj
 XRYhsgBlMT39vTD1zKBEqMRe82W8zB3GWiSu+mMDwY+xXf67izbx5pzzobIBSk8IHlcExub
 XaMpVyxddUonXrad5VFOwXn8RcJICN+WeVypVtxp7UreZIle3znZMspm6j0A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=collabora.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2CE3C402CB
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 13:19:11 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2755410E65C;
	Fri,  6 Feb 2026 13:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770384509; cv=none;
	d=zohomail.com; s=zohoarc;
	b=VvflCfu5Tlwx84cmJdYAuQfS2uvXaUWEaAod4Yk6BB5QtEPQjE2HOXRJjz+lBhAS/XGdE4SiNG+xpR5/AM3ISc76a94DBLhp0C4FuQc6gLYNcwKZvpg/6wTZpHso+q2wSaE2FmWDnUh2GnGsC75iDEkzR4/FJKPGeWTib2+aDmk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1770384509;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=EfZok/MurEDRcV1mDJp4vz9cTk4a2xijlpkpmdsVGM6P9m8C7+PMkA6HEV7bucRciNnajsbVOWz063mLHKErmITDQ/Xa9VIJg65dBrRMxQgus5HDU52AT+uvO5K+rh6BohrayDR662XP15bLxt5RAgsMJdm4MJMjV2ayPcz3qbg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770384509;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=O7vHgqbv6LjWjy6Jmk+Y49oY1nH3B84GIMEaiiLmr2vgzCF1u4R965JzKG6WauAv
	122Yn0PEJcQsKSPFhKGqDHNcwb6wwWgOaHVlbc+p4rTpw64OwIU0nJ0M9Idyvu2oq41
	FEVxovs7mLRSqkQlBooHMIgLqiB+4ew0nniNg4Gg=
Received: by mx.zohomail.com with SMTPS id 1770384507352128.09159677504636;
	Fri, 6 Feb 2026 05:28:27 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 1/4] rust/drm: Introduce DeviceContext
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260131001602.2095470-2-lyude@redhat.com>
Date: Fri, 6 Feb 2026 10:28:10 -0300
Content-Transfer-Encoding: 7bit
Message-Id: <5C67228A-B017-42E7-944B-CAE517F7AACD@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
 <20260131001602.2095470-2-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
Message-ID-Hash: OBYNNZITWFCDSGJPI23KYPLBGGBA6A67
X-Message-ID-Hash: OBYNNZITWFCDSGJPI23KYPLBGGBA6A67
X-MailFrom: daniel.almeida@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OBYNNZITWFCDSGJPI23KYPLBGGBA6A67/>
Archived-At: 
 <https://lore.freedesktop.org/5C67228A-B017-42E7-944B-CAE517F7AACD@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
