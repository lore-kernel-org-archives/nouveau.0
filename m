Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F161112240
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AE29B10EFB7;
	Wed,  1 Apr 2026 23:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OqBr1Jat";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 824FA454AB;
	Wed,  1 Apr 2026 22:50:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083812;
 b=ycXjAeK8caVnbUMm/wxTblPawukCdhyTMjRpFg4epgFxikOVKjdgDs4Fv98IA94hnPzkM
 9laSQ+ueL3JweWQn9rROfUeCoJyWRTassrZ6L+o79f1DU5gtbsF5nomaNirWkHN8XuDKj3i
 UP8YzCfs2VAF14AJcvfFNzSLI9NUCvKz7i51FOpTpjERxoyFZQlKOtFxmiWce/IbrxOPd94
 D2rJZKajgfLH8Gy/gSPU1QhplhB9HRr9AByDyQO9URt0uVcnwNje3c3wj8Rw4vJ2YbI2CSn
 PPEzV7ZqambWiKrxvFqhbZb1n1FOTuWgr7IvUq4aWbSZSRrcp5aO17zvL4mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083812; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ct5P6mCjDlMhnQm+SSiZTYjNsbM3KmBoSNOdcv0MzNI=;
 b=bgTIBUNtz7L6fnkXCyW/Yj5C4T1V9WSHXg0oR/w2ATp9cqM1qLgpfOW0lguMmmcwM0TF2
 pW7mCV8HV6Kc4yonqntbfOKckyfTRqLwsIoaLkn54sY23xvcqC8d1V8/X74soXd61TJ6kwO
 C7u4HMbwEhdUznJKNW+gzOl3Xy87AkP8w8YMRtpqCGiPReJg+bH3KbLizOpSHNhT9rmbZXg
 ddMA68QGQ+to6uRCbHlYUJDkFqzydhAvLoe5zSMKUfdZkRvH8WfeAfimlHU0HMrYT13po41
 hgZW6HzfNb6f+2ht5MepgNQjWoH3qS3ZyKF6YEf2VQxGyGSSepII3BP0R6rg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4A22145476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:50:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5361C10EF8F;
	Wed,  1 Apr 2026 23:01:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38036434F8;
	Wed,  1 Apr 2026 23:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E053C116C6;
	Wed,  1 Apr 2026 23:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084492;
	bh=eMEeyEmMsSEJqm/VBl3vGWpBMChoVMgzinIBBgfTPlE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=OqBr1JatdiUb2SuylVZI06g081Th5A5y+SBKA3HDmkQQ97vI3JEwhrSxvGwmRYfcT
	 gIgZiBk86U6zFl2xeAM5XAcNIndwN1BmcEoaR5ZvJYM7rqzMFz+1YsE+cz7axIJl2F
	 X039vepaYXzaeHv3h/+ZjOkTeUE+OJDVFelUi2CljqpO1nCMphf/t+AimoE63wwItA
	 oicrQfUBsr7nzOMQMl4np1MASYv6HNnj7KFB/AEG/OmevrCXcdXrzdV6/QynJ6W0qp
	 YB9ROCeUG7CfHzwZ7tLmPMeRsXJJ6hXMQDecGejA+SExP6VmmpiJ41ojKql7BZVzvj
	 qYYbOof6fOpDg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 26/33] docs: rust: quick-start: remove Gentoo "testing"
 note
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-27-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-27-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434468.73816.14590171380654521174.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=345; i=tamird@kernel.org;
 h=from:subject:message-id; bh=eMEeyEmMsSEJqm/VBl3vGWpBMChoVMgzinIBBgfTPlE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7uuLFn5ysG844m+YOzU32yT5q2ddFFGwjjYK7z0s
 IHllYmrOyayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEx1cxYjw/WVXWtWXt19ZdneHTnhLd/eMl7yEJ8655tqxfdHppWHvysx/PdbySo
 az7fibtaeiJbGk/N2qotN1tyw6K2c2vSuyp4IYx4A
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: DAFQDIPH5RAMEFIIUUSH3NTS5JTYKFWA
X-Message-ID-Hash: DAFQDIPH5RAMEFIIUUSH3NTS5JTYKFWA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DAFQDIPH5RAMEFIIUUSH3NTS5JTYKFWA/>
Archived-At: 
 <https://lore.freedesktop.org/177508434468.73816.14590171380654521174.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:33 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Gentoo does not need the "testing" note, since its packages are recent
> enough even in the stable branch [1][2].
> 
> Thus remove it to simplify the documentation.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
