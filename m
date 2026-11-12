Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EABD606A327
	for <nouveau@archiver.kernel.org>; Thu, 12 Nov 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xi1M0Wrq
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D813112280;
	Thu, 12 Nov 2026 17:18:05 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B0CA9492DE;
	Thu, 12 Nov 2026 16:58:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794502703;
 b=kwy6R4GcLh85znCIzp/BtXH0oIAvaxDyeAM+IYZththfWxr+cv4GsEUpYL7bH4e23UKvH
 B9LB66rdooz7colbdyfLVbpeLUBrgFVhBhUhcHohV0GOyip6JxB9AZvlS3rmVoYAyuC8LMf
 pjD1Drhm43uFWZLX2OB2iCaXnLqeq1lprAUMVX9ZRxS/mxKcmQuNYt0zY9o8Pkt/HwLAXe4
 3O8Ucnmkf9UwKZRevE/9usZiKGDLwcblXJtupZj3nh0dLrUuSv7LXWWw+eK9ZuYevWWcILj
 lyOZl1nWm7E52G96WZdzon6+7UdH+0JZIi7ud2HlCxhrjQi7IAQ1fYhr4VNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794502703; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VMi+hIkLWXT7siLEN9ATyCll+A1V4GrHFAEeCBcDPio=;
 b=WQ0Ki2DP98qEA857ZjnBsez9OSTf5e9Wiy528c7dievhjqWxQ0cq2ZiGkLvlcAGQQ8Yqy
 iMkS8svYcotcka/7aNx2ADHHvXXdHS6KRZ+7gMEO4Kt5kyJwDfYfxPBj15kjCtEqV90YIZf
 LdjYKFLdc/KX3pTju4Ltobg7w5jsVE+qkk7qLNH/3Yc4DWtRXqwopYntyw/xxv+opKiOXOp
 H6p9kaZaOVdQ/gra5Fpf3gYY5I4eNbzCHzn4BC7voXuaJU/eMt8QMZGrplrIgIzcJnQ1beo
 bW9rdkgvDXHBRSq9xjRlZBlXKMfbBwHuqll0KiWMHpajj+IlJO4sbkDIVGTQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 771ED492B0
	for <nouveau@lists.freedesktop.org>; Thu, 12 Nov 2026 16:58:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9475F11225B;
	Thu, 12 Nov 2026 17:17:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 441464233C;
	Thu, 12 Nov 2026 17:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179EA1F000C4;
	Thu, 12 Nov 2026 17:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794503876;
	bh=VMi+hIkLWXT7siLEN9ATyCll+A1V4GrHFAEeCBcDPio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xi1M0WrqH5bMvx0n0pi4w5v7a8qJzrxjW4xzgjyJBTk4w5Ha9LDFHd8Q2SIO4bI0/
	 R1AH44wKcxNJXbaWLeAun1BY623lBE7mWeM8MlocaX0VT4oGCtm1o/G3AsbPIXS1Ln
	 HAfe4Gi1tJJQuDHDrzTAcmJcvP7xkP9KNg6uFt8kIbAQS0k0mQOiMe1zrTRcGbMEAP
	 QjV4y8GkI+IFa+IR6J9g75IGth5ijUGZ2Wd4tjx81In8/mDCI0Hl19n37GOo0mpyES
	 RMm1owYYSjXmybNXysJzMRsSMwbMIAEWBzrarLAWP33yYlnJBqzwDlRjfOGVF8svjx
	 eUQ0ymv8EqhZg==
Date: Thu, 12 Nov 2026 09:17:55 -0800
From: Kees Cook <kees@kernel.org>
To: Bence Csokas <bence.csokas@arm.com>
Subject: Re: [PATCH v2 0/2] Add struct_offsetofend() for pointer arithmetic
Message-ID: <202611120916.3619B95@keescook>
References: <20261112-offsetof-v2-0-276ede839967@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112-offsetof-v2-0-276ede839967@arm.com>
Message-ID-Hash: QRLXFDKQWNX6N66AEY4GG4XFEXLXYDOT
X-Message-ID-Hash: QRLXFDKQWNX6N66AEY4GG4XFEXLXYDOT
X-MailFrom: kees@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Chengchang Tang <tangchengchang@huawei.com>,
 Junxian Huang <huangjunxian6@hisilicon.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Nilesh Javali <njavali@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-hyperv@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-scsi@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QRLXFDKQWNX6N66AEY4GG4XFEXLXYDOT/>
Archived-At: <https://lore.freedesktop.org/202611120916.3619B95@keescook/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 10:29:32AM +0100, Bence Csokas wrote:
> A common usage pattern for offsetof() is the following:
> 
>   offsetof(typeof(*ptr), member)
> 
> This is exactly the definition of struct_offset(). Some call sites use
> offsetofend() instead of offsetof(). Add this variant, then replace all
> call sites with the corresponding macros.

Yeah, I think this is reasonable. I'd prefer to see the Coccinelle
script explicitly added to tools/coccinelle/api/ though, so it can be
trivially re-run as needed.

Also, while Alejandro is right about the needless outer parens, I think
I'd like to keep them just to match the other define, and they do no
harm.

-Kees

