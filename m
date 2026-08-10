Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73D4C5B572
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 15:03:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8A10EC6C;
	Tue, 11 Aug 2026 15:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pzEc9r3I";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1D8F64767D;
	Tue, 11 Aug 2026 14:46:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786459612;
 b=vISOEOzNC9dmLY2UklSOc1D2oE/ZQK5ioLYrR5BIdyhUhPi4NB9pU1s19fdNvUcpRb6uQ
 RE84WiNc/kAxQpaiWybdfTsBgbumoCRnaQMSI7B6IjW2caZr1Mdk4K699+CcPpLWAQ50i4V
 MmgrFLWIZqFBVCCxxxlNAB8aSF8WBxAuQHz4jJaqek+2uV6thdYaqkExRKlYr/TyLVv1aSe
 qt4h/p0iLUieb78x6Vx2H4S/o+S1Fktr5eHQ/oMqOxRykWYPYul7IEfzJi2t0SQxPIGZUIJ
 /pmbG3jo1G89FjvxQYvL9HJtyp1WVBk9Q4tCRN1NEiLTVm6o/iz+O7byLWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786459612; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=V4aYm6FYSeErtwvuAXuGnJHyrhkVQge6WQL6UnOG+zg=;
 b=cqoi72tvL/XzW9NKqJbsf/V+KaSpa2qWexclsBdNA0J/Jkh3IbCD3cr6l8G10H90sYD3q
 I1UvCxbiCQmWjbPaAvUWuvTABjzN++yIlj/jOeBNCotRqVXIqNLUFdZY4sgJftL60l9VBVT
 7AnXW2x4OrBA6O5CjR+3REt0JZsvnd/9OCD6QyGKcdMQ7j+qLVQFgIr+zliR2R4rlTPCedQ
 36t4Ms5WsCAbohR/WOCQ+hMdKGVe8U+hoseU4ENf4mpgiU01HCR/MJS0dG8u6Rgl/o/vbVK
 eu1clvmjWb0M5yzkfzQxd5v0Df5H9lNmxLkbuOxHykJVsoe0PSO8RUsXydjw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BBED445559
	for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2026 20:22:31 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7CC10E9A6
	for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2026 20:38:45 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-84e0688b7e8so1951186b3a.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 10 Aug 2026 13:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786394325; x=1786999125;
 darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V4aYm6FYSeErtwvuAXuGnJHyrhkVQge6WQL6UnOG+zg=;
        b=pzEc9r3INJ519nFeC5w1EmC2LC1PN8GOyBlvTLV0Dug2fP+Fa1yIH/7pgG6/ihveYn
         9qmy75FEmNT7nj8llUwlFFrNzuwpyepf6SvoeZqzFYQzeEQFOfejxBZ6NTDcPNIcBBRs
         AN6lELQ4I8r11YcjNkrmsU20E1vHZh8sYIdif23zJy8UaL//klkrAkbUEhp4rjZgD6SW
         J9YzMCNSpWxgVttc/IiNQ0ZT3N/fZDwx7qZO44ne+6v4NSwi3ibHk/BrZzpeYNn4Mwrb
         LfwjZQw+OTV/p3dU9Uai5gm/s3PBzJwRp2eMx5Xea78+D5kWFc9rj/esi9U0009LI8dN
         NK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786394325; x=1786999125;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V4aYm6FYSeErtwvuAXuGnJHyrhkVQge6WQL6UnOG+zg=;
        b=ehnNZSXLG47IWKB2NM+HzPf4fs/tADs2hJ0JQE22HBP8XZaYf/zm5uVC2SNcXyMt4a
         3ImuLXKttYfKZGs1L+/nqyg4VGQ0zdvZKkG8Y9MyAA9E6az1N6DINnJB/MCn9zRO6PEf
         nPIBjVHQy7dKowsCIAZqcsRS/y+NkDx7r0MPXV3pE0xiHXSU4JLJ9f48R15kb3pl6UnK
         WR/Qaj4eJpwZqwog9Ra11K7BqgKGZ8cpl+61pQLfvFQBODjQdhRYvcSHBb+/JkG7YTnZ
         INiBJNaHsXVQs99x8RfjmMgvdKE9IjePcwYc9YL71QLvRhp4p29/B6WZcc/KKogn1P14
         uGrQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro2m5Q8FGv4pfwG6Z44LaiUmHNe6a2QJE1KZZ4xevuf2cQkmI3I9NdSm6YYcX2dF71mXzV2TkZI@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7UkuQWIlcujAe6eVMh63YHOddqELOBbCI5i2OkHaKWTPbV2ic
	G7OzxgRsVdlH/3INdU4ruLhjlfSy4DJwepnZ8Lrnix3UAKPer9E5sgsq
