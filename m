Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D578CD6E4A
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 17:14:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD33C1122BA;
	Fri, 29 May 2026 17:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HA0VAkF+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 67273466C2;
	Fri, 29 May 2026 17:00:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780074034;
 b=Qk1z2EsPBrCmRRBHDxNTVbyd+6uU+GLTUP5zd1mWDB64kZurFAfRjTc8KiTJUt6PeqFuT
 vm3nx1PPdjAKc5yOFTRbfQO1wYtrvgAr7R5uC6raD4T30CttYqSHRaVftaBC+r024cCycif
 Ep+LD8VA426cDSLpF8jrEQ9aX0m49iWipk0yX2oWH1MYat3rknTOYJX7czdGZ79Gg4D0bzF
 U1Yau7zXPh295eorpfteyxkCE4xcymPYl6m6plB0fkcN3Y46VbpZGLVuO8Bh4pC4aoxQBwG
 aAZquHDDPfEWn1eIg1GQCASlwphnESnPcvhnk5EZnolc0ZbOi3yDad8QdGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780074034; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FOngmApMBrQO8uj3ai8G4vkQzIPcP8Ggyb/B7X9jiE0=;
 b=PCIgruviFKXAHdtGMk8gazeEpYRaX/kAiL92A7aA8g48FxVba0gkzZkiNx9OjLKCR7B1f
 49CsjsUAapQbx81mg9xb6fQWqqCsdH5w2/wZgSvOon6heqROnlugZxUcNseN+aGIgi35WSE
 QygK7JwYw1btri9okJv0V2YuFdvfMikeObKnHQPbvd6VF+cJTj5yxiLtyqtQ5P+kD6JJ5tZ
 K20Wx5G9BB72LoDlcFmPrsXFW3LYrgp2ZAuZD4cdMuuk5ETs90Ten4jmxA9vz2qcUEW0vU4
 xW+Ah77VTm2wlHCNQqHqEx5v2OCnWpnvxLHN7d3vAz7lxExr5UvPVdtHWQdQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 85A6F42910
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 17:00:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B78E01122B4;
	Fri, 29 May 2026 17:14:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 72C684059E;
	Fri, 29 May 2026 17:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641991F00893;
	Fri, 29 May 2026 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780074842;
	bh=FOngmApMBrQO8uj3ai8G4vkQzIPcP8Ggyb/B7X9jiE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HA0VAkF+ZdznJDiNbldi/HgfrVJ63DSBEyskhz9QG5BShGd6nJbuCc2syGLjeSSNm
	 T7PXFS3KuDO1NZd1sVmSFVTLFEoQ8nTqgOHE9n6dRa+42IDw60MmR3Byr9fK60d9Xq
	 ruSedHMfqJUmUYqACtYtwFixkVtMfwJymIs4r/AeiHwdXJ4aAGlIWszCoSn8H52Kxh
	 sAOsuHxIO/IgTsNtnmbJ5r5bFTmRoFCKdKJg9vBILH5me9x4Gqiy+5Dn/Xu6Eq8e8R
	 cOCViNu8yP/qJ9MQgacQcQ7exaMK4MNot6MbMH2gmEaZjdFbbA1Lj3xisTdWGVWoti
	 4CA6fblr3QY3g==
Message-ID: <f1ee6c54-25b5-4d9d-864f-26e349bb22c5@kernel.org>
Date: Fri, 29 May 2026 19:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Remove DRIVER_GEM_GPUVA feature flag
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20260421084701.24227-1-laura.nao@collabora.com>
 <20260529191027.40e1ec5b@fedora>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260529191027.40e1ec5b@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LYDR7AFKLGEBFRM67R5TOUSPXG54HLG7
X-Message-ID-Hash: LYDR7AFKLGEBFRM67R5TOUSPXG54HLG7
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Laura Nao <laura.nao@collabora.com>, steven.price@arm.com,
 liviu.dudau@arm.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LYDR7AFKLGEBFRM67R5TOUSPXG54HLG7/>
Archived-At: 
 <https://lore.freedesktop.org/f1ee6c54-25b5-4d9d-864f-26e349bb22c5@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 5/29/26 7:10 PM, Boris Brezillon wrote:
> I took the liberty to queue this one to drm-misc-next even though it
> was lacking R-b/A-b from Nouveau/Pvr maintainers because
> 
> - it's pretty trivial
> - it's been posted more than a month ago
> - we need it to make progress on the Tyr side
> - if it's broken (I honestly doubt it), we still have a full release
>   cycle to revert
All good, thanks for queuing it up; I saw you message this morning and had it on
my list to reply.

- Danilo
