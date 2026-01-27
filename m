Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36A2D19515
	for <nouveau@archiver.kernel.org>; Tue, 27 Jan 2026 09:35:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F0C2910E4FD;
	Tue, 27 Jan 2026 09:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="nrQnEEP1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 514CE40ADB;
	Tue, 27 Jan 2026 09:26:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769505965;
 b=PO3yMtLbL6+/b9M6Sx9eE7qECXG6+aPuVLEnia1cEh6cZ9YOmarx+LxChwEG0996vOicG
 9jb2fWi3dHC+AGHKVYMGgZ+n0QwVzSAOTxGtxPX+H4qPdEADi0bJnnda3a/Lb+c5fi0Br2X
 lf5SBNSMXO9H51R3Tvy+PzD8UCM1ikto6W3CVeypu5J5hRlgLU+PAcK7uX6tYzuEvifxziQ
 V37yk3JmZi/VizGH5PzacaT63e0/CXGyrzCzL89JsXatv75DDnemIm4JhlRP4e7zscNMQGk
 XQ8+EVVFnrKgLffJUrV52fVUh/IFRY86LMDDcheHQrvPW0d6fTWYxF++uSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769505965; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=c3y0lEsQSa3NxVnQjnb+gUVusQedR1yDzUFCgD6dyo0=;
 b=aBhIIHvNjOvm25JgwiQW/Z3tGY1N5vFCvXyXJMPPypy7pMGygK2vjARQxxLaRu3iwnFu8
 9R7lapHA0PVqqwW/i69V4zFqw1EG3N2toOfxnVhg5EtZ6erLC8Fmt8Q5ViTm2XeZ6l8cUiW
 nmJ9TJ23EFphsnS9PhEyLG4xN53GhDqUEkqC1/VMWGs97t0fp74DRYXuufJIosMLH0eySA0
 13gd8j9p7zExIfTJKmlqvwbFUpJb5n71h3NR8ri2zWRTEvXFFrRNsT0Ot/dNHEhocw1xiBE
 7tqgF31Cv5w4b7P3p9CsOhojt+VkCvctyk9Ru4YUZAAP5PCfOyyu14uqIJDA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=web.de header.i=markus.elfring@web.de;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=web.de
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=fail header.d=web.de header.i=markus.elfring@web.de;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=web.de
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8EDE440032
	for <nouveau@lists.freedesktop.org>; Tue, 27 Jan 2026 09:26:02 +0000 (UTC)
X-Greylist: delayed 795 seconds by postgrey-1.36 at gabe;
 Tue, 27 Jan 2026 09:35:01 UTC
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8611610E4F7
	for <nouveau@lists.freedesktop.org>; Tue, 27 Jan 2026 09:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769506497; x=1770111297; i=markus.elfring@web.de;
	bh=c3y0lEsQSa3NxVnQjnb+gUVusQedR1yDzUFCgD6dyo0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nrQnEEP1lnMQguNMk4tLE1RGXyKw/IRTqjLpxDxlIfl7G1OI656htHgvrIDgDkkv
	 7wCy71YSOo2EDO2gwj/+6ItFHRN+elzM8j/Xz9gzQE/nOA4eYNwyGiIlKKkihB5Bg
	 o9FWWi0UzbVEIgPeuA8vvu9Of9or4SSVkml90TCSLn8XvBqxAqZYmjJoiWDiomBya
	 434mmnXVEOPzS566h0Zuri2pRQP+2OFe7RfrAkFhG1/IgmM4F7Yxd1fwULlsiWarV
	 FFKYbX/nScx0JZe8+QYE/upn7LOpDNhYS/Tkjg3lNAcgxi5V8kU44WO/jMxr3d8GL
	 U3jMSuWv7Fz1/vZh6Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.251]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MkEhH-1w92f2282T-00baAK; Tue, 27
 Jan 2026 10:21:29 +0100
Message-ID: <2f36c79a-093b-4b68-836a-79949f69e0a6@web.de>
Date: Tue, 27 Jan 2026 10:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zilin Guan <zilin@seu.edu.cn>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260126123248.164621-1-zilin@seu.edu.cn>
Subject: Re: [PATCH] drm/nouveau: Fix memory leak in nouveau_channel_ctor()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260126123248.164621-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DOpCXLmUWVxrJLrLMiGJcG1e+vezkn+c7eiXtsNxOVDS64IZ+Df
 ZKhMAK8jiUgV1Q82Nu9qdXZev2/ycscrwiX+/q1ikNj1ml2NrYhfA72AC007udNfoCRPxgq
 bkOT0gtJaifp437JeTHwprA8BSBcZ1+dxnS96KVuTDcwxj9cIpddI4PG+R58YqNGgF6OYxA
 fG5ykxpIQYtd5b6km5uLw==
UI-OutboundReport: notjunk:1;M01:P0:OiYmW5qYfRc=;kaAfrporKJpBkF2a8yu+leVB+5H
 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
 VZcXK75bbOcTYQPoIp7pnate3gPlg
Message-ID-Hash: CXOOFWVDRF5NYBUNXROCNNCBSP7K7FUR
X-Message-ID-Hash: CXOOFWVDRF5NYBUNXROCNNCBSP7K7FUR
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Jianhao Xu <jianhao.xu@seu.edu.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CXOOFWVDRF5NYBUNXROCNNCBSP7K7FUR/>
Archived-At: 
 <https://lore.freedesktop.org/2f36c79a-093b-4b68-836a-79949f69e0a6@web.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

=E2=80=A6
> Add nouveau_channel_del() to the error path to ensure the allocated
> channel is properly freed.
=E2=80=A6

https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/gpu/drm/nouveau/=
nouveau_chan.c#L247-L351

* Would you like to complete the exception handling by using another goto =
chain?

* How do you think about to increase the application of scope-based resour=
ce management?


See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/stable-kernel-rules.rst?h=3Dv6.19-rc7#n34

Regards,
Markus
