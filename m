Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93778FCA188
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 20:27:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 91FF010E1D0;
	Mon,  9 Mar 2026 20:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ik.me header.i=@ik.me header.b="iQTK/4ga";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A1EF844F91;
	Mon,  9 Mar 2026 20:16:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773087412;
 b=yPR7h+6wFENWEFsZtZCFe04pNhKrsj20CKH9fgpgS6KEDoH4j/yPp0YiUmShLLBnP4f/U
 suxDK5TUnWVSHkvQ2fZsTalLizfhzQP/t7HQ+FTK1pnKEXwA7nYooJ6V55HrbxOvDJtOAgv
 RH7Rmxi3oVxOAglPuSWF2NMst2H8fjmW3uFaAdrv1pNa1Yq7ozIDI2eCdqjtq1yi2It8HAp
 cqiHxEaoEhnJjB+X+nede2R4hLDjOykfMRWn9dJWCGkTfKL/ZAHAqWPuKZe3K0T0EBy0MKW
 PiluYdyshgZa+euxcCQMW9tKpbMtoXN3l2y4u4YVXoUuWLIoVsfSAn5I1nDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773087412; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JSB1VwR1hlXdj+drdPisjtXSesd6AYdMKEWkO/sGqrs=;
 b=bgsTTcB6QYnQTLnqt1b/yfrCVDWxXPnVctWBjofZHja7DcJrD9fLOLDENtagibbea8cRK
 kwrPPkFhdKaOCgO7x2dPpCbf4WbY+RjRxWLi+ZPp4FcLZLA+kw0JDX05OOjZqN9LlVus9Eq
 q5PrCgb4OccoQzRp98fBGb/ONX7QD1nEUbWEiA5gojBeSloBuY1CHt+R/uqBqUHfg32nx+h
 P3HTcjMk5YhXHhss1ThQhxwqVSy3GWovJTtedLXasoVVmFGEbl5v3gwADaH5eiYoqtGGTma
 MJ3b/leID7mVaIOo/D5aPy3EbnROEzmDpH89pzYn4TRJLBd0NrzNVL4Ez8Sw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ik.me;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=ik.me policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ik.me;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=ik.me policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EF378404AB
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 20:16:48 +0000 (UTC)
X-Greylist: delayed 1800 seconds by postgrey-1.36 at gabe;
 Mon, 09 Mar 2026 20:27:20 UTC
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch
 [84.16.66.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 645C110E126
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 20:27:20 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fV6yJ0Qd6z620;
	Mon,  9 Mar 2026 20:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1773085719; bh=JSB1VwR1hlXdj+drdPisjtXSesd6AYdMKEWkO/sGqrs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=iQTK/4gaQcfdwI+buCORDM4mGZR5RWb+mRBHrw/v/BGEgHN4Dwuxuifm2hK2BrVPA
	 e4JOU+r99Eq5Ry2biEsIzl3Np/H20WPhxdq5QM0+ktCpM+OsacDpSUE9r4qRm7+lmU
	 PH4eYlzQTSV7Wk5hsoNYZfEerIAhRuOgMRb1c51U=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fV6yG1p98z27L;
	Mon,  9 Mar 2026 20:48:38 +0100 (CET)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 20:48:37 +0100
Message-Id: <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
From: "Ewan Chorynski" <ewan.chorynski@ik.me>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
Feedback-ID: :b2b0f7d1dda10c9:ham:e74197f626dda86
X-Infomaniak-Routing: alpha
Message-ID-Hash: YQ7TB33DWPXZU6W7AUA2LDO55R5XS76G
X-Message-ID-Hash: YQ7TB33DWPXZU6W7AUA2LDO55R5XS76G
X-MailFrom: ewan.chorynski@ik.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YQ7TB33DWPXZU6W7AUA2LDO55R5XS76G/>
Archived-At: <https://lore.freedesktop.org/DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Mar 6, 2026 at 5:52 AM CET, Alexandre Courbot wrote:
> This patchset adds the remaining support required for booting the GSP on
> Turing.
>
> We did a deep dive with Eliot looking for the reasons why some fields
> involved in the bootloader are ignored or used apparently
> inconsistently, and this results in a more documented flow and a few
> fixes. Apart from that, this series seems to be stabilizing and
> successfully probes my TU106:
>
>     NovaCore 0000:08:00.0: NVIDIA (Chipset: TU106, Architecture: Turing, =
Revision: a.1)
>     NovaCore 0000:08:00.0: GPU name: NVIDIA GeForce RTX 2070
>
> This series is based on `drm-rust-next`. A tree with all the patches is
> available at [1].
>
> [1] https://github.com/Gnurou/linux/tree/b4/turing
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Changes in v11:
> - Fix build error/warnings and rustfmt formatting.
> - Address incorrect IMEM section start offsets in FalconUCodeDescV2
>   and better document fields usage and unused fields.
> - Use `get`/`get_mut` instead of direct array indexing when accessing
>   firmware content.
> - Link to v10: https://patch.msgid.link/20260301-turing_prep-v10-0-dde5ee=
437c60@nvidia.com
>
> Changes in v10:
> - Store the firmwares into a regular KVec and move them into a DMA
>   object only when actually loading using DMA.
> - Use `try_update` when updating the `NV_PFALCON_FBIF_TRANSCFG` register
>   array as its index is not build-time proven to be valid.
> - Fix alignment issue when processing imem section of the FWSEC
>   bootloader (thanks Eliot!).
> - Link to v9: https://patch.msgid.link/20260212-turing_prep-v9-0-238520ad=
8799@nvidia.com
>
> Changes in v9:
> - Add a few preparatory patches to simplify the actual feature patches.
> - Use a wrapping type for the bootloader.
> - Simplify the falcon loading code and move the complexity to the
>   firmware types.
> - Add the generic bootloader files to `ModInfoBuilder`.
> - Link to v8: https://lore.kernel.org/all/20260122222848.2555890-1-ttabi@=
nvidia.com/
>
> ---
> Alexandre Courbot (10):
>       gpu: nova-core: create falcon firmware DMA objects lazily
>       gpu: nova-core: falcon: add constant for memory block alignment
>       gpu: nova-core: falcon: rename load parameters to reflect DMA depen=
dency
>       gpu: nova-core: falcon: remove FalconFirmware's dependency on Falco=
nDmaLoadable
>       gpu: nova-core: move brom_params and boot_addr to FalconFirmware
>       gpu: nova-core: falcon: remove unwarranted safety check in dma_load
>       gpu: nova-core: firmware: add comments to justify v3 header values
>       gpu: nova-core: firmware: fix and explain v2 header offsets computa=
tions
>       gpu: nova-core: make Chipset::arch() const
>       gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder
>
> Timur Tabi (2):
>       gpu: nova-core: add PIO support for loading firmware images
>       gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turing
>
>  drivers/gpu/nova-core/falcon.rs                    | 315 +++++++++++++++=
+---
>  drivers/gpu/nova-core/falcon/hal.rs                |   6 +-
>  drivers/gpu/nova-core/firmware.rs                  | 107 ++++---
>  drivers/gpu/nova-core/firmware/booter.rs           |  65 ++--
>  drivers/gpu/nova-core/firmware/fwsec.rs            | 129 +++-----
>  drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 348 +++++++++++++++=
++++++
>  drivers/gpu/nova-core/gpu.rs                       |   9 +-
>  drivers/gpu/nova-core/gsp/boot.rs                  |  17 +-
>  drivers/gpu/nova-core/regs.rs                      |  30 ++
>  9 files changed, 820 insertions(+), 206 deletions(-)
> ---
> base-commit: 15da5bc9f3adab7242867db0251fe451ac3ddb72
> change-id: 20260204-turing_prep-6f6f54fe1850
>
> Best regards,

Hi,

I just want to remind that there is still issues for some Turing cards
with the firmware used by Nova (570.144) and this patchset still suffer
from the issue.

I am not able to probe on my GeForce GTX 1650 Mobile :

[    2.246095] NovaCore 0000:01:00.0: NVIDIA (Chipset: TU117, Architecture:=
 Turing, Revision: a.1)
[    2.722681] NovaCore 0000:01:00.0: Booter-load failed with error 0x31

However nouveau does not probe either with this firmware so that's not
really this patchset fault.

Are there any plans to check this to enable support on all Turing cards ?

I already reported this error in the V4 patch [1] for context.

Feel free to ask me if you need additional tests or results.

[1]: https://lore.kernel.org/rust-for-linux/DFA1CUMND2ME.1D3PAJW641QHM@ik.m=
e/T/#u

Regards,
Ewan
