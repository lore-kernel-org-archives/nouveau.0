Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDFDEA7940
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 18:54:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 26B0010E744;
	Wed,  4 Feb 2026 18:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JyO2vrkO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CEE2341B48;
	Wed,  4 Feb 2026 18:45:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770230712;
 b=U+4sZMcmpt7cJNwuc+c1WlISrOjNGn7T4I+mpHbT6jw9y56gPqpzQ1AnAxgzlrBdGbZDJ
 SYr4TQic1vuVIhLowMlMMu3zV7TcpZJ3/wlH2FkR9TjxZdMpWveXqBQDY4P/LIf3YsaJBb+
 DNfofqeGue3qXyLwYfQqr+g2JAL8Cq0xM9LxlmjLT8jtqv3ytevAq4ipxSwXKSXAfVyKZCk
 zg+q3VALO8QNiCbAg2hENicV6Se8K0wxDJPg0bYtmcU6FKlvN1g5n/GxX730aDut4J2Y/ZI
 6rN2CgepnJ1bB0SkTtI8SO/gydxEZANQbMDHbiUErmiUlHDMsjhD909NEnOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770230712; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
 b=qKvzoSTbaV+9ILlmnlD+mNp7yKkzcRLqUgyAhfnlUKn3Qq05RsC3LnLs4hy0WeB4wVRew
 tByvw5qGa+n2p8haUY87B9HHAzuWqWtAGokOUx/bnWH1rONoahAftZzQqoI72vSyoICkGs5
 nMc1CmhIFTT48ZUIq/pMo2v5l13rw4p1tIjIzOW9kkKN5ACVFE8/SE9F1k1s4CrfZk03DR/
 cQwC7bvIBr6N2Xhwx/tK1d0CsCYtr/JJRnKj3GZXoxlbGC+/5Pc/65HbSN6KKRMDryn8inX
 IEln9gsLMUiEqndPATrkNdKIv6VyRk6scNE3l0RnVkGUAfS7ay4R6QFZVW7A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 92BAF4015A
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 18:45:09 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AFE0010E37A
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 18:54:27 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-2b78c97f57bso3879eec.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Feb 2026 10:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770231267; cv=none;
        d=google.com; s=arc-20240605;
        b=ME6i3Dy3vRbQCMyqpVXUO37QVDo3rZghMzzDoz0UpK7JedRgk4BN8g6uC6fsqrQL2g
         Es++JIYaAb0sa92TO55StuIiYHaIpYTG10ksYnis3T9b+KIH53HbC9V242TU2c9XZO/l
         uaNr8JJ+2KZ82YhYISEPP2JolSCCV8c9CVzAvRh4TpaZWGEebSLz//vGaoVpnYLdVMHM
         Ppb2+QF7WmKiUOdHa5x2zA7SmsV4BTa+2DDvPt7N0KcwbXzS9ZfR5UehaxxtIOFBwXop
         5DPqJeRxPQZBUhCckXhjGnojmSBNurJhJx+8OpbceTMPuzfBCJjKejUf1/3GzDft44Et
         RzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
        fh=4jFbWSAIwlpORfGEA6HLQcDJEzeusR+aCYHOUf2/qEg=;
        b=aYtXOzME5+3SnWAS6auWIIbReFS+QK4Ba6CiGI0jOLERTrHMI+taz6E0swNynnn5z7
         9PftkFlAnKZ18nzoElgX1GlvJQyw2StK5KPRpPtcaFY4sksQ9kq5cuJWpfNBf8D2uJ9b
         6ONPqxiqpgbqHBHVrbqGQ5J+ktJaMuZL1pStCquRoHNnO+2BkYxNe9gHkBAs7f1OoXX5
         +7MD0sWzPcc3nX0XmnxZkATA4qj25qevTvYmGZAiOsODZ8pI7P39X9RpYH6IW+L0K7an
         A5s5+zLPCO0fWmBOo7EHkOIWr7lvN1dlCRJ3ijxVZDVq5t4sEnJTjCbfVoiEWxTMGoB9
         Pyqw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770231267; x=1770836067;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
        b=JyO2vrkOnTp85T0eQYO8QJclGWx3q+QTmFxasBtv+QVf9rvtxj6eBA76cg2EyDplwq
         g+to7Hkb35VyibAmyqZp2x9pnLg3WCVZwPCAr1G2136bZo+xPFN5j+auymStykg+V67R
         sGv4o0WoACfYLt54Rxzi1LoJ/FaCHvPC1Kcoz21xu/OBian6AvC8ODrWSwHjkwymZnlB
         6OGXC78KNBWQ32JK0qJ1JuWb2d961QvtZtlLI93hfNhRmS8zjdI30Wg+w2ubFaK6KnrT
         wMuRP7azbLJrR41iyjted0t5aEyJ1bkcr7K7o9Qp+04A8ryAk32pce2ZP8/mR8k5UXSy
         8PBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770231267; x=1770836067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
        b=SJwaKho4ydktvK05/h3N13EZ1UARJ8OBS0YMU140ScZdiZu5yS97u+zDR5mqGe8tQi
         99B2dz6CXVJHIQmPDwAFPiePSAu4gdwciq0O2vT6A1JDrzW2r+2DjB+6F/enX3CtXSxW
         jbRnrCESLAHF8I0l8t/IfhwX0gpbjqSQRwOXTZwSHGG0QgUhsZh5DksZ1Zdg0l/A9ual
         VJW53L5HzjsL1aINajm2UOH8Y6COVsZW4xWpVn5uH4JkFUvnSyhVVl/FtMCNVs6sLa2C
         YIvWTbh9scWtRjDEsnwKPxjlfLs1S/3FVix2p3FPNPLGL/lrUicf1atCBSulIRwQ9G59
         F+rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNY6tKN9S48llv8DRFTfRFjwOY/n8iqEr9fxTdnAANIS6YUZ2Dr+JVqTfj3+X0bo81cfNQa5+A@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn4Pl/nT00J/iL/hTOJ45l5M0o7+DGa6TpKsuYFUAWhOAKFIw1
	25AUF/4yJZ+GQMh2XcySbEbd/bBdQimiLH9MpvPIuarLKgYRoTUupk3ECOuxxm+FvyueVTB7yR4
	O7vQ3Wu3dnDwmETQCZZy59uay8Ax6csA=
