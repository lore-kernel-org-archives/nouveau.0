Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FA3108B91E
	for <nouveau@archiver.kernel.org>; Wed, 25 Mar 2026 01:35:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E2C0510E677;
	Wed, 25 Mar 2026 01:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NfSNLXJj";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 36D40452E9;
	Wed, 25 Mar 2026 01:24:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774401848;
 b=vXzfBdYf2Vmr9fPa57XQbUN5md+kOxSAWGWM4t/FL3Vc3V4cSRU5zkqf7aDt+UeUkwxFm
 NuKH5ZCyXXIfOtEottKCANeQnNEM9/YwaoqfwpKcXXImDYp4ET2TnNDCVhf6JzDJzUsOM6q
 9vswY2OhGSwFUx4MTqWaonXV0FZuiOrK/03yMnLDehG9qZbGAhb0LH3SRCLQPejOk2WQalx
 sSd7JJNHVBd5PPEaSBcK41tPBuIse7grELvbGWh8XPWTWdkUVyP8QETSTnf44ki+yRgsZKe
 UD0RWINBtC+LlJL0m2dlQdhCvtXlMr7yGmNbQY1ALEAU26NiIhllP2j+8Epw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774401848; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xwP8eZGTtz7Rk3rVDwXvQy/OeNlG2E4kW67PcErHUY0=;
 b=BQTirKMHYfE4PhdmAEKhmpdKAiOsANZfrY5oMHET4vr0RysnOrjhE4VJE/pW1lLIE5cHO
 CUgXROBbyZ5oRgsQyMI4GGmkoMnCzlfj4g0PLBS2Ou5kbQbJtHJexfrbMTLy8aMdRpEUHfZ
 8W5qmOw+U+PuuKjLisy2kvA1Q1g8Rnd6zKA6X7aJjv9QcZ/GtPyyevZY38G6rl9qaN5nCee
 LC5cD5psGDaZqU6JrZ7kLd87W0V4FdFbz+j5fLu3UXgQHWW01QG/w6/XgHOeFg+2kta5laF
 6qa5gr7xYdf6SKIIwprsJWU5NdUG8p1uoBk3myj88pSW51cKjTeCRvCrA79g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5DFBE44D5E
	for <nouveau@lists.freedesktop.org>; Wed, 25 Mar 2026 01:24:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D985710E18B
	for <nouveau@lists.freedesktop.org>; Wed, 25 Mar 2026 01:35:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FA8043E5F;
	Wed, 25 Mar 2026 01:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C30C2BCB2;
	Wed, 25 Mar 2026 01:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774402511;
	bh=u+or+4ewo6DzW5OS99JNcJt3P+PYstR0dsJPR1tuZdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NfSNLXJjobHuFIyJwgQnaBha24RbrbvUDO7tgCICQaBxVu+Iy056ZzbsnHDKs74gR
	 jHgY2J++3sLB7d/nrI6XlokOLgnfwrwTTEucOZXkL3yxyOO2n/P/5jCvCecb2uhV9n
	 s3jyETmhuBCp81hJAXhmBirEWPDKgktu5zhy+ppProV3LaI47st429hj2g2LNmJ2uC
	 P1/T1NiXjNT1+bRoXFm1E1Gz2nuEerITSMeOKwPC7gbXHj9xcJAIOx4OMYLAp1pVcI
	 LPGdWVOXy4zce7aEeOjhHdO1OdZkDCPfhEpOMivLedLQxd2rEnp23AcJMu00FeTupE
	 p5htC9RVHmbXg==
From: Miguel Ojeda <ojeda@kernel.org>
To: gregkh@linuxfoundation.org
Subject: Re: [PATCH 6.19 000/220] 6.19.10-rc1 review
Date: Wed, 25 Mar 2026 02:34:47 +0100
Message-ID: <20260325013447.66771-1-ojeda@kernel.org>
In-Reply-To: <20260323134504.575022936@linuxfoundation.org>
References: <20260323134504.575022936@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SWU4QLRUB22PVIPTOWJRHZ5S657L54Q7
X-Message-ID-Hash: SWU4QLRUB22PVIPTOWJRHZ5S657L54Q7
X-MailFrom: ojeda@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: achill@achill.org, akpm@linux-foundation.org, broonie@kernel.org,
 conor@kernel.org, f.fainelli@gmail.com, hargar@microsoft.com,
 linux-kernel@vger.kernel.org, linux@roeck-us.net,
 lkft-triage@lists.linaro.org, patches@kernelci.org, patches@lists.linux.dev,
 pavel@nabladev.com, rwarsow@gmx.de, shuah@kernel.org, sr@sladewatkins.com,
 stable@vger.kernel.org, sudipm.mukherjee@gmail.com,
 torvalds@linux-foundation.org, Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>, Tim Kovalenko <tim.kovalenko@proton.me>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SWU4QLRUB22PVIPTOWJRHZ5S657L54Q7/>
Archived-At: 
 <https://lore.freedesktop.org/20260325013447.66771-1-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 23 Mar 2026 14:42:57 +0100 Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.19.10 release.
> There are 220 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 Mar 2026 13:44:33 +0000.
> Anything received after that time might be too late.

Boot-tested under QEMU for Rust x86_64, arm64 and riscv64; built-tested
for loongarch64:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

For loongarch64, I am seeing:

    drivers/gpu/nova-core/nova_core.o: warning: objtool: _RNvMs1_NtNtCskfHXyXj90Gn_9nova_core3gsp4cmdqNtB5_4Cmdq3new+0x2c8: return with modified stack frame

Which got fixed in mainline by:

  c7940c8bf215 ("gpu: nova-core: fix stack overflow in GSP memory allocation")

But 1) this is just for loongarch64, 2) Nova is still being developed
and 3) it is just for 6.19.y, so that is probably there was no Cc:
stable@. Anyway, Cc'ing here.

Cc: Gary Guo <gary@garyguo.net>
Cc: Tim Kovalenko <tim.kovalenko@proton.me>

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: nouveau@lists.freedesktop.org

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev

Thanks!

Cheers,
Miguel
