Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BE1C4452B
	for <nouveau@archiver.kernel.org>; Wed, 22 Jul 2026 00:44:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D2F2010E3BE;
	Wed, 22 Jul 2026 00:44:38 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 15B39472BA;
	Wed, 22 Jul 2026 00:29:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784680148;
 b=sBbvSHGOph7RGyEgR9+J+poo9/1R8oBfB1odtCRT0XHme/NKdFYvjvoTFljwUWfCqUTCP
 Yt+YGOK4ctsV/OPU6wZGqUvU2WKzMX75NkpqCSK6Fpc3K9rqSBU5P+WK13Lv4dDhwjF7MzA
 DU6JEftGprr2iK5TpuxZ3PLa5iML3d9YWmfxF9RJs9o1Lg3fj5+JNI/VOeoOsx2jbWiPJ+Q
 DgwX8nOZlWDx2Lowowez0WwHafDbsfG8ebmExfPXRKvQgag7tcUliMUe+jaqF8g/yeVP1Ik
 NKrw61I0yNzI5Ci3U6/KD1oTC0T5pNDZ88fa0Nk7e9TGaSm+rs1XMk6kVeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784680148; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yLb8BEepOSk4HQLZRdlMGN/K3U/yIcALJ4BHiPUDv1M=;
 b=bgJW/gydaICsy5CtJcLHRbidgMQ09kJuDmvU9ZxnXXCjOIjrBpJvHDBe5gbVqZUNTw/G1
 mhaTTt5Hm7IBEeFOOXGPugttaLq7kvmA0tiXKXCB67+luW0wvT/zu5iszW59hGPv8DoAFhX
 laPn+W6Cr9qyDKEZAol8XbbTxSxpGystJJvlbJtos4WXzMvhWYaJz//5TyS+6UzP8+sX/+P
 WkDj84mKqaPV1pr3rRP0BQg0D0G0qUFUdon1j9KLZ0vIOkzD7m4VnRsPIN9wvnSTSArDEQX
 /mPpeLtTmtX1Qrj8bfOLdGAbJY4pI47GmelXCM3SmPInafts9JC2jdPLk3IQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=goodmis.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=goodmis.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 22B5846EB2
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 00:29:06 +0000 (UTC)
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Wed, 22 Jul 2026 00:44:35 UTC
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com
 [216.40.44.16])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 88EE210E385
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 00:44:35 +0000 (UTC)
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id AE4E2C0210;
	Wed, 22 Jul 2026 00:38:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf16.hostedemail.com (Postfix) with ESMTPA id CF0432000F;
	Wed, 22 Jul 2026 00:38:24 +0000 (UTC)
Date: Tue, 21 Jul 2026 20:38:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: deepakraog <gaikwad.dcg@gmail.com>
Subject: Re: [PATCH] tracing/mmiotrace: fix resource leak on trace_pipe
 close
Message-ID: <20260721203843.65d06a69@gandalf.local.home>
In-Reply-To: <20260715143604.14481-1-gaikwad.dcg@gmail.com>
References: <20260715143604.14481-1-gaikwad.dcg@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CF0432000F
X-Stat-Signature: tzgaoodpiywcy7suk3oj5zh1pomkugd6
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18LevLbhgbI1GVSjSGxOxREKAy8FfMl4jc=
X-HE-Tag: 1784680704-557893
X-HE-Meta: 
 U2FsdGVkX18qsG8OY0Cam/g13cNxjAGZ/TUK9+JgEp4sXRiL2RRe2CfSwsA+jXxVHGQ/y/+jh1LwhW7PeRQySgY2Xjjc933ToFli1SCA5bHuBgUzU4iZdcRxMG6iOtMNCwt+NNQ1ibMG8rJFkb/yu9WK5ty2OFsJN38Op8tCNJd1niqqonUGoEAMchOcoR5Csv/8E2lsq8IrdlcbGt7HH3kWykvzUV4MGWYWNaHfa0OhnzTtOAVpAtlioDdcM4ZQ+E/vSRtfNWnpjvS/MU+mlU58mRcwn3SCcK5BE0gB2L92KKs4ZGAFjl2wf1+/INvwjekBqnUu1/GW5enrpnHL6QaBXQpHDKGs
Message-ID-Hash: 5F6L3P6IUHSI2EC7PIULL2NJ5NT6VSSF
X-Message-ID-Hash: 5F6L3P6IUHSI2EC7PIULL2NJ5NT6VSSF
X-MailFrom: rostedt@goodmis.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Masami Hiramatsu <mhiramat@kernel.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5F6L3P6IUHSI2EC7PIULL2NJ5NT6VSSF/>
Archived-At: 
 <https://lore.freedesktop.org/20260721203843.65d06a69@gandalf.local.home/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 15 Jul 2026 20:06:04 +0530
deepakraog <gaikwad.dcg@gmail.com> wrote:

> mmio_pipe_open() allocates a header_iter and takes a pci_dev reference
> when trace_pipe is opened. mmio_close() frees them, but it was only
> wired to the tracer's .close callback.

Were you able to trigger a kmemleak?

> 
> tracing_release_pipe() invokes .pipe_close, not .close, when the
> trace_pipe file is released. As a result, closing trace_pipe with the
> mmiotrace tracer active leaked the header_iter allocation and left a
> stale pci_dev reference.

It would be good if you showed how a leak can happen, as the mmio_read()
does clean up the descriptor, making the above statement incorrect.

> 
> Set .pipe_close to mmio_close, matching how function_graph wires both
> callbacks to the same handler.
> 


The mmio_read() will free up the descriptor if you read the trace_pipe file
until it blocks. But reading part of it may trigger the leak. Such as:

  # head -n 1 /sys/kernel/tracing/trace_pipe 
 head: /sys/kernel/tracing/trace_pipe: cannot seek to relative offset 0: Illegal seek
 VERSION 20070824

and running that over and over again will produce a leak caught by kmemleak.

I'll update the change log.

-- Steve
