Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D5EC5B572
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 15:03:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E0F3910EC95;
	Tue, 11 Aug 2026 15:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bknvqq8+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8F61847691;
	Tue, 11 Aug 2026 14:46:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786459616;
 b=HIlyVaf/+EXnZTj5jYQ9WSabu4N/r/tr5IbqqJPr4YNGV5T0aBEMOpl/7TBE6cGn+2Gw/
 VJHgFc4q1Nty1u2HTl2cW/Sls3JLGb6ixLyk/h3k+VRQFmZ5RUMmuKc88eL3lbbuFAO+1+Z
 KCDRveMpylaUPlsHe81lcSOP2giLnENtyzNz78BLDnolZ+MTSPir3Txwu27UzzaoAWjmYw/
 M6m+NkztF7KPpr/EvV/YR0mIaIFKjamXw+J47CJ3QCXSPZcUVspiXAeQKJZTFK1OqPRqfBP
 CWbECteL+ansKfK4i3VrTm+ld45tbg6bxqIMAKjlLEDaukjHnYT8CgI0OuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786459616; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aRMZKmFxEexFiSBi+NXLZ4mOnz6FGsIj0DngbOrmNM0=;
 b=lsIbVsaXRD756lxNodMfHrf4gNuvPSD0L8jkPFCryiWChaSaIPEenUdTs5fZTovsSLr0h
 Ydc9mB8B9AaxL7ygfn3pzo1uZQMxeod+m+sFbIfzoOuX4TEB2y/gRt4J9mBa4MW1Zju5OSe
 L47QTmyLODx0XlaXo9OQIaizTdBF8BroKBMoiOXrZPkMKMCUVVxUY9baGX4Ttjk5o1q1Pet
 oXQ4bwQE8aRy4E1S/qQDRazlzMo8QlOSFNuy1u6CoaR+arbMzYzEKzjXHp318fDfE3hLHSD
 6dqIMhaZlu/yFzGwHoE9XIrJHhC6agm2fmFctncCGdi7PpzqRf5Nd7yns+Fg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0BF6246BCA
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 08:30:37 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 83A2210EAC0
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 08:46:51 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2cf52d15d88so25120255ad.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 11 Aug 2026 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786438011; x=1787042811;
 darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aRMZKmFxEexFiSBi+NXLZ4mOnz6FGsIj0DngbOrmNM0=;
        b=Bknvqq8+m+yUrk14WIQmYEbFQmfZQAFnU7KKBT/dUdyHIbcTrH1mn0ZI5t1MjFW3a+
         0QF0m7m49uQIg8/NPV+8q5YN1PjzZ/XGxlo8gXZGzLBNun+0vk7wKh6qKvfCRykS+yWi
         ZdS9p+II+Aev+oP+bNtBOCXYvsMZKFBQYHOVVGBadMP+K8wUzMbv9WNYM57aAGVmzwjl
         fgOkQp1D5oiKUlYDpUZZGl4Sxcsaz8NXpttyHSIjm/AQdczTkk030UFdAVOFMZO8a0j0
         BJifc/Y+xfCL7237oLXUAPe45jlRVSY2+40cQWu6I0YzzBp8tv4HN/3vMi3wYII+aFDv
         08fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438011; x=1787042811;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aRMZKmFxEexFiSBi+NXLZ4mOnz6FGsIj0DngbOrmNM0=;
        b=FgF5QZmN+9LpxA9Ig5CwJsi9HDBCG3I6X7aVRJ+MAXoOi+4faA+hsNnd7vQUPqvaBr
         kPt9hfANwb/6nBG6ODybcPveYqAHOvMRT8AM+sG4nmi0WyZjZv2qZt21rhNpjVltTeVk
         QNDtYl8wKrSjlf05Pw0O6h8nez4XRQ38ejpbwPvyb2bCdlvWY2MNXSNEQEZMItGHTDoP
         F5sl8pWLFGMburbCUpZENL8Mk5JoUwFC+1AuXCEHJbeAGhprpQKaSNj7kHY4PBSvfOX3
         cud4SpRtWvEv2S1Ck2/uaUE80FKmoq1ZnMUbDTcIxfeWVvJelaZ9QEQCOyiG47nRRD4W
         kZKw==
X-Forwarded-Encrypted: i=1;
 AHgh+Roj+40oY0MMCoweTVapavjcvJRru4l5vFCf+cGN+1M338+b/JC4BN/KRLfKeInTQPoLVV1jsYA7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycU18tkLB+8RmAJ1/9AJXHMKraFTljVCF85UBnNZDcixEfZWsY
	cedyS7YaGKV41wRbfUM96Ny3YhKKqQi1dD9d8siyo4516GD107hG6xpDd+jVgzTtJFg=
