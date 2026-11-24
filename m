Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0DF606A32C
	for <nouveau@archiver.kernel.org>; Tue, 24 Nov 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4Sx6EYH
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A170710F52D;
	Tue, 24 Nov 2026 12:00:18 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 88FDC403B3;
	Tue, 24 Nov 2026 12:00:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795521613;
 b=EJiV3GiQlRqD4/BzSCdwDMvMU3gcXvycOLu/tbbddoGzJvWhxb+3kBpCXwKe+j8hPGdd0
 Fxi3Q5nrywkxdiP+MBZZatFikbtFLHCDN3TXB8Te7Hq1ohuztD6xa5usqyu+YjZK5oriBqd
 tdvag1nyCdaPOIZjgiA3uJ9ierkHo5YLTkmqs+OIxa2qedZ9aXYZ7w7P+jtMRz83gJteRJ7
 xzIzWUu9UtBHzi8zYEJBtDwDsjLLH4OMUIH8JeUlRu9AkoFTtjTaGW9LX8D70WWMn2bfqX7
 ju93tKCI3xtpDfrnPNEohXaff4T0f3nKDzp4lGH1GEPj38pnwIQcO009+1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795521613; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VJLol9QNgQ8sIKCWFbA7w8PHUKOB+IRHa3RMNrUFjZU=;
 b=NG5fPAL5fccr4ERx7gFC0tjW9R3zjRH7H7kwWJOCBSMoECgPJEyGsR/V23BGcF7xO1upM
 3rCOKYymvVzYTsfE0TOKBFiCli6Bdl0wO7nqi3c7lMUkEcdlAnMVnOzesMMNT6el7vI+vmX
 GpzP19XcgOysgSPzmvowkH4VDuAIXnLJxGAw1XJaDFqPSIbcCb7vtUv2W48oPfWb1h19pVR
 ilanRLADY9J7sJAel48HbHBz416X2mUEQ1pe29av3WIECYg8tECkvSZw0x5ABVuWu81phoB
 el0lawGIWOkV2GzbIaWQXZE9TPUgQUYKP8zfuMBST+H3Bwzz66rYx5BgjsgQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
 arc=none;
 dmarc=pass header.from=kernel.org policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1D96440218
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 12:00:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 095FE10F525;
	Tue, 24 Nov 2026 12:00:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46FC3601D7;
	Tue, 24 Nov 2026 12:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827EF1F000CA;
	Tue, 24 Nov 2026 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521605;
	bh=VJLol9QNgQ8sIKCWFbA7w8PHUKOB+IRHa3RMNrUFjZU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=O4Sx6EYHLxDJiMmqs4rZeop3a92PV+k7ISEmre12ro3B6AL5qxuvuKcgFaiUtVEWN
	 yuj0fP+wK86JN0o444myEpVzsj3hhv9iDCFGeZLk76Zs2il91I6GnCZejBdPbyd2bj
	 +UdR4hbGIzxUSmqAtzL/+jXbnsE2qqKsCk/2dFq1UehRWx3YtBCo5QgqUBHRpacmOc
	 ewAj6/7+pcHe3ZsfcRVvK5W/7cvOrZgqBzINKTqO41mN3R61P+PO0pAqT6b6CpPZE7
	 zMhu5W96onuEsbJeMaKP5idsB0M6difo03mREs8IvdHiygXE9GMT79y3/b7wd3TmnZ
	 R700/Jo99UmgA==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 12:59:59 +0100
Message-Id: <DN3FABTSKUC6.2VK9DKQIBAPFO@kernel.org>
Subject: Re: [PATCH v3 2/2] nova-core: only bind to GPUs when explicitly
 requested
To: "Dave Airlie via B4 Relay" <devnull+airlied.redhat.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261124-nova-nouveau-gsp-v3-0-e1440479ded6@redhat.com>
 <20261124-nova-nouveau-gsp-v3-2-e1440479ded6@redhat.com>
In-Reply-To: <20261124-nova-nouveau-gsp-v3-2-e1440479ded6@redhat.com>
Message-ID-Hash: HUOULDGBP3X3DFJ6Z3KHRFQ5TJYYLJRB
X-Message-ID-Hash: HUOULDGBP3X3DFJ6Z3KHRFQ5TJYYLJRB
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
CC: airlied@redhat.com, Alexandre Courbot <acourbot@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 nova-gpu@lists.linux.dev
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HUOULDGBP3X3DFJ6Z3KHRFQ5TJYYLJRB/>
Archived-At: 
 <https://lore.freedesktop.org/DN3FABTSKUC6.2VK9DKQIBAPFO@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Nov 24, 2026 at 6:50 AM CET, Dave Airlie via B4 Relay wrote:
> +config NOVA_CORE_BIND_GSP
> +	bool "Make nova-core the default driver for GSP-capable GPUs"
> +	depends on NOVA_CORE
> +	default n

I've replied to v2 regarding this: https://lore.kernel.org/nova-gpu/DN3F752=
1O232.LXJ8JBRTSTPQ@kernel.org/