> 
> Signed-off-by: Bence Csokas <bence.csokas@arm.com>
> ---
> Changes in v2:
> - Use struct_offset() instead of reinventing it
> - Rename offsetofendp() to struct_offsetofend()
> - Merge the two treewide patches
> - Link to v1: https://patch.msgid.link/20261105-offsetof-v1-0-4153f5c10edc@arm.com
> 
> To: Kees Cook <kees@kernel.org>
> To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> To: Marcel Holtmann <marcel@holtmann.org>
> To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
> To: Sumit Semwal <sumit.semwal@linaro.org>
> To: Christian König <christian.koenig@amd.com>
> To: Philipp Stanner <phasta@kernel.org>
> To: Sudeep Holla <sudeep.holla@kernel.org>
> To: Cristian Marussi <cristian.marussi@arm.com>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Jani Nikula <jani.nikula@linux.intel.com>
> To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> To: Rodrigo Vivi <rodrigo.vivi@intel.com>
> To: Tvrtko Ursulin <tursulin@ursulin.net>
> To: Lyude Paul <lyude@redhat.com>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Zack Rusin <zack.rusin@broadcom.com>
> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> To: Selvin Xavier <selvin.xavier@broadcom.com>
> To: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
> To: Jason Gunthorpe <jgg@ziepe.ca>
> To: Leon Romanovsky <leon@kernel.org>
> To: Chengchang Tang <tangchengchang@huawei.com>
> To: Junxian Huang <huangjunxian6@hisilicon.com>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Hans de Goede <hansg@kernel.org>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Haiyang Zhang <haiyangz@microsoft.com>
> To: Wei Liu <wei.liu@kernel.org>
> To: Dexuan Cui <decui@microsoft.com>
> To: Andrew Lunn <andrew+netdev@lunn.ch>
> To: "David S. Miller" <davem@davemloft.net>
> To: Eric Dumazet <edumazet@kernel.org>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
> To: Jes Sorensen <Jes.Sorensen@gmail.com>
> To: Ping-Ke Shih <pkshih@realtek.com>
> To: Johannes Berg <johannes@sipsolutions.net>
> To: Benson Leung <bleung@chromium.org>
> To: Tzung-Bi Shih <tzungbi@kernel.org>
> To: Guenter Roeck <groeck@chromium.org>
> To: Nilesh Javali <njavali@marvell.com>
> To: GR-QLogic-Storage-Upstream@marvell.com
> To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> To: "Martin K. Petersen" <mkp@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-bluetooth@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: arm-scmi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-rdma@vger.kernel.org
> Cc: linux-hyperv@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-wireless@vger.kernel.org
> Cc: chrome-platform@lists.linux.dev
> Cc: linux-scsi@vger.kernel.org
> 
> ---
> Bence Csokas (2):
>       stddef: Add offsetofend() variant of struct_offset()
>       treewide: Use struct_offset()
> 
>  drivers/bluetooth/btmrvl_main.c                    | 12 +++++-----
>  drivers/dma-buf/dma-resv.c                         |  2 +-
>  drivers/firmware/arm_scmi/base.c                   |  2 +-
>  drivers/gpu/drm/drm_edid.c                         | 26 +++++++++++-----------
>  drivers/gpu/drm/i915/gem/i915_gem_object.c         |  4 ++--
>  drivers/gpu/drm/i915/i915_active.c                 |  2 +-
>  drivers/gpu/drm/i915/i915_sw_fence_work.c          |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            | 12 +++++-----
>  drivers/infiniband/hw/bnxt_re/qplib_fp.c           |  2 +-
>  drivers/infiniband/hw/hns/hns_roce_cq.c            |  4 ++--
>  drivers/infiniband/hw/hns/hns_roce_qp.c            |  6 ++---
>  drivers/media/usb/uvc/uvc_v4l2.c                   |  4 ++--
>  drivers/net/hyperv/rndis_filter.c                  |  2 +-
>  drivers/net/wireless/intel/iwlwifi/iwl-drv.c       |  2 +-
>  drivers/net/wireless/intel/iwlwifi/mvm/rs-fw.c     |  2 +-
>  drivers/net/wireless/intel/iwlwifi/mvm/rs.c        |  2 +-
>  .../net/wireless/intel/iwlwifi/pcie/ctxt-info-v2.c |  5 ++---
>  drivers/net/wireless/realtek/rtl8xxxu/core.c       |  2 +-
>  drivers/net/wireless/realtek/rtw88/fw.c            |  2 +-
>  drivers/net/wireless/realtek/rtw89/core.c          |  2 +-
>  drivers/net/wireless/realtek/rtw89/fw.c            |  8 +++----
>  drivers/net/wireless/virtual/mac80211_hwsim_main.c |  4 ++--
>  drivers/platform/chrome/cros_ec_lightbar.c         |  4 ++--
>  drivers/scsi/qla2xxx/qla_gs.c                      |  2 +-
>  drivers/scsi/qla2xxx/qla_mbx.c                     |  2 +-
>  drivers/scsi/qla2xxx/qla_os.c                      |  2 +-
>  drivers/scsi/qla2xxx/qla_tmpl.c                    |  4 ++--
>  drivers/scsi/scsi_transport_fc.c                   |  2 +-
>  include/linux/overflow.h                           | 12 ++++++++++
>  30 files changed, 75 insertions(+), 64 deletions(-)
> ---
> base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
> change-id: 20261105-offsetof-f62aa6348f0d
> 
> Best regards,
> --  
> Bence Csokas <bence.csokas@arm.com>
> 

-- 
Kees Cook
