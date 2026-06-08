Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EACCD8C9D
	for <nouveau@archiver.kernel.org>; Mon,  8 Jun 2026 13:57:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F1C7A10F411;
	Mon,  8 Jun 2026 13:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="mSUBhBoh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A75974685A;
	Mon,  8 Jun 2026 13:43:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780926216;
 b=QiPXsgyyNOAcZJMliZ2hDFKBwq0oqRBF0E7OKL80ONUBMSd9Kd6AdEUwPW/pUndFhWO+B
 ka3l2Ofil3vqGLpYfKqqCvgvcQNuS/gsyWVpE0953a5d3vnJQOXMTzvU5gS21Fau5JXlheY
 5VJpqbxeVNmFPZWCeEhQ/nQrnZb4VBSINtFzqq/EHnH0A7vZusdvPEFlgRhGQqxiHhiuUy8
 0YBeeTp+b7QowKwiob0NX3lB4Lg8MtcQet53/nSbRvxfr7EAFvbiYBBpDmFdt85o+chE5M0
 iNF6RKGaEOaoDcZHh4MmItGO3j6l39OtQcbbZKtbzeWQPuTVFqvliIV8iNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780926216; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PUAzZqFOE1r8m01APLHVgv/zFAIdkEgJl07BOOwnD+Q=;
 b=JbMt3oHPlpWs9MlXpzd6RecGZAyJdJ6jOd6cmXxiHS17R+n7L4nSa7bJc+RgR+HK0MeOd
 nmvgO4IjCNFHtiFyjDQemHHHniaxUFbCcwkGV6lSU2xrgi4zJg6Gi3re0sbjT2cxi+ygnt9
 9ONmT8g5YukKWwRsZrIyvKlpsK//rG3hBKFenNvCFKVyefUI2DXhU0p3AfrFDp/T60682Wa
 ih8t4KECgeaoyq+PYSmBDEdeRYwV48MudQWeSwuoMSoFxXeKlWcn6ENE2WpSJD9IpdkZdPb
 knUhI0oaMLeTysVcmD7E5ElXzlWlTIVzXvyCX3H2CWCQgyVrM1g7w8fQF61g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=seu.edu.cn;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=seu.edu.cn
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=seu.edu.cn;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=seu.edu.cn policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BF394466E9
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 13:43:33 +0000 (UTC)
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Mon, 08 Jun 2026 13:57:24 UTC
Received: from mail-m10230.netease.com (mail-m10230.netease.com
 [154.81.10.230])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5C810F40C;
	Mon,  8 Jun 2026 13:57:23 +0000 (UTC)
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 418697a0a;
	Mon, 8 Jun 2026 21:52:17 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: ttabi@nvidia.com
Subject: Re: [PATCH] nouveau/firmware: fix memory leak on BL load failure
Date: Mon,  8 Jun 2026 21:52:18 +0800
Message-Id: <20260608135218.3413471-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aa2e39a828634f20852d066f593f26510fbdc2d9.camel@nvidia.com>
References: <aa2e39a828634f20852d066f593f26510fbdc2d9.camel@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ea7816a8a03a2kunm10e519bdf5324
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTk5JVhpJS0lPGkkaT0NDTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=mSUBhBoh0496xG4IiMYv5fe7It4OxD9eTPVOkNlmdB4vm520ELI4bYLj9R/YziGnOA7drsT3LqfYmPOjmRkbMJhKYoGBKqtDLXlWUPp9ktE+vZsjFQRIgsJGS79ZnfDIAxg2lMUGCv3s3wkryPG5OOUZJvv/6CxUIZjLG0kTwuI=;
 c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=PUAzZqFOE1r8m01APLHVgv/zFAIdkEgJl07BOOwnD+Q=;
	h=date:mime-version:subject:message-id:from;
Message-ID-Hash: LWRZIF27BYC2374PKH3JVIBLSGV5NNT3
X-Message-ID-Hash: LWRZIF27BYC2374PKH3JVIBLSGV5NNT3
X-MailFrom: dawei.feng@seu.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dakr@kernel.org, dawei.feng@seu.edu.cn, dri-devel@lists.freedesktop.org,
 jianhao.xu@seu.edu.cn, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, namcao@linutronix.de,
 nouveau@lists.freedesktop.org, simona@ffwll.ch, stable@vger.kernel.org,
 zilin@seu.edu.cn
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LWRZIF27BYC2374PKH3JVIBLSGV5NNT3/>
Archived-At: 
 <https://lore.freedesktop.org/20260608135218.3413471-1-dawei.feng@seu.edu.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Timur,

On Fri, Jun 05, 2026 at 06:22:41PM +0000, Timur Tabi wrote:
> I think it would be cleaner to instead delete this
> nvkm_firmware_put(blob) call here, and just rely on the call to
> nvkm_firmware_put() at the end of nvkm_falcon_fw_ctor_hs(). Then you
> won't need "blob = NULL".

Thanks for your review.

I don't think we can drop the nvkm_firmware_put(blob) here. At this
point, blob still points to the image firmware loaded at the beginning of
nvkm_falcon_fw_ctor_hs(). The later nvkm_firmware_load_name(..., &blob)
call overwrites blob with the bootloader firmware pointer on success.

If we only rely on the final nvkm_firmware_put(blob), the success path
would release the bootloader firmware, but the original image firmware
pointer would be lost and leaked.

Best regards,
Dawei
