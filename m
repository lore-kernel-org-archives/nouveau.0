Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC792FC72AC
	for <nouveau@archiver.kernel.org>; Sun, 22 Mar 2026 06:15:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 798EE10E202;
	Sun, 22 Mar 2026 06:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F8HHE+Yi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 087094527C;
	Sun, 22 Mar 2026 06:04:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774159440;
 b=JLxdFZQvhk9IPA8q84ipW0hoL6g4WPS7uj38JUV7nlksTQPEhAKRg2pJD2UxgPTd1+IKH
 8+oi4Pyfkcwtl+a9HDwVmygPaogK7PmyaNqReH0wqwLJZ9Bv4wn/gEaiOXxz9J/gpTHlcl6
 AyLs5zUI9quzO0NQI7XU/QEdaF4zHUDzhmmePaJKJeZuN4sAUB+Zzt6DDM89BjR9uv9BASU
 kzCL+gFPxHrJOK+klhPTQ7MiPsqEtRoBQodYfAAU5QYVMksYzdav9zUYAJ1ZpE8+QzueMDy
 8lLfIl9ny0xvAoEoRLgci3V/wHrN5Wudiq1V+iYz9GmpJFbrsCQm9qInDB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774159440; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XqAQc2CNEfo2l7r/6LGV0uoJHY//hLpkZlFH0GmzSik=;
 b=Y0tArVK6AvY0AU5sdKg3iGFNc7Wbz5f9pP+GLkiQ2yBDdoTaswtGOPxUFtpCpKAe0PLFg
 nxHxcywjLndw4Zzy6P+vVvb3L6eREtH9ZCEyoY5khRSct71Uv8f0fxA3MfPQSB5/N8Zu0rK
 HTZvcKcJ58bAPN+6JOzDmTqLzG0tZgCneNNsJ53MXdd99B2MoJukaOqmo/20WFgCCwg138r
 cba10qZ6N1WGC7RHGT1GSdA/1kTv3DZGcIgx//W21Bs9w90mUCfnAt8KfH50mcFG69555iu
 222qHe4nyhTR6QNfKJ2B47Uj7wmskV7MamG4kwe5mArTH/p6ubZFfHkxwg+A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1959844C86
	for <nouveau@lists.freedesktop.org>; Sun, 22 Mar 2026 06:03:57 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4393C10E012
	for <nouveau@lists.freedesktop.org>; Sun, 22 Mar 2026 06:14:56 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-35b95a7444bso1038274a91.1
        for <nouveau@lists.freedesktop.org>;
 Sat, 21 Mar 2026 23:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774160096; x=1774764896;
 darn=lists.freedesktop.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqAQc2CNEfo2l7r/6LGV0uoJHY//hLpkZlFH0GmzSik=;
        b=F8HHE+YiQTezZY88Nl3tVBK39U8W1kWUBVlGKuUeNveLqdWwLUOqptIs+IeHASgGMr
         GJisAOuX+84Qw9Hq1vOFqvc2rOlYwozRTZI5kF3RLQuivMf/ffCxMFW9iom0p9FTqv4y
         Edur4fs1dIP70unkqJmIFjMhlAeYbQ3dxQhNHfUjiSyfhbWqNLfa2ooaY4Tup56R4ey0
         Yj5XtmMCqRiEYBmYwx0PHvubdHXgHp/9GxidFfJN2BRyer8XBNlGMGcN60cRsQoMRwUx
         Qo5/638vecbppav3gGpPDcsGUH1h27179ztWCOon7RSyZQR4F+LtFZBZvd9LUE+heKwZ
         wALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774160096; x=1774764896;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqAQc2CNEfo2l7r/6LGV0uoJHY//hLpkZlFH0GmzSik=;
        b=qyvkqQloyru9O6BG/8BxZ5YSldteeEzB+iWcVoBGKqrP4cDKurkoKzMGvK/qBhFWoV
         DL5Fk4+LTfv0QZa8i53wfNTx8w3ts83S5Sqqrp0TtpUfi43tZhNnUR7pkEPLWzJfF/7x
         eibuM1jPDw11M9RjFR24xUOfLGnUTpZcL+hJZrgMzu/LlEH6i06qq52rWIspxqmhlg86
         /KDMihNXyygB+7kParFRKk6wkuJ333erHDWfUpjWRJ8AJwcXm5uLx7RRbCLWgOE07uFy
         263IZpycLNSuAollAbVJ0p7n74J6g6C7r1sK00BGtoJsxLvNixJ1Gak8yZFaeGrKpQ1V
         oXTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnFl0vJjGRtaJfqws0uTEx82aJEeuDo7o02jNbWM9MsEX/P38oPK7jXUo2yEE3JfS7zxRMez86@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0Nhjjo8iEME66ZdArdicHK0kLu29h/u8tHkhCHEMNl0D4j2vN
	93hX2++6GXWDSs3a97vxHKzA89DWMawu/E+uDMWCBBUZCrYLQLEyqJCX
X-Gm-Gg: ATEYQzxnzw3SRadMrYXeQO7WVg6Cd2nTrbosHWvVy5CXIXsV1m3O2fUpoUDZ7Fq45wF
	damirglnCq6rwQzyVAakRwtA+LCb1NP5y15WeDeXV54CCpgzENhIdS1PDIUQRWwDbAQgo33zV8C
	yGLricFDlZcwa+KDvtPvky5beosKeVa3Cep+CWe5+oAF4ft83BgVIKWxpd6PdAiS74I69zF+6eo
	OnfloJ5q07EHJCXs6TMqDmSE7bxRCdh/+8a5fg5Vok8e6tCbxwaG91m2DCy65PUT64SB9j046qy
	mNWYySmxRYC02Cqg43ILwqM4wTG2jp+LSuSXcxuGPglZ1pZtyvl6R0Q7ziumQDsKaGyHmAkLRyz
	zooXad0tGPlqh5dfqZqx697HTmdc8chx8FOW1UlQDOq4VwgkJ+LdjqoLaLfN5HFDzWh8Hc8slRf
	vt86DJ6EP37XNPVRICEg==
X-Received: by 2002:a17:90b:380c:b0:336:b60f:3936 with SMTP id
 98e67ed59e1d1-35bd2be6e27mr6866046a91.12.1774160095747;
        Sat, 21 Mar 2026 23:14:55 -0700 (PDT)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35bc60ec3aasm8719437a91.10.2026.03.21.23.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 23:14:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 15:14:49 +0900
Message-Id: <DH939HK0611M.22A8T9BJ3NG8@gmail.com>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Jesung Yang via B4 Relay"
 <devnull+y.j3ms.n.gmail.com@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
 <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com>
In-Reply-To: <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com>
Message-ID-Hash: S3S33UL4TWIBGJLM263DXNOHK6LHEI54
X-Message-ID-Hash: S3S33UL4TWIBGJLM263DXNOHK6LHEI54
X-MailFrom: y.j3ms.n@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S3S33UL4TWIBGJLM263DXNOHK6LHEI54/>
Archived-At: 
 <https://lore.freedesktop.org/DH939HK0611M.22A8T9BJ3NG8@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Mar 20, 2026 at 7:04 PM KST, Jesung Yang wrote:
[...]
> I'll update the implementation based on your feedback within this week,

JFYI, the updated version can be found at:

https://github.com/J3m3/linux/tree/tryfrom-into-macro.v6

Best regards,
Jesung
