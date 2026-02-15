Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BB4EF5858
	for <nouveau@archiver.kernel.org>; Sun, 15 Feb 2026 00:36:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 669FE10E34C;
	Sun, 15 Feb 2026 00:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KpNCawH9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 48C0942FB2;
	Sun, 15 Feb 2026 00:27:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771115233;
 b=QbYe76X+95eyhp2JWx7nWEK0P3I9uafxG/tUidSEEKDRKWBWpZPPEQA0u2UbqchBF2qpY
 i7ngxyJCyYanD/Wb3o6+/5CuGetZm8ve3xfM/l5IY6uxjbaXMydIY8TNh/LU5bAwGP56IlA
 CqK93Hdtiu/idhnPlJanyLJXBY8KfleHE+qXGl2HJn4nZuUl0PKoPhenxF1e2KMmmZCj3Rt
 i8Ju/O+cKe2MJZ2gVVNyPTDCHPJblkiuu/QymjzC7MrNJoZewPKyHcNo2xQWMSCp0ezeI/q
 2tIIjxk+dla8g+c1a0mfwz8xkn/2rpwDRLIyugb84qrIyZFIXv5iQbcaxEtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771115233; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aBvFod0W/0wxkDlNZIX3d4MICzlKU+yJgFACTxIF7YE=;
 b=caTSW1gjZHH6LdZF3NYISBMB30KbpPz7r/q1Yj9gkCPQpq4ZjP6NUBuKp9blkQ5CXnPEv
 2ytwSHGjA0VguADXfPqsWtZq/YCzeHfRpYAXrvd+x7LOLnSijCF1SDUAVaLogFHzM+U+78h
 UxJvSjAKpd47Dw85FmzXNWLhWe/GNdp4LLtZlslFff0twxO6PtFkDMuWqq1kid+yX4lh0IN
 hP4w0RcaBC+u5rEP+lnrLS7c5t6cwX/k6Yk4rvdrINN2dUDzMkF75yQnFnZOvEEELFOmnkf
 cqLRTNJE6AbG29lkSjZ8nuICP8lHDTNtzKvsNCSwuNSRH0Kl6+wD5GxyEC0A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C903B403B4
	for <nouveau@lists.freedesktop.org>; Sun, 15 Feb 2026 00:27:10 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AED2310E077
	for <nouveau@lists.freedesktop.org>; Sun, 15 Feb 2026 00:36:51 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-89473f15ed8so19222326d6.2
        for <nouveau@lists.freedesktop.org>;
 Sat, 14 Feb 2026 16:36:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771115810; cv=none;
        d=google.com; s=arc-20240605;
        b=GvoIl6XZbVsharxNE2N+Dc+wwak3iHDZl7SzO3pGHnWETOrkJ/brlOOg931y9RrP4A
         UokzyEnuJwwXDUQnY3LgbXY9veE/65mXxZSzuskg84nHs/+pBZhMz8v/jlUvrTHk/szV
         hmKUfqMsCPcmw7XXVGG1NWlkefAFyhBVbAJmUMI7Afivk+sqoEDDgs4pVbiYMX418fex
         OsjBty7rli1RqIIO/eErxr/JSNbVLlBI6n3fGSZYWG7WlHi9hn92KXORViFN++euCUnB
         kQVVDxGKd+1sQp2rU2K8df1yg3YBqP6XIeCBfBZ17g+eB++OoX0ZN7q4rBhgIg1nOn1a
         yrZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aBvFod0W/0wxkDlNZIX3d4MICzlKU+yJgFACTxIF7YE=;
        fh=DBfGSDvLfeTKG6jVc8pLLJEluaqL2KXWWWFlc1TlEHI=;
        b=bELNI89qwXvZ6qAI4qQnRVgxTg9zFxuvdqrxFq9LMuk2YKKlDtkV4KVOo8ZkHzgSfI
         xhu6b+vq10dWjFEZufQ9JeTeUSfPJDrZqcUtN1A/jV+7ANoVe/Bb11tfGCs9YfMjbgxw
         ExNWLhYd3yGx6UXlMYcgoTsQfFnSdQGIBMqyKp9b9iNtAAed8qGSMXZzO2qwZfsOxUVO
         HPcTU8p+rRd2r9DJSxwPFRGe/bNPwuzZrpxDTqqU6MxEwLv7xsyiRz00JPcICs4Au+tp
         JqYUM9vZZQgIlIIE3Wa4DBaFZNcGwY23RWGmailB7smx/ye/z38mnygI523RL+DLVDRc
         TJOA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771115810; x=1771720610;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aBvFod0W/0wxkDlNZIX3d4MICzlKU+yJgFACTxIF7YE=;
        b=KpNCawH9ERSggeUr3i/D7h+17YV7MRAog1zNXAGyqGC6Fk8lbDrGNdbIBsL/u3aZ0Y
         oM7tF/jk6R+DQ1fvnOhdn72sKZOYE8lFn6HIlOEZ/AjSFcdlDCj24xrNNkM+X9SMpHwU
         pK/YWc/Vm4/3enFqqsTeZCxaL0YbbGO/CFD5tOVnW8SRsq3RzbX7wwrvWQ0YB/CqE4UV
         +7HtcD893EYZ9Q0KnR9H+ovXRze+N6OutrCBhGBzZiN0W0IWYGdX+KZNuL2WvkQdbjbs
         wRNfW3SjOfseSJoMn0qK8IpPy5POysR2U4vAmzQIVdcPWTlFFT6e8+szuf3Zc/Xu3LNa
         obxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771115810; x=1771720610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBvFod0W/0wxkDlNZIX3d4MICzlKU+yJgFACTxIF7YE=;
        b=jRT2MzOj/py6xLu7igXsuARxTg4+W4FEES6iEQ9XCmCa0LT8FncZBjd7Y9Gw4/Cgp4
         jQl9X6SZ4fgXqbdkMOiDhURN8XD4efAWXH6Idt7IafQkzSurLhBW236xx1p87mVWWyjA
         zW7aujeFcN2SwEEeLhnsDtipnoRpMSOWu/A0X7NA7VPJQmJgCz5/ZAewICrvvrFId0eS
         RK+AMQCQ+Eoz0DITBWDvvKBvQsKd6OYuWcaBWhuNzJFGFcsRwpuQtH2mqQy1vzOzzNUK
         Xegf12fF6mshTsE6s0aK4BNkaxRQ4nqSDQqvbCo28BZ/zvxnLYW0gkuhtYAu7xcqfvqX
         0sPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7bjNWUPazzTABa9jqB8N4HSIl42+sjKj6O4UN/KKc1b01T6dli2fMLAKK90xPL9BtieB/oBwa@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw2jGp+oeiTlyQHRaw0DMkhALdnD57zw/QfCMTZU8Qkrz6gJ8p
	UNDL7Pka05WtBgNXw4zTg1Agos4lQF1Ix8MXG9SJT2n6PPUaRD2HFgul+8CvjoEAzjGZj42/1w5
	rPhy3UCSeF5KSAazXZxNbVCI8Q5nEVDQ=
