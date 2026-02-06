Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A56EE209F
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 13:46:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1016610E780;
	Fri,  6 Feb 2026 13:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Sb45cyqK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BD3C241B4C;
	Fri,  6 Feb 2026 13:37:09 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770385029;
 b=rwgV6+y4Igw/kSdkoEIXYzL5YrTmOoctAiRZV+AzJ7Vnwi8u/CASNRMC6DI4xLdwtSXmd
 dftL2Wk4mMJCUpiseSMzhb6ureRn4p1a41qfbZnfFiC6iO2rj/BMwneMK8hxjTM3n8wuhpH
 X1yKTracQ+tWqb36r+RkAP4zc00kkmDHzugBYRRk7OpAzYp6s8OwFkLTJTg/vfSjAL9Sgtz
 wggtkQeGAyuVQUAphVBsbfY8/rQN73oOi/QNzaULXn9eikAk63Aoht7/UapIe5ddJkhGrsZ
 GhKXeYlayAzxos01VvXjjipAwMD4V/EOtssu4BP5s+rXf7g1mbTGplgKEyMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770385029; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jII4uV7+Vs0Ibvaq1++auXI/SyWNRdG9jXgAmegXSN0=;
 b=KtxNhhvxlZ7n+BE2nOhIMp13Qy5tV6miG5OHzRx48+li/R9QAw6imDC9HoixqZ92RWGwc
 q8pyDAujAQSXxzFEDokg6Cz7CHHcNjvoTT24HyyviMZpK0eeB0MYc6JZOGAffUQSielgdsD
 uI3H2jLkhebZvkrP/HdS/7Cor+BkViIZoD/NI1VrV4eVDHgDPXra2TGXppE2fZkAtxLrlbt
 6mD9acGeYJoeKGyA+gk6KTmM8AGjafmErl3YBNu2Ziejq7Q5jAXEoJJ9XtRqX7M/2Ke/ZdB
 5ndEg/mGJEpFPJs0vWPgpfZN097WjIyVEiPn7ozEfp+GG75Sv3zLe+dd+zMQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E54D040492
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 13:37:06 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E09E610E744;
	Fri,  6 Feb 2026 13:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770385585; cv=none;
	d=zohomail.com; s=zohoarc;
	b=bYrsqXyxh2adE/va+HbL2hL1RyIBilD7Up1xYXKSCrqgCYHYqZHmvp6juLTds9bTD0Q+PQrXeuQceHHV/VgGDN2MOhwRgMOmS5URYbg7xIasfUm/LcWg7praszUcq4B1kq9FAXLlY7WFakU1uMLZXz37roJpc6Vmd/5Xz9mjRPE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1770385585;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=jII4uV7+Vs0Ibvaq1++auXI/SyWNRdG9jXgAmegXSN0=;
	b=V/xmudkZdfPYVrmJNW1jkkFf8IsNj9p+8l38OASid1Tb6uYUGsiDozmWxk11YkbV/bvIH7/TfuD9pGzlrzUbpmc+ajPJyxFPVDfcK7qj7+o/xw0ue8nHXDPqJp1WJVoTYIww3P8nSZ3JBG9dgQSmW7xpYd/u0pa3M7qwY1QFyiY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770385585;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=jII4uV7+Vs0Ibvaq1++auXI/SyWNRdG9jXgAmegXSN0=;
	b=Sb45cyqKPMZ/rkdzUKdv1wwbs4cJWLRZnWalNlAC6/Qf9Oaw9uMWPBDHW7xn7Bx1
	YmEW3a9O2iu5qISAvyxddLKYYkmSFhixfIRkI4HqF8vu1A33eBdOVEQWV3V5HeiEU0Q
	Eo5mvT/HFK1rEOGKiufdfHcvFjbUEL7rljkpyvQo=
Received: by mx.zohomail.com with SMTPS id 1770385582739892.3909061737788;
	Fri, 6 Feb 2026 05:46:22 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 2/4] rust/drm: Don't setup private driver data until
 registration
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260131001602.2095470-3-lyude@redhat.com>
Date: Fri, 6 Feb 2026 10:46:07 -0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <C1C710F6-CB04-4A44-BE3C-EBD12A87701D@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
 <20260131001602.2095470-3-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
Message-ID-Hash: N5DBGIEGMU6TX3WQQ6SSK4PB763PLJVY
X-Message-ID-Hash: N5DBGIEGMU6TX3WQQ6SSK4PB763PLJVY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/N5DBGIEGMU6TX3WQQ6SSK4PB763PLJVY/>
Archived-At: 
 <https://lore.freedesktop.org/C1C710F6-CB04-4A44-BE3C-EBD12A87701D@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



> +
> +    /// Keeps track of whether we've initialized the device data yet.
> +    pub(crate) data_is_init: AtomicBool,

Oh well, I was unable to think of a better plan than this ^

Nit: you=E2=80=99ve added a few pub(crate), consider whether these could
be pub(in path) or, better yet, pub(super).


Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
