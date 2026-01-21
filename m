Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D49C44526
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 12:58:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2E28010E785;
	Wed, 21 Jan 2026 12:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.b="FTEGwngV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9CD10402CB;
	Wed, 21 Jan 2026 12:49:25 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768999765;
 b=Fv0Jdo1NfqKC6iSFjP14HGYkFv8Dd+k+5Ubo4hHq13ZzlVjJgqfWQR3oZZJDt41vPFbHP
 X/EwfJ6gKEPg3NKmuObEvvrmtVCnhgG5dYMiKzPuibeHTV1GgwJIjC8N3iwc+PkT15prfXW
 kX6NhDd1HBPLv2fFVj4zLOY0UgxDxvxTWPTDbF5G1CuIAAJ/+Ni4AY1wbhx0llD21Q2ddgJ
 r3DVQmtLf+p+m16ouX1NragfIs9yGv5wueiwYuwzETpqPxf6Z6upfYTE1bGAseHzyAZXmZp
 dJDlGl6xoAV+ijP89rmfdrzvZ7C9IHjvRelJpWACtkv4gttq1pTmlvPrYhng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768999765; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=289Atm7oPq1l3r6V8vm4GQYEXnTPwmsMGTT3QqYWfFE=;
 b=mIJk31GD/T/euAGTbK6clMQ/F3E1dlwghJzqqMoXDxwHaDioFL4f+Be90v+qaiBqCPTXr
 kcybw54n389YY2sTUZoEkIhUxTxm5LF2mjt/c6d+T6Yk794UF7tXAg/duNqdanTp/QHCuEu
 BpKtJdZbyaq/jMIpIi6HzoV0uxOB4o+zZSdOJ7SVuNTnhdpn9ar0hoo22TyPmtngMzvm4FS
 G5fgTCXHTzLGig1Py2fR7SfppDIlFJeMSsMF823VGAFn1pP6h2/jexQ1ogM+87ALsBP+7lp
 Q8IbAy4hvzGDe13UonL2RSiE9F50IP4Eeor7NG/ctnrewOPN+GoR9TPS3xqQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=linux.beauty header.i=me@linux.beauty;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux.beauty header.i=me@linux.beauty; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BE0B244C5B
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 01:28:52 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1336810E192;
	Wed, 21 Jan 2026 01:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768959452; cv=none;
	d=zohomail.com; s=zohoarc;
	b=liIeJTKXCCTCr5TmSEz7NNqhik/u8Lgoyl6wqMLoKAznnAIjdnWADV2hmFD7Lcl4TfZx7cjaT36PCVYQANmxQeq0vzBLg7VNsuPrP4wrLut5ZqUGrqwF24a/t+2GALw44P+uHy5N/+oLEKnekij5fJREsa7nXRwNjXhirWzM1HE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1768959452;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=289Atm7oPq1l3r6V8vm4GQYEXnTPwmsMGTT3QqYWfFE=;
	b=JrBf5NRjWzqzI3poX5JkkT4XxekzYgY/nmxTsMoh5TkJJZyrL/z6lAb/tJ2/oTWivoNKCUopt7P/roX/47EXU4lV8nqbLx3JO+hbYi1uOlo3YGri5ASkaclmbh1V6zmX4DrITJpovTfLhcXjZ8NyCME9vKo+KBL8OFg4f/RjAyI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768959452;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=289Atm7oPq1l3r6V8vm4GQYEXnTPwmsMGTT3QqYWfFE=;
	b=FTEGwngVgxHZJC4CHqNeP06r2l8R0UEhOPrtbhJEB07L7h9qBkNqnN2gr5dQYnQq
	9K52QKybxPDioAj7ibU7qNxnCuumgPDMG5S2HqpFFATWCkCGd3WfoqxwzPHiDds9tKU
	GB+eGSRY7qH6bPFE7pw9DhfhgN4DIrq6fGC4PYRA=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1768959451085884.078207294641;
 Tue, 20 Jan 2026 17:37:31 -0800 (PST)
Date: Wed, 21 Jan 2026 09:37:31 +0800
From: Li Chen <me@linux.beauty>
To: "Danilo Krummrich" <dakr@kernel.org>
Message-ID: <19bde331fbd.dd44bec734977.5910036498943757747@linux.beauty>
In-Reply-To: <DFTV9NQTFFU0.NOD8PPU8HW8L@kernel.org>
References: <20260120121455.142960-1-me@linux.beauty>
 <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
 <19bde085588.1b451560725069.154128025837198067@linux.beauty>
 <DFTV9NQTFFU0.NOD8PPU8HW8L@kernel.org>
Subject: Re: [PATCH] nouveau: pci: quiesce GPU on shutdown
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-MailFrom: me@linux.beauty
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: ITFWDCWDSVKKU2T4D5QI42M3Z5K42XF4
X-Message-ID-Hash: ITFWDCWDSVKKU2T4D5QI42M3Z5K42XF4
X-Mailman-Approved-At: Wed, 21 Jan 2026 12:49:23 +0000
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ITFWDCWDSVKKU2T4D5QI42M3Z5K42XF4/>
Archived-At: 
 <https://lore.freedesktop.org/19bde331fbd.dd44bec734977.5910036498943757747@linux.beauty/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Danilo

 > On Wed Jan 21, 2026 at 1:50 AM CET, Li Chen wrote:
 > >  > > +       usleep_range(200, 400);\
 > >  >=20
 > >  > Why is this needed? it at least needs a comment.
 > >
 > > This patch is needed for kexec/KHO/LUO reboot: firmware reset is skipp=
ed, so the GPU may remain in an active/DMA=20
 > > state and the next kernel can fail to re-init nouveau. We can=E2=80=99=
t call the full DRM/TTM teardown from ->shutdown() because
 > > userspace may still hold DRM fds during shutdown, which triggers WARNs=
.
 > >
 > > So the shutdown hook reuses the suspend/quiesce path (safe with open f=
ds) and then powers down the PCI function (D3hot)
 > > to leave the device in a consistent state for the next kernel.
 >=20
 > I think the question was about the usleep_range() specifically. :)
 >

Thanks for the hint.=20

That usleep_range(200, 400) is just to give the PCI power transition time t=
o settle before an immediate kexec jump.

 It=E2=80=99s mirroring the existing nouveau_pmops_suspend() behavior, whic=
h already does udelay(200) right after pci_set_power_state(..., PCI_D3hot).=
 In ->shutdown() we=E2=80=99re allowed to
 sleep, so I used usleep_range() instead of a busy-wait udelay().
=20
Regards,
Li=E2=80=8B

