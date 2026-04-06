Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AF3F46C47
	for <nouveau@archiver.kernel.org>; Mon,  6 Apr 2026 14:29:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 438B410E25D;
	Mon,  6 Apr 2026 14:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dRSvnYgZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C110F45661;
	Mon,  6 Apr 2026 14:17:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775485066;
 b=PGbRkMTG6XPcNoX/mccYDR16zPfG1bOPuun4qDB7UpPyIY+rEoAhJVcT8beFZO6IptUT5
 /ypl/yCFiyNvHGoKLfKGZ/bsKFK8ZJZA42O+BEKGmCwY81vDep0EAQ2aqDB4kUWrfQ6v/o/
 79KoFyOxkuccxbXQ1gUzZyUmSdWarlKhxWCyiv1NAuwsfEdy+q4Y0b7TWseh46OT4T/Vxjc
 sl78Q3jfVsYD24hZRTqXhFlNr+HJ/aiL8CYkvISZeAJ2WmGLu8DLzx5UWB6BQM3fT8rcy7h
 7mPMCpwWOswyGkg3wT19DRuMWXAAnh0+6j+SV569mSWnCkzDT9ZwLfIRcHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775485066; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EkNm9wFfp98jb1LRjOKmI7vefuruoaGtzyUv1N7ItVU=;
 b=DIEQi+Y8vhnYZt9PK2WMtJGAN2NTYSh+cZOyh6PZOZ1yPo0+75NqaLTbLBZzT0ej0STJA
 AcD9SI0SwEQsa9X/OFiUaqT/ZMTe6sxnB6a0qKTjcdeDQh7DKjgdv3vPrzIn9mYLNDI8pfa
 Qwix4Kqs7PQK/huBLjz3OxA76jr6OdhoRK94WzslSwSZHruqdDvHDdA5p7i/EmRxzQFdgs5
 YXjnDbDDnx/qzSs3hQbuJf2cg/uWSOCYREER25H1eyF9vzaKZNlOqFUPsv3M4eCC030E/wf
 MZrrNBB+YTeAzskVpjLXEojHGPKLiKDjVP7YzlpoouTUG8w739iQZJAnBhCw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C284645582
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 14:17:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2149010E269;
	Mon,  6 Apr 2026 14:29:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDC7642A61;
	Mon,  6 Apr 2026 14:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976F9C2BC9E;
	Mon,  6 Apr 2026 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485756;
	bh=hQs1Tn9TC/fuoSSmmMaVRc8aMtneqBIGGyK2dnscFmo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=dRSvnYgZ8y+9NiMZOjUfwe4OjJV72M3gHcEolR8tMg0+XKG0e7wy8sJJa1vgsFLdw
	 c5CFD3Xucwz/io7Rpsfq1thQFQcPIRkLYLUPP7Y1y4I9b9KPB/G7mQhVM5TuGcd6gm
	 6j4o/t5E0/msw22ksl7ZTZX5i+G9zAy7YYwtPYx221YGT0Z9FD9uUy74kjVaXqtm3Y
	 n2mq1cThIix8w3e/hkBH9UlVKC3bY2TG7D15bvqQZPmyIzlg6q00tW5pIHF305QHMZ
	 T98GigKLXQQCyZiVCE86iP0fUgWjV2j28zjziqxOJTxW4KHZ7g2VhFATQ86+Kfh3KS
	 phsh/0bbvPSlQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 15/33] rust: macros: simplify code using
 `feature(extract_if)`
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-16-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-16-ojeda@kernel.org>
Date: Mon, 06 Apr 2026 10:28:56 -0400
Message-Id: <177548573698.95472.15531781806867412060.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=508; i=tamird@kernel.org;
 h=from:subject:message-id; bh=hQs1Tn9TC/fuoSSmmMaVRc8aMtneqBIGGyK2dnscFmo=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJmXD+u/jDBy4Oa9bJk4w2M9B7fk4YfP510ojuW9dtlDK
 8//gb11x0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKnWM2JkmPtPyHGS6crEmrgGbgvtnyq6OeqXoizabv3atXTD0XW/fzEyfK7+xT2
 9UPeX0uOlbpUiO+eET1rG+2bCuhV3GffYBAk+5AMA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: FTE7FGS3WQXMFJFVW63AUIBLMQKPZOFO
X-Message-ID-Hash: FTE7FGS3WQXMFJFVW63AUIBLMQKPZOFO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FTE7FGS3WQXMFJFVW63AUIBLMQKPZOFO/>
Archived-At: 
 <https://lore.freedesktop.org/177548573698.95472.15531781806867412060.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 06 Apr 2026 01:52:51 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> `feature(extract_if)` [1] was stabilized in Rust 1.87.0 [2], and the last
> significant change happened in Rust 1.85.0 [3] when the range parameter
> was added.
> 
> That is, with our new minimum version, we can start using the feature.
> 
> Thus simplify the code using the feature and remove the TODO comment.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
