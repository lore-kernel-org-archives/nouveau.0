Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0BE109B497
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 17:46:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E9D4110EDFD;
	Wed,  1 Apr 2026 17:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i+QTrxR2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2EE624547A;
	Wed,  1 Apr 2026 17:34:41 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775064881;
 b=qrNCzOPtVswtjVzL6J/+xm9HVkwsXlix+gh3c9jAAKYaYSCvP5bEo/T/Q23opthGbbKNh
 zXleGc27bXrcYnQUizOzr50Tb11VxxWiI56zl80rHflwALRcPzNMwYy6MnultgDoGQYj2zb
 fxfi2zYpwxbmNvm6HWsrbsU9YxWUF/eSzDgwY21hzqvfFZms5Muj6b9TIcUSBviv6NVfCwz
 gUUJhLa91MaRybXPDhq0y9VAm4mCGSbR0cMJtDIbChY+PtLfGTQccbrUZ6Z1AYDgN/qwybb
 NLX+qC4vCnvDozRKxrwFI9kIMPg8dOJSvaSEHvEQPoc77JPW4f4kgPEJ08Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775064881; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
 b=0tZChggnQEK4J1tB8czjr4oEiLQibD7rtT/hdbY4vIWzSWBnB4q+fwV4GhDeSeVJU9bdT
 aPSWRsFMk/RxqX8gMhAYQkixaPLWiIzuR02ffgKNDK9Y2RbswP474z4UQwH8hSQNoIrH62q
 zevvbSrxVx0ErC+2kciSFzvWwfGqXO6YzxAz/BkWAud4mhm6yUhR4sj1OI26gEv0JuqpVVN
 1AJulSXTAFtm2iPGMb3wotFQPTac4KdAQu+l7kdug0cc71n8avXCa8x8/NTdFh3FpIVN0WY
 5ISYAgx4ceqztMNTfQJ3xEjS1i6jvp9yEITSygYA2rWJWO6Ta9C6lvmI8/DQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 12673453C9
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 17:34:38 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9630C10ED0C
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 17:46:00 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2c645e399ffso2846eec.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 01 Apr 2026 10:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065560; cv=none;
        d=google.com; s=arc-20240605;
        b=dDUNzUvf1QcBzuvTMohsKh1ff10JzykP/+2Xw8YK2i/c8n/C7Rqfwx2s3b4bHkEW/F
         V2kcmfGY9fM65vf6aj8LqRS0yWVqj4IuEIH8WPPyav80xgAEbr0DfJ9rsV7FFu016y8m
         0BQ8JacpWwiMRo3u/Nui2NTBzqfqOE4f9IBktac6tzYwh6e7Qvmwsg+RtzKxKuWwSoIc
         KYqasbsg6yNqdqkUVUQaLAe9K7i7K7C3Ntg5AuaZkvqCZd5vSxwfAJz6UXDmBxOhOGJm
         LBzaVHvA6j72/uenV+aqA+LSf0pZk1IfqQ2q/HDwmDkMEu1wyGoFZXXz6zMPfLg0clwR
         yxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        fh=/UXC/3uiImnBMFJHcpndQR9kJXAHjaRJ4lhIwBtPas8=;
        b=P4dvSut8eXqvTCXDjY2weAKYpJ+RKqhWnPO9nUAkUOUIplhAnXNb+g6Tr42Q+gSqBZ
         udZhXNV2iElq8pXd17ummbI6DgNLWk+P3mXUB39aNyFpumNoB3xjtUL1yYp2O3T5WnSs
         xyHNJpIih1TBuQKZjZ/x4JiNzLFUhuhEuRhrEWKnAgEEc6hXVPz5u7D6ZpjUKJkWcsnF
         EEfGPIRiWCu6GPEMjZBA4Ztm4pYNulHcyvpsWcpfFnAi4+sRBTDm4lfBIQHI9T7hYMSt
         5cEjj5/vFVdg6vrjjhRhk781YhuxDGYo89x93CBIvY0GMwrd8HU4HQsVt3Jbio553LrQ
         sVZw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065560; x=1775670360;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=i+QTrxR2ibLygyMbFwPywMnTpGGfsmKgVDqE5IYcTLU5m39zJYHlS2WxvjL7xyWrNt
         7AyZcQKGdvVcoFzU3F4TMjsngOyIfHyu+BsZfvYBScbPsvWOdnIL0hpeK3EZBOz3nTS2
         vMg8UrT3c629+/6zn9ekV0x7yExMozRswzggVIgESvnsZ152U4CGb0B2pH6WmUnybhf/
         mSNkgiC7zXUVq52KUaMWxvSGA85E2BdlcVWTyoeiyjmdWFQzYOn10CALMcSNTICPb8g1
         oOzp5DJSkPJ0umciz15hc4QVlBY6j7P9WlVR+nX8ehTuwPU2/wSacUDMHNwnJaQh9hjC
         4kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065560; x=1775670360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=MO8S4WunB+GVFCTEFszkub/1OExRl2cet64hRJNNdq8qkEzWx+vJHn+LMdj9BEFvqW
         YCfReg+ViHfzsgOO1qP2N+oQLt+GPJzoirwNMeYMJ0vmEm12wZmn4POCCoqa/oFaKSc6
         J71f2WkNbTWsf7xDgMxaoSl+yP7nQokklqdQoVC2m50jrW4pjOxzRYfh6vIdDiDdF6r1
         lsjVccOHEpJZ5oYomuT2wwfLsLzl6As6gCbamdy71x7+40K+tyrxARy4k2c08q6pqpb7
         VQ8Cf7CY3sWhdw+fn5RoX/wLoN0qRmr7sihwOJM1Oq1ffqLUnFrfsd/cvHv0ag8nsxax
         HPWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYnRSWNICHQOB4bNuaxQld2omcibm2K1BBUBRDZzwZ8PcCucbLI3nM8MjSP6t9UIP3SEoFUL6C@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw79HGQB8i4dRgNBgo0o9sNCqqtgzxKExq6VdQQ+IJPBEfC9+8Y
	fccQl/CC2P361fe51oxkx5joM8xBApML7M6xWLeuHZMWVeQIvGBkVByAMDdmu4cjyXkubpiGQdb
	hYPABgb9s5VpGw8m7iCqwBl66iJUAyMI=
