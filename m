Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBD91112242
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD8110EF0A;
	Wed,  1 Apr 2026 22:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AInBcHCO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 69C5745487;
	Wed,  1 Apr 2026 22:48:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083713;
 b=uWUwSk4PXoSnWjdVH+YkC5G5H/bLJWFVkOF9MeOgn6zKPBO5cGhaKGvhKP2Gn3sciT6wz
 f72DFNFQyW8AIeR4MkX7ystZCvNVnuJsT4Z7LcElSC3svyVlU43ijlRYVI39TpxeOYd9zM/
 r23SnDCMNrG20dqaHdmAljzOTL3VgwyYZLMEGMYiRHhGdHOSz8V8D9KUl/zuwPeRSPFCbt5
 DCre396vHIakijhmTb4IWmGrTeVFOH1jfDhJWAYc1F9Rz7+UBv2l8nkkZJ5NILzG2tP7RN/
 BkXwN5On8q89MMeqomm6rU6Ik6oMKc3MIV6JA/9vvtM7+A/ykbZrfuJnRIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083713; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mPS90NnWbA8Lo0O1GPzXKgakrNy+l89I7krMYfaB+Q8=;
 b=VBFJsiGsT4f9YNNCbwx4nitqhfDjWQEC5yAlFV2f0iY3Ho+Qz7wrxq8Fgd8wEpdcqY4L9
 8jAcjOLYLruO2+sC+LWx1ehKiXKcn92yRnw+yICDJhKx64dPlHKPFy9FAlkzi3JhJIQOFl4
 Jo2zkqXIDdd7YXk7ZzroiJYAPVQnnJG2AU32aqMO0V+KqPAH3lNVym3yDXnlxfuIYBifpLc
 yO6AOB1bJw+h3+9eE7LzMQsXICaLoMQ+hak8RUgAxRz453mYk0Xv8BKi82movIVO87gwTdm
 4HLUpqThqYuXrIv+Evb4lMMfN/lnsnwPiK194CcDAtxuUj6kkR/XQ/+0hWoQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C3FB54532E
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:48:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CDD2610EF08;
	Wed,  1 Apr 2026 22:59:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B263343F93;
	Wed,  1 Apr 2026 22:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A75C4CEF7;
	Wed,  1 Apr 2026 22:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084393;
	bh=xq9NcCud+LpB0atoCb11q9Wd2+LfbKDNAZgfYlibXt4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=AInBcHCOb6slZkVW3sn4yoBhwFNl5NlNG6FRxcOcIgbbEkjdrWTvy+wLlDWdNljcc
	 vk4SDzjYy6ZR3ZjdWJhBV2ccdBdnaQCwXJPz5Yi0tg45+MPA61hDBoLRIoTN4QvGxC
	 44aHSoDRJmSVpgbQHlXqD6c/CH53DMmvO7Q27cV7SRH799uEQrs0IUUfAUC3xvcSfc
	 HJj3S3JF4Rz5M7mt9X4oNWU03EttVxsgI9eMoA7Rv84vHKGz6jiEL4Zcrano0XnD79
	 RGUY+op3WG++YeUETBS3kAl5j78KT3CoatR+1yaVIVR8silujNcQMpHiLSrolxpScn
	 YBJyUoPe/kkSA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 07/33] rust: kbuild: remove `feature(...)`s that are
 now stable
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-8-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-8-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434438.73816.15311163307401795216.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=313; i=tamird@kernel.org;
 h=from:subject:message-id; bh=xq9NcCud+LpB0atoCb11q9Wd2+LfbKDNAZgfYlibXt4=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzspLpTbOycju58p6Jb3ZLOTu+M754m9/iawQLs9w
 erJzAPzOiayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEx19zGG/0FezPN/HDOfzHe+bNJvl0z7Rx0bKgOunZEp7JeLPBIyT5+RYZfYni7
 GH+9rH6cZM1tXqnm23i9Nv9+0+PeGNO+Zi4rv8QMA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: LFW6JPHPSSWYO6OAGJ2K7WWI33HXCVSV
X-Message-ID-Hash: LFW6JPHPSSWYO6OAGJ2K7WWI33HXCVSV
X-MailFrom: tamird@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LFW6JPHPSSWYO6OAGJ2K7WWI33HXCVSV/>
Archived-At: 
 <https://lore.freedesktop.org/177508434438.73816.15311163307401795216.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:14 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Now that the Rust minimum version is 1.85.0, there is no need to enable
> certain features that are stable.
> 
> Thus clean them up.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
