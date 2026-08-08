Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89257C5AC67
	for <nouveau@archiver.kernel.org>; Sat,  8 Aug 2026 04:16:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E7F9D10E4F8;
	Sat,  8 Aug 2026 04:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="He9pQrBp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2FCE947621;
	Sat,  8 Aug 2026 04:00:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786161634;
 b=jOuA8wu241btJ6l/KX7q6pDilf0qPmfyQlKS9Vt1PaiUZbbGN0MZpwHHsWCNOQTa9lObJ
 RggjcqVy7PYy0hHN4ZCR3TXbghShhedpTWFz0Q99GCywHXBLQbG4gY50//k/uqzwO0VMpjA
 eTwLcxZ4omddzXh+nJGgcC1nJRa3XE6hACti+QIljssNcKF+nrfqyVEWPa2a5AvZneVX+Ha
 WKSG5fVY9ezITQ34UCYf5+siNkhVcn1QI3A/0B+/z9GYvB02QiILD9E8LT65YhKIhl2Jlyy
 k0aV8jPjHt5LCOZOUC5QMn5vGq70KxVuwXGPCOuyPbrf+EOnk99q3UmCr7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786161634; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Fz3hQs7dGPKGj3P4TL+iHFB8vT287v23iLsb4YLkVNc=;
 b=yk0GdTdOMk7InMG36S20rzzVvqA8iZ9gLvuIDi2WZ1lmhKH52maXlgEJl2bA9w9kSJ7f1
 A61rvwFmJ+aQfMxOBCxsuV0saV2Z+BDLtsGD/HoOCO+ZtOxj+BQJWxMoH8bwfo42GSRzkQN
 FOl/PP1u9bUD8IK/HB77xiiZp06TROufhSaNDLeVVZcBhvfUj+QB2bkadPep1Lswcl5rsc/
 mosZgGPSHmHAkN3c0EExY3DANdDCSlRqBJqltqXgVFeaXjyAu/HdpRNreBMI9/saxyGtiyD
 qxftAAZmtp7DgyDMQug2u6FTlpFTF8t7hqzVzHau8We2oXWvfqJHsggTX1DA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0DA5F4721F
	for <nouveau@lists.freedesktop.org>; Sat,  8 Aug 2026 04:00:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 87CCF10E4DF
	for <nouveau@lists.freedesktop.org>; Sat,  8 Aug 2026 04:16:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5874A4164F;
	Sat,  8 Aug 2026 04:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97341F000E9;
	Sat,  8 Aug 2026 04:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786162598;
	bh=Fz3hQs7dGPKGj3P4TL+iHFB8vT287v23iLsb4YLkVNc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=He9pQrBpOGOgxzd/42LlA1uIsWsDzMalZQ+kiNf3xPzzsN8JJSj3YAClfVUkyKA8a
	 QfjY39OtPfHktEjC1bdJXMzsaUWSQkZhiDfI5YP+YI1fuK/FeffvSxoT7COmpTQkaD
	 silKovzkc6NURV3co9Ue9uwuqxVIxZlpbxzq0zH/WPKxEdHjqboAKGsWb4Dah47uZK
	 IFeba/8ASG7uJoOauEYFfEh8NusCx/x6te8eILh/g6IOiYItTZUXBb1XTxYaFvENkR
	 FmtHt3aZBPUcM2Pt3dSC1TaS4xRX/10fqrPRDQroEm/3DL/Ymh+1hGtx4Bj4zYxOFh
	 18DeahCMApwbg==
Date: Sat, 8 Aug 2026 13:16:34 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 4/4] tracing/mmiotrace: Clean up coding style and
 redundant debug logs
Message-Id: <20260808131634.4dafadc203a58e9f5b0e7613@kernel.org>
In-Reply-To: <20260807205053.7000eef0@gandalf.local.home>
References: <178524298182.56416.7520852015178187644.stgit@devnote2>
	<178524301945.56416.2087305624947649637.stgit@devnote2>
	<20260807205053.7000eef0@gandalf.local.home>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WZDDBWODGTMACMRI4FZP6CDC4YGQ4RS7
X-Message-ID-Hash: WZDDBWODGTMACMRI4FZP6CDC4YGQ4RS7
X-MailFrom: mhiramat@kernel.org
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WZDDBWODGTMACMRI4FZP6CDC4YGQ4RS7/>
Archived-At: 
 <https://lore.freedesktop.org/20260808131634.4dafadc203a58e9f5b0e7613@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 7 Aug 2026 20:50:53 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Tue, 28 Jul 2026 21:50:19 +0900
> "Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:
> 
> > From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > 
> > Clean up coding style issues in trace_mmiotrace.c:
> > - Remove redundant pr_debug() entries in tracer callbacks.
> > - Fix opening brace placement for mmio_tracer.
> > - Prefer 'unsigned int' to bare 'unsigned'.
> > - Add missing blank lines after local variable declarations.
> > 
> > Assisted-by: Antigravity:gemini-3.6-flash
> > Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > ---
> >  kernel/trace/trace_mmiotrace.c |   16 +++++++---------
> >  1 file changed, 7 insertions(+), 9 deletions(-)
> > 
> > diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
> > index 77120d467e11..ce16e1c53d12 100644
> > --- a/kernel/trace/trace_mmiotrace.c
> > +++ b/kernel/trace/trace_mmiotrace.c
> > @@ -36,7 +36,6 @@ static void mmio_reset_data(struct trace_array *tr)
> >  
> >  static int mmio_trace_init(struct trace_array *tr)
> >  {
> > -	pr_debug("in %s\n", __func__);
> 
> So how are these redundant?
> 
> Are there pr_debug() prints elsewhere?

No, that is not redundant, but just like only for debugging mmiotrace.
Maybe we can leave it.

[...]
> > @@ -322,6 +318,7 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
> >  void mmio_trace_rw(struct mmiotrace_rw *rw)
> >  {
> >  	struct trace_array *tr = mmio_trace_array;
> > +
> >  	__trace_mmiotrace_rw(tr, rw);
> >  }
> >  
> > @@ -353,6 +350,7 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
> >  void mmio_trace_mapping(struct mmiotrace_map *map)
> >  {
> >  	struct trace_array *tr = mmio_trace_array;
> > +
> >  	__trace_mmiotrace_map(tr, map);
> >  }
> 
> Honestly, for one line functions like the above, I think it looks better
> without that blank line.
> 
> -- Steve

Yeah, this is somewhat machinary fix against the checkpatch.pl.
Or, maybe it is better to just pass mmio_trace_array directly?

Thanks,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
