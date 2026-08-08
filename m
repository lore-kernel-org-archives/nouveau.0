Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F05C5AC67
	for <nouveau@archiver.kernel.org>; Sat,  8 Aug 2026 13:12:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0663010E300;
	Sat,  8 Aug 2026 13:12:28 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 76B6F47632;
	Sat,  8 Aug 2026 12:56:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786193779;
 b=YhkrAonjF6vY5XP/rjhdtKPK5aT3MBv73iakzmoIZgN+NlMr011bDTrudvzT8Gp5OkHqE
 5gcLz1CSMy71ilkzSVjArSQjzAmZDdxlmSnimQTrIpclQ0XbA0tbLamQhHX049twup3ermI
 5KmW0YQUgbC1HP9q7QUPaRLkchvoAwxSxOBhYqPpOkneNqc9igqdFFuTjSsdISwiCdvHLeM
 5gbIVZ6PUAHcre7XWjDHkCk2azMFsOL4gCrK05Od5GgIJ9OdvHmIimyMaRu96da3a/McJf9
 6ZtsRGQ/x/lFQYmIeOv0/CgNX6GQ0Unc+dJB5ZIm81Gm0tNgQEeydCBfH0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786193779; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hDbZl3qPDBYdxq/eCcIg7ptQGUIlYTZSixApOi6tuRs=;
 b=nHkePInoR+PwNLJjpzBohx7Wxyvl43FFmK+pCOOxj21MB91WAva92igVC1ApipDuruvxm
 8/BnEcIGegB9W+1ao8N8WhWpUjxzfc9NAaKZXF+nvaomZ5qCP2PVjqkMTeCAxxpl6Z6DdYS
 TxyCsdUITLf4dROPJitg3EdlZRex7/Nkx+wZXQwFuGIjvOZMJevxsOxnq93AdC50Bikwd1U
 RWm1DG0XJZLzL9Jfh9optfh6GljRpIoLTLmCHo408q0Wmb4ESaTGnv1Qd4nFx+or6zRBWJP
 VdEdiE81o7XVGky51SiNBwzRx8ftGFV41kWwHqDHbOg8lSDMeQ30FZEHQcxw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=goodmis.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=goodmis.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1AA1F47612
	for <nouveau@lists.freedesktop.org>; Sat,  8 Aug 2026 12:56:16 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com
 [216.40.44.13])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5F92410E037
	for <nouveau@lists.freedesktop.org>; Sat,  8 Aug 2026 13:12:24 +0000 (UTC)
Received: from omf12.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id CDFF6120374;
	Sat,  8 Aug 2026 13:12:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf12.hostedemail.com (Postfix) with ESMTPA id EF86417;
	Sat,  8 Aug 2026 13:12:20 +0000 (UTC)
Date: Sat, 8 Aug 2026 09:12:19 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: Re: [PATCH 4/4] tracing/mmiotrace: Clean up coding style and
 redundant debug logs
Message-ID: <20260808091219.76d3c382@robin>
In-Reply-To: <20260808131634.4dafadc203a58e9f5b0e7613@kernel.org>
References: <178524298182.56416.7520852015178187644.stgit@devnote2>
	<178524301945.56416.2087305624947649637.stgit@devnote2>
	<20260807205053.7000eef0@gandalf.local.home>
	<20260808131634.4dafadc203a58e9f5b0e7613@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 6joiu4s575cfck7s45iryq7w8f36t4i4
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: EF86417
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19OT0neM9cuPapsa7FWTtaeA+JUyyPMUkg=
X-HE-Tag: 1786194740-47388
X-HE-Meta: 
 U2FsdGVkX1+gLiPXtn6NOrqLtU0+g0sRYVojChVl2xZ6oOD1nexNziDbT3gx+rnL9r59Kv4u+Aq/3M3IVBc88/e1kUXfKdVtet+AB5i4SggvbTuZLdnNqa3pIzMjdPGkSWzJMtI0kGm4rPnYzj/mMahkpZINg1mZQUrw1FEG17oAi+2a6vVECOugmr/esQMYOCRRk7Ix7rOwr2djUZQu6wOezDk3fc0FadaZe9s9YX/e0109qIUsLxsHXs+wVX4rFDRIte14AtGO2itSdGoSaAY/yDlO2o36BNfTuASEjXX1hcROnX6MdG40k3/QTYpuS691fwtJxeGvGy4did4HwR6T4wGSzhoC
Message-ID-Hash: 7RX26UCR623QUR6AYE25P2EABDMHZXA5
X-Message-ID-Hash: 7RX26UCR623QUR6AYE25P2EABDMHZXA5
X-MailFrom: rostedt@goodmis.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Pekka Paalanen <ppaalanen@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7RX26UCR623QUR6AYE25P2EABDMHZXA5/>
Archived-At: <https://lore.freedesktop.org/20260808091219.76d3c382@robin/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 8 Aug 2026 13:16:34 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> Yeah, this is somewhat machinary fix against the checkpatch.pl.
> Or, maybe it is better to just pass mmio_trace_array directly?

checkpatch.pl isn't for existing code. It is for new patches. And is
also more of a guideline than a rule.

Those two functions don't need to be changed to satisfy checkpatch.
They are fine as is.

-- Steve
