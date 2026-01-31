Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E532DD49C9E
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 00:10:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A36B10E079;
	Sat, 31 Jan 2026 00:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W4xC6phT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EAF7340F63;
	Sat, 31 Jan 2026 00:01:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769817701;
 b=TYc7gHo88GtGGYo34YVX65mx5ZyF3zWPdf+fe24IJPJg/NF1ul47stwg/UM+o+9ceYoDJ
 Zn0BjAd6LYx4wMTEEmi9MZoJHAr3lbzngiV5dG1rtMmVE+V9q2va8Hnu3ZYllNVtbVTI2yT
 R9KyO4F4MWOnioSfSN7/BqMM83WB0AnE/vnzIgvFk/lrcuyWIndZ1KYamrK0Kpjf06UPH2h
 lh7N+qaQVWNRUoEZ8c4M3qvS6CYnVGUxInbP4BqSEgBmcTLb5UkI7YwQReaKanscAVNxM1G
 2ZMliKSJ3v+A7eALotCsqZOCyI44sq/oU0IJauJA4kAT7X+YrbXRVEbWdFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769817701; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+PJYugJXb03mJ2e4M9oSzRL+RG5M8BzHTo8gm7zB+yI=;
 b=CUyi1Pkr9XrrlZpml8jyHw3Aemaq1yDS1kKGnbCiG4Wm4RjrUVNCRwH5FuKagZUuMG4Ue
 idl9L1TTMxKyS9fkQ4O+HAy3hFp1wvRbWsq3JYaRT6NlwbLnphFfF7KPOdEVEU100L36HTA
 IT6338eYmv0HjSR4nDQgbBCtrgrF5/KTJZxqL9WimPwruvZ4CW+AR8ct2+0CHmS2TIx63pc
 JvPNa8f4C1fG4DQq7R8gAWq3XCek3Hyw6DO8nXS2gbVRK0I1XavO7R4iojb3n71DwNsx4F6
 m54Is1mwyFWdGltaGoZriQpTZTlfCBgYT8Y8asJ2QRI64Zp4OLLlblEjKsTQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 912FA4015A
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:01:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E748210E079
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:10:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A46F541A2E;
	Sat, 31 Jan 2026 00:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F65C4CEF7;
	Sat, 31 Jan 2026 00:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769818245;
	bh=0cIaYkeyUjjiU2nhtPN1N3DQIRS3hiEuBd58WC6s2A0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=W4xC6phTp+UHC9MMZ2soFrScfG9X0Z5P8LlEWBD3vuZHAMZnT5R0htxtSonkbZ+TL
	 EK7lPrgm/K7WxdWUtowaqCktkAoar/kY8Htrj//g7WZi65pJJZYCxZIPxRCvvh/6B6
	 WB3sElNSALd97+1aLxprLAcRb5bc4T54P6WYCKQ80Bqqe0CeFs2jPiSNzJ/J1rIc7+
	 pwqmg64onemwibh5LIAnPctm1s9qP8pWxqqG3Q0X9Cz+pjYDnfnHXpkmwZW1iMFdGX
	 JqlYMW03HZmzS3JIITA+J03YAWQuDRBLbkqwShv9l83jJ58dG0IEux7R1r0FGTI9XR
	 FD/PkqOyim7sA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 01:10:41 +0100
Message-Id: <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-8-ttabi@nvidia.com>
 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
In-Reply-To: <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
Message-ID-Hash: P6WVOCK4ZPLVHMX3CXEVVZH4IKL4FOYY
X-Message-ID-Hash: P6WVOCK4ZPLVHMX3CXEVVZH4IKL4FOYY
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P6WVOCK4ZPLVHMX3CXEVVZH4IKL4FOYY/>
Archived-At: 
 <https://lore.freedesktop.org/DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 31, 2026 at 12:58 AM CET, Gary Guo wrote:
> On Fri Jan 30, 2026 at 11:36 PM GMT, Timur Tabi wrote:
>> I think there might be a problem with this code that I don't know how to=
 resolve.
>>
>> If CONFIG_NOVA_CORE_DEBUGFS=3Dn, then DEBUGFS_ROOT is None, and so the .=
as_ref() will also be
>> none, and the .expect will cause a panic.  We don't want that.
>>
>> If I remove the .expect(), then log_parent becomes None, but then the .s=
cope() won't compile.
>>
>> I could wrap the whole thing in #[cfg(CONFIG_NOVA_CORE_DEBUGFS)], but my=
 understanding is that
>> the call to .scope() is necessary to ensure that LogBuffers is not dropp=
ed at the end of this
>> function.
>>
>> It seems like I'm going to need to do something like this in struct Gsp:
>>
>> 	#[cfg(CONFIG_NOVA_CORE_DEBUGFS)]
>> 	#[pin]
>> 	logs: debugfs::Scope<LogBuffers>,
>>
>> 	#[cfg(not(CONFIG_NOVA_CORE_DEBUGFS))]
>> 	logs: LogBuffers,  // Just own them directly, no debugfs
>>
>> But the design of debugfs is to have it not care if debugfs is disabled.
>>
>> Any suggestions?
>
> I think the rationale behind current debugfs design is that when it is di=
sabled
> in its entirety, then all of the code are compiled out and you're leaved =
with
> ZST, so code don't have to care at all and you'll still have no codegen i=
n the
> end.
>
> However, when debugfs is enabled, but CONFIG_NOVA_CORE_DEBUGFS=3Dn, then =
using
> debugfs functionalities would *not* be compiled out (so, for the `Dir::em=
pty()`
> patch in the previous iteration, all of the debugging facility would stil=
l be
> around with CONFIG_DEBUG_FS=3Dy and CONFIG_NOVA_CORE_DEBUGFS=3Dn, which i=
s not
> desirable).
>
> The straightforward solution is thus sprinkle `#[cfg(CONFIG_NOVA_CORE_DEB=
UGFS)]`
> everywhere where debugfs is touched, which is non-ideal.
>
> One idea is to create types that look exactly like `Dir` but always ZST a=
nd
> no-op regardless whether CONFIG_DEBUG_FS is enabled... But that feel a bi=
t..
> weird. Matthew, what do you think?

There is no need for CONFIG_NOVA_CORE_DEBUGFS in the first place. The only
Kconfig we need is for retaining the GSP log buffers after driver unbind.
