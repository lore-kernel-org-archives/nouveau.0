Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6422BE9B269
	for <nouveau@archiver.kernel.org>; Tue, 24 Feb 2026 14:17:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 33E2310E596;
	Tue, 24 Feb 2026 14:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NPIVlNzV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C73A943714;
	Tue, 24 Feb 2026 14:07:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771942059;
 b=ixYo77ZDzCoUKr4GLTZYFDAPn5x2L41iCZwPLUJgrBX2Jrn9QSBfHkcfJOnFMWLfOLj/+
 /tmwQGAEUrtUwEUbvMWyFitRob+DGhsaH8vHkQOcD9++vA5tnFZsXv7ma6qhFle5zyrZtOH
 Kvz5ycrG4cZEddomUf10Qk5ssf3ZN+pdYqUDW5F7WYL9THO3n+1SfjnoujGXpptpxnGsk+6
 /f8Sx+092DMjxk78zpCHvtWHHRp33LK3iNF1Mt/dpk6fBt3bbG+CDl6g68vYc9yCkass83g
 EqiVzU/HSfv+zE9WyNV3vZBOaV+h8TFeQdw5/k494l0cY0HMBqq3HJNrvBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771942059; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2JFIWlz0TWF2wkS4m5jro2pMErdFQbBut6BbyleZfnQ=;
 b=xvnXN5jNot8YOsV9mA/CgH+eUvH3j6LtDO0UqAlsLqTxO8KNrwGy/jMgYnT9uuY2+VHzL
 TBT3D44k01SM6REPG3YGhnLTICAq4+1JWk+f4c79KzZomo6KbKPHD6LtmB53acmzN2SQhkO
 pqmEQ3Lkh38W4DafOPcc0yDFUg9AMimDvFxPAGo0bzYdZAqi6e9DmYHeJxb0Yn25qjOgT1w
 Wzud+23HgrXbb6Zyn7Dwzu2ApDjgOkAdjxc4RXK4JuQ5gKhI4YFgUpuz+3jRUqw9cHEOS3y
 RZWFT0r1++8dlR7iZGc8+lQ8WC8jV3j7293tBN9mrtCzsbZmKMv8w8bjEPDg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8099240ACE
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 14:07:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA5FA10E58C;
	Tue, 24 Feb 2026 14:17:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 037E36132D;
	Tue, 24 Feb 2026 14:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B305DC116D0;
	Tue, 24 Feb 2026 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771942659;
	bh=Ziv04o8VS9rUdSlEFBgCvXLaRDO3rJ1KOplJuFr+R3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NPIVlNzVNNLKePtVD8OMqcBXS4ijT8gmOwyQMlsShZ60i4guSCKn00B9XsUgur9EU
	 bKFD6I1oxgNJynT2CefMnhAVv7YGyow6GJCk4YhDzaEaQ2q9NCP29iJeNXrCHjj1xc
	 y5g/NSRRwvL2Zpe+VVz/Yfjz3fM7BDxg9fwJ1YZMfETQIz2/bCCBNJ3vcpZPiuMAlM
	 CEN+n/qtJxRqNWHanNZ/3Z77xDfSOr9ipGTlnpUiITN5aWWlBYR4fP89IG7knk8Vbh
	 EmZMfyZkkOLeZRiitJF4fdjOJ1kW8IyPmJthvNcEhcFnCS/6GBlmlTWP+SNrM5QOoA
	 iF8v9kwT5ajLA==
Message-ID: <a354777f-6275-4b81-90b8-45268db22ffa@kernel.org>
Date: Tue, 24 Feb 2026 15:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
To: Gary Guo <gary@garyguo.net>
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260123175854.176735-7-gary@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7RFQW6Y2S67BPNIRQLSDVZZ7KETKO5TQ
X-Message-ID-Hash: 7RFQW6Y2S67BPNIRQLSDVZZ7KETKO5TQ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7RFQW6Y2S67BPNIRQLSDVZZ7KETKO5TQ/>
Archived-At: 
 <https://lore.freedesktop.org/a354777f-6275-4b81-90b8-45268db22ffa@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/23/26 6:58 PM, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> This is now handled by the macro itself.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to drm-rust-next, thanks!
