Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03ACC624D3
	for <nouveau@archiver.kernel.org>; Wed,  2 Sep 2026 04:50:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 54AD110E6F9;
	Wed,  2 Sep 2026 04:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="Y0S9Iegm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 16AC947DD2;
	Wed,  2 Sep 2026 04:33:54 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1788323633;
 b=gS04VHB1D4b2Jw3ZEzJNIjCOnbq+dimkUJEFPs5WLXQwyRcMCLOOi+srJRSRQb7yPAVkj
 IVlVqUKCSd+W29z+kVCIDjP70Y9z2QXfnbnvODpWVO1ivCspXgGPnMDXwOCMNT6Cz4BGaQ1
 ThS/srpX8L+O3Mcwc+V82NCL9psysLs9HIBT5cIDNJxfHuXSy9UVndlEtAYFevuel7ou2yA
 u6Hmd+9P88FfzTz32aB8wmr0UB9pYyudt1DgcLTeWnrFHAQqH6h6p5U1Hksfcy38vRcyKFG
 XPiCf6S+FRhbtd1eskbTzw6FCtkOwkdOiRG2LgDoZXoNTGYF5Q0a+U+4mF2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1788323633; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/qHEHJKZk4x+utXQVy6Oy+Uc44nyD4jHGrqzfQUFDl4=;
 b=UhKS2nV0GwNycFcjF69lE2eL60IDqCOul0Z/Vafe5BUkDs/SQGuJqx6QBGRJlteYe44QR
 g6DLtY1ZSuSkNlnwzdeiREIS5Uk+q10S8eI+0nvHpvzl8rpUiZXPnm5l7UjQpaBWQ26frce
 oOmqf4K9rXpDswzDVwYxz1kXPZ6UhWTfAVTLjA56ADbSVe10nrhreBWWUBDOa277MPKLBjI
 ZUXp4Fs7rCGdrMfiQcRXP6lwHfspBQN85esf9RLPANuenTOB+8N5YYxaBiTsbv1XElu2zcM
 l52tNeQi0cS3CKtwfapgEI1knypxKXnTH3PozBxrLdirUB18zNMNTe+M+qPg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=mark.filion@collabora.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=mark.filion@collabora.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=collabora.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BF21B47DC7
	for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2026 04:33:49 +0000 (UTC)
X-Greylist: delayed 5403 seconds by postgrey-1.36 at gabe;
 Tue, 01 Sep 2026 21:42:13 UTC
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A3FE210E0C1
	for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2026 21:42:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1788292626; cv=none;
	d=zohomail.com; s=zohoarc;
	b=iRo+P7mAm08WkJfLM6/kM6jWZBcspiUUoomaALQ0IIQX4D1eimll7LmVXAsEL7IpQb9dqruwsvoGD9IA0QSVulIoK+lpmL8e5stcih8jK0OPS+H+DWknV+VaM1GmmeEFqNTmi0ZzeLuAwjJKnfbpg4JP7mUtdVdVKg1F2Fb2srY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1788292626;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
	bh=/qHEHJKZk4x+utXQVy6Oy+Uc44nyD4jHGrqzfQUFDl4=;
	b=fnIKKrq8VdTVJEf8ECchElNXMOY4QXaGcz2G+4m7RE8uE1lh//GsEISn/Vg8dQ0fpViuzrF60oX0P6yT3ZqtEQOhlog7Hc/fVEsjz+xw2m4tkvEgUKuPPVM9tTbdPsSMUe/Br4GEqxM1Ua1CSxrsqvbMhCdzzDXYFNBi7uUkcJo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=mark.filion@collabora.com;
	dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788292626;
	s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=/qHEHJKZk4x+utXQVy6Oy+Uc44nyD4jHGrqzfQUFDl4=;
	b=Y0S9IegmcpQwr1ItyfzR4Up2l1CnBZqZm9XCGh/9AGwzVEmfojUHD3A2zLKOm+QC
	DNrpWEItfmF9yc1JeNRuudIA0zJS8H8Q+Z344WsheUTZhGy3/zFk+HvzY3ij2l/dSSt
	QL38pIuiz3ubpzXJAU9SCG1J4jyljAyRYypjROqw=
Received: by mx.zohomail.com with SMTPS id 1788292625288819.6275929185153;
	Tue, 1 Sep 2026 12:57:05 -0700 (PDT)
Message-ID: <1b2f8062d73459c3c65e998153e84e2201990f30.camel@collabora.com>
Subject: XDC 2026: Full schedule now available
From: Mark Filion <mark.filion@collabora.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 01 Sep 2026 15:57:04 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
Message-ID-Hash: NWHCQB7JRH6MKZS7SDZ7YER32VKCSXD3
X-Message-ID-Hash: NWHCQB7JRH6MKZS7SDZ7YER32VKCSXD3
X-MailFrom: mark.filion@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NWHCQB7JRH6MKZS7SDZ7YER32VKCSXD3/>
Archived-At: 
 <https://lore.freedesktop.org/1b2f8062d73459c3c65e998153e84e2201990f30.camel@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello everyone,

Only a few weeks to go before XDC 2026 kicks off in Toronto, Canada!

The full schedule of talks is now available! Check out the schedule to
start planning which talks you don't want to miss.

https://xdc2026.x.org

The CfP has also reopened for Lightning Talks, Workshops, Meetings &
Hacking Sessions. Submissions are welcome, though acceptance is subject
to available time in the schedule.

https://indico.freedesktop.org/event/12/abstracts/

If you are planning to attend, please make sure to register.
Registration is free, and helps us plan for catering, evening events,
and nametags.

https://indico.freedesktop.org/event/12/registrations/

Best,

Mark
