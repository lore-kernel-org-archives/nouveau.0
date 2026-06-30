Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70446C43458
	for <nouveau@archiver.kernel.org>; Tue, 30 Jun 2026 20:28:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA1D10ED3E;
	Tue, 30 Jun 2026 20:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="Ru4dtXvk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9857346DEA;
	Tue, 30 Jun 2026 20:13:43 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782850423;
 b=Krss5flUHhF/UUq3/0/gasbqrQ6nCH5Gt7NqlDkQcWa8UH0L72cKH31ikich34AN0fHb9
 l8x4l9ugrjZOY7pt/fViWD7vtjjcGgMsuzahpEZvkah/gETiW9Hp1TsWIkjXdSHt3yQdOWl
 B5KoZaYPDs/8XyLwX0qLfAIp7ymC1wsj9Utlv29bs016DIWdJHwfQRE2QX3p3Aj832pmHPs
 0p5L6GlCJx7ewfaOdaGLT02rRljEuKg/Lfrwn9meVe85WgBBduPBO1/nmhCxZG6Am1YvMDA
 vewvZJlDv+VDdEFUJnpYvG5kF1VEHdUdQdYn9QXo0iIvmD5brXmgCKZvgOqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782850423; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/xxStwIF61bn3ZqA6+M8xNVE8MJdolxYpTE31ogRu80=;
 b=MDyjNM958MVqFCnlhodAWpDxpsS18asqjO58CvkJc6OLFHS/AWQoQGlwFSnz6dJaMWdjE
 XX1hw8YeGzT6HTSdb9Jrs+EHmohjDkT5k5d5j5pF/9Vb5juZYf9egyGIcbbBZmk1zbq7in6
 IKSEWb1WRtIQEJ0Zeo9lPE3zvJ+DyuSue+cFtCBzCOa7D0UR/ufQKn4IXd9v3BLIsuLmTXU
 YRbBav4tyE1x785UUUEiVfvk/jnEuz52DHA9RClGiUzy9PcctF4PNKk7R3MW6NsxBkMnXT1
 gccc1Aj6PRQceqbeazKRNnW9CckBmznObpln25QoWK5vDmFLBdUTh8dcrtFA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 11AC24017F
	for <nouveau@lists.freedesktop.org>; Tue, 30 Jun 2026 20:13:41 +0000 (UTC)
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 902C010E268
	for <nouveau@lists.freedesktop.org>; Tue, 30 Jun 2026 20:28:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1782851302; cv=none;
	d=zohomail.com; s=zohoarc;
	b=MZtfitQnzq/Gj1uf8H6hPWiSMCFVwR7wLyPwfzUOvBFyJJeen9sqpthkBIhkjsEjoBlxrO3EeZd14EV9RJ7NFeYlC7+eFmZGjuFEHCeneM/gMnIfnifr0pQHyTC3yTuKLkJgs7opMnVU6RbDLeXlxtxEpZwmMoCb78U/S0kDAr4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1782851302;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
	bh=/xxStwIF61bn3ZqA6+M8xNVE8MJdolxYpTE31ogRu80=;
	b=VKeZFVpxAwZFf+ZA+7dKAvJqK0zWlagemCRcNKZt4c/HHEFgE7afJRKLvFS19RAMQ8N35TbX4X0WnL9ca6hzv0tvNu4B88Oo4Bonj+CANpOEf57fPXJFcPCbDXdcHoo9o7Hn9J/YLMBejLG9aN1zfeb7+ppXMLOnhose7R8aE80=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=mark.filion@collabora.com;
	dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782851302;
	s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=/xxStwIF61bn3ZqA6+M8xNVE8MJdolxYpTE31ogRu80=;
	b=Ru4dtXvkPhI+bP5BtVWU7PaXwnsUpyRyIW1wEVGfUff3wwjEdx/rID3KwAteKYF2
	DqJkLqknHK0uGgZbDaL260O7ioT0BlWOJliFQQFDshjjOKKxOF3NlNPIjMEl98E85Xv
	LORNXUb9ByjkJU7K8nB1Kug4u6xBuDQtWw7CcuKE=
Received: by mx.zohomail.com with SMTPS id 1782851300655115.36931291562132;
	Tue, 30 Jun 2026 13:28:20 -0700 (PDT)
Message-ID: <8d987b07e1d629d358b9127d90359a2088b39763.camel@collabora.com>
Subject: Reminder: Call for Proposals closing soon for XDC 2026!
From: Mark Filion <mark.filion@collabora.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 30 Jun 2026 16:28:19 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
Message-ID-Hash: FBT6ZN2QWCCMXDHOMPY4PT3R2HJA5BFW
X-Message-ID-Hash: FBT6ZN2QWCCMXDHOMPY4PT3R2HJA5BFW
X-MailFrom: mark.filion@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FBT6ZN2QWCCMXDHOMPY4PT3R2HJA5BFW/>
Archived-At: 
 <https://lore.freedesktop.org/8d987b07e1d629d358b9127d90359a2088b39763.camel@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello!

Reminder - The deadline for submissions for XDC 2026 is this coming
Friday, 3 July 2026.

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
