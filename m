Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52ADEFC72AC
	for <nouveau@archiver.kernel.org>; Sun, 22 Mar 2026 06:24:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E321910E21B;
	Sun, 22 Mar 2026 06:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TK2uPSDs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6CF954527D;
	Sun, 22 Mar 2026 06:13:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774159993;
 b=U+hZrRS2vcmmjWQ9duJATlrjS4H+1IKWfADDO4fHOheNBKt7nC+IpSCTXTcMZaShAWnnh
 /OwWbfcMaiLcFNy/g1+A0kHb+E58wGQ7lbU0FpP+3DhKETFHPtp1CZaWheIvTOkTSZZeJ0N
 woSbmdVg0XVdryq/3H7vrKD6RPCo0ytPy2P4GlL//+4m3Nq1sZrn5CNNU0ovGNAPUxW8pUj
 8DkSr2M5K8qPaKsKdW2ALwH5m28waX09hbhJCtSB7jN8I/5M71FSeOdRc0pY+t/kFMlID3R
 k64jKAogQKVwicb//ijwTX6l7Lt7EMI7tVs5GuBLbpkY9zKd5Vo0rOjV3Mgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774159993; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=d/1klNg2aFhsp6OGvAAoWYikrcXambFiOwbGCQtt8hg=;
 b=JEkpHMLGiKPen+O+SxdwMGAIUZzltjM0Ib0d0CaGJvVHlA51ptVDBRGdudxBuMG/bjy4m
 kua2hlkF/L9KLimyb5Hip5vwb/RCwXMxrLXTEGN5NSswswqH9rUjXWwAMyY/H5UVzCtOBNQ
 QjDeGGxfhDzcQljup1mFo2YhML4fdxykOiYZInOkcz1daHAo+10EDLFJAAArrOqS1ANpDRY
 5o+fRoXFkaixcdmQKAl1g9J6zmxZWzA4amrA3WN0+a2HmsxVWjCEQYWBDjker/kByB986Tk
 CXrgndcgcV1s4SD1NnsJmFRkF4lYROHSx7miqbfhpTxd74C7lj9M/EWt6E4Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 20B4540214
	for <nouveau@lists.freedesktop.org>; Sun, 22 Mar 2026 06:13:11 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 67A9710E012
	for <nouveau@lists.freedesktop.org>; Sun, 22 Mar 2026 06:24:10 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2c107ef474fso3115745eec.0
        for <nouveau@lists.freedesktop.org>;
 Sat, 21 Mar 2026 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774160650; x=1774765450;
 darn=lists.freedesktop.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/1klNg2aFhsp6OGvAAoWYikrcXambFiOwbGCQtt8hg=;
        b=TK2uPSDsfnDe2uou7y/uNdTd4x/XRX44oM7AhDjlZn/Y5o1wf6MroqGDohCRX0VVJ9
         WOwltaE9t+zI0bIXiyjdcGY6XwZXXVovR1sx41/cQ2zmakWOiUaUq1wwKtRdix4EdWet
         puNcjYB8bEPfEr5SPlgUuIUqOU0DqWOMagqtjB1NvmC764yIU1vND+/CQQDymkySRDrd
         NFXFEHcHiHcJMWAxkwAbGLx7mGxIL9SxD4BoIxH/2+JBFbzMZa18fOW+K1c/2n2DAlLo
         QmLUpm7jU+C+VmZa7NAtOzwS10sxHUDPfNErVPiiZu2A6IeRqQJ+v7hpxaeokVJN4in6
         8X8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774160650; x=1774765450;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/1klNg2aFhsp6OGvAAoWYikrcXambFiOwbGCQtt8hg=;
        b=d43qxbUAl9Jyq5sb5jLfbkh5txGoqK92bUCxohhh7jZtJLD0QpP6Dw2gOrSzTnbI7I
         uHEF3zAA/E+i92RQbfGo9teK6g7Nbt303kd7B9lFI9wDz2mmzXq/muOWvXdRDK1lKLcA
         vq+bNPpw+QRGIcbLRocN0PO9iMEz+0hvIvF4hr2GCgsksiPw5DeQEm0LEX/MXOzbaKUh
         uUSSe7Zaaqzt+1/o8KDO5COB2rRUPYCV5YzAszukdeVPkHNhDBi4TyHlsf1KAY64ReYF
         hYPraH9voncHRgu0glz65ZwRPCn/+mTh7AqgqPEhfhkWjmxyuV4XNz+nVe6bNOPjWjeS
         zgTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEQ/qjHHcekBySu5KGJ57iCTmzdRFOemgkkWsQaZp6zKAwcDDzgt/pRqTTOyH2Tbzxf10u2oz5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHjpZaKNmRO53ZJh/Lm6btU2EGPXXddqU1MbD95q7Zne5ObkFQ
	x2HMorVbvEMBnlgq+74xJuOOPsLJu1HLTfEy3/5auNHnDuruQ74+Zx14
