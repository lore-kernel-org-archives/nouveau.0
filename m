Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEEDCDB46F
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 14:52:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2B71F10E755;
	Mon, 22 Jun 2026 14:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="Mf0Pyusm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BD53646C7B;
	Mon, 22 Jun 2026 14:38:18 +0000 (UTC)
ARC-Seal: i=2; cv=fail; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782139098;
 b=C5j/G6G/D72e7dfVOAbjrUQRLR7Nowl1iFxoIE+/9RqDXcHoL0GG2NrrPle30xHg1xdby
 uEGrnpmugwZKMk0NuSdyW2kklLqNBEBop9ncyYlmzTDZKhn4YDa0lZtw/E8v2JaH3Wf3usA
 j/rBrtn1fOHLMEjwWfTOvbW5EdC/tRz30BerxoFLHcOWoMZj3CmpUhhUnyKG/BBTvfXaHdD
 tcNb4fmZ1utbRO5UW/4Bm9xBg38RpTDEjlE6LbbLsWykEnkxXSGy7h4WDTTxw2QUdKiEvkJ
 vWDbEFh9OU3Tg0I4ULnz7q4D1ZpCMBOaqy7tWmY6I8OTNi9BE1n+FnRgn8yA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782139098; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=63C3hkJcUAjLx1Wo5SqhN4nguOHicwdTIcrGRX6qKsE=;
 b=TOpz8Y38qryfcGCGLq+JVIb19rdniBEuOoEXRfNnceNxO4PtXrH28pHMW7PLbvFEa6B5I
 QG9jKt9YSwRTS8rQTRK0f+3m2GGn7M5LJAayuh2yqo0QdnKc6ViRvUtbGxz9n5znqxc5ndT
 03e/FlLr1NXL7ju3FU2z8T9WaZ2QpOvpRPGAvvAb174T8Bec8HnLrTwXE4gG1DTDgj17SbG
 vZMEQOHvEdozodlkNVVau/88tjpcod3QYJqFL+AGUL1jexTWNoSoIr0j+r+mGy+mig2hIuq
 T/o5Ke4Pnn6pKeRwUrRdB1pUNSy2WMFafDgOMhQ68SBic745cVQFNPcn9qxg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=mark.filion@collabora.com;
  arc=fail (Most recent ARC-Message-Signature did not validate);
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=mark.filion@collabora.com;
 arc=fail (Most recent ARC-Message-Signature did not validate);
 dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D8BE346C6C
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 14:38:16 +0000 (UTC)
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16AAD10E73B
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 14:52:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1782139959; cv=none;
	d=zohomail.com; s=zohoarc;
	b=iMpzQMMcTADR0OAgyDF/SpEq1SxkoXoLwWdKq4H4i9apemeD7bYhOXFULEluoW2zkkkRhENLKNA8GTOff4Zc0pHhgYvAYbzn3LhWau4m6TSKv89eubREfpCF2DqMT2z1Jr7NaZxG4vPOpu1J9bZISrLgo50+bG68yjy2J5K2JWo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1782139959;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
	bh=63C3hkJcUAjLx1Wo5SqhN4nguOHicwdTIcrGRX6qKsE=;
	b=jDEcbLc7fG14dS90cEKRV/28Ditlm7lvYRA1R0rQwxbo/6+EKve1XWw4XyA9yh6vTO9wxytCq9xoE4eEcMVxM3VTfQipbS++uuYFcb0ZsK9nrr8DLP5W/DNknlD3ro7rfkwwSXhGKdKXhmGahZl6QvQ7d5xquUvaPzIDhOrygr8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=mark.filion@collabora.com;
	dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782139959;
	s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=63C3hkJcUAjLx1Wo5SqhN4nguOHicwdTIcrGRX6qKsE=;
	b=Mf0PyusmWNOJsUjEc5oeWJ1BYEdrsq8shxUx6urYmpN1j5lW1urdudvBHiJT0ful
	13wcp2fp8dlTZLnnj5ade4vuSwM2h1SDeLMOvzfCj95KUDEhf2DJXGcIqBwxegtZPRf
	uIeV8C9UxVxFx3h01uSHDXMbSkJtOf1NyrmOKfj4=
Received: by mx.zohomail.com with SMTPS id 178213995864957.804006687524975;
	Mon, 22 Jun 2026 07:52:38 -0700 (PDT)
Message-ID: <b84067aa8774b67fd210fbbbee2bce8b5a5e3e48.camel@collabora.com>
Subject: Reminder: Call for Proposals open for XDC 2026
From: Mark Filion <mark.filion@collabora.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 22 Jun 2026 10:52:37 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
Message-ID-Hash: ZNP3MOI3E3HW5RRYB7LAYU3ZRVDRYKAP
X-Message-ID-Hash: ZNP3MOI3E3HW5RRYB7LAYU3ZRVDRYKAP
X-MailFrom: mark.filion@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZNP3MOI3E3HW5RRYB7LAYU3ZRVDRYKAP/>
Archived-At: 
 <https://lore.freedesktop.org/b84067aa8774b67fd210fbbbee2bce8b5a5e3e48.camel@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello!

Reminder - The CfP is now open for talks, workshops and demos at XDC
2026. The deadline for submissions is Friday, 3 July 2026.

    https://xdc2026.x.org

While any serious proposal will be gratefully considered, topics of
interest to X.Org and freedesktop.org developers are encouraged. The
program focus is on new development, ongoing challenges and anything
else that will spark discussions among attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more!
  =20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!

Best,

Mark
