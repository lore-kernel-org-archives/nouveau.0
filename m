Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A78E9D410
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 16:41:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EF97D10E6D1;
	Wed,  4 Feb 2026 16:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="mY6N7D0P";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E48DC41B48;
	Wed,  4 Feb 2026 16:32:03 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770222723;
 b=tFdmmFSlrwC6z5I2UQlwWY9z0xFUtRmi3pLQrTSme+XuJmdy52nd5efMJnmZUMI229TG7
 8JrWYve/zD/5pah6/ef957xU3y9aSJ4U3CMCnwZ6YcL1HGnogSpWUYSgVyU5kAN6Cyxej0P
 mnIeaZb/oDrN4bUZpFlfFFjWpLuqPSPa/16Na95rgPZPCDWYgyNqp/YbxVoe5A7tzqS+Ug8
 cs7GN0W1bWN1iytW/jJa/wqiqKIaLwEAC6aE96l2tBU2sJokW8ZBtEZcS4BkoAbsJUsyOk1
 Gx8aaRSast77huNGvP9RbTGLap+EicfhAzxuP5rE2m3Qu6G04oixA4r60j+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770222723; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6H20zi8+AvWZmoZ2d8/Vb8BEwBllRonR5eGO+tKukdg=;
 b=PQqn+HAtqpPPn+yw/3yq8s2PjomIPlrmjGL7ROg4kJkkJe+G6D/YbTXTQaidsPcuitRBh
 lqnJs/HUDykSTh4FYHaAiH2YYbv0BFpWjUXgyD4ayq3SJg0XLqGThZg/yNpRPk0MCyL2Uz0
 7d79Vq2MqSMu16k6u83SaDkewSPSkmejwof7fMEFoYEARafBXwxOimmVyXP41BdLwle/6Cx
 t6gktorTN40OM2yN7ljq1fN3Zi0oJGTjJt4QVPTYPSLcKmylv+WSo2Qf0eccLx5WjGsfMA0
 GsqiYslc7PmZ9/A7qFxk+yESDVDy1O7T+aVK//r61n8lLPQ9/coDXGvktTnA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 147A44015A
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 16:32:00 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AFDAD10E6CC
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 16:41:17 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b884a84e655so1032829566b.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Feb 2026 08:41:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770223276; cv=none;
        d=google.com; s=arc-20240605;
        b=JBQFB2Z1CVRk1xz3HTdoDcEPip/uj9uQi6LzC5jowglG7odFzbYgzg3BLVRR3nESED
         xhkT5A6IN62yJ++MILEHxV/ASAuEbZcyJvKOaGKVgNYLkD9gPmSkEc8yMV/8vjhN2kt/
         uIhYI9khRg/vhvqQuDHyfJBDT2djJ3P99JAEGwhYTv4DIv3GMiqHKAj+lLV2Eq8lhmV3
         DRxl23J1MVNXDL8isIi4ylh6WXh1YneYT3LmrSbE9YTSfMUhrtb9MQlmmZtwatkBPqkt
         hfQaIECABqt7vifyFecCytyZ3ONzI2oCM2eqX4AkUr0kU1VFRkhggYxit9WtLQyx6MOb
         FdHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6H20zi8+AvWZmoZ2d8/Vb8BEwBllRonR5eGO+tKukdg=;
        fh=kyMnE7ZqQ3oIXnrRXhYNje4+WxanNiVpYIRreReYnV0=;
        b=A0j1HsEvwZnCjPjnPeRPvZ1O41EWBqDtPDAfz+bJARy61/i5ls+OC1UBSz1NLH/BG9
         IabUl/Pg7DVPciI5nsHIVxm8uuIWN2yDL0O8tKKvaYloWju6o/37HKW4JXZk9Df6bSWz
         w6yhJ4dxqRogoZbil+RI5Wk52kSyKSXlGzmusPTZvsq1QBRS86opPyIQkC3MfM9DIO+O
         cZPeh4DFHXV/IUZnmmZuwgfYDaNYEgWI1NXKsJvVfC9ohs0t2ctyWuOvsdi6VORxy+F1
         NHu4YeT6HDCnkKJGI0ILkitcI1h0OAUVDv5VIQKGZgJB4c66fC0Z67QnJapqx7svDxhl
         Z5gQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1770223276;
 x=1770828076; darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6H20zi8+AvWZmoZ2d8/Vb8BEwBllRonR5eGO+tKukdg=;
        b=mY6N7D0P9i+L7zxZDUZg/pdPJueowWKl0nyWO0bqr1cYxNndUsU2Sdv75ZNXmXy60u
         Qa4DpI5Y461FYBfK9Ip2Kg9iTuV5nR3/rfwCCBofwU6+ENhc/vtumcaRCw4HO09XZSjW
         gT0GNyrenbeu60fIC9jQ6eDQbxKEoqCUvkly8SVMe+9T+xW4Fax5KwnqNcwwZg+sRRau
         m+psfg9KF42rQfaoEY5BuQK/9a+TGQGVTooMzGvshIg+V8+ezyIZPVLQpFIHTGVKztbJ
         9d5RAyIPLKtfLtQVe2cJ74ueZJPfgh0EuDCq6RBF/TCMVXoaiJtf7YNAQC2neYVkAJW2
         OKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770223276; x=1770828076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6H20zi8+AvWZmoZ2d8/Vb8BEwBllRonR5eGO+tKukdg=;
        b=ZnHZfaWVDjHRTyNiLwhjNEXX97zquMrtV5wd/pd6BIUlWqGshkjF3zOyi5pwe9OrgM
         Pr+ai7Qx8svUOXmHhI/WrragqVbQPtvsFu3M+u8U/ZWFNNhi2MRllAVeY4r5YCsJA1AT
         LUiVlnVrr3uEYRF8ZW5WPkZA4gcKFHlmKahkLglgYn60GLf7cMifEGSAQD0MwLxNTs3B
         BXEzXDfy/l7v4PR4vb5hwhXHazYEaHic0swXgWRl3A+zSE21avp/M46QTXaXulOyKbfI
         rfx1Ml3jN7vf4a3/+Qx5qVkpQP6iNnIQhCV+wWY7sc1a30zS9yr6iFY/w3CYoTFqS8oc
         TeNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlMEP0yGW7bskPia1THA+m0Rdj/xRr2atV3LLibC01zrT8tc/ud/unN24SrXf9+V71IuVD2NV4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhEVO1sjrfdETa6N2Afkw/MLtqLPGNh87TbeX7OPPH9lEpoeZ2
	c6LypI9KdsfnaW4QSktfNKkfSXZlNVgEuvaHWxZMTiRjcdiHhNw//JRqZsTCCkGBbdIio8Z2iE2
	IGCMxpKwXzcc0H0tqt4Es3tPxXq5x4ysQy2eHtKAZPnWPYJBUZiNakSo=