X-Gm-Gg: AR+sD126GG/1W+vssYUkOzult6JoMMWGzLzdxpop8ahX7Kfu/+aF0E20Bnqd3tWmKXG
	RzaZmDBpvBjPaNDrmpFwkbHRj3SOWGLw0zoV0x7jJWeLVS4qvJAQPKpyNSStIAjcVQGj6PGS2Ot
	I6MDpgb4hXlVW2HQqckRyS60PQVsNr52KsytqwY6eALaYEfE1IKi+4i5zUcWqlxrqdgkHo46ubr
	lFuo8mr5ymhrdksJp7tUaFeYVbGkX0IxWxzj2j04KWUvG418yGpXVkmuVRUWCKzIg0yHRDgVUFk
	7koEsCbDjVN0xXF49c0kKuk/um23J0VQ+ghFmqwjlsuzOhwIecLP75QG4ifCUatiSLcuQthC+JE
	+TlbY37p7MBVni+7SpA0BDrJVTfro8vChW5yQm+0T6651O+y7yJyiC7idHlsjsuzirLbQCOcgnN
	6vhjjhA6iaw6A2A/m3eRgA/QDJQYwphYA9KieROT7H2GMlG25n5i2ddmT/iIFr74MSnmn3+g==
X-Received: by 2002:a17:90b:2750:b0:37f:b0a9:1a68 with SMTP id
 98e67ed59e1d1-392ec38eb9cmr1766448a91.7.1786438010922;
        Tue, 11 Aug 2026 01:46:50 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-392e58a94aasm633058a91.4.2026.08.11.01.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:46:50 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Subject: [PATCH v2 0/3] drm/nouveau/uvmm: fix VM_BIND submit/unwind
 error-path bugs
Date: Tue, 11 Aug 2026 16:46:27 +0800
Message-Id: <20260811-nouveau-uvmm-vmbind-fixes-v2-0-aaee4b395d04@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPhemoC/42NTQ7CIBSEr9Kw9hnA2lhX3sN0wW/7jICBQjRN7
 y6tF3D5ZeabWUgyEU0i12Yh0RRMGHwFfmiImoQfDaCuTDjlHb0wBj7kYkSGXJyD4iR6DRbfJoH
 i2gp5OvfaclL9VzR7UPX78OOU5cOoeRvcGhOmOcTPfl7Y1vvnpzCg0FJtmaJtJ9v+NjqBz6MKj
 gzrun4BvA9VU9QAAAA=
X-Change-ID: 20260811-nouveau-uvmm-vmbind-fixes-c2dfab359df2
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786438000; l=1359;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=p2r9UCUH+IkCeVc0eIsmIJaqF16cFuYfb27Nri+KSQE=;
 b=BPNGH7Rxw1u58EJuGxnCMfLg0hb9HrQMIWMovlH5lsn/WN39m5IfwwvHzxSAs8yLw6I7youtI
 RP78gf9O83LAQQaRsjG8AMkpQbpSpp7soUvsAfEfjPsTqXCNx5yQnQa
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: QOMFFTQNDISGMD4MMH2EK3IGSKAAFBMW
X-Message-ID-Hash: QOMFFTQNDISGMD4MMH2EK3IGSKAAFBMW
X-Mailman-Approved-At: Tue, 11 Aug 2026 14:46:51 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QOMFFTQNDISGMD4MMH2EK3IGSKAAFBMW/>
Archived-At: 
 <https://lore.freedesktop.org/20260811-nouveau-uvmm-vmbind-fixes-v2-0-aaee4b395d04@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Three bugs on the nouveau VM_BIND submit/unwind/cleanup error path, all
introduced by the original VM_BIND uAPI (Fixes: b88baab82871) and all
reachable by an unprivileged render-node client:

  1/3 NULL deref when the unwind loop frees a never-populated
      OP_MAP_SPARSE op's ops list.
  2/3 premature free of a region on a failed OP_UNMAP_SPARSE, because
      op->reg is left set on the failure paths.
  3/3 a sparse region left permanently marked dirty after unwind,
      wedging later binds over that range.

Each fix is minimal and self-contained; all are Cc: stable.

Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
Changes in v2:
- Add an Assisted-by: trailer to each patch; no code changes.
- Link to v1: https://patch.msgid.link/20260811-nouveau-uvmm-vmbind-fixes-v1-0-40df1c046b49@gmail.com

---
Zhenhao Wan (3):
      drm/nouveau/uvmm: fix NULL deref unwinding an OP_MAP_SPARSE op
      drm/nouveau/uvmm: fix premature region free on failed OP_UNMAP_SPARSE
      drm/nouveau/uvmm: clear the dirty flag when unwinding an OP_UNMAP_SPARSE

 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260811-nouveau-uvmm-vmbind-fixes-c2dfab359df2

Best regards,
--  
Zhenhao Wan <whi4ed0g@gmail.com>

