Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B2FCD6E75
	for <nouveau@archiver.kernel.org>; Thu,  4 Jun 2026 20:45:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A036E113850;
	Thu,  4 Jun 2026 20:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="Myq8l+z3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 91DA3467F7;
	Thu,  4 Jun 2026 20:31:36 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780605096;
 b=ifcErVkj7C3F1w0dKbH9pJaW2KdNbu1jSzA1tI4Kf9NKq6aOmf06NaDfiojrX0UzswgHU
 sasEWMGdu6uN4eZyiOVN0iRq2mIeDczDT3wky28JPvuc05Ah2h98ciEuOi60MVVQ4cIYO0C
 CztXTuGEYW9+cTyISs00egeXaUFGd4VsOMK4cnrYaQhXQC6RwXNv9xI/JsawIzXk/JHkOUP
 816qH9mqb0LN+qYYBt6gVEOk75FX+VOcbAvGl0d7S0WEqEX62y/3kBjxTdBP+TJSBxOhwGq
 3/SXqTPpUdCLEJJwj4h2aFEkMWN7ddM3ZFo4KWezBqZCM+esLchiTLO6mMJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780605096; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=muC6rawBX3CykhRdzS4yBFWa650rEAb1z3ELNMgRXrs=;
 b=glFs8qxbjO0yllyn6SwQ884uzHA/IrKCiMXqXDWx0qeDKHOlUO+RY2VwqCkjDrGa2qKXq
 uDlpXXC9DMllAMTXn4auZ+rViM1QTQVL03gJbXzvLNARhVjk0jnVXuL5/bAgT+xTzj5Z+Fo
 JtbJ6dzcEsRnhp1L/bgKz+9Fg/tHNMCB0nE3cm0IjRXXuygrQMrjSB+JzCnYPOBa64oe+nV
 ONeYawfXxf3xsdXIoKOItEJjievZWB8ONtg7oyGEz/WswccyaSIp9o11imrwD0r+L1KMaC4
 DyC+nmynq0KG05W0cpjVetMVWGVtEAowImzUhFWb7MNAM0E/6R4Q+IIT72ag==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 35B37467B9
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 20:31:35 +0000 (UTC)
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jun 2026 20:45:19 UTC
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 369C31135AD
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 20:45:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1780605015; cv=none;
	d=zohomail.com; s=zohoarc;
	b=blpPOiV19DAIP+eHtzRExw79FdUkcnkPvG9Z1D5YrNC6agORCyn/c0gWm8CohKdrgGZf6a/lxfdqtAByUmpGkNiUamlR8PuHrbdd1xmCm1lBmrf06Fj+J7BwWYkG+HMK8vYjGKVk6WNFZrYpFT+DGTMNp3eeCNwjHNVhL7F+fz8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1780605015;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
	bh=muC6rawBX3CykhRdzS4yBFWa650rEAb1z3ELNMgRXrs=;
	b=RcXtT0BCS4slwXENt3M/lVf2+rZKd23hK1hImUk6anQUIS1n4pwfrEd2axhMj3Z/UtoqvPHbsvIznSohtBS/3hCey3I6eF6lZgln5fPAxDTwr8XhGc9yayMX3xa1CHFmna6uZiJnETKl13CyGHUXiAwIdREwTDQ18VuE11dVpuI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=mark.filion@collabora.com;
	dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780605015;
	s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=muC6rawBX3CykhRdzS4yBFWa650rEAb1z3ELNMgRXrs=;
	b=Myq8l+z31v83jDaTJNOyqMPad5tny3p7eNAI4wS4LEsGF0mL2LT1jutccIfD4SHO
	w0l8kwkQhBncPxPELFA3Iyi2aBGpnigNnb2voQqrZRs6nEIbpJI92dXM4v2Wt/RHNs7
	6yo4fAWBYbgP+KRsjppy0IO/5w0NAU6Nkc57iT9U=
Received: by mx.zohomail.com with SMTPS id 1780605014129561.7890082678962;
	Thu, 4 Jun 2026 13:30:14 -0700 (PDT)
Message-ID: <25315075290481f0c77a56cd0c18576e0193338e.camel@collabora.com>
Subject: XDC 2026: Registration & Call for Proposals now open!
From: Mark Filion <mark.filion@collabora.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 04 Jun 2026 16:30:13 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
Message-ID-Hash: S6F34CGKQDNQAR4III7YPZYHZWRCRAFU
X-Message-ID-Hash: S6F34CGKQDNQAR4III7YPZYHZWRCRAFU
X-MailFrom: mark.filion@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S6F34CGKQDNQAR4III7YPZYHZWRCRAFU/>
Archived-At: 
 <https://lore.freedesktop.org/25315075290481f0c77a56cd0c18576e0193338e.camel@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello!

Registration and Call for Proposals are now open for XDC 2026,
taking place at the Daniels Spectrum in Toronto, Canada,
September 28=E2=80=9330, organized by Arm.

    https://xdc2026.x.org
=20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible:

    https://indico.freedesktop.org/event/12/registrations/

In addition to registration, the CfP is now open for talks, demos, and
workshops at XDC 2026. While any serious proposal will be carefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more:

    https://indico.freedesktop.org/event/12/abstracts/

The deadline for submissions Friday, July 3, 2026.

We are looking forward to seeing you in Toronto! If you have any
questions, please email the organizer (charlie.dixon at arm.com), and
CC=20
the X.Org board (board at foundation.x.org).

Don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

    https://floss.social/@XOrgDevConf

Best,

Mark
