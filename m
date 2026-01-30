Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F767E6BF1E
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 16:19:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 20BA410EA12;
	Fri, 30 Jan 2026 16:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T+OySUiJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2DCA740F37;
	Fri, 30 Jan 2026 16:10:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769789446;
 b=0SY5EDQclUF3oh/TnKlCy+6OeQt1AsPX80G5SQaUmTr/CEcIrhMFoJp3QxW2iOAs0ZEbX
 1NRKUvS6OLB1slm0BsRTLevbR236V/yd+ZNj6fl5MYu3xD5HLEfgzeBKI9/hpXJcguZjusq
 rymxM1xd5HJvJR99VynhYNXd7RocpTt9JFcASuhe12OlFGR8fk0FCAMwJ43RqvskLfqzwaL
 tzNidJ/O9iWUmWl19AN/fry/Hvjpm/pFRVchjMej9P55PWP/aosC6NNc/E682zh2J1yXPhD
 SoKo86hYH+CVfdYUY9vKlWaAAegvi2hcRPv11HaEyfOVVVjG+wzBVu63cxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769789446; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cj2UVr4AwkNfFQ24cDHGjp0w8M2eMkgYBCeN86uDgnY=;
 b=0JjEiQlQiy2Uxxri8aF9cdH32FNEm0EHocbg+nqud48KknPO+EhXfgUGJqmP2K8ZwQ68c
 rzpb5KzoHu1GSk4ruabWHAUmlUmqPEbJ/1jvNNtueWkfv0+lyjlf921FKMkh2ZjlYFvDNgI
 pNK+JMIWTqGD0NjlRSA+/powcQwjPt90Wjb0MHKYEbnjvUcVNUKJ2Wc/fnTmdIpJXuYOzvW
 rfSJegkeyVb92DuZ9XyB4SAF8mnGW8dYhRZ8cjhT4Di4Y6V85ViLHhS4XE77WhyBQ5qVY4j
 vBvPR4B0RmlWK5moctLFU5/7xna+NFJ8bHGVzot45tijsETbTkL4JJcUS7tA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D23EA40ACE
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 09:54:52 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 03B8B10E941
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 10:03:59 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-8230c33f477so890459b3a.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 30 Jan 2026 02:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769767438; x=1770372238;
 darn=lists.freedesktop.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj2UVr4AwkNfFQ24cDHGjp0w8M2eMkgYBCeN86uDgnY=;
        b=T+OySUiJadm2TchGacekJOsoKkM/dddSDnFN3V2+WwzE1nJdUjCmvA7jw12bxAb+dB
         HTZUiB4K+UWUuSfziBZZeElVNw7Mi0dpv5yOCVFkHpchJunXXhxYCatJF4IH2cVdTGiI
         R8H31NZL7KTT4DID9WYPF/p5PBjuU+WjbRpEVsH1WpC4JVsVZnoXvbUHm27LbN37Nu/r
         CSVW8le3Crl6gBSAjXf/zEEFTibl6NE+LCk3B+nKwVDgLlTXLB0GS+Weij/5vpgcQffd
         bM4HtG1N1QKuwLioY6hRbf3h3kbMXU7xpudJGP6xXvtP6x8x6JW6iGeqGtjOOPJHVC9V
         hXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769767438; x=1770372238;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cj2UVr4AwkNfFQ24cDHGjp0w8M2eMkgYBCeN86uDgnY=;
        b=j/7Cs3JVCySFujoul9KFoTxiaGhvQQgXTPwUDM2+JdNU0hi3AE0HZmOQKdPDDOePb6
         I6jh5fXp61wqtBIwti9KW1MDXc/2qoKeQM//Sd5swJKXTkipH9GLxREMIhzwTkSq9ou2
         9+O8BTTzDbX9iP2CpL2gPEWwmWkGyJPBSLmoAvlzyiJvFM8tqO/ilNx6BaP6qzztp3Dd
         2zmtk44Jf06kNWCvQAD2hwytsimwsE3Y6/WrizC/iyQinBuXlzfVf4R1mPSCfItM7r1S
         4XVk79Cw23p3cn1mUQ0kTl54HB9Ze7gpLXxNDgdVh3nUENyJul8Gp1Q6C5HvZmb91++b
         LNPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmwBKejF9nduCWxkM6bjXi5lOGaEdP7bLgtP3mX4/fsyLTrEQxC/EPj3HgKDvtdfAne9ZdBX85@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5XS5BWJl3qjaB0vf6tvZLaB9aLXboCCcPVMHDO5ESWZox6tcp
	TvhFGx3Qx8jwMQfeU68dW1M8irgbCiNBui/ox/11+2nPHpD8/kKFNFoz