X-Gm-Gg: AZuq6aL5X9oXwBoN8zDGvRpGWZ3lHoaq7xiUPtEXsPb1x2irEGRSCuOyhG80hSa0zvh
	e2t/HPo7Qpx/KnQXCrDjoBvxoPnqyAt7HqXFZmGoYC138hbs1dHwiteCKR/1H/5Le0EZL70GbFQ
	hO24M8v0ZwmjaRaovO3ps3k9kziirZN4He4Qgw0Gixl3o3j2pXB1UBlGbaepgN0MQFWlxELP6L+
	/xZFODgrMaP0CQydBDH0HE0xNsr4GpIlf2HjHsSPinIdGUvkg903c4W99Bdpg0Zfe0+nUs=
X-Received: by 2002:a17:906:eec9:b0:b87:117f:b6f0 with SMTP id
 a640c23a62f3a-b8e9f3e2e97mr253155066b.30.1770223275965; Wed, 04 Feb 2026
 08:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20260204030208.2313241-1-airlied@gmail.com>
 <aYM-9GzXxbExyiVi@caroline>
In-Reply-To: <aYM-9GzXxbExyiVi@caroline>
From: M Henning <mhenning@darkrefraction.com>
Date: Wed, 4 Feb 2026 11:40:50 -0500
X-Gm-Features: AZwV_Qh0Tr7h06-qOfBSaU9OUFifYwXkh1UdL4-plmXRgoSDFWkz1WJIbTln44Q
Message-ID: 
 <CAAgWFh2=8ecCCSMp4eKx7ubvmeC3fRnbtboPYC4Lf1cWH3RORw@mail.gmail.com>
Subject: Re: [PATCH 0/3] nouveau/vmm: fix switching between small and large
 PTEs (series v2)
To: Mary Guillemard <mary@mary.zone>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: W2ZZJVTIDQ6J4WAWS6USYBWMM7AXDF2R
X-Message-ID-Hash: W2ZZJVTIDQ6J4WAWS6USYBWMM7AXDF2R
X-MailFrom: drawoc@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/W2ZZJVTIDQ6J4WAWS6USYBWMM7AXDF2R/>
Archived-At: 
 <https://lore.freedesktop.org/CAAgWFh2=8ecCCSMp4eKx7ubvmeC3fRnbtboPYC4Lf1cWH3RORw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

I also tested this and it fixes the issues I was seeing in both cts
and my reproducer script.

Tested-by: Mel Henning <mhenning@darkrefraction.com>