X-Gm-Gg: ATEYQzzD4X5v1mqX60KwDyGnycL8b5S6wWcqMYV1zL7+AdxgvszWHoBMvhSYIyAELjh
	7s3NXkovMc4X5NhqeLgz2yNHOR2pnBuOpzy4dhY2KXXdfsAwvPd5aZnIaTE/N//LQJQZL1szkxe
	bISPoWKvQtXHWbNsk+bwWx/xdkYw6z40Ms6EElzeDKSd4ktboUkbwqrPQ4f5Yc8EpncyGz0jDEt
	NYtplPVZv3a1iUnCn11DVdPjXqzvm5soSnAuY2D3xdTN8NVM0vh1xYEX7H83UGZcnr30rLwAHTL
	UmMJMySyam1Ea/Gtm1Wupwos3Df9c6Nclpu8/FuyIbMB0u7j55jDta2NxpbyHZmgh1YtFEjBk0L
	Fu67bnYn5TmewIFoc8TRhmGEkBpGuGgxwmQ==
X-Received: by 2002:a05:7301:2c05:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2c930798a4dmr1033595eec.1.1775065559731; Wed, 01 Apr 2026
 10:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-13-ojeda@kernel.org>
 <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
In-Reply-To: <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:45:44 +0200
X-Gm-Features: AQROBzDasvNfwm3irNcxLclKgLrVzocIHNQudR_c4deB-93-CSbalwIa-aYY_TU
Message-ID: 
 <CANiq72=8eVKk0gqyvgWM_-VSsRZY1s2e7gx9AbAg+q0dRRYO=Q@mail.gmail.com>
Subject: Re: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO comment
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IWDK32TJGPUZVZD4AMHD35F3P6NHMRLK
X-Message-ID-Hash: IWDK32TJGPUZVZD4AMHD35F3P6NHMRLK
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IWDK32TJGPUZVZD4AMHD35F3P6NHMRLK/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=8eVKk0gqyvgWM_-VSsRZY1s2e7gx9AbAg+q0dRRYO=Q@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 1, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> When I write the comment the intention is to enable the unstable feature =
and
> switch.

Yeah, that is what I meant as the alternative in the commit message.

I am OK with either.

(By the way, I wondered why you mentioned 1.85 in the comment, I guess
it was supposed to be 1.86 instead originally, i.e. "above" as in >
1.86)

Cheers,
Miguel
