Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9596ECD98F2
	for <nouveau@archiver.kernel.org>; Sun, 21 Jun 2026 13:49:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 295A610E3B5;
	Sun, 21 Jun 2026 13:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EdTUaj1c";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0861446BE1;
	Sun, 21 Jun 2026 13:35:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782048916;
 b=SGQobz/tOZFTemfESvE18TqHaW/iGN/LDbqWXISMH6ipQXanNAnXd1RfZwlnh4iiavP3+
 IhCNMKkDYyYUeIbGMhIZDZZHKyEXI2MWuu7wvdvfBeunKUVzQ3pmfunCFWyfGpbl/0LgUaO
 H9j54mUtiwjnJKr/GRuTT92z6+DUQBR1oL7tC2S91+l7BFc9BSsqrB9JmzPyxGKu4HQRwn6
 vyR8gNcxAYVwDZZB1moPR4dHPKBw1CODDzBa7gsoukiXbhdLKieNKVPwnEccM/SJl/g636n
 pvNGrouPfFpuIVPu7494Z8McWu/Te98E2MaS3h0lrklQftE363dma5MypVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782048916; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jJY+uYtV9LlMGtbVVSrE/Xo4Zvi84Yvvd73ebE/AiUA=;
 b=lSK5CuurKqo8F8ga7fa6jAoIOjWp21Z0TASPoBwdT3GRJgvwscbidHx8upZUIhfd43rFy
 qgeAbUlXNkN2BfXs+CbXZhrtuD9db5Ewom3alohtmdSmi4yrImu0J1d83hDY9ysvkReDTMQ
 Q1KmheaPB4pR560EZgcZl+4M0GPntvyUHv4MXnRNhmF5TaVR6Jym+9B+E3loiP9dni6B8Nr
 AlNGbYOLax8ZVVCQB1owwwnBPfeOlfoctPkKCOEmWH9KjK3Ve/s9SN98EVQhLa5Lv9rEn0q
 uFFff7UDH9cBnVRtk3BwmoHm9YrwErUdMdEynHN/RcOQGYRZoiq/V9rEgrvQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 65FF546BBF
	for <nouveau@lists.freedesktop.org>; Sun, 21 Jun 2026 13:35:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 497C888A72;
	Sun, 21 Jun 2026 13:49:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 81CB06008A;
	Sun, 21 Jun 2026 13:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296191F000E9;
	Sun, 21 Jun 2026 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782049775;
	bh=jJY+uYtV9LlMGtbVVSrE/Xo4Zvi84Yvvd73ebE/AiUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EdTUaj1cOIwUaHKPso86x6R8FqGvVS09EquQqmrsryCKXUSBW5gyD+L6ptsFmWPK0
	 pV7AWZdjcQ3hIEZQcvXkjHAXqbOcf+KL6cFCjPRMHS+fgY/COry4xqaCI9nEavSRUN
	 QgPv8isaziL3PvyH+GPUxG9YlKF20dd8SaX/0iOOZ5IZ2D6D1WxBr8QEf3P/yzrW4e
	 OPrTM2u4rVnm6lwDSgu+YTNkmcQ9FdyWaU4qNFkLXn+kHkCvH7lrOcK4YZyT4vSqMl
	 /5RLw0v5FMFyRk71w36QTNB/f8cR5fIJYcQaZR0EyZYw1ttWGX+Mu2xyAqzDgjTfGy
	 vkMvsMEMc2xog==
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] nouveau/gem: reserve the bo in the info ioctl around the
 vma lookup
Date: Sun, 21 Jun 2026 15:49:26 +0200
Message-ID: <20260621134926.10271-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612020658.3176270-1-airlied@gmail.com>
References: <20260612020658.3176270-1-airlied@gmail.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UADR2GCSWOCFCQJW34OV76OFNT4EPZSQ
X-Message-ID-Hash: UADR2GCSWOCFCQJW34OV76OFNT4EPZSQ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UADR2GCSWOCFCQJW34OV76OFNT4EPZSQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260621134926.10271-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 12 Jun 2026 12:06:58 +1000, Dave Airlie wrote:
> [PATCH] nouveau/gem: reserve the bo in the info ioctl around the vma lookup

Applied, thanks!

  Branch: drm-misc-next
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/1] nouveau/gem: reserve the bo in the info ioctl around the vma lookup
      commit: 5e17160d41d9

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
