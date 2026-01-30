Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543CAE6BF39
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 20:02:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 310C910E380;
	Fri, 30 Jan 2026 20:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="LmtQDvBd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DC78D40F37;
	Fri, 30 Jan 2026 19:53:26 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769802806;
 b=WmlwVA9ioADKgg8/tgvtkrKhLpmiy+ok+PuKIkVOHxunYx3ubDJHamfrtjjH7LBzco4pu
 ZROwHG9QBIz/3kr1W93KVZ7sodnGCOzdt9l1i0NbV0q6LIjRvB6AuMYs0E75CMyTqyUGNpl
 xzndS533U2EKYi5YsJEOl2XmeVLWNQv1mMsAek31Us+MaDz8fNa9Kq0R8ZqpCQWpecyUHSS
 djYEphXkNkXpxljhMCd1YYtWV1gamf6Ylz1RmYL3Pgx8qZ2cRO3Ax+Y6rFTkY/GJQZbT6f7
 +ZyScSyzgXBQ6VF96DnXly0PJQhtCOqPGUflP/YeXft2Tj7AzMURf1w+46Hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769802806; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=y8hQ0pJ2y45BUCdM6h44grmgVVwoS9WEFEAAmL+tgtQ=;
 b=ADHKiXqyMEIa8sYFogTYSW18k6srp36AaPDKXi/j9P64U8Fi+ufsvqgoiyStMoWBBe4xP
 BN29IkxvuqbFhodKChV8qzgjTBgkvt4LaW7hFV/8/lhqRffI/nZW8JG4RuaGCQh+LwLOTLb
 J0cKMcEZkXIVyfDhCqkU4L8g2P3DNlupNl9Fz93v7eXoaDhnJcSUPhQCrigf9HtuWEX+oTz
 euGofMMstUDyAJBsnVm4bqWqDPtgiGftacn4n6E4ic20w8OAojPu6opTzsJmxuQBjhadODa
 1Enzp7sx3cjtaz1q6fygQgNP1imJoy/cYa6fnn/OiaFz0D5H7p3SVG3NUsMw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E84E14015A
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 19:53:22 +0000 (UTC)
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Fri, 30 Jan 2026 20:02:29 UTC
Received: from sender4-pp-e107.zoho.com (sender4-pp-e107.zoho.com
 [136.143.188.107])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E54C810E1BE
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 20:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769802446; cv=none;
	d=zohomail.com; s=zohoarc;
	b=Ya1/HxKkG9ix6A7IUegFeVOm5cdrEqYuPyY48sXZTU2j5wpWueKTLAeOlIUNWTBTgrupAaQmk1XuQCr/l3UPqqmgB6DEiGDz5ozU1O4Nr/sJGBzizw79nOH7j7Clo6jWZ9eNPFXCQ4ujM6W1kQOR98B2M36kQnrzhNkBe5STDy8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1769802446;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
	bh=y8hQ0pJ2y45BUCdM6h44grmgVVwoS9WEFEAAmL+tgtQ=;
	b=FU+sUKsJgLeOaRReNAr5tKpW9KxHMRemZ0O3MIEmIGqIriRmx4B3PihEKhGrMPGGF4Xe6+KOakKjJZGC0m1WpVm2muGWeuzYjZGnuqnKuHp1yrwGYmyNxdPGdBO4RzmJ9bapefOBhJP34Dv7aYk126xu4xnj3R4xCAMzOiYQ33k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=mark.filion@collabora.com;
	dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769802446;
	s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
	bh=y8hQ0pJ2y45BUCdM6h44grmgVVwoS9WEFEAAmL+tgtQ=;
	b=LmtQDvBdeKWkvFFrsXXWBD5ehYYKHXBlBiRA9xMwEPx7jz66qOliVdToN2ks/56o
	L7TCDtjoKQ596CFXYnb437arhyiIWWse0oLhkmrG9mBzNdmzzv59zENel7P1Jky9TA/
	4RXdlxl32/4PEqS4yry5/0iXfHWqBJFghAp021R4=
Received: by mx.zohomail.com with SMTPS id 1769802444400859.6360689753798;
	Fri, 30 Jan 2026 11:47:24 -0800 (PST)
Message-ID: <449e33648750002176ba2071a65434deccedd577.camel@collabora.com>
Subject: Save the Date! XDC 2026 comes to Toronto
From: Mark Filion <mark.filion@collabora.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 30 Jan 2026 14:47:22 -0500
Content-Type: multipart/alternative; boundary="=-DLVveY778K7kFxhCXJlu"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43app1) 
MIME-Version: 1.0
X-ZohoMailClient: External
Message-ID-Hash: WT3NBJHUEYDRVSE43QGLS2HMYPHZRXNY
X-Message-ID-Hash: WT3NBJHUEYDRVSE43QGLS2HMYPHZRXNY
X-MailFrom: mark.filion@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WT3NBJHUEYDRVSE43QGLS2HMYPHZRXNY/>
Archived-At: 
 <https://lore.freedesktop.org/449e33648750002176ba2071a65434deccedd577.camel@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--=-DLVveY778K7kFxhCXJlu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

We=E2=80=99re excited to announce that XDC 2026 will take place September 2=
8=E2=80=9330
in Toronto, Canada =E2=80=94 mark your calendars!

The conference will be held in person at Daniels Spectrum, a vibrant
community cultural hub in the heart of Toronto=E2=80=99s Regent Park
neighbourhood, just minutes from Yonge=E2=80=93Dundas Square.

We=E2=80=99d also like to extend a sincere thank you to Arm for organizing =
this
year=E2=80=99s conference and helping make XDC another great success.

Registration and the Call for Proposals will be opening soon, so stay
tuned!

Until then, be sure to follow us on Mastodon for the latest news and
updates:
https://floss.social/@XOrgDevConf

Best,

Mark

--=-DLVveY778K7kFxhCXJlu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hello!</div><div><br></div><div>We=E2=80=99re exc=
ited to announce that XDC 2026 will take place September 28=E2=80=9330 in T=
oronto, Canada =E2=80=94 mark your calendars!</div><div><br></div><div>The =
conference will be held in person at Daniels Spectrum, a vibrant community =
cultural hub in the heart of Toronto=E2=80=99s Regent Park neighbourhood, j=
ust minutes from Yonge=E2=80=93Dundas Square.</div><div><br></div><div>We=
=E2=80=99d also like to extend a sincere thank you to Arm for organizing th=
is year=E2=80=99s conference and helping make XDC another great success.</d=
iv><div><br></div><div>Registration and the Call for Proposals will be open=
ing soon, so stay tuned!</div><div><br></div><div>Until then, be sure to fo=
llow us on Mastodon for the latest news and updates:</div><div><a href=3D"h=
ttps://floss.social/@XOrgDevConf">https://floss.social/@XOrgDevConf</a></di=
v><div><br></div><div>Best,</div><div><br></div><div>Mark</div><div><span><=
/span></div></body></html>

--=-DLVveY778K7kFxhCXJlu--
