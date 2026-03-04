Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53170EFCE49
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 21:09:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 535B710EAB8;
	Wed,  4 Mar 2026 21:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dc3/VCpO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7D4F744E6C;
	Wed,  4 Mar 2026 20:59:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772657948;
 b=wNfEt+CnJic2QH8jGliXg3t8//XHmPUkUn/1d52jUvZrgpsB70wkA//BfdTov7BH3QJlc
 F9JWQSLZxofzPE0S29e802BNjDwFFziDYHuqpcKhphVtTtqdJXAtlbhB21sdmRxMdtsbQa1
 j6TQV/VC8YKV7vHwlUvYUkxeM2moXHgdj+kTbgusc+rakAyukW6KJQpWv62F/LokfUbg1Pm
 n1kpEmly88UyWYu9clWLuaJ+wVYEzh0qNyvoX5K/yZAXZVT7lQN108jG/LRxOkz1pKrUmA3
 2tb2roZ0txQIkNeImTC8fqiFtSrum/mUJIeiEnMz05pFoqHAZU+N1W2V4ruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772657948; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UrgLcwHU8FgZjtEFEnz7U7KqnQOrgNyuhrBqFpTsLUc=;
 b=iWg4uHp6ZOxtp37kEXpQbwoAdoxbwAWMoEG9y0cibQtiVs7gCX/Z3E8lfO4dKuQ+qcWnA
 9c9/B6QPg4xL8eLpxJfJ+tMrOVIALgtCqR7pPoqKR1b1bEsZViyfscdcphghPL6rp2y8eYH
 GAkdWHH/Tc+CTqZLC5ims8tiOP0CcuQjDU8vJ+HtlB9FWEacuVOWWBKmJM8JLBxV/RZYnp1
 H3ctQGQbbiQsm+YC8Hq990KdV4K/LN1m1XLDKeSmXLl5XNgF9ZWkoa/vw9EkSJzPj4E43Za
 keC2sIdaAwvh7UdMkNNSKIMluysQYGcjboq+bYsCY54A82jbQyFjfENigPxQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 287F044E47
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 20:59:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA0C110EAB0;
	Wed,  4 Mar 2026 21:09:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FDF540868;
	Wed,  4 Mar 2026 21:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B284CC4CEF7;
	Wed,  4 Mar 2026 21:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772658565;
	bh=UrgLcwHU8FgZjtEFEnz7U7KqnQOrgNyuhrBqFpTsLUc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=dc3/VCpO1Uw8lxiyJljSZKPgiwfZprS8L14LpBbkv6LP5+4yTkh95vx8ubJiSCIMK
	 tnecHG3yL7n2kGzQqglMJdpVnD29d2diK/aC2PzmmKefvyeslxsTdY5LEDi3v2og8t
	 T+yf+qxoJ9M5VQOwBVp46G9BflnqQeP8ROqzdZ1hNAuv8Z7WaGZA3hQQsQzaK44uZQ
	 jlxCJyQ/vijB3QWMXOfjAc6ve3QLjo05Jx29eGDwGm93Fd+8Ci5rORFZKJyZenDvh3
	 UR4z9/ex4rITF9NDYAdf3XPhWA9CPkgcSHQGQL6oF9uPUzxl7029U8Q8JgeRpaoUwB
	 PqUpEvbeZKg/Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 22:09:23 +0100
Message-Id: <DGUB0LOC63Y6.3H5BNP6GOOGEB@kernel.org>
Subject: Re: [PATCH] nouveau/dpcd: return EBUSY for aux xfer if the device
 is asleep
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224031750.791621-1-airlied@gmail.com>
 <DGU60EGDUNV7.2MJ0CY8K01TCF@kernel.org>
 <CAPM=9tzcwB-udBP2W-MzmvwsC-YiCW6pCkdc4jon2pyQYGtLfQ@mail.gmail.com>
In-Reply-To: 
 <CAPM=9tzcwB-udBP2W-MzmvwsC-YiCW6pCkdc4jon2pyQYGtLfQ@mail.gmail.com>
Message-ID-Hash: QNVOOKS37WAXQSZ45DLGHVDH3QUWV66Y
X-Message-ID-Hash: QNVOOKS37WAXQSZ45DLGHVDH3QUWV66Y
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QNVOOKS37WAXQSZ45DLGHVDH3QUWV66Y/>
Archived-At: 
 <https://lore.freedesktop.org/DGUB0LOC63Y6.3H5BNP6GOOGEB@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 4, 2026 at 10:02 PM CET, Dave Airlie wrote:
> On Thu, 5 Mar 2026 at 03:14, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> On Tue Feb 24, 2026 at 4:17 AM CET, Dave Airlie wrote:
>> > From: Dave Airlie <airlied@redhat.com>
>> >
>> > If we have runtime suspended, and userspace wants to use /dev/drm_dp_*
>> > then just tell it the device is busy instead of crashing in the GSP
>> > code.
>> >
>> > WARNING: CPU: 2 PID: 565741 at drivers/gpu/drm/nouveau/nvkm/subdev/gsp=
/rm/r535/rpc.c:164 r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
>> > Modules linked in: overlay uinput rfcomm snd_seq_dummy snd_hrtimer nf_=
conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_f=
ib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nf=
t_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tab=
les qrtr bnep s>
>> > snd_soc_acpi intel_rapl_msr libarc4 kvm crc8 soundwire_bus irqbypass s=
nd_soc_sdca rapl iwlwifi snd_soc_avs uvcvideo intel_cstate think_lmi uvc fi=
rmware_attributes_class intel_uncore intel_wmi_thunderbolt wmi_bmof snd_hda=
_codec_conexant snd_hda_codec_nvhdmi videobuf2_vmalloc snd_soc_hda_codec cf=
g80211 videobu>
>> > processor_thermal_mbox sparse_keymap intel_soc_dts_iosf intel_pch_ther=
mal platform_profile rfkill snd soundcore int3403_thermal int340x_thermal_z=
one int3400_thermal acpi_thermal_rel acpi_pad joydev loop nfnetlink zram lz=
4hc_compress lz4_compress xfs wacom hid_microsoft ff_memless nouveau ucsi_a=
cpi typec_ucsi>
>>
>> I'd remove the modules linked in, it seems not relevant.
>>
>> > CPU: 2 UID: 0 PID: 565741 Comm: fwupd Not tainted 6.18.10-200.fc43.x86=
_64 #1 PREEMPT(lazy)
>> > Hardware name: LENOVO 20QTS0PQ00/20QTS0PQ00, BIOS N2OET65W (1.52 ) 08/=
05/2024
>> > RIP: 0010:r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
>> >
>> > This is a simple fix to get backported. We should probably engineer a =
proper power domain solution to wake up devices and keep them away while fw=
 updates are happening.
>>
>> s/away/awake/ and line length.
>>
>> > Cc: stable@vger.kernel.org
>>
>> Do we want this backported before GSP introduction?
>>
>> I.e. if it's only about the WARN_ON() and otherwise doesn't cause proble=
ms it
>> should probably be
>>
>> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-=
RM")
>>
>> otherwise
>>
>> Fixes: 8894f4919bc4 ("drm/nouveau: register a drm_dp_aux channel for eac=
h dp connector")
>
> Go back to this for safety, probably won't blow up but it could still
> cause wierd register timeouts.
>
>>
>> > Signed-off-by: Dave Airlie <airlied@redhat.com<
>>
>> No need to resend, I can fix up the above (and the minor typo in the SoB=
) on
>> apply.

Applied to drm-misc-fixes, thanks!
