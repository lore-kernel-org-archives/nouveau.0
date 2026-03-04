Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424EEEF9001
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 16:12:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0D710EA5E;
	Wed,  4 Mar 2026 16:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="B1gXa7u/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 10DE044E3E;
	Wed,  4 Mar 2026 16:02:32 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772640151;
 b=Pjtsc1GDsyTZHKn7Er00CpKav9G0zF7dPBiu+UX8Yz2kpGc0ifBL2lgM1qnHWs7oQujfL
 3COOgd+XB7ogkF+0QUAlxMYKJAC0jYvn+ehThzD67E4G5P1mYJzU/J685TjEfAWGlrK9xoz
 0JoclOzwYni5+mJAvIWOUE2IlxunnvV4FHlPTf2dP2vu4EB6gX23XL0emKo/4T37pDI9OP8
 NILFf/1qN5syXjznssMqbOkaoUiOYImJQwd+G5qz/m4kLfamu/jPLGWjl3fSEFd1sHdGkZZ
 LmkS7MxLxPKHQP03KMa6yNY0i5mXodZe7ycHfV1evVx7li2VwKRn9Ic4/g4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772640151; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/UZ1fASd581DGwoDXE4nNr7cvDBmu2IMPO2n0Z57d0s=;
 b=WOwMsHq1L9lpfvPHOcit0uOGBB0LZghXtVuTjRS0ydgT0s9HT/QG+RvH1i/WMga1y9KIx
 TBMkXGoMoHNZly9/TVZbUb3LTMMY+16JexrP+bEL7jYcKZKdBS9sc7ZMOr7FdCbBUzfNt9k
 eZ+/4nyze6Kr0Zuf7aKErp66XlSEt2KVzIa8Vc4n+/ExZS2nA108ei3Kbpyw2WwMDK6ZGLQ
 2AkMGAXTSOVUlAAfGA1vT7xT14ExtR0i7UO6n99D/VvlRXea80EIrcXy+7rET+8mqz4NOFu
 cOKTfClLqZp9oL4hNzsFpWxQbpYKQ/dR4xcd2XjjbrcDDq4solCdo4+4iktw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B1D3341E96;
	Wed,  4 Mar 2026 16:02:28 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C164210EA4E;
	Wed,  4 Mar 2026 16:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772640762; cv=none;
	d=zohomail.com; s=zohoarc;
	b=kRUk4O3CAkzGxMf6lwluro+2/Zz82AxFHdSBn1AVH9XeEFz+DgVJiTQ55KyJWsrIYa2OHiRKthYJEV3YdQcOaM8KUF6gCG5IXgVk6EJiFrPv0xDaFLsO7Q0AHgVcNE7ZwSfC1qE3+i9L23m89rRu1bxwXgxULFEfPuyJfIoHTY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1772640762;
 h=Content-Type:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
	bh=/UZ1fASd581DGwoDXE4nNr7cvDBmu2IMPO2n0Z57d0s=;
	b=SGcUttgqGNnv57CByEPkn2GSqhC8MLfPmEtHn+a8SixdvwPNhPkSlqN6dpLdT+WrKxOTDSbtalIR1wl4vvoMLr7X8q4idoRkqLhpodm27Z+HokzaZxV8Kdf7l6UjnP/Zb2GlhW9hmEsHVR8iy1ypnrJ0q3cr2I2dN5/fnCM9yiw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=mark.filion@collabora.com;
	dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772640762;
	s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:In-Reply-To:References:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
	bh=/UZ1fASd581DGwoDXE4nNr7cvDBmu2IMPO2n0Z57d0s=;
	b=B1gXa7u/vRyCFytF/C2IblGhO61hhskl0NxSWvE4ckYXxcyO3lXkjGW5PLb21kLJ
	7zUNCZSLQDYxOMUSaI2QzOSxgdXaaJw52Ifa/nPOtmCPc/Le9XQPO2rK4E3+jyRFrmn
	iItL/LjFC98h7dSQv+5LA3setfy05ivchT3QNeoY=
Received: by mx.zohomail.com with SMTPS id 1772640759959464.1568830656362;
	Wed, 4 Mar 2026 08:12:39 -0800 (PST)
Message-ID: <77e280436ec5b54973a11303dd0446e9f3ab2ba1.camel@collabora.com>
Subject: Reminder: Deadline to renew X.Org memberships for 2026 is March 16.
From: Mark Filion <mark.filion@collabora.com>
To: events@lists.x.org, xorg-devel@lists.x.org,
	wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org,
	xorg@lists.freedesktop.org
