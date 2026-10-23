Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AC1606A31A
	for <nouveau@archiver.kernel.org>; Sat, 24 Oct 2026 14:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=yandex.com header.i=@yandex.com header.a=rsa-sha256 header.s=mail header.b=xggIpMTA
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0212F10E56D;
	Sat, 24 Oct 2026 14:34:54 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F0A9448B80;
	Sat, 24 Oct 2026 14:15:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792851351;
 b=Q/M+CkaxUSnQ8IBCaXdFFS5Sf78zlMQG2cdtxAEBWVsbbyV4VqFC1g23XoaKeGsoXCePb
 AKk6DMFMlreXFU4p0ADyNAKH3OyUsR+mnkSXkwirC7k77KQ645snEfz1G1QiHR+kgiYKUWX
 Xk/hCVenCpslfc2W9OclxrEQUu0eIXIXWqWbMZ5FUND7zyk1fARcAxp8GzzNuYrHwp3647x
 +o3snMhOAjgeus18HSqZl2euMzU27KF1gDdoGy/EjkHcb+DddY1msdk22lnveumR2gZk5LF
 xeg4H/kzJssUyyZteSIX+JJUeBhEen8cssyP2izhYgnDtmWYIUs7jAV0dEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792851351; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=npNmIRcmiTbe8TUN5oF9hqxjSAu4kad9SSf+fBhKItc=;
 b=a3YDr+E4a6c/lcFZDdofs2bCjMBterM74PODMTtz6iuTnvsWxVBnIoBSEE72SRUOpEUL7
 Q1QBjiMS64C4yXJOGb4G2xzHDVWdPMwM3E52qGJ1AMBfD/kiwUXgpd2Z4eZiyBBm65vyoE6
 3e4CTVwm4/3wedfC07VLGKyIDdiQiK2G/2vAUEjHnxes+TVe7jWwoP1Z1S8VPrHqFsWWNuF
 bxxWJuBvy/kL2rzX7/j4ZAnJeOKnC0IOQHN8D8/YPYnwQ1Y3rZLZwfp6ySx7q09lIE3My+Z
 krRbLABx/9V20EvIv03WFLxPKlgBSceK7gsy7qVPlaxF0JdvGG1ZmdxpxFmw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=yandex.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=yandex.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=yandex.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=yandex.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B37BE48966
	for <nouveau@lists.freedesktop.org>; Fri, 23 Oct 2026 15:05:33 +0000 (UTC)
X-Greylist: delayed 2460 seconds by postgrey-1.36 at gabe;
 Fri, 23 Oct 2026 15:24:25 UTC
Received: from forward105d.mail.yandex.net (forward105d.mail.yandex.net
 [51.250.60.165])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC3910E63D;
	Fri, 23 Oct 2026 15:24:25 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-12.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-12.yp-c.yandex.net)
	by forward105d.mail.yandex.net (postfix) with ESMTPS id 0BAF1100072;
	Fri, 23 Oct 2026 18:24:23 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-12 with ESMTPSA id
 GOf0WQDdMGk0-GJ7eC45D;
	Fri, 23 Oct 2026 18:24:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1792769062; bh=npNmIRcmiTbe8TUN5oF9hqxjSAu4kad9SSf+fBhKItc=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=xggIpMTA+9QrK39kLs7DqFcL5iYULlATGWKi98PgdVpdYgPrmPLPir8A8G6pkJ8Un
	 5M/QmsPEK0gy1ppY3dmt40uWJA8BlZTgkWbA0Sa8nCK5G2S6fL6q6HIeEkXpSSlrcS
	 KJAU7XSU4cbsIPqsgLcHZfBty9I5cDoaeqY96kr0=
From: Alex <xnderv@yandex.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau: idle the channel before destroying an engine
 object via abi16
Date: Fri, 23 Oct 2026 18:23:31 +0300
Message-ID: <20261023152332.9420-1-xnderv@yandex.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023144219.46478-1-xnderv@yandex.com>
References: <20261023144219.46478-1-xnderv@yandex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: xnderv@yandex.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: RN7XX6XS5GA74DMXG4FAZXVT7LTI5AZX
X-Message-ID-Hash: RN7XX6XS5GA74DMXG4FAZXVT7LTI5AZX
X-Mailman-Approved-At: Sat, 24 Oct 2026 14:15:49 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, xnderv@yandex.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RN7XX6XS5GA74DMXG4FAZXVT7LTI5AZX/>
Archived-At: 
 <https://lore.freedesktop.org/20261023152332.9420-1-xnderv@yandex.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the Sashiko AI review of this patch:

> Can calling nouveau_channel_idle(obj->chan->chan) here race with jobs
> running on obj->chan->sched when VM_BIND is enabled?

Thanks, the race is real.

Legacy PUSHBUF submissions take cli->mutex (nouveau_abi16_get()), so they
are serialized with nouveau_abi16_ioctl_del(), which is why the Chromium
case was fixed by the plain nouveau_channel_idle().  With VM_BIND the
EXEC jobs are pushed from the scheduler workqueue without cli->mutex, so
emitting a fence from the ioctl could indeed race with
nouveau_exec_job_run(), and jobs still queued in the entity would not be
covered by the fence at all.

v2 (sent as a reply to this thread) waits for the channel's scheduler to
drain first -- the same job-list wait nouveau_sched_fini() already does,
factored out as nouveau_sched_wait_idle() -- and then idles the channel.
New EXEC submissions cannot sneak in meanwhile because the EXEC ioctl
also holds cli->mutex.

Alex
