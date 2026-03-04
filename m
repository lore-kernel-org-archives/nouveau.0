Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BB9EFCE21
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 17:14:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F3BDB10EA7E;
	Wed,  4 Mar 2026 17:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Iw/egV+f";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7180E44E37;
	Wed,  4 Mar 2026 17:03:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772643827;
 b=b3DJ0ErnGBmwjAAjPtFZ09e6ZSRoAMLpMKhMIo/bwNWfL+2A7LVqDtwrG9jpCNLwXUYGy
 OhOlWyijvuPGIXPvdYoLX+PobAI40IFEO+ovd2jrDawvawVeblMKI854v7RaF+44I0ZJhRz
 ILcE2+CDBKicdNI4CDwh0gtjJn+IFmFHDHcninHoeoNLFe/CxCqf41DmcgJ7MlCnXuKLHzW
 mc1+8mbHfM0ZI4KwkgtBDfJBuKipSDGEGef9P4fe5V3QeEeGx7bXflDCb2XIBEg95bv2BJy
 cB8v9hmLoamiPFukgbv1huB6WTdKl1TDTQNxaYpWD9WI2huhTKOCA198syoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772643827; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CmAwyXiLDc/33BunxhG5anWKSX/FSXmBKq48NqfFivM=;
 b=cc4zDeVdFFsez5tszbgYPxODPlbOFBgKi3HJlU1kU7wnzdIv1jwLN1Zuw8J02fWTrHRev
 FBTLd3uiBtCVr+/Ctg2LyqkfFYQi7C6Jj62kzv0i0EMCW/v+0rwZKlt/IUFOqdl7M/LVRpY
 VkW7uaCpbwzpf24zEB0ZgW5GVam/Uk68801UOaGhkFycFPsBBpgQxGtvKB1nQOnVSYq8hHJ
 qxSH+7R4Q6X39c9fYEAGwpUmw7R+xdub5CzDkBgw9EP6/TNieoXp31v78izKVlH3bdzq8yV
 Ot3kbCMcYlGQg7LHKoYvfA+zraQEXqJG1cSTlTy4eZ1rdMcy4Cre4ocWYBhw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5B1CA41E96
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 17:03:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F80510EA79;
	Wed,  4 Mar 2026 17:14:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D88D42B81;
	Wed,  4 Mar 2026 17:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E838C4CEF7;
	Wed,  4 Mar 2026 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772644444;
	bh=CmAwyXiLDc/33BunxhG5anWKSX/FSXmBKq48NqfFivM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Iw/egV+fA2kyik9AZwQm8RK0TJsoGXoNjsUir2SeDWgVCCXZ95fNmhWImeSgzp43u
	 UTZZN1IpJuKrvtnbFLOckG7E8ONozY+UmWfBfhNHtn81oIuYaQNo1XzWyg9UtE6q8i
	 QIIdjKxyG1NaVZ4I+4nCZdmbOYTPuyyoOZypqbQJm6rrzWyu2JZJ2rcKZ4tqzuAzn7
	 mTGufFgutK43iO9vCRtnKt9TVCM9WXDfXteuIUKQOViIhQLouFJvl3e1f7nLcD2+oh
	 TtjwxpKBbqE9v44ajO/scP5vlfE0R9fQiXj/ImZIWm2jlaB3rfSIUtCx6B9NtIbPUw
	 ObEpEvWRq2MaQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 18:14:01 +0100
Message-Id: <DGU60EGDUNV7.2MJ0CY8K01TCF@kernel.org>
Subject: Re: [PATCH] nouveau/dpcd: return EBUSY for aux xfer if the device
 is asleep
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224031750.791621-1-airlied@gmail.com>
In-Reply-To: <20260224031750.791621-1-airlied@gmail.com>
Message-ID-Hash: FFPPV4ZS4VI3GXWMULUHPLXRVBHEEQPZ
X-Message-ID-Hash: FFPPV4ZS4VI3GXWMULUHPLXRVBHEEQPZ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FFPPV4ZS4VI3GXWMULUHPLXRVBHEEQPZ/>
Archived-At: 
 <https://lore.freedesktop.org/DGU60EGDUNV7.2MJ0CY8K01TCF@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 24, 2026 at 4:17 AM CET, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>
> If we have runtime suspended, and userspace wants to use /dev/drm_dp_*
> then just tell it the device is busy instead of crashing in the GSP
> code.
>
> WARNING: CPU: 2 PID: 565741 at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm=
/r535/rpc.c:164 r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
> Modules linked in: overlay uinput rfcomm snd_seq_dummy snd_hrtimer nf_con=
ntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_=
ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_c=
t nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables=
 qrtr bnep s>
> snd_soc_acpi intel_rapl_msr libarc4 kvm crc8 soundwire_bus irqbypass snd_=
soc_sdca rapl iwlwifi snd_soc_avs uvcvideo intel_cstate think_lmi uvc firmw=
are_attributes_class intel_uncore intel_wmi_thunderbolt wmi_bmof snd_hda_co=
dec_conexant snd_hda_codec_nvhdmi videobuf2_vmalloc snd_soc_hda_codec cfg80=
211 videobu>
> processor_thermal_mbox sparse_keymap intel_soc_dts_iosf intel_pch_thermal=
 platform_profile rfkill snd soundcore int3403_thermal int340x_thermal_zone=
 int3400_thermal acpi_thermal_rel acpi_pad joydev loop nfnetlink zram lz4hc=
_compress lz4_compress xfs wacom hid_microsoft ff_memless nouveau ucsi_acpi=
 typec_ucsi>

I'd remove the modules linked in, it seems not relevant.

> CPU: 2 UID: 0 PID: 565741 Comm: fwupd Not tainted 6.18.10-200.fc43.x86_64=
 #1 PREEMPT(lazy)
> Hardware name: LENOVO 20QTS0PQ00/20QTS0PQ00, BIOS N2OET65W (1.52 ) 08/05/=
2024
> RIP: 0010:r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
>
> This is a simple fix to get backported. We should probably engineer a pro=
per power domain solution to wake up devices and keep them away while fw up=
dates are happening.

s/away/awake/ and line length.

> Cc: stable@vger.kernel.org

Do we want this backported before GSP introduction?

I.e. if it's only about the WARN_ON() and otherwise doesn't cause problems =
it
should probably be

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM"=
)

otherwise

Fixes: 8894f4919bc4 ("drm/nouveau: register a drm_dp_aux channel for each d=
p connector")

> Signed-off-by: Dave Airlie <airlied@redhat.com<

No need to resend, I can fix up the above (and the minor typo in the SoB) o=
n
apply.