Date: Wed, 04 Mar 2026 11:12:37 -0500
In-Reply-To: <0070f3dd-a521-40ee-b6e7-8b1f82e48b66@amd.com>
References: <0070f3dd-a521-40ee-b6e7-8b1f82e48b66@amd.com>
Content-Type: multipart/alternative; boundary="=-Ou9PVGv0Q/xGWensQ9B3"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
Message-ID-Hash: 33QZJQPR6W57ZJDXZCWYJ63B3WCVXWQQ
X-Message-ID-Hash: 33QZJQPR6W57ZJDXZCWYJ63B3WCVXWQQ
X-MailFrom: mark.filion@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/33QZJQPR6W57ZJDXZCWYJ63B3WCVXWQQ/>
Archived-At: 
 <https://lore.freedesktop.org/77e280436ec5b54973a11303dd0446e9f3ab2ba1.camel@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--=-Ou9PVGv0Q/xGWensQ9B3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Just a friendly reminder that the deadline to renew X.Org memberships
for 2026 is March 16.

Membership renewal ensures you maintain your voting rights in the
upcoming foundation elections, but also helps strengthen the foundation
by giving it more credibility.

https://members.x.org/

Thank you for your continued support of the X.Org Foundation.

Best,

Mark

On Wed, 2026-02-04 at 16:22 -0500, Harry Wentland wrote:
> Hi all,
>=20
> it's a new year and with that a new X.Org Board of Directors
> election. Please take the time to log in to members.x.org
> and renew your membership for the new period or sign up for
> the first time.
>=20
> These board members' periods will end this year:
> - Mark Filion
> - Erik Faye-Lund
> - Simon Ser
> - Neal Gompa
>=20
> The election dates will be as follows:
> =C2=A0=C2=A0=C2=A0 Nomination period Start: Mon February 9th
> =C2=A0=C2=A0=C2=A0 Nomination period End: Mon March 9th
> =C2=A0=C2=A0=C2=A0 Publication of Candidates & start of Candidate QA: Mon=
 March 16th
> =C2=A0=C2=A0=C2=A0 Deadline of X.Org membership application or renewal: M=
on March
> 16th
> =C2=A0=C2=A0=C2=A0 Election Planned Start: Mon March 23rd
> =C2=A0=C2=A0=C2=A0 Election Planned End: Mon April 13th
>=20
> If you have questions or encounter issues don't hesitate
> to reach out the Elections Committee at elections@x.org.
>=20
> Best Regards,
> Harry

--=-Ou9PVGv0Q/xGWensQ9B3
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
</style></head><body><div>Hi everyone,</div><div><br></div><div><div>Just a=
 friendly reminder that the deadline to renew X.Org memberships for 2026 is=
 March 16.</div><div><br></div><div>Membership renewal ensures you maintain=
 your voting rights in the upcoming foundation elections, but also helps st=
rengthen the foundation by giving it more credibility.<br><br><a href=3D"ht=
tps://members.x.org/">https://members.x.org/</a></div><div><br></div><div>T=
hank you for your continued support of the X.Org Foundation.</div><div><br>=
</div><div>Best,</div><div></div><br>Mark<br><br>On Wed, 2026-02-04 at 16:2=
2 -0500, Harry Wentland wrote:</div><blockquote type=3D"cite" style=3D"marg=
in:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>Hi all,=
<br></div><div><br></div><div>it's a new year and with that a new X.Org Boa=
rd of Directors<br></div><div>election. Please take the time to log in to m=
embers.x.org<br></div><div>and renew your membership for the new period or =
sign up for<br></div><div>the first time.<br></div><div><br></div><div>Thes=
e board members' periods will end this year:<br></div><div>- Mark Filion<br=
></div><div>- Erik Faye-Lund<br></div><div>- Simon Ser<br></div><div>- Neal=
 Gompa<br></div><div><br></div><div>The election dates will be as follows:<=
br></div><div>&nbsp;&nbsp;&nbsp; Nomination period Start: Mon February 9th<=
br></div><div>&nbsp;&nbsp;&nbsp; Nomination period End: Mon March 9th<br></=
div><div>&nbsp;&nbsp;&nbsp; Publication of Candidates &amp; start of Candid=
ate QA: Mon March 16th<br></div><div>&nbsp;&nbsp;&nbsp; Deadline of X.Org m=
embership application or renewal: Mon March 16th<br></div><div>&nbsp;&nbsp;=
&nbsp; Election Planned Start: Mon March 23rd<br></div><div>&nbsp;&nbsp;&nb=
sp; Election Planned End: Mon April 13th<br></div><div><br></div><div>If yo=
u have questions or encounter issues don't hesitate<br></div><div>to reach =
out the Elections Committee at <a href=3D"mailto:elections@x.org">elections=
@x.org</a>.<br></div><div><br></div><div>Best Regards,<br></div><div>Harry<=
br></div></blockquote><div><br></div><div><span></span></div></body></html>

--=-Ou9PVGv0Q/xGWensQ9B3--