X-Gm-Gg: AR+sD10ELDTBXgSTgY4LYDcVSuYJ1d9UvJJImMpgMgNA6Ltz1WgCm23XU70N6o1ek5z
	x/cuxCoqNoCV3NeyyitMcRLzcxbWWoQm/k/KhlfgzYOyAQ89v3SSv4Ho0AbqZitbxGvhgfYJZzA
	F+l+uRtIwKez21ZvIokyIo6g0NIrbNRB1jYKHzig9yTu3xNbHugWxqRF10AcqJLYgxilTUIvqzx
	0FvetJIXGY8Y8Fh0tiD6WLfoITnSveZ3O6vBQIIhUb2icv3qAEohBdWINSsTzFIvfLB9mJwOedi
	jz/4aVJui1VNjyZiUdtadaKlJ8T91siGTnvoHdYrZphVBRr+tQa6is6yxFITwhyEGEDBvhsS3TR
	a6FfN1m75OJpd0FhLY9Ka3dXnCB/hqDLeZGp93Z/O2YfYpzCyg/v2P8Zy13rxSUg1/8/j3gXepT
	9V0zEfh3wAGYooxTYZaJKgLXr62vdf3nqPey4eO/ephlhrZO14jNu9v6sZkdY=
X-Received: by 2002:a05:6a00:1883:b0:84e:b7ed:7d50 with SMTP id
 d2e1a72fcca58-84f9c8bf09fmr4538374b3a.16.1786394324672;
        Mon, 10 Aug 2026 13:38:44 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84f5a553071sm4324001b3a.43.2026.08.10.13.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 13:38:43 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Subject: [PATCH 0/3] drm/nouveau/uvmm: fix VM_BIND submit/unwind error-path
 bugs
Date: Tue, 11 Aug 2026 04:38:18 +0800
Message-Id: <20260811-nouveau-uvmm-vmbind-fixes-v1-0-40df1c046b49@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALo2emoC/yXMywrCMBCF4Vcps3agiVisryIucpnUKSSVTBOE0
 nc3tsuPw382EMpMAo9ug0yVhZfUoC4duLdJEyH7ZtC9Hvq7UpiWUskULDVGrNFy8hj4S4JO+2D
 s9Tb6oKH1n0zH0PLn67QUO5Nb/4ew7z+EJKiefQAAAA==
X-Change-ID: 20260811-nouveau-uvmm-vmbind-fixes-c2dfab359df2
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786394315; l=1170;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=jqjdQ4ytk0+wTeBw8PTbYYR3zs6526Vfg9ko20PQNAY=;
 b=Gm20mEIHRxSyNqIwseVbLPncJya+jfBeFQW1zRIDALtssFI5jN1ElKIgYE7rkA2kCvoqn4Kde
 ehO8EMs8rL4A5Em4KpyLCtT019GMGdAlef3kWJE23++u3iVAGXDWvTI
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 4URCDYQUGECSBC5MLR2FG5TM4W7HWMEO
X-Message-ID-Hash: 4URCDYQUGECSBC5MLR2FG5TM4W7HWMEO
X-Mailman-Approved-At: Tue, 11 Aug 2026 14:46:50 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4URCDYQUGECSBC5MLR2FG5TM4W7HWMEO/>
Archived-At: 
 <https://lore.freedesktop.org/20260811-nouveau-uvmm-vmbind-fixes-v1-0-40df1c046b49@gmail.com/>
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

