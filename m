Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B35ECDB479
	for <nouveau@archiver.kernel.org>; Thu, 25 Jun 2026 11:18:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 40F8F10F265;
	Thu, 25 Jun 2026 11:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="fSk1vHv9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 71D2646CD9;
	Thu, 25 Jun 2026 11:03:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782385430;
 b=cFPpRyWkJwN296r74gQ9bsnDl+uFkf02gUS+nMwILTIeOZdA/o9RUR3xBcDK3I5pprF3z
 0Lq+/+uYswV1/NM16JQWYo87Jcd3aJTWGCR0ettW8vWNf8YkYNjrtvmdPQSK+4C0KaOzp5w
 k2fYgmqVrnOF8PGt5UByCP7wvkOCvw1jBCJyAYGUvNL7sBOhzOiei6f91mJKCAPyTL+xICl
 3VhxoVfQThnKMmGz5niOVDOL5hftvj7lZexrfPBr3ZHhp0sYYrGdOUrjhmynig4xTXhFRXi
 DJhQI1zeEWq1O4TrZfLMQFZqlrlYKIIOt4aHm57p6dVBm2t8tFbIs2//XTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782385430; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Bxv0WhQiYf6pkXwOGd8BAHkpkzQ7RlMAJ6ktjf5RQ60=;
 b=wW/hP/KTeB36ULyDkzxxqGThU0X6voiFwMs8erpfPUqVWHFJKpBAXku5MjejTKc6dV8gE
 Iv9iZtC0LsDviE5uzOrIbul+p9GHThnSXaGbx6l4BdZFu6R053z7Hok3MbZuvX0qtDE/Qu5
 TmwJqI1HFXcCAFKr172+RGV2FcIHeN9c9kcbADjHOfg8HwLbAG+AOzUroxsNOd9oaVoVsKR
 /++ShD5FUvKoHc2qCLQZ5jWxvyf1blEKyovqMTSmYIQaX7GKrqD4tXR+yuRhoMgPbwtzeKA
 71jKC8ShZv/6WFC2w2L5wanQBlqnElIB0ZhS/Fc51Oz8f7yldRM2cIOLapeA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=seu.edu.cn;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=seu.edu.cn
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=seu.edu.cn;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=seu.edu.cn policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C3F474046C
	for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2026 11:03:47 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Thu, 25 Jun 2026 11:18:16 UTC
Received: from mail-m822136196.xmail.ntesmail.com
 (mail-m822136196.xmail.ntesmail.com [8.221.36.196])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE4A10F092;
	Thu, 25 Jun 2026 11:18:15 +0000 (UTC)
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 43c0dec8c;
	Thu, 25 Jun 2026 19:13:06 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: dakr@kernel.org
Subject: Re: [PATCH v2] nouveau/firmware: fix memory leak on BL load failure
Date: Thu, 25 Jun 2026 19:13:08 +0800
Message-Id: <20260625111308.1407104-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DJEQTPJAR8DW.18CJ2FC7YZPA3@kernel.org>
References: <DJEQTPJAR8DW.18CJ2FC7YZPA3@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9efe7bca7e03a2kunm68fb4ad27cf8c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTh8ZVkhOSkNJHh5MHx9PGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=fSk1vHv9g3pkECkmoJLMWQpP7Xj+htLFoPA1G1aP7jF4T3/oyBYsDZsd8jGPulrd3v9QhMl3Jsw4r6g4mQU+diQ/YXv0tmhKDCQSUPxZExB09QCHnvMnXGzFgzjBXzM9Ysh86D/uhko8GNwKn4JxXMp8f4uxGRkr09uNua4ko+o=;
 c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=Bxv0WhQiYf6pkXwOGd8BAHkpkzQ7RlMAJ6ktjf5RQ60=;
	h=date:mime-version:subject:message-id:from;
Message-ID-Hash: ZLEZZXFV35KIPTLOIN7LQ2PPWGOYM7PF
X-Message-ID-Hash: ZLEZZXFV35KIPTLOIN7LQ2PPWGOYM7PF
X-MailFrom: dawei.feng@seu.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dawei.feng@seu.edu.cn, dri-devel@lists.freedesktop.org,
 jianhao.xu@seu.edu.cn, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, simona@ffwll.ch, stable@vger.kernel.org,
 zilin@seu.edu.cn
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZLEZZXFV35KIPTLOIN7LQ2PPWGOYM7PF/>
Archived-At: 
 <https://lore.freedesktop.org/20260625111308.1407104-1-dawei.feng@seu.edu.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi,Danilo,

Thanks for the review.

On Sun, 21 Jun 2026 14:57:56 +0200, Danilo Krummrich wrote:
>> Fixes: 2541626cfb79 ("drm/nouveau/acr: use common falcon HS FW code for ACR FWs")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
>
>Is Zilin a co-author of the patch?
 
Zilin is the discoverer of this bug. We are in the same research group,
and he actively participated in reviewing this patch. 

Should I set Zilin as Reported-by in the v3 patch?

Best regards,
Dawei Feng
