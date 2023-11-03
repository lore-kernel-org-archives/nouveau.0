Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB67C4332F
	for <nouveau@archiver.kernel.org>; Fri,  3 Nov 2023 02:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEC110E025;
	Fri,  3 Nov 2023 02:09:15 +0000 (UTC)
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Fri, 03 Nov 2023 02:09:14 UTC
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4B810E025;
 Fri,  3 Nov 2023 02:09:14 +0000 (UTC)
Message-ID: <a8b2653a-88de-456c-b8ae-2705fc35fcd9@dakr.org>
Date: Fri, 3 Nov 2023 03:03:38 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231031051943.1957328-1-airlied@gmail.com>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <20231031051943.1957328-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] nouveau/gsp: move to latest fw and small fixes
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

For the series:

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

On 10/31/23 06:18, Dave Airlie wrote:
> This moves Ben's work to the latest GSP stable firmware 535.113.01.
> We will be stuck on this for a while.
> 
> There is also a fix for a message signature, and additions of two
> registry entries, which seem to help recover from crashes.
> 
> Dave.
> 
> 
