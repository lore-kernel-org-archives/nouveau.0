Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713ECFF8875
	for <nouveau@archiver.kernel.org>; Wed, 29 Apr 2026 21:40:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 29AEF10F18B;
	Wed, 29 Apr 2026 21:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="LuyuGTHZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E607045D49;
	Wed, 29 Apr 2026 21:28:10 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777498090;
 b=E/na/lTG7ba7OmDmiofE5XCyFwZiiWZAWxPVH6476BbOp1SqAI3J0XF75rJM0nm8fESKm
 C1e/+MOPz64+CsTSWAUODFDSNAZEo9PxIIxZ172LMXTsnsW6kdIdwLNcPewLnx/kzhrLa+y
 7fWSFHVRdoerCQuGBQTt5PPODVWLmjuq4ewgmnjR4SmcRKzxBYnlXutQOG6DvnidSGw+HEn
 2eKlikAw/WkT4b9TeSIC6VpIy3y1JH2TAqoX/HuUE7PnAs2Du2xzd7Ao5eFRzzkktfs/ftg
 8af/3ivkMrVH5ehywDqhovlyt0pFybohe426qNgKJ0zO6x+apsKOFBRyU1+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777498090; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WJX7xHCfvTT+uoYdGdgResyGTcDES1g9sRJnLBitFRQ=;
 b=E0hTsEKtGQJfPhTeaQpga0DBG66ZVlKS1ootZ0BBaJey+5DENOPiv85XWMbp6HBiTeKRE
 7DnnDpWP2nJGLNuG/304icq5qBEHckz8UzqGC1LtJTa6qswRRdAhFH3vnNI7pgcs6Ivv6S4
 H09qNowL/YiBJnd7HHDRnsmcgCz6lrJrUZ9pqUhNcpheq0oNDBa+dExSjPYu65MCeJgygtQ
 m1oBiyIRilAwxqA6Ogl39KSWihSdsIpjMuln0eJrJo0v6m6eBurplJifRlTxo3/7BbMcD9U
 lHL2maXFinNm+dmqEFVsbuEtG1n/9E0ws062yGTTpmoxAzADChlE/PgOaMKA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=collabora.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 000DD4515B
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 21:28:07 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D3DD310E11F;
	Wed, 29 Apr 2026 21:40:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1777498828; cv=none;
	d=zohomail.com; s=zohoarc;
	b=iIg3N6KVM9tGksa69tR+Rw1tKEpC6Drno8ArxLJ+CAFg1++FHLqbkE/kTIoPArU6/Zme/Z5PcBWTjDWJuP1LP5LMUgNPrh0uE+FY4rBjxlsNHCqIQTFTE416t+j0Iu8NgXAyPnFFLs2nj3vXx5l1sAgt9hVUYIkk55j5eOeaxbw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1777498828;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=WJX7xHCfvTT+uoYdGdgResyGTcDES1g9sRJnLBitFRQ=;
	b=npG/D4rtyXZda4rONm0viZ5L1zr5IWnx9dwv0K6yYVWUiC0b5+GRxvYd2rBAK8elrBhRwiXJ3Etk0vCGml+7DGylGGXSjmFMauds/0KMrzTAv4dWkbK6W2B15uuoq8Zeq4s3llV1WuopU3VyBeYfcpCjzqkUuKg+Bjn2oSk/6fQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777498828;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=WJX7xHCfvTT+uoYdGdgResyGTcDES1g9sRJnLBitFRQ=;
	b=LuyuGTHZLbfXwpbIMZKOdT6zYqCBj4Na+Yeg3vPMSnUTr5q4KBF+YBb76zVsjYa4
	ePRNj3SgjFJgMyEqoS5x68X1qTdST/sl+8Bv4BOw0/hi5T6oyHrxfEyiyXLg+t3DbjQ
	wYI48w5ZSKE6nIzfZEaA3wuQBkZvkj+lQoOk/OLo=
Received: by mx.zohomail.com with SMTPS id 1777498826399615.4481576439005;
	Wed, 29 Apr 2026 14:40:26 -0700 (PDT)
Date: Wed, 29 Apr 2026 14:40:25 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v13 4/5] rust: drm: gem: Introduce shmem::SGTable
Message-ID: <afJ6ySox_f7g0sfn@um790>
References: <20260428190605.3355690-1-lyude@redhat.com>
 <20260428190605.3355690-5-lyude@redhat.com>
 <afG_HUjCMH2qKjPS@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afG_HUjCMH2qKjPS@google.com>
Message-ID-Hash: JIZKS4ZSFFL2S6I7Q23GQ444GGGRMK7T
X-Message-ID-Hash: JIZKS4ZSFFL2S6I7Q23GQ444GGGRMK7T
X-MailFrom: deborah.brouwer@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Boqun Feng <boqun@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JIZKS4ZSFFL2S6I7Q23GQ444GGGRMK7T/>
Archived-At: <https://lore.freedesktop.org/afJ6ySox_f7g0sfn@um790/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 29, 2026 at 08:19:41AM +0000, Alice Ryhl wrote:
> On Tue, Apr 28, 2026 at 03:03:44PM -0400, Lyude Paul wrote:
> > In order to do this, we need to be careful to ensure that any interface we
> > expose for scatterlists ensures that any mappings created from one are
> > destroyed on driver-unbind. To do this, we introduce a Devres resource into
> > shmem::Object that we use in order to ensure that we release any SGTable
> > mappings on driver-unbind. We store this in an UnsafeCell and protect
> 
> Outdated? No longer UnsafeCell.
> 
> > access to it using the dma_resv lock that we already have from the shmem
> > gem object, which is the same lock that currently protects
> > drm_gem_object_shmem->sgt.
> > 
> > We also provide two different methods for acquiring an sg table:
> > self.sg_table(), and self.owned_sg_table(). The first function is for
> > short-term uses of mapped SGTables, the second is for callers that need to
> > hold onto the mapped SGTable for an extended period of time. The second
> > variant uses Devres of course, whereas the first simply relies on rust's
> > borrow checker to prevent driver-unbind when using the mapped SGTable.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> >      obj: Opaque<bindings::drm_gem_shmem_object>,
> >      /// Parent object that owns this object's DMA reservation object.
> >      parent_resv_obj: Option<ARef<Object<T>>>,
> > +    /// Devres object for unmapping any SGTable on driver-unbind.
> > +    /// TODO: Drop the mutex once we can use Init with SetOnce.
> > +    #[pin]
> > +    sgt_res: Mutex<SetOnce<Devres<SGTableMap<T>>>>,
> 
> As far as I can tell, you don't need this Mutex. Also, it causes
> problems like requiring the reference transmute below.

I think it is also causing a lockdep warning pointing to this sgt_res mutex.
It only happens when KUnit tests are enabled.
If the KUnit tests register a lock class for this mutex first, then when Tyr
later locks it via sg_table(), lockdep complains about the same key being used
for a different class.

> 
> Alice
