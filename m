Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AE1C561E6
	for <nouveau@archiver.kernel.org>; Thu,  6 Aug 2026 08:52:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A470110F14D;
	Thu,  6 Aug 2026 08:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i+3gtN0w";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 007A547603;
	Thu,  6 Aug 2026 08:36:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786005395;
 b=TmtAEBjWioiBerttxWUjtulOA6yaxocmcuJVNOF3rT/FlRSa8GqkOA/icv7AZYbHaKogr
 m1NkdfDBrQ/qcbmFWTeXLxl3VGtMgo4AMbx3u6Eu5SLdUMC+4leiv4Ft6vrTnNMNoasWvXo
 d/2NjedA6C++I361YoMB0VWFtWah9tZyXBabciphvmA/GbZKOqypU1u1v0AwqaHuBY6WMhI
 uGEQS7ng7qz2BGg+KTHbKpxvopfeA15pTRFTvoXHPKCSaq2ipxJ247jl0sOxFqiRSsPJ6SZ
 vgzVkYiKZnNcaa2NqrYQs34R/s0VYkhf25behh7yqYGeNA0vSjCbRl/C7vPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786005395; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gH1ZijC9dBMRwcIQPOFxOSOLg1MiHZNn8LjvIG16PSY=;
 b=BsAvPgIQ8zm84mZkaMNLDvNukS7U4SDZMZ5ZV/MvjxYesK52sYVXB52nmgGhgk4eRqDD7
 mvC2+fOnB8pliINcWOpzm0v1NmAseyM9egnLDCMbPDgn4U71i9sD/DcAN3MleE8ew68Kifr
 1z0IQkFK1MWvSQMTsucksVIvwz2n5dPf35yj9vwb9dIbHQOba37oHquI6bU7T1EwkpOLV3z
 HdH3NL3rKiBV4+JPdOKWt5EGPkC8Fx9rYmQOcUlWKoAmr0q/27EA9iiF4b9oVYt5Tpe9+AO
 /XpIjBNKCm5C585a6MEkj+CwjVS5qpv5d8BABXgtJAi8olcstY3Lr1m8Jvtg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0225D47601
	for <nouveau@lists.freedesktop.org>; Thu,  6 Aug 2026 08:36:31 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 71F3310E2B9
	for <nouveau@lists.freedesktop.org>; Thu,  6 Aug 2026 08:52:34 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47f611b3af9so272424f8f.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 06 Aug 2026 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786006353; x=1786611153;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gH1ZijC9dBMRwcIQPOFxOSOLg1MiHZNn8LjvIG16PSY=;
        b=i+3gtN0wjl9xzxpWUwRNXEuknR76817eHoKMvi7VtpWC2pbjXN4WDemHVUcxQ7EhTw
         5sfbHXfb/6N5TGhFLsFNZv83CBdaJMNoQ7keVS/u67+87iTXULMQq43Ti1Ch4Si3aKr9
         XKrNtj6Shl2xJYvpttQD5X4RhpQWBLSdJvcqE2nVUUxKRSr2NbBarUtqPsfhbqqQ2wJV
         6phhySS7484yTm5ul/0tpwoGJvsZ4TT4aFzIZ4o9dkYfBUU/y4Uvdy//pbBTx4jSukTy
         4/xBF56nxU2l/+Z34q0x2846JoypTZH1RJClNcJ/xlI0N4a0H7KpT+rkYwJIW1+F3wxK
         5+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006353; x=1786611153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gH1ZijC9dBMRwcIQPOFxOSOLg1MiHZNn8LjvIG16PSY=;
        b=caAWLGKjX486DsCRJah09yFgrATse8DmIjS9uxEGLQh0AV/a9aUms/abIOGDNSI4rd
         teaT54fyzlziRiOjZz0xnpTIQB1LD9soWdBwkacs/f44+QJKmeuYmB05sAaP6Lmbn5uO
         HCjmJv7GEATQXWflWHhxgqFSbwzG8CEKm+YhaL3zbRcnAdR3uOpGvJKpW1g6Ri3v6W7x
         SI59kcozsyTNG+0X3Q4P7kx9i0hTS8PeOLVEKiRPJcz/j7oeWXfU9xkOH+CI0Jy91ksL
         pZml/061TIycNIhHoyHRV46z+87g7w6ape5mJC3YgTLi2iTzbpFcTvor+QH6jkIx5b/R
         eUkA==
