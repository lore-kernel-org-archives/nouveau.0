Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1775EE9B26C
	for <nouveau@archiver.kernel.org>; Tue, 24 Feb 2026 14:14:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E9CEB10E590;
	Tue, 24 Feb 2026 14:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P2fknBqO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8330343714;
	Tue, 24 Feb 2026 14:04:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771941890;
 b=ihFiZsbtr0NVuuN4j7EUKu1XeDLQWwdD+u7TBr1clALSPXJC9tG9eQzoe1oNJziM16YbL
 v9Kod3buKk9kmWhpO/KRMHWAY6rUM7ArvbMlEJqToyfRqalQSa0SHGuw9fu1p9T/RBiu6mO
 3kOs9gr3HJJel23j87+v/kfrBrec+pMj3eMUUHVL0FFm9drEbACOLmMROK91tb1uld1YBQw
 jd2+zrd1eVb5SzNhQwJ2qEzNx8nE6tm7YSJM1DG+ya8j/OhL6n9xOi42adUo0zIe5HwODMS
 2ZtYf/HBoU/FBkFfqCKQupi1uG1/l4yzihQA6Za3EQ4lRrvXobwG91Y6N7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771941890; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yovrk/7XjXzhLlLQqGcX2vs2pZTkvm3Q4cB71tyuOFg=;
 b=KLmo/o+VxqRRTmtKnXlrHk0VDr+Jw/0pyw7Iz3nhOmdi8CKea2oQPLCWWnOBY/56CdAeg
 l+//Hi3rcUdrzH6h++BUSY2kKD9416NfKsnRXqDRnkWKWgH1xUlZSibkEp6J783QkJuepiW
 9uXeqPUg4StpcgFDJnp4sTFA3Tr4zzHQpf3LHAd3GsJu3bCuc3dP54+9hfqbQfKmCV2PV9Q
 Up4+JUa4tgotZTXJ94lX5FtQUosNf0hFh0avfX6NA7N3XLQeYwqWH9Z1Njo/aPNfESMuhI4
 QDGEHsdX7W29VHHhmn/1pKPfFP/N0GTcJGtIAGFKWbYh7+NpSQRiTPKbt4jQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A057D40371
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 14:04:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C48BE10E2FC;
	Tue, 24 Feb 2026 14:14:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D765B6111B;
	Tue, 24 Feb 2026 14:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E058C116D0;
	Tue, 24 Feb 2026 14:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771942488;
	bh=OGl6xJYdX0fbyEQDOlHxh9XvRFW+wl9rPzQLm5yZBU8=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=P2fknBqOPlYIESr77sdWPB7rEUzmtFhZcv5wHsesvHKfBq+1lxCA3vIkvPBMrYhWU
	 KVpJUJ2dtggPgplVRItVJtzb/EgiIxNsS5s77gvAYpUk5Bgzk78q8IFSMR9s2joSdz
	 NpSfajyCEl4GuHV+vbOeD7HT/UzmveacodvbVB3a5QvsRaVyGR+CpguZf+tWo0l7gO
	 7tDi6GcK7ew0ssWvLckCKUs7duU9oDqseonazsrLx8mNNwagEoC/lVPBgNejjh17lC
	 3vJcZfFtSdHfzoA8jGEcEbmHbit/VkLN+c/vCVuUaqF+wCRQQvbE/z8neuiSfPiceh
	 Fez+Ju1RenciA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 15:14:44 +0100
Message-Id: <DGN96RQWQO5L.1K2LBU331S2KZ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 0/2] drm/nouveau: zcull support
To: "Mel Henning" <mhenning@darkrefraction.com>
References: <20260219-zcull3-v3-0-dbe6a716f104@darkrefraction.com>
In-Reply-To: <20260219-zcull3-v3-0-dbe6a716f104@darkrefraction.com>
Message-ID-Hash: RCAEDPDHXKBTADP73YIRVFERF3V4MJVR
X-Message-ID-Hash: RCAEDPDHXKBTADP73YIRVFERF3V4MJVR
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RCAEDPDHXKBTADP73YIRVFERF3V4MJVR/>
Archived-At: 
 <https://lore.freedesktop.org/DGN96RQWQO5L.1K2LBU331S2KZ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Feb 19, 2026 at 9:05 PM CET, Mel Henning wrote:
> Mel Henning (2):
>       drm/nouveau: Fetch zcull info from device
>       drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO

Applied to drm-misc-next, thanks!
