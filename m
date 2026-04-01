Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7099A1112243
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45EA310EF26;
	Wed,  1 Apr 2026 23:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TNCiRvfR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1E0F845498;
	Wed,  1 Apr 2026 22:49:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083746;
 b=icta4vtO2nuRSpTWPabAUy5yL1JZz3HnxAuej1WVa+BvYVW17LGGExiDc08SmbNMp3s0+
 ndd98n++c5ULuiPe05++m1UMqbXVXAOdxK7bQyLna67f0LAfXVSXXOtAaIWvg3W8oaWiNEk
 xf0CWjSVwX2iu22MWPsujxQH3RXd2AVY2HP6izoCPeVWQlkwQ18Aocz2xJg5Ak4WZInvYb8
 8AcEXeSeVqBGDYDpvVO7iN7/gK/ja6qnDoU5H6fXvYV5XLifsh0O8vQ2MnlcsFyK88DFGaU
 ktGacvY8zI4g16yjLRZRYCk+bqNt5QWkmvyfByAP9iMN4eSocg7LhQfFS7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083746; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=p6JpffBRR7v7TPIcdjPK+lmgyv35PebkTTYtaqTWCzg=;
 b=ZWwI/QyARJIJ+Jn/ISvWZ2PEJpfWdd9GBLO44/wKOoWslu72w24xigqgEhQe7cN14lONE
 JepSj1TkOVaXI9wfwbbUt+xVoHFGLOBGTQXoj6CUPO1t7ugQjI8wSvxvIc3AV7rqVhtqJjR
 win8l/ZAlyRlQ3vjrScFwemNPxr+TivhDDzg+UKsR5J7ZcQhq9+QjHcBE3RCIpCX0GE3BHy
 N4cYvjYfSmEsiyO/vNSRlpuN9jrnTswk2YjYQP5FShOsxnD0anm6rqU1uANxvOJ+dam4JuM
 oHf8hrprlh9ZIcp+UC+uX7xAW3n58I2i0XJZznVbpWNTI/ibqs8wKo4Vt3Lw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0055C45476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:49:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E6F5710EF1C;
	Wed,  1 Apr 2026 23:00:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BDCE61340;
	Wed,  1 Apr 2026 23:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56866C4CEF7;
	Wed,  1 Apr 2026 23:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084425;
	bh=9r+j9aJtexiSdsnA3tlntaKZ+10b/6Dtb9uN5qz0dUA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=TNCiRvfRAoSiNwWajo6d0tXBALrIB8uy30x62v/7vE1DSF0tGUGBWvB9FNsMOGiOL
	 r088gtwia8jZfrou5153siQUWg+QidfxbyYB4Ypow5AdBNPcZhSf05qfgKMPzQ41a9
	 ZXJJmDCivwRwYQbl0M8qhWW5DfT1+KZpXMWTHvGtTkPFHjox09+X+JH6M8f8ul03/R
	 bfWcSI1kXTIk26Acc7x2QdVjBUaonzABDS6685jJZTEk+a1LrIQVA/Fz+zAzT95oPw
	 IRSzJuq6+jnD9s7fnI9D/EamdCfX7ZbISJfeRtyPKPcuVCXdSxdB5slSxvZxxG9joo
	 AfLBw3t3VswhA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 13/33] rust: block: update `const_refs_to_static` MSRV
 TODO comment
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-14-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-14-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434450.73816.3437422593454602087.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=862; i=tamird@kernel.org;
 h=from:subject:message-id; bh=9r+j9aJtexiSdsnA3tlntaKZ+10b/6Dtb9uN5qz0dUA=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzvbH589QYvn/4oPv4Xey3uvd0h7plq9692z5dJ5b
 wRSd+gWd0xkYRDjYrAUU2RJFD20Nz319h7ZzHfHYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdAx1jBi5OAZjqgpMM/6NnThCWnqBawfDCSNE+6vHTZwuXfX7lr3Th9K4XsjobdTYzMrS9mlI
 WcW7lHu1jfq8uugXyGtpkcCwxlc5QjlVaIdopxQAA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: OTRT73CERSXHKRDCK23DY4ICA626252M
X-Message-ID-Hash: OTRT73CERSXHKRDCK23DY4ICA626252M
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OTRT73CERSXHKRDCK23DY4ICA626252M/>
Archived-At: 
 <https://lore.freedesktop.org/177508434450.73816.3437422593454602087.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:20 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
> index c8b0ecb17082..912cb805caf5 100644
> --- a/rust/kernel/block/mq/gen_disk.rs
> +++ b/rust/kernel/block/mq/gen_disk.rs
> @@ -140,9 +140,7 @@ pub fn build<T: Operations>(
>              devnode: None,
>              alternative_gpt_sector: None,
>              get_unique_id: None,
> -            // TODO: Set to THIS_MODULE. Waiting for const_refs_to_static feature to
> -            // be merged (unstable in rustc 1.78 which is staged for linux 6.10)
> -            // <https://github.com/rust-lang/rust/issues/119618>
> +            // TODO: Set to `THIS_MODULE`.

Good first issue?

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
