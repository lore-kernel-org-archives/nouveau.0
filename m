Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1483AC88E50
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:52:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DB65F10F577;
	Fri, 11 Sep 2026 08:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i5c65ouB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 179414153D;
	Fri, 11 Sep 2026 08:35:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115699;
 b=pKPIW4NGufaCwQGpuk3m8Ag8kLmAy3c34PwOlkRzJln/xpVzyd40aksVc0KG6+QxdxAhh
 2xFYG9Sr6K+7i7wDC43KALidIP/uG3isxnuk1E12aUYi7GADd9uj28nHEgzb/py67oRq8NO
 LhcJL9cjoICiK/Fd13dxbuwtxA1u1IleQ7CZYSwRFnlVRRqC3szoM/Gx+98VZZc8hqYzVYY
 yuQq7580ysR88gSq3ED/oiWV8GWExHQ0XQPViIVjDiS29J7Wy6+W5N4K5thBQ1FRxqBTO4P
 oaj4Wcclkeun+skGk2cwcpxDpuBd3LaZSWRyD5jKUJWkCTsqLRuf61Jp+wag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115699; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9Y0RYiQlqdq8T8rHGKcY5WJFbZOHMj5XD8BYUCfkmiM=;
 b=ydqUOcTdWMc71MRF+Fa8VumwIRzrxIJFABbsPb1hCUPzXI6PASQcaZYes+NupL2+QAOX2
 Q9Sl4KQ63m+x2oRKv6t7SOZjxiuArmM5CXOnaNxngYgvJ64/fgJI3fW07iC4WcMb5h6kbOz
 AGdxB+QR9btWmppnHeB+IS5KTLrZOcE0ELFLAKZgLTRFmcanzUYy0aNPtlDIVdHltyN3deh
 pSWRFiyS+2shJKWHvOL/7Wadih50uGOSFho29TZPj3rkDNYBTvjuy+Fxx76jksFS1pPA2Qn
 LFoihPJiYs02qNYZ/O0y2g+h5/Be4ryf8bTotgYmRO+wHHa8b+5BsFznm1Ew==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 698B2403BB
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D70EB10ECAF;
	Tue,  8 Sep 2026 15:27:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8A88601FB;
	Tue,  8 Sep 2026 15:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F591F00A3A;
	Tue,  8 Sep 2026 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788881245;
	bh=9Y0RYiQlqdq8T8rHGKcY5WJFbZOHMj5XD8BYUCfkmiM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=i5c65ouBuEyZ6oB7J0Er0dVut/Yg1ePEEy4oGAe64mY5uM6ZfpbkeT5m9W1IA29ab
	 JpZ8/TAPB6a+2NvkxIL3f43y3pKy3+R0TC/cYTdy6ySa2sA4ar26sqHKau57vlmrUD
	 jUqXiw954XFwqTofPlkk19Rd+03vy+ibx0rr6Jd6qWdhOzm+xsuUUy33Uj1Yq52ZJW
	 ijmyGte57XMTYBeOmQngxbymMaE/F8EJ6TAWS+WzjcxZj+Lz3mcDTkMdZK7PZzdBmi
	 IYXFACNOY2LwM8qmgJLPf4tQ/RvntUz7HPGkC10AaLkELj5a6/IQ76M/xV1tJVqxDk
	 w55vjeDNey8AA==
Message-ID: <315455b0aa801c7dbd1b1e2ecf7282c3@kernel.org>
Date: Tue, 08 Sep 2026 15:27:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/7] vga_switcheroo: Add post_switch callback to
 client ops
In-Reply-To: <20260709092215.168172-5-tzimmermann@suse.de>
References: <20260709092215.168172-5-tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DYTYM3S3QFCYOZZ2SXZY2QX7XJBJIVWG
X-Message-ID-Hash: DYTYM3S3QFCYOZZ2SXZY2QX7XJBJIVWG
X-MailFrom: mripard@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dakr@kernel.org, deller@gmx.de,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, jfalempe@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-fbdev@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com,
 sashiko-reviews@lists.linux.dev, simona@ffwll.ch, tursulin@ursulin.net
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DYTYM3S3QFCYOZZ2SXZY2QX7XJBJIVWG/>
Archived-At: 
 <https://lore.freedesktop.org/315455b0aa801c7dbd1b1e2ecf7282c3@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 9 Jul 2026 11:16:00 +0200, Thomas Zimmermann wrote:
> Add post_switch to struct vga_switcheroo_client_ops to inform the
> switcheroo client about a completed switch of the output.
> 
> This callback is intended to replace the reprobe client op. It is a
> rename of reprobe for consistency with pre_switch.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
