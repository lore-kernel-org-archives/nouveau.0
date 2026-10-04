Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D16CCA5FE6
	for <nouveau@archiver.kernel.org>; Sun,  4 Oct 2026 17:52:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7596F10E649;
	Sun,  4 Oct 2026 17:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=freenet.de header.i=@freenet.de header.b="GzFNF12E";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1F77E48984;
	Sun,  4 Oct 2026 17:34:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791135258;
 b=pkHCVr65294D3980E9oqfn19o3ZV6q1gLjBV9VZzFzAO7A0eXOIeaoiVcL84EsyCQW0yA
 Myr8K/KmXw7+HsASeI0UGoJuDqd5WxSPAHKMOE8I0RgX5253ajYQFglzHf533rqAm+d7bGx
 GqKvzsEEvaecwztQGY0EaevkJET/26ovuueQpuR0jB9JJS9O5Ki8YhBWDj2uFG/CKJ4N1SK
 AGoc4Duj1iUrgiatav/oSyYPSTmhCGL9lx/Jlje55TZwcv2TOTHPWtUbe/Cp8zzhaDRD5Pp
 8Neqr6cC0l4hmi53qjX0cmS28bZFGg8fRXu157r1v64RFCLTYzlsOGZrBkAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791135258; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2/ESMMhP937gOpnqm+Aja/Ig9u2Am/krOl8ze2wI+bM=;
 b=PzN0l/X2UkYhx8+TnwYd0FKFuexF+m1FfP6iy/R28gcp0Xei3jQaaHHSC/5osHFiwMVF/
 +eMadlasrqZrajL7WBqNZwW9kjqY/8JqrVqEkDTPFdpKTQP8OlrMUeRdrI7/qyACqaJ+Vux
 c7nFtEKSmTqTzv1foT4aThDT8yEH6gEzj4tf+xNTDAi7DwecBbPdJTFWGdEnukqnD532+0i
 PLx4vEXdqGLnm/hdyhm3uBpWqVaDZCIb5UTWZfvVrZ2uHr9uwuGFZHKGvc+9EVD/elyZpgP
 UsJWdiIZihuCtFs/3VmTYuulPEtyR6NamQz9BtDzI9tg0+u4p6PVJjor/kiA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=freenet.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=freenet.de
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=freenet.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=freenet.de
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E969C405E5
	for <nouveau@lists.freedesktop.org>; Sun,  4 Oct 2026 17:34:15 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Sun, 04 Oct 2026 17:52:31 UTC
Received: from mout.freenet.de (mout.freenet.de [194.97.212.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 11E1210E18B
	for <nouveau@lists.freedesktop.org>; Sun,  4 Oct 2026 17:52:31 +0000 (UTC)
Received: from [2001:748:400:2319::3] (helo=sub2.mail.fnrz.de)
	by mout3.mail.fnrz.de with esmtpa (ID georg.schwarz@freenet.de) (port 25)
 (Exim 4.98.2 #2)
	id 1xDQJ3-00000001wM4-0yPn
	for nouveau@lists.freedesktop.org;
	Sun, 04 Oct 2026 19:47:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=To:Date:Message-Id:Subject:Mime-Version:
	Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=2/ESMMhP937gOpnqm+Aja/Ig9u2Am/krOl8ze2wI+bM=; b=GzFNF12Eb1cGFd+W0s3ChAK3K3
	hig6LIRn76YCCpf+3/p6r0RjMcVki8UGfiWwslMLxbNdDCNesDrYJ5BseSGwQJa1Dt85QEvjdfSRy
	Alq25uupTz3gxCOsIPP1PQrYEZ/jOjDJBx5Z4Wd1B7ADBNK1TuZYzqsd5CW7uL5XDGj4KE494AzGX
	plJnBCFE8q+WG0NbO6Z/Y0JeAwcFJ24aETIMmkGD2YwnqPGdO9+sgA+p0HTnnuRhJ5SxSZRf3Lfhv
	fmIVco+8Gs7tu3orj0Z1quo0CVqPzFmgE1NfpwtYXIasPtM5E6BAsjGt8l9Zv8Aw6WBoq0CYBywPS
	IFxtIhBg==;
Received: from p200300ec3721d1002990cf72f1bce58f.dip0.t-ipconnect.de
 ([2003:ec:3721:d100:2990:cf72:f1bc:e58f]:50226)
	by sub2.mail.fnrz.de with esmtpsa (ID georg.schwarz@freenet.de)
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256) (port 465) (Exim 4.98.2
 #2)
	id 1xDQJ3-00000007KaW-0Ola
	for nouveau@lists.freedesktop.org;
	Sun, 04 Oct 2026 19:47:25 +0200
From: Georg Schwarz <georg.schwarz@freenet.de>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Nvidia GeForce 8200M G acceleration
Message-Id: <1559C309-6759-4B9D-80B0-7648496FD7F5@freenet.de>
Date: Sun, 4 Oct 2026 19:47:23 +0200
To: nouveau@lists.freedesktop.org
X-Mailer: Apple Mail (2.3445.9.7)
X-FN-MUUID: 17911360453298FC187FDAO
X-Scan-TS: Sun, 04 Oct 2026 19:47:25 +0200
Message-ID-Hash: NFV7ZO5Y4IUTKKSKCBA2TTZJPW5YO2PF
X-Message-ID-Hash: NFV7ZO5Y4IUTKKSKCBA2TTZJPW5YO2PF
X-MailFrom: prvs=07377e5300=georg.schwarz@freenet.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NFV7ZO5Y4IUTKKSKCBA2TTZJPW5YO2PF/>
Archived-At: 
 <https://lore.freedesktop.org/1559C309-6759-4B9D-80B0-7648496FD7F5@freenet.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Dear Nouveau developers,

first of all, thanks for maintaining this piece of software.
I have an old Fujitsu Esprimo Mobile V6515 laptop with a built-in Nvidia =
GeForce 8200M G.
In order to make it work with nouveau I need to use the kernel boot =
parameter nouveau.noaccel=3D1, disabling acceleration.
Otherwise the system won't reach the graphical login screen, or the =
screen will be filled with "color bars", i.e. some artifacts, and will =
not bear any resemblance to what should be displayed.
This happens on the various up-to-date Linux distributions I tested (I =
now ended up with Mint XFCE).

Is there anything less drastic I could do than disabling acceleration?

As a test, I installed Ubuntu 16.04, which still included the =
proprietary nvidia 130.107 driver. With that one it worked out of the =
box, so I believe I do not have faulty graphics hardware.

Is there a chance to get acceleration going with my hardware? Maybe =
there are some more precise settings I could give a try?

Georg=
