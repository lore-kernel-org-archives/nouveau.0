Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B21CD6E79
	for <nouveau@archiver.kernel.org>; Tue,  9 Jun 2026 08:57:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 18EB110E1C6;
	Tue,  9 Jun 2026 08:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="AD7+HCMt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0068A4689D;
	Tue,  9 Jun 2026 08:43:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780994619;
 b=U74Y/dvIgcYVP7OEuR29h2WfJ51b1yqvINaC66rjCjlzT39xUthH0N5PHIy8ulLcu4dMJ
 fSQt0o1dZv/RtLeJhs0wEbfC6jtVHWFpNh4CxpWO6f4oXHuAjcEZqjAbEZMfkmPc+gZdjG2
 ivvZS5umJBBHi3naa/7fvcTzo9/vZka3wNb4RzMtZ6nqMn6jD4S/v7SGvluarmatTl6X5Th
 37V7NDW+/dqiIfKVa1OwJKlcO7oBSo8yJvsHJbwsNl6BPyaNtbXTbiUGIUqlT5CCaomSeTq
 G3fCehTEmPwNVaXLXFK00eMLu2RGY2OiAPwTNdd/gc3UTenKRH6FsOs7u3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780994619; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PWKiJfHLAuY51AfkQhZeCWOGsOm5BCLCBnZ0+m/OIxk=;
 b=E7MoB6fKYP6wrwUBHRm2pTHCEr6m/GFZ7WzulqlbO6Yp/qG40elHkcODbOcrXvqroydkw
 6ADH4UaUagWBGeNF6PPA2Pkkg9G3QBbIbgASNX+TGhqyCk3PlBXkP/16B6TYszaTW0iwHsc
 pEMdUkKWEcpZOeZpoWHgM3ynxlIMTOBc8k6vbEdC62waxl1WIp3kJDIb3xcmEHop/I7bi04
 87f/lKJrIgTgDFcnh4FRoZipwufkUxAxu21S9Q8KVAJQOwkiQsw/1Fq2JANXtw+ELDAko8u
 sOkd/QmgaO9NFSfC68Vgsgtq9dhlSBM8PvvpV6AHwKaw+tU9iI0F6CtoCULA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=seu.edu.cn;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=seu.edu.cn
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=seu.edu.cn;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=seu.edu.cn policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 15DB545A40
	for <nouveau@lists.freedesktop.org>; Tue,  9 Jun 2026 08:43:37 +0000 (UTC)
Received: from mail-m1064.netease.com (mail-m1064.netease.com [154.81.10.64])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7116D10E033;
	Tue,  9 Jun 2026 08:57:30 +0000 (UTC)
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 41a876c6e;
	Tue, 9 Jun 2026 16:57:26 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: ttabi@nvidia.com
Subject: Re: [PATCH] nouveau/firmware: fix memory leak on BL load failure
Date: Tue,  9 Jun 2026 16:57:29 +0800
Message-Id: <20260609085729.3786763-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0045b3583272df0b82f146fd96dee13d03377b4a.camel@nvidia.com>
References: <0045b3583272df0b82f146fd96dee13d03377b4a.camel@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eab99d60503a2kunmd4cb5e84127d3d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEtCVk4YSklJSh9MHh1JGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=AD7+HCMty0xT7ukJ2iVq24XZZtBk3S/QiDWX6gpGVFjcPKiO7RmZE7dzKCP/i1ObA/sHrur+vKJnntauTebn7UK4kaZhgSBnpvDaCOC3pG1hOrsw5Ok03Ux6gPVAd2HoLcW8JJIC4/n1uvVMkY4LrxLMkFVDeukP++uXZW+UT0U=;
 c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=PWKiJfHLAuY51AfkQhZeCWOGsOm5BCLCBnZ0+m/OIxk=;
	h=date:mime-version:subject:message-id:from;
Message-ID-Hash: NBNSQFIKX2CYK4L74PDTRBWIPDETVH7L
X-Message-ID-Hash: NBNSQFIKX2CYK4L74PDTRBWIPDETVH7L
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NBNSQFIKX2CYK4L74PDTRBWIPDETVH7L/>
Archived-At: 
 <https://lore.freedesktop.org/20260609085729.3786763-1-dawei.feng@seu.edu.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi, Timur,

On Fri, Jun 05, 2026 at 06:22:41PM +0000, Timur Tabi wrote:
> Ah yes, you're right.
>
> So now I think a better fix might be to have two different `blob`
> variables, so that there is no longer any confusion. Because right now,
> the nvkm_firmware_put() call at the end of the function releases a
> different `blob` depending on whether `bl` is NULL or not.
>
> What do you think about this:
>
>     nvkm_firmware_put(blob);
>     if (bl) {
>             const struct firmware *blob_bl;
>
>             ret = nvkm_firmware_load_name(subdev, bl, "", ver, &blob_bl);
>             if (ret)
>                     goto done;
>             ...
>             nvkm_firmware_put(blob_bl);
>             if (!fw->boot)
>                     ret = -ENOMEM;
>     } else {
>             fw->boot_addr = fw->nmem_base;
>     }
>
> done:
>     if (ret)
>             nvkm_falcon_fw_dtor(fw);
>
>     return ret;

Yes, using a separate pointer `blob_bl` for the bootloader firmware is a
cleaner approach. 

However, we must keep the final nvkm_firmware_put(blob) under the done
label. Moving it earlier would cause memory leaks in prior error paths
like nvkm_falcon_fw_ctor(), which jump directly to done. 

A safer approach is to manage blob_bl locally inside the if (bl) block,
while leaving the original blob cleanup at the end. 

What do you think about this:

        if (bl) {
                const struct firmware *blob_bl;

                ret = nvkm_firmware_load_name(subdev, bl, "", ver, &blob_bl);
                if (ret)
                        goto done;

                ...
                nvkm_firmware_put(blob_bl);
                if (!fw->boot)
                        ret = -ENOMEM;
        } else {
                fw->boot_addr = fw->nmem_base;
        }

done:
        if (ret)
                nvkm_falcon_fw_dtor(fw);

        nvkm_firmware_put(blob);
        return ret;

Regards,
Dawei