X-Gm-Message-State: AOJu0YzDJDEpaCHiNHqKnPZybrsyx3P+zg99p3rr0PP/8Ur3Ip1NuLO5
	CqNDNNascP6tOe648pZzUpthyOCCxFzO8WF+EraU81Ro/EUUA6c6VlgjX7uCu16gOXs=
X-Gm-Gg: AR+sD13VYzycwFsRvfNe9HuEYVRsc9r5cxXrEFtqWCKVXNPqsUgmtV2IqErJbQeqIgO
	m7ofg1w3RBhHPumS9qX94/TEdpPAl/DIVnGdOruvRsMSZ26paa9q6bynJLMgBJLTMEOrC4Ofw0h
	79IUMIZ6nKrUVvW3w6nGzeVrBBeulYZpjb6QImitWTW+VAnGXlTUvyx7zPmiEhKKSsZqRIMNZmf
	l5PTJvn9VW7EM2DVtftgmmhD8FQYgcKtYZEikUJxVVZ2cktNkc6zlZw6ot6bgnJep80aO90C2F7
	m2huMYhu2rzcaeK7XFE8fGmhED2MSUcSZIG+svjliL1rUsGV1Taog7XpWZYXZHUh5NzfmHC7q8k
	eKCF+cKaBoh26cRI5vgwGedmWtj7mg7u+h59kL0/MQA7nbklcbPu3PinetHZ/5PlJoChPZyhaLm
	A77kXQOTYhZFBKLWsaq5UgRODSDF+FjULWf4TqNa442cTylL2V6g95YvFUFHJOhCWSfShMwk7dS
	IVIfraPLvPMHmc6kAU/dZaMhfSD2h4qAEyPju+md19oWHO8EJShTHo=
X-Received: by 2002:a05:600c:1549:b0:498:1371:660c with SMTP id
 5b1f17b1804b1-4994e704bd5mr85555625e9.0.1786006352729;
        Thu, 06 Aug 2026 01:52:32 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995420cb4esm45985355e9.2.2026.08.06.01.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:52:32 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/nouveau: subscribe to channel-kill events on NV50
 and newer
Date: Thu,  6 Aug 2026 10:52:27 +0200
Message-ID: <20260806085228.1848994-3-mczernohous@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260806085228.1848994-1-mczernohous@gmail.com>
References: <20260806085228.1848994-1-mczernohous@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FRL24HVN7OQVGTITBPVK55UKJCK4XTVE
X-Message-ID-Hash: FRL24HVN7OQVGTITBPVK55UKJCK4XTVE
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FRL24HVN7OQVGTITBPVK55UKJCK4XTVE/>
Archived-At: 
 <https://lore.freedesktop.org/20260806085228.1848994-3-mczernohous@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

nouveau_channel_init() only subscribes to the channel-killed event for
FERMI_CHANNEL_GPFIFO and newer. On NV50/Tesla the subscription therefore
never happens, and nvkm_chan_error()'s NVKM_CHAN_EVENT_ERRORED is
delivered into an empty notifier list.

Today that is harmless, because nothing kills a channel on Tesla: the
only nvkm_chan_error() callers are the Fermi and newer recovery paths.
The next patch adds such a caller for Tesla, and without a subscriber
the consequences are severe. nouveau_channel_killed() never runs, so
nouveau_fence_context_kill() never runs either, and the pending fences
of the killed channel are never signalled. Everything waiting on them
waits forever: drm_atomic_helper_wait_for_fences() in the display commit
tail waits uninterruptibly and without a timeout, and the TTM delayed
delete workers wait in TASK_UNINTERRUPTIBLE. The user sees a frozen
desktop on a machine that is otherwise alive; it stays that way for
minutes until the fences time out, and a reboot clears it immediately.
That is also a dma-fence contract violation: a fence must always be
signalled, with an error if necessary.

Lower the class gate to NV50_CHANNEL_GPFIFO. The nvkm side is already
class neutral: the KILLED case hangs the notifier on runl->chid->event,
which every fifo owns since the runlist rework, and nvkm_uchan_uevent()
does not discriminate by class. Pre-NV50 chips keep the old behaviour,
so NV04 to NV40 are unaffected.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 598513f60449..1db9fbd81f5c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -363,7 +363,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	if (ret)
 		return ret;
 
-	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
+	if (chan->user.oclass >= NV50_CHANNEL_GPFIFO) {
 		DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
 				sizeof(struct nvif_chan_event_v0));
 		struct nvif_chan_event_v0 *host =
-- 
2.54.0

