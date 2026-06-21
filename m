Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD0DCD98F2
	for <nouveau@archiver.kernel.org>; Sun, 21 Jun 2026 13:00:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6C110E39B;
	Sun, 21 Jun 2026 13:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QgqqEt8f";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4A40D46BD4;
	Sun, 21 Jun 2026 12:46:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782045985;
 b=DzdFg/bQ2GE4RKmijMNcFknZPpzAbQKmJGMAZWbIUIWiTfFfOwHbuasWeDNldAWX3N7lf
 3Dwr8bpjcqq98+LPk8Kmwlv3rOoBVirHG1jPKXzBColxGGKonMnZuJzh6aWNkhYdE7RSD6j
 RCIOvwyTXDNUBoZ8mGPoW8Vd+pC/Lp6SEpv1EwXuekYm5IhYT769/YKrIheIPUttXY8MtPb
 N29Nj3vpnH5BZn38OnCE7FAOCyl4PuXAo4i2z4ALZta8C/gUmyc41ZSJfeDmdJdobe66ZbM
 omJjGAd2i/vKAPktPcUFsFHY+8SKGhIdDD4sbPiRaBopnWTH8sF9XDmvIUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782045985; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8lxJr0Ff/uWo6FpO6JrLPcU60RV27XXd6YBLWVHwVrg=;
 b=no7Q1SO2/ajXojMECEXQJRBW6++7arLxt/eINay9BRDQy1gsznOd8VdPriYSLSRkZnryz
 iqL9QlVhNmn8apFahP3wZhjGnfjpXG45IjI+ENQ30d+RybiMac/P73y29cFb+Slla44H5o/
 za3X/9ah7aQlINVi12fQ3YRJzb5p/VRKnMnmSVIx7AbOPR09TXCskGBlaZ7A0VW5uj6kWpQ
 HajfTU87g9Xr6voZRokojxO8h7poaV/7dJFmBbZarqleCvcGljPh3YYZ8k0d3/Vudbq4r9m
 RTzifWjLK0ALLt0uaZEYnmyWI2P6B5MQqdrP4DKj0RXE2EULe4PH/Uu+R6WA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 51EF4405F7
	for <nouveau@lists.freedesktop.org>; Sun, 21 Jun 2026 12:46:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF9910E38F;
	Sun, 21 Jun 2026 13:00:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C502143957;
	Sun, 21 Jun 2026 13:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11891F000E9;
	Sun, 21 Jun 2026 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782046844;
	bh=8lxJr0Ff/uWo6FpO6JrLPcU60RV27XXd6YBLWVHwVrg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=QgqqEt8fkjzYqED2Zo0KdWJCse6Moh82r2qaEY4rYC7oFNfzMRJ/SL0svtmZmvw4D
	 +zmoYEWTRwyTpOH0Off/PkWC7uFvtBAa3FrfH6rfgds3aeMlFop8UTDr/2Zzw1fFgF
	 reZeEE5/PtjdRCrpUOCI/ZJdt5j6vbz9/HrmdmXbhlDIZ7Ptc7Ep0hSnhA8cJHptBf
	 ylItNv0aMdS0V8rf83DHy0OxA/UHp9OwItGNcorSvl/iC2J/TfRIZwmRoDOoyf2epA
	 T88x9r8jN6tPX7hZ0Rg2xZOQXJPIEhaZdvqJ0xulONioJeIsVJvJ4KKwJXzX9qK5N7
	 xqXRlV/IlAWBA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Jun 2026 15:00:40 +0200
Message-Id: <DJEQVST8KK4D.1DX65CF227WWC@kernel.org>
Subject: Re: [PATCH v2 0/5] nouveau/gsp: Clean up IS_ERR vs IS_ERR_OR_NULL
 usage
To: "Hongling Zeng" <zenghongling@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260601095403.228220-1-zenghongling@kylinos.cn>
In-Reply-To: <20260601095403.228220-1-zenghongling@kylinos.cn>
Message-ID-Hash: DBHFBNOMP5F7BULUCGIDXV4WYYS2T2HG
X-Message-ID-Hash: DBHFBNOMP5F7BULUCGIDXV4WYYS2T2HG
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 airlied@redhat.com, bskeggs@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhongling0719@126.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DBHFBNOMP5F7BULUCGIDXV4WYYS2T2HG/>
Archived-At: 
 <https://lore.freedesktop.org/DJEQVST8KK4D.1DX65CF227WWC@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jun 1, 2026 at 11:53 AM CEST, Hongling Zeng wrote:
> Hongling Zeng (5):
>   nouveau/gsp/rpc: Document RPC function return value contracts
>   nouveau/gsp/rpc: Cleanup incorrect IS_ERR_OR_NULL in rpc.c
>   nouveau/gsp/rm/alloc: Cleanup IS_ERR_OR_NULL usage
>   nouveau/gsp/rm/bar: Cleanup IS_ERR_OR_NULL usage
>   nouveau/gsp: Cleanup IS_ERR_OR_NULL in nvkm_gsp_rpc_rd()

There are a few more comments from Sashiko, did you check them?

Thanks,
Danilo