X-Gm-Gg: AZuq6aLoD6Z2ZjfqllDWNMuBYia6XqLR+phm14Rr13zF9Ge0tK9vQXOlkij6dkSdvIb
	MaQwmcUQ68jfICukkaBB1Gntluu+yNsHvh03Gpm3ZPcQYRiDH81bra40d1zLjP30muKedahzdgG
	aOvb0Pn+LYWqb8JJN3M7n89fMqe2I2dyQQscTrQFV7PjmQ2/Y4BxFBOSXoIA+2lY/zhDQXU+3Ie
	Lx2+t7/PMIigXoHlnzliKEQH6vY1iv6UolBkpbJPggANO5Su3xYjQs/WSSiGGQEGaPXYUEIc4Hw
	cQUyLS82PCoAFpyhV2ZncXTNRJrw7T85ZR7/PdHRt8mHYtw8fBxXCHPoNzQeCRj/DGblnlbls0o
	3tVUsqRTEFznB
X-Received: by 2002:a05:7301:fa07:b0:2b7:f145:a66 with SMTP id
 5a478bee46e88-2b832895203mr863567eec.2.1770231266769; Wed, 04 Feb 2026
 10:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
 <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
 <8859d68f-ca38-469e-8345-84059573ac97@nvidia.com>
 <DG5OGLH0BHNE.2XSVBQHAAXHGI@nvidia.com>
In-Reply-To: <DG5OGLH0BHNE.2XSVBQHAAXHGI@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Feb 2026 19:54:14 +0100
X-Gm-Features: AZwV_Qga4SHaJVbqnKL6-k_z0NAbFWIYrZ90umh2b3m2XbOK6FLc8RcS6JCVOMk
Message-ID: 
 <CANiq72nhzix4Dr9_gbaFwZQQq=3cDY=oAYVgG5hDAmMgaYKQJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BVE6XEKWCDCWGWRDSTZRX5IV3GYI7NVB
X-Message-ID-Hash: BVE6XEKWCDCWGWRDSTZRX5IV3GYI7NVB
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Dirk Behme <dirk.behme@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BVE6XEKWCDCWGWRDSTZRX5IV3GYI7NVB/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72nhzix4Dr9_gbaFwZQQq=3cDY=oAYVgG5hDAmMgaYKQJg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Feb 3, 2026 at 11:25=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Thus for anything non-trivial, I'd like to keep a `// CALC: ` header
> describing the intended operation. I also noticed that LLMs check that
> the code is in accordance with comments, which provides an additional
> layer of checking.

Yeah, it is the same reason why documentation as well as other tagged
comments like `// SAFETY:` comments enable to catch mistakes even if
they may be redundant in a certain sense.

I wouldn't mind having those tagged comments after a certain
complexity -- perhaps it could be possible to define a heuristic for a
threshold where such a comment is required, and get Clippy to warn
about it (we are trying to get other tagged comments implemented, so
it is a good opportunity).

I guess a fancy IDE could perhaps render the math expression on hover as we=
ll.

Cheers,
Miguel
