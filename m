Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5080BECD996
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 18:57:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4156710E0A3;
	Thu,  5 Feb 2026 18:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="U4R03ZGk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B1CAC41C67;
	Thu,  5 Feb 2026 18:47:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770317279;
 b=bafNPut0Ri7Qoqb3IV98nbxN7TUVe4H2iRnloR7k7EzFIxr1Ahpg1gjRzZax75TrTbfKi
 ORdG/900j0HnLd51KW/ntW7Ao3pDmcr9yrSCjG2/Kx5QwN01Jp0Rhbf6a8q7dkwVYvsHkEU
 EVnYq/KfT+w4cS+BjnrxbENnVMKng7mgg+IHuYkU0Qs+uKiiw8stNsmkyC81XTQfWtocwdp
 kuSxmLecR+UrwBGtWsElTm/bof8p+HcynHPOgRpgb7fSupdbfEpax2MMZzD//9V3o3hd2HE
 n6cKh/ILwCJ1nAURkRPp/2051euoahzIR9/gN5IfukbzL1fXw+y9IMyibSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770317279; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Plcb1tyHlgD2XmdE3zgDgi5PJu1QpuIkg+akIyg2pv0=;
 b=ZqZ/Hcb/MGtyR9kbMLa5NNYhE5e2EFgS3c4NhERR8FgXQnx7bHfUO7O8GNTmUwfJzGJ/z
 cWyDkibwqSh3ud8zoF/QrFoV4iiW1H08fjjjrnnLmkWiYBvvZjLHKssVzB1x5bDlvglxmax
 /Fv2Cc+geQ4gKjqbwixj7V8Z+ma6zVpRLfV4quDYyUaOStnr4ZGmvDQ+OrP1Vf0idy5VlGh
 qz9rN8vyRSsZnPNlODVWkNm6IgApXk5pyI4vj//mt/wTDCzDKCymsQvOiqU1e5wY6phqrsP
 FA9IprZAPOFHL9QpLSTJ+eIGFgf7fjHHOyfiQOsm3lcQUG5z+RlecmYd0yrA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6EBF5402B7
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 18:47:56 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEED10E04E
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 18:57:16 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8c710439535so84185985a.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 10:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1770317835;
 x=1770922635; darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Plcb1tyHlgD2XmdE3zgDgi5PJu1QpuIkg+akIyg2pv0=;
        b=U4R03ZGkJWAiv/R7OM6sf3nLcwkILtsFxirMfQyVSLQ0lsnywIkx3TX+1nZ/NSRTZH
         yvXTzpg6w4+483bmXZt7iDVlNNPbUZC81dMDTnrP5RSR1jYtEFwfo1YHjHwBzU+R6QDZ
         ++vbENHPWhoPw0w8FaoxdZHai/m819aZUYPB36QNAThY2rTkiWuxj9WBGl1tZLAbu1DX
         j6D2FtNbVb6BnDTMQW2FyhBUTiym0VdMWO0WcbiTSPe7jaTdbeM2ak4s64SxIsjGTx8i
         5//XWl0Nu0kQs+rQ+VGRkHoNOovtKO3j6mcE9dPu4SwXSVl2pJjIZa+oWxvYm/PvwAhV
         OqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770317835; x=1770922635;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Plcb1tyHlgD2XmdE3zgDgi5PJu1QpuIkg+akIyg2pv0=;
        b=g7Kq7w6RV82gk7Qv+Bo6ByqsOtFGPw5QEq7f02GMZknq7vkiMTtB0vdbvmbyKKLfNI
         DeSwj3WTBwQ62ojTWYfyOvO8SWPdXN+sTIO3r53ppUHkkJvILP0UIeqzJ1QSu7S0iDfC
         BXezUfKh5AgtvP+s7AvcEwC6fuho6E8ZvFMw9NPq5pvFA5wktSJpAPXmL7z6eI8Rh7ht
         07rHyyWGsCR585QrrVQq3KlK6hG+ZzuvwGUPuprbgcYo+B6zGnp//HSXfpoHa6Xy4QVh
         ZhaBFzJUbTUS6Ea0xifpJCczCn1fA+wg1GMfXdrvxh0UTQ2+PK6izCrwN9K7W847cK/y
         pRDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGFa1t46/23G8UwYq9BIfiqaCpAbbQ10CJbkjmqdoju7nzQDgNb0mR09CrZvOKU9PTLH8a0M3E@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkGSGjT5fsg6g6jh/MLk/ppkpWJSNpPUUtDQMRwU45SmxdgGBX
	TtRDy32Ng5CWfqElHxPy9CPEm5+X/sFpZ+gBHmHJSsx/3zPcw6N+N0yNVEDra2lY9BY=
