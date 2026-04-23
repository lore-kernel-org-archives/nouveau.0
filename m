Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC1EFAD3F0
	for <nouveau@archiver.kernel.org>; Thu, 23 Apr 2026 02:55:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D79C310EF69;
	Thu, 23 Apr 2026 02:55:19 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B6DE745B1B;
	Thu, 23 Apr 2026 02:43:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776912189;
 b=mPO7EKT+g+4jgdk8h7IhLSQDkN/l8AWselyocL9kAu3DEwro/uvgyHyT1zWvzM41YNVR0
 9Hd5e52kZ6NJA/NUX+9HBMfpAduuRWH5aISnluOwSVlj2Z/OPkCuPbXLKjY9kYkzYc4aRYA
 EdSUe7l94AMexcNAfpav8wb7LG76OVR73sQ9kqPhhJEF3Sawn74pNYW4kTiSp2+zNRXeIkY
 gNQfLORE9yZ9n7cheYyYd77kFVp6e8jkBcz6pV8AKPLNxKDJ/O8Bik5M6lERGywLxz35CjO
 GHsqPTwwP/mfO37tpA2wCD3wwfCUH0JQvb3QwF5T0OHKQtTfaFSX3uLom+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776912189; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=duffMU1D/28NFG/a9L4qPLN18b33+z4YPLXQ92WKiAE=;
 b=uIXAOm3MkCBkgt+txiPe5QL/JJemwVBFC8Je838e2Ig6l02NTotlnfw7koADLpB3U7MEc
 0PUiFBDHDh9k2YtEUMmArpUp9/xP/KIh9nnaBK8VGO+E4OCXEUGpRLWRnVmnOialJbueAtl
 7UBlsQN378AE02gWLzr6MhBVGJX7bqL//nseigeiS3JXOe2zHyHOuFYNMp1MMu0kBvFrtql
 vcFbTqbk6cMC5xr0Sfv20Ak8MKAJHyFbOB/LWDt54RjtWI1I0DohH3x4Thw5xKE36hTsHHM
 KrFUgOI85l0knj9nC326Thjn4oDWDGFI4oYBHoKP+tkMcgvQxvOUKbyEy+VA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CDC2C45B18
	for <nouveau@lists.freedesktop.org>; Thu, 23 Apr 2026 00:40:53 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6809310EA43
	for <nouveau@lists.freedesktop.org>; Thu, 23 Apr 2026 00:53:03 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-WlvI2kkfMdC2OwfZqhq63Q-1; Wed,
 22 Apr 2026 20:45:59 -0400
X-MC-Unique: WlvI2kkfMdC2OwfZqhq63Q-1
X-Mimecast-MFC-AGG-ID: WlvI2kkfMdC2OwfZqhq63Q_1776905158
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 974EE195608B;
	Thu, 23 Apr 2026 00:45:58 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.53])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 932CA30001A1;
	Thu, 23 Apr 2026 00:45:56 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: nouveau: add HDMI FRL support for GSP enabled GPUs
Date: Thu, 23 Apr 2026 10:42:12 +1000
Message-ID: <20260423004552.3289884-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6xnB-0Tvl9a-SHuXqqqtblXoO8JQ6q1PhxQ5IiYrxas_1776905158
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: Q5RD6JXB5KT4JZLCSG2QED43JDAZHC3L
X-Message-ID-Hash: Q5RD6JXB5KT4JZLCSG2QED43JDAZHC3L
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q5RD6JXB5KT4JZLCSG2QED43JDAZHC3L/>
Archived-At: 
 <https://lore.freedesktop.org/20260423004552.3289884-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This adds higher refresh and resolution modes that need FRL support
on HDMI.

With GSP the firmware handles most of the hard work, just need to
send things in the correct order and handle the link training at the
right points.

The first commit reorders current SCDC support on GSP to do things
in the same order as NVIDIA open driver. Then it builds on that to add
FRL pieces in the backend, and the final patch adds all the frontend
pieces.

I've tested this on Ampere GA106 + a HDMI 2.1 capture card (Elgato X).

I used claude code to iterate on this a bunch to solve the ordering
issues and align with NVIDIA programming sequences.

Dave.

