Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FAE1112244
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 70AB210EFAA;
	Wed,  1 Apr 2026 23:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T9tdpUNm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 47306454AB;
	Wed,  1 Apr 2026 22:50:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083806;
 b=cwIUsUmAmhYHJgG8i5yYcC3RS0XsrBdvSqrJccX5NwPMRkCGqWkE4KpHef0yGAyMJgWz+
 0li1ERX0bKXgS+VULtBLX68Z5DZ2186Ba0DrDjAnrnVt8QX9NyFroHGQdfJskLThZGUD0fT
 OiwhGAvwJBcRHeXRzxLE9envUpVTxsNQLGrJeIaydBs8QEinktEiY2xqBcOcQq4/Osda328
 9BtBGNIce84MpJ0pRkdcgO3/BqPmVqObxl2RqSypzpoXKXPdKq/xcifjt2dzODLUtSCYZFM
 2NMbqHDLt3w8WXp4ZACdBHAPSRbSwbZdrXqSj9+7uDdNVZdjyJ17N79aw9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083806; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UqOq30gfiENKdb1rO9ZKcdE9ZfyKfK6S7Xrvje53HYM=;
 b=xk4tUYXDvMLOGbi5ddfEzUk4ZuqwRsMVdb7BoGpLWuv4+4YcBNn+3FVW2VpB9kr64DJl2
 0Y1QOEhC9bTcCfhyekl7SqROSfvM0IoI0TYaNQdlNEGwo8K8+u/SHwAOmb9TAKI6somy1dT
 38wQwoHpbPY1ZkaJh/a97J32/gNkwJl0U/D34FjsxJ3xqMsbM/9cOaaDVB9sLJJC6J3ZThQ
 fv3QtKM7c37ze9srC/CAiTkp8/zW9K7GBeoGe6xE+MJradj5qQOkhF7yZYJB5pNYzaKXviS
 bXaBmPouV+Z2YCPDxkjRz8+2TsKU5wShkRvMM+v7Fj85C/MaVeh6Vihytsfg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2007645476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:50:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 29AAC10EF85;
	Wed,  1 Apr 2026 23:01:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02CF041906;
	Wed,  1 Apr 2026 23:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CC8C4CEF7;
	Wed,  1 Apr 2026 23:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084486;
	bh=0QBnjOf/a1gNT5EM5ReEkFxjICqiOXo4W5NTsRTeKQo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=T9tdpUNmBlbEPGldW4o1S6Lb7P25G/VI57Nx2JE9Q5s0svWpM92inyF0M8MT0RYGn
	 N+PeMsBowJab3sCv7iLX7l4hN35w3nDCNNktZYg1Xd6ALCbMslxNiJffCMZC/NRVBq
	 lQe9l9USpxDufqZqJNSIprajA9Pl6BVYg+GyMTm+nbxJTu9Ao4ExHvdLv/oASjIFyh
	 KMZGbGkUquUwt874wqpiO9uR8tVSAcIfPriDDE/J44GxjDQAaF5lcadIyNPdzqQVY+
	 1C0aSEbp72qTPwVzEumrnCaF8t5P49f5YewF/wGtKLell09jTNUCNOjr67/ACQupbL
	 GNnxVHyDQa2Tg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 25/33] docs: rust: quick-start: add Ubuntu 26.04 LTS
 and remove subsection title
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-26-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-26-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434467.73816.6022443418822181845.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=tamird@kernel.org;
 h=from:subject:message-id; bh=0QBnjOf/a1gNT5EM5ReEkFxjICqiOXo4W5NTsRTeKQo=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7t4ZiUrZk18eGdl7RsWcZ1FEtweXba9+qtcXAW71
 aqtV0R0TGRhEONisBRTZEkUPbQ3PfX2HtnMd8dh5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix0DHWMGLk4BmOpb3xj+ClVkB248oqWpYGZ350GB8Pw/fFJBB2Oc1s1VUv/4aOGjWIa/gttXX7n
 0/VJT5cxF/REb12mFLYo22znnYJqx4L1dlTHJHAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: 4BLQEHFG4QCQLTJ53RZODSG7VN6O4AEE
X-Message-ID-Hash: 4BLQEHFG4QCQLTJ53RZODSG7VN6O4AEE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4BLQEHFG4QCQLTJ53RZODSG7VN6O4AEE/>
Archived-At: 
 <https://lore.freedesktop.org/177508434467.73816.6022443418822181845.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:32 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Ubuntu 26.04 LTS (Resolute Raccoon) is scheduled to be released in a few
> weeks [1], and it has a recent enough Rust toolchain, just like Ubuntu
> 25.10 has [2][3].
> 
> We could update the title and the paragraph, but to simplify and to
> make it more consistent with the other distributions' sections, let's
> instead just remove that title. It will also reduce the differences
> later on to keep it updated. Eventually, when we remove the remaining
> subsection for older LTSs, Ubuntu should be a small section like the
> other distributions.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