X-Gm-Gg: AZuq6aJKWrRnB/zZDg/HUu7gc/LFvsZmuxlxTjykGBowNm8byiRutg+w965qM7BD+gV
	ZWNJsLNmGePQBQmoDmJ3hM/e/K8fKEPo8rpzqay8lrMJd1dwJMOxgnart8ZXtS8s6ktQOFPvbVI
	Oph81oUbP5HX8nGHiu40sli76KIkeiV2p34ie29SdYuO1GM93SHoh70j6d835F9ptwsl34zbMEW
	zxVSfHHII4HX7ezjtu/2moOuCHHUk5w25N3BkCRJAXsVVy02BXiYHEJK3ETJqiOnUNtr07yMjwW
	5s1LBpPd0zfgvWIIdrR1tXvGBBU+HS+lEj+f/Gi9dG8HiVCKW7KBSJ+KdxcdkobAc2XPO34KkGv
	thkUt9RpaupBJ3qtxVMG/LOAx8C2gT/N/FGKXKYZWJl2oAnj63rKVFcKYydahqwF5JUHxzRbfPZ
	ly5bx6Pg==
X-Received: by 2002:a05:6a00:1ca1:b0:823:167a:4790 with SMTP id
 d2e1a72fcca58-823ab6bb713mr2216855b3a.26.1769767438441;
        Fri, 30 Jan 2026 02:03:58 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379b48531sm7602480b3a.16.2026.01.30.02.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:03:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 19:03:51 +0900
Message-Id: <DG1U72B6ZZF9.26V06STNHG5GC@gmail.com>
Subject: Re: [PATCH v5 1/4] rust: macros: add derive macro for `Into`
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Charalampos Mitrodimas" <charmitro@posteo.net>, "Jesung Yang via B4
 Relay" <devnull+y.j3ms.n.gmail.com@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <20260129-try-from-into-macro-v5-1-dd011008118c@gmail.com>
 <m2qzr81jrd.fsf@ip-192-168-1-196.ap-southeast-1.compute.internal>
In-Reply-To: <m2qzr81jrd.fsf@ip-192-168-1-196.ap-southeast-1.compute.internal>
X-MailFrom: y.j3ms.n@gmail.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: LPLDMZPCPGPZKEJ53HMX6VIRLTC7C6AH
X-Message-ID-Hash: LPLDMZPCPGPZKEJ53HMX6VIRLTC7C6AH
X-Mailman-Approved-At: Fri, 30 Jan 2026 16:10:44 +0000
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 y.j3ms.n@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LPLDMZPCPGPZKEJ53HMX6VIRLTC7C6AH/>
Archived-At: 
 <https://lore.freedesktop.org/DG1U72B6ZZF9.26V06STNHG5GC@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 30, 2026 at 1:11 AM KST, Charalampos Mitrodimas wrote:
> Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org> writes:
>> +/// ```compile_fail
>> +/// # use kernel::macros::Into;
>> +/// // `repr(C)` enums are not allowed.
>> +/// #[derive(Into)]
>> +/// struct Foo(u8);
>
> Should this be something like this? Also on the TryFrom (patch 2/4).
>
>     /// // `repr(C)` enums are not allowed.
>     /// #[derive(Into)]
>     /// #[repr(C)]
>     /// enum Foo {
>     ///     A,
>     ///     B,
>     /// }

Nice catch, I'll buffer the fix until I get some more feedback.

Thanks for taking a look!

Best regards,
Jesung
