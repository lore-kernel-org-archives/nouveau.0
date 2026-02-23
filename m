Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB4CEA4FAE
	for <nouveau@archiver.kernel.org>; Mon, 23 Feb 2026 11:23:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5771110E36B;
	Mon, 23 Feb 2026 11:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gUL+xGe3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 715C943493;
	Mon, 23 Feb 2026 11:13:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771845229;
 b=b3WfCCJHilYaVcRV+Z7lX9mW+DbUtRrP5gLT6Gsos7XRlQuD3uaIUE5Z3Od/IEkXB6Vpw
 OFjIeaKP91uUxUOSeOI/v6ywLSdVdRZ1YkFOtjt03Lx/JSgJmIpf7Trfd+3B9OkazuAdoix
 3p2JurW5HEKvKKWE3f+UL3aPiTibJtMB9SpyTVvsmXv/St1QMF/idDAjHZz4V5Jcj6Brbem
 NN19fXoiFxZhUpPS6ueecctoUMr1ql1Q8WGJtKhlMJCXVJL3YwG39CUwzLizur7uhN5hfYJ
 52Pjwc7PsraNwZKTTl86ac4yFrL9j9O1wuPjVX57SfatutrSls/2Z0C1SaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771845229; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=N5sqVBklMNFd+AwWdw1mQppSBmesqWMHAjeKbhCCvH0=;
 b=JSfHVu2p5HjZZjBePEoGXNUMGcwmyGZCFQO17GiaRGJc+uCJ/NDmqDfBJal/A6xcc+laj
 AegA19lMkONJA+U33q2xZQ6EPPdmsTXMsFtOQd74Sq1GbCVLyQzzymU5Ye/E3qgaKU3dkHj
 nAHikyfKIBWNS5wtifv4dctX3f44nMSIk51+55GYVIwbygBh9Jc6yhcq0na2cxOm9AOWsLH
 XPTUMIgioEqYVF8MHtsCLkyhcMVIreGNLs57lq0sehWrYs/ZPKUmRuO1QB4T9qo+769BazH
 dPuGJc0SxEBtYkQ87OmLfFD+y+/7EYwCO7U1Dw6BTSPCPZE0ITbFfNL2pwiw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CDCB040ACE
	for <nouveau@lists.freedesktop.org>; Mon, 23 Feb 2026 11:13:46 +0000 (UTC)
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 863B710E37C
	for <nouveau@lists.freedesktop.org>; Mon, 23 Feb 2026 11:23:46 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4832c4621c2so42976585e9.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 23 Feb 2026 03:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771845825; x=1772450625;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5sqVBklMNFd+AwWdw1mQppSBmesqWMHAjeKbhCCvH0=;
        b=gUL+xGe31Jo9B3KtcRlCpU4Wr69KLnWMBw2EiVkFZ3leMRqz8vOpwCVAkVUSgTfA+P
         FiVtN1VaopoccGwmPsX3ZOOHWt6H6vBKO+BokJIe8y8IMUIFu3WaZPuHyOfzsZ/ZP0P2
         7O+vVFeLzEyTUyjKYBwbDmg3j8OaoQHxtCvN9h4vRQE3Pn4bavzYRmUPhyqXCavM/YRR
         208xce8iTNwwIxPJt4Pn1svlZFB5o+8etTEYzWoxUi6pCHeqW3+vtJyVHICL6143rFHd
         AUUtRpj6JW9yQnqklMB9PwTgPCpG/7UwXDtu8iWrVNYdlFg5UMiWS7JgUR6TUQNayJMB
         pdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845825; x=1772450625;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5sqVBklMNFd+AwWdw1mQppSBmesqWMHAjeKbhCCvH0=;
        b=buJ36EnrXDIPGAq7qSUn5P77vjOJjjOQlTJg3OQRMNkETFqknlKHypMj16ks1hqAjV
         YnX0HxO/Hc4j7W+jZAx853UGEckWriT1Bu9gTrOb0ahJZgAGBLqfm5AIrNqr2G/U6gep
         HoJy2om3/NhSN+xviOkSLdlSjkVjiD7Nd1rLp4sg22vJLRbg7+rq8/k/Rsd7jLSRCH1E
         HdqR+xy0gcWQOx6RdNGF1TVwUGtf09xVTqYQA5dREu4uUD67EiKe61NCZoVOF0wlOD8C
         VipXTazmk8DGXk/69cQdpkn88aYnCGsGuSFLD8vjbVl8ue5p4WNbka5xSBbEkWTI/T+e
         mPjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrSgK0r8+RuhCdzDhO2Kl6TnLxoOe5lbIMieMJk+crvZoB+5g7p65aIGRMV710rAaG9WqZPmj4@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8C20g+JiulKy0TahKwIM+RDdj3Iaqi0EBUse4XkmQ7q4IG0Qw
	K1fssLtFsxVbfWdEZc1rztijUnK6fCWnGme7f8Iri5GdaVuSsjVG0oVF5rUN/DDjiv+H2QTR7FU
	rUSnJtnlzq1gX17czAw==
X-Received: from wmbf24.prod.google.com
 ([2002:a05:600c:5958:b0:483:6c98:3d2f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a418:b0:483:b3d7:2e80 with SMTP id
 5b1f17b1804b1-483b3d72f30mr25074315e9.33.1771845825030;
 Mon, 23 Feb 2026 03:23:45 -0800 (PST)
Date: Mon, 23 Feb 2026 11:23:44 +0000
In-Reply-To: <20260221020952.412352-22-jhubbard@nvidia.com>
Mime-Version: 1.0
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
Message-ID: <aZw4wCZWhEsvfkAy@google.com>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
From: Alice Ryhl <aliceryhl@google.com>
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: FKZUPVINO6OXARHZ7F5GNHDMFH4OGY2H
X-Message-ID-Hash: FKZUPVINO6OXARHZ7F5GNHDMFH4OGY2H
X-MailFrom: 
 3wTicaQkKB_YYjgacpwfjemmejc.amklmstcYsjgqrq.dpccbcqirmn.mpe@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FKZUPVINO6OXARHZ7F5GNHDMFH4OGY2H/>
Archived-At: <https://lore.freedesktop.org/aZw4wCZWhEsvfkAy@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Feb 20, 2026 at 06:09:35PM -0800, John Hubbard wrote:
> Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
> equivalent of Alignable::align_up(). This uses inline_const to validate
> the alignment at compile time with a clear error message.
> 
> Add inline_const to rust_allowed_features in scripts/Makefile.build,
> following the approach in [1].
> 
> [1] https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@kernel.org/
> 
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Note that Rust Binder's ptr_align could use this if you want another
user.

Alice

