Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470F1C53200
	for <nouveau@archiver.kernel.org>; Wed, 29 Jul 2026 04:17:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 567F610E421;
	Wed, 29 Jul 2026 04:17:10 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D290D4747B;
	Wed, 29 Jul 2026 04:01:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785297684;
 b=h49k4DUflp9N5BMevaMj7djT0JA3Vvd+7/Ct719hPPgKYUFKl+/YiGkD4Y/Zmu1rfg4uj
 XLKkBLCeDOmUp1b9uJwd7pNuWp4lTc+S1i/jiL4O6KsmVbLxT90hkOOkyPmdHBKIBi16bsj
 gMIZAwpMyEfnNJ7Ocerj6T+QnbPi+mh4TK2Mq2QY0pmCX+9FnbzVO/SYEkUKgZ7oBWc+cJI
 1M1Oan7IZPtiPvXr0gJ/s+5xIqDxl8c4Qq+E8thREv7SyRO/oaxueEBdYlpCi0mBMiXuh62
 ziZ35NfIF04c4dM+nTGJeM6Yle1zrPeAoN+eu61NRTnZQNkGQCcDB4dDTClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785297684; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gDt5USCSvcSJtqm9pthaPHk2JE6sc39QqEAFefH921Q=;
 b=QWoqGZoywaZm4sA1Bky2K9RoKjKyGjb1jRnJ2BvkMgzCy7Z5l7gUxaUNTYLGsyVxYJVez
 HZWTRDMC+W3CK1Cg/EtEmWbHJrLoml5Ndrv9Aev/mZ6fI/lM6eaiTj/ShktsL2xQn+Y7weg
 nEhkUT/fvU9Qx6Ne5XZSCUXtbcTo4+us+HmrnN1kUF66GI5xBd2JvEq5qkykOV8MRLktfkh
 +9MHfr7OSK+7EmKVubnVJj1ZuE13b/UnkZrscHJZ0/oO+W2eLbGopnPYTxlf7FXsUyFPiWX
 T94Bw/IZkH2UVZkN5Rh7O0Mj8AfGID3VmaY5BODiLfz6xjDHrZ74IlGS5rFw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 780DC47477
	for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2026 04:01:21 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 88F4210E02F
	for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2026 04:17:06 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-219-LuL3E-ZTOe-pZAaWQqQEYw-1; Wed,
 29 Jul 2026 00:17:01 -0400
X-MC-Unique: LuL3E-ZTOe-pZAaWQqQEYw-1
X-Mimecast-MFC-AGG-ID: LuL3E-ZTOe-pZAaWQqQEYw_1785298620
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C8B901956095;
	Wed, 29 Jul 2026 04:16:59 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.13])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 54D751800480;
	Wed, 29 Jul 2026 04:16:56 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: nouveau/gsp: some r570 additions and refactoring
Date: Wed, 29 Jul 2026 14:15:24 +1000
Message-ID: <20260729041653.3985549-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dIQ3wtdwg7Wk5rqvm8S5k884l5t2pokHHT6XQbfLwUM_1785298620
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: 4UZ6G75FDEMFTQUKMGWE5EG64IDHKKM4
X-Message-ID-Hash: 4UZ6G75FDEMFTQUKMGWE5EG64IDHKKM4
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4UZ6G75FDEMFTQUKMGWE5EG64IDHKKM4/>
Archived-At: 
 <https://lore.freedesktop.org/20260729041653.3985549-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

While adding support for newer fws, I decided to fix up some missing
pieces for r570, along with a refactor of a function with too many
args to use a struct.

These are all -next material, I don't think they fix anything at
this time, but I'd like to have them upstream just in case.

Dave.