X-Gm-Gg: ATEYQzzfTU/y1DUcQm9NRK11+6uZj6hYWNAn5K8ImKZOq2SFtWRazaAM2u97lG+cUzH
	EYqoczb0FSNJFdUce4NGeoDOQWW1hEzXRv4Cgt1et1OOXECXMDavFwh0HP9cNFyDjNLP6AC44JR
	cpSAFXE8hs6A4iQ6Rq9MovbFfrFvhzRFbGkuCyzBbFRpJR3Z3DH7S9HWPwAHgInk8qa3fMeCcdh
	WomaT133lLgGHyIM+EMd2Vowo5zsV8dO2avnCDlNuK0pKYG/iVou81acMRs6suNBI5ZCVEdL0qg
	02if6vfzkbiqCSnV2UjAcwF9DqGDwO1OsnL3RxsGWT+EvvXmXJdtd70OSIOp+7z9mMwi2v1w4Yw
	Ka9oiQwPirD9USqja1+7d82lXjq7UGmQtPD+s+gBgD1EBWi/RvF6aUMSRHrWMr8/pteyA45KZhb
	XYSxlkLgk4N+5+Y8eRtFYeuZY14Jru0UdBw3dcSO+uiFx7
X-Received: by 2002:a05:7300:e785:b0:2be:2f58:2ef5 with SMTP id
 5a478bee46e88-2c1095d7861mr4599770eec.1.1774160649552;
        Sat, 21 Mar 2026 23:24:09 -0700 (PDT)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c10b3253d0sm9235890eec.29.2026.03.21.23.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 23:24:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 23:24:05 -0700
Message-Id: <DH93GL0U3NZO.3STS474THERXH@gmail.com>
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <aliceryhl@google.com>, <acourbot@nvidia.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>
Subject: Re: [PATCH v2 2/8] rust: dma: add generalized container for types
 other than slices
X-Mailer: aerc 0.21.0
References: <20260320194626.36263-1-dakr@kernel.org>
 <20260320194626.36263-3-dakr@kernel.org>
 <DH8UHISTLOA4.934370PUTLB4@gmail.com>
 <DH8WATAVCH33.19JPYBAOILCZE@garyguo.net>
In-Reply-To: <DH8WATAVCH33.19JPYBAOILCZE@garyguo.net>
Message-ID-Hash: 4JTBLT25YBQQGZP7PO34DGDUHABR347W
X-Message-ID-Hash: 4JTBLT25YBQQGZP7PO34DGDUHABR347W
X-MailFrom: adi.dev.github@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4JTBLT25YBQQGZP7PO34DGDUHABR347W/>
Archived-At: 
 <https://lore.freedesktop.org/DH93GL0U3NZO.3STS474THERXH@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Mar 21, 2026 at 5:47 PM PDT, Gary Guo wrote:
> They're going to be removed later, see https://lore.kernel.org/rust-for-l=
inux/DH87CCNRR5EC.2SK3IT6N6Q8V5@nvidia.com/T/#m30142b65bb87af64860838565c78=
4c304e02b563
Got it ! Patch LGTM !