X-Gm-Gg: AZuq6aKpdlu2t6/02fuMr9T81T/fJf8mm0XhoqmpfaU7135LuYtv06QIfaiTirtpFL/
	pU3MGI6kEIQe+FnljlNDHgevAdynbBUxQKzaba2hwKICMbh810lWWTslQpU7ZmP0N02erl0b96h
	Ngmz1IHZAi3X0V5mLvoB/oO9klP/FU2knJw9iqenm9tUKrhZqi1yYwfVou097NcL+Q9pXR3dg4I
	evKl0jVH7kBWeyvZKVdqAHi3ccXvMioaSpQt2nI9tsQuI/3fVOyId6cnp8JAIoXHSsEiqqieywB
	kU81+znXzgRd6FmfqsGJbO2/LTYzE73MW6pCAr49xqEy2KKv65afXICZ968k29WN6Z0=
X-Received: by 2002:a05:6214:268c:b0:892:7085:4dd8 with SMTP id
 6a1803df08f44-89736246fe9mr95383566d6.59.1771115810523; Sat, 14 Feb 2026
 16:36:50 -0800 (PST)
MIME-Version: 1.0
References: <20260209224036.3283326-1-ttabi@nvidia.com>
 <29093339-6562-45d2-a4de-5081c07b6898@nvidia.com>
In-Reply-To: <29093339-6562-45d2-a4de-5081c07b6898@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 15 Feb 2026 10:36:39 +1000
X-Gm-Features: AaiRm52tGN09MehHR6AyMnDIDbPvo9A76ADTO3PpeJOXxuZsL5eKPcP6tVF8EbM
Message-ID: 
 <CAPM=9txwqvUMLB+xq_Bs=syo3wBz9uoCUnXW3+QxY2+pUxecBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/gsp: add support for GA100
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: O5E655PM5J4SOP62NEWVRVNEX7GZWDIM
X-Message-ID-Hash: O5E655PM5J4SOP62NEWVRVNEX7GZWDIM
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O5E655PM5J4SOP62NEWVRVNEX7GZWDIM/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9txwqvUMLB+xq_Bs=syo3wBz9uoCUnXW3+QxY2+pUxecBQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

> This looks conceptually correct, although I'm not a nouveau expert, so:
>
> Acked-by: John Hubbard <jhubbard@nvidia.com>

I've pushed this drm-misc-next.

Dave.