X-Gm-Gg: AZuq6aLQLHLhNgLAeCYk6+wb4I34jJla9O+hRPDmeV5lFUoFKI7c+AJgV+cuJCodOY+
	KmtiaYDvOamDljZlhBDmUlld9SSlOQe4O2l2Az/qog5yhxckfcGedC9psvU3FO4HgiUQyUTU2Xa
	kyTWngyGG2LtMyI32y4zKhpwosbOfkJJXjl1AzV+TOlzly4hdPW3Fl7NDWO3NJqaK2z5pUhIs0m
	VWyj64vBNI2m7vk3gV4j8c/+vrpgD7Nd6VVe28Ebi044dbmkdGoqAoM8n5v0QpjTnL0XLvtcQRE
	IIK1hZUrP6qFzymcThJ/WAWwVWYD/zcnK9T/WddySmA/F4Wf+UZS00tW8B121l7tXv+PzbDXPHA
	dukMtMwPt8C217Ss9opVtpm6U4qxTOPHLtKX8pBwCZ/fO1q9CfQsqbysQ8eqg7UKMH51hkQhX+P
	9i9NrUjWruoQUxMRA6UabCZMw30evd
X-Received: by 2002:ac8:5e11:0:b0:4ec:f26f:5aea with SMTP id
 d75a77b69052e-50639a02480mr1109211cf.68.1770317835142;
        Thu, 05 Feb 2026 10:57:15 -0800 (PST)
Received: from [108.27.160.201] ([108.27.160.201])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-506392902f9sm1678331cf.18.2026.02.05.10.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:57:14 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH v2 0/2] drm/nouveau: zcull support
Date: Thu, 05 Feb 2026 13:56:09 -0500
Message-Id: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNT3ark0pwcY11LAzNTQ0PT5BQjYwsloOKCotS0zAqwQdGxtbUAHzQ
 5G1gAAAA=
X-Change-ID: 20260205-zcull3-9065115cd238
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3
Message-ID-Hash: JU6JBSO7U4QQLTXU3G6HLLN47E5DVJ5T
X-Message-ID-Hash: JU6JBSO7U4QQLTXU3G6HLLN47E5DVJ5T
X-MailFrom: mhenning@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JU6JBSO7U4QQLTXU3G6HLLN47E5DVJ5T/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

These patches add kernel-side support for using the zcull hardware in nvidia
gpus. zcull aims to improve memory bandwidth by using an early approximate
depth test, similar to hierarchical Z on an AMD card. These patches add a
new ioctl on nouveau devices, which is currently only supported when using
gsp firmware.

Corresponding userspace changes for NVK are available here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33861

This series is also available in git:
https://gitlab.freedesktop.org/mhenning/linux/-/commits/zcull3

(v2): Split the first patch into two - one for fetching information from
      the hardware and the other for adding the UAPI. Also, drop the
      change adding DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER - it isn't
      necessary to get zcull working and will be pursued as a separate
      performance improvement in the future.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
Mel Henning (2):
      drm/nouveau: Fetch zcull info from device
      drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO

 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   | 19 +++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.c            | 29 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |  9 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   | 32 ++++++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  | 19 +++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
 include/uapi/drm/nouveau_drm.h                     | 66 ++++++++++++++++++++++
 9 files changed, 172 insertions(+), 6 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260205-zcull3-9065115cd238

Best regards,
-- 
Mel Henning <mhenning@darkrefraction.com>

