Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AB7C5AD05
	for <nouveau@archiver.kernel.org>; Sat,  8 Aug 2026 00:50:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 993FA10E491;
	Sat,  8 Aug 2026 00:50:57 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2705947626;
	Sat,  8 Aug 2026 00:34:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786149290;
 b=bc3/3egstnFn6oDWPn7la1vA299crUJ1Kgnea90r+XxaNeFNwTxBX1oQSIKd+t8OdpIBc
 v3y0ZCX9K9btBOKWj+tKhPpkf9LuYiyvn6l+RI4q2TfYkz+it2jte3j0niBEgZGWK7rUaKs
 q3f2cOGM8Lbu5CPIX+oF6nxI06uIdVx1AGl66wTNB8rnXWCHo3q3n0AFKXlZS1bkCGNKVMO
 0atOgK/4R8P4UGt5fMH3f96cSdNoV4zQ0j9Pu7mbygDCjX0fst55X9QwClxapAhyViWKkqb
 mNmDmSXehW5NW0fPcgqcU8SakvZOq7QWnc5xQhkoH8pckpzQioeYVJ+AUlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786149290; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=R7ehihLLiZmHB2B3ciyg5Xqa9/zPCscVuwpxeE3XFeY=;
 b=pYDpicwG3GTWL2E8gp4jMaj53TYwvDfS4BAt6JhE6IYHEdxr2XP5VGGG3P80/2cbtRKv/
 +W7Srh3YlRSD9w89FkrYhkt71Je54/v64W4e28GnszM7Og3KuWyPNTXnF90aBMQGZ2kK5xO
 z5V14K/77A1o34yY0YTdLEJYeDbF/VoWDGGyv1M2jjBXz7xaMQDVPXHF9fISu00507xTL2I
 EnE2w1/DnIHaIlU6tIS8OMZd5V/03ZiusbFRQNCKXhdoXwC0jUj2yvNZX//8Bh/x1mMJIey
 TTC6rWELqXkiAozpGPnO4h+qnztO7w/yPl6txHZ8ov7ddvenlUxI8GmiTm7w==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=goodmis.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=goodmis.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CE9184723A
	for <nouveau@lists.freedesktop.org>; Sat,  8 Aug 2026 00:34:46 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com
 [216.40.44.13])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EB63310E483
	for <nouveau@lists.freedesktop.org>; Sat,  8 Aug 2026 00:50:53 +0000 (UTC)
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 1B4358020C;
	Sat,  8 Aug 2026 00:50:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf05.hostedemail.com (Postfix) with ESMTPA id 522E12000E;
	Sat,  8 Aug 2026 00:50:50 +0000 (UTC)
Date: Fri, 7 Aug 2026 20:50:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: Re: [PATCH 4/4] tracing/mmiotrace: Clean up coding style and
 redundant debug logs
Message-ID: <20260807205053.7000eef0@gandalf.local.home>
In-Reply-To: <178524301945.56416.2087305624947649637.stgit@devnote2>
References: <178524298182.56416.7520852015178187644.stgit@devnote2>
	<178524301945.56416.2087305624947649637.stgit@devnote2>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: but57si57nhqcgc6yng1suher1mosm3u
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 522E12000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19gRu8bUZ9VZnlDoRBGEO+tZKahHYXFwsU=
X-HE-Tag: 1786150250-943132
X-HE-Meta: 
 U2FsdGVkX1+WHC481oLJWAA19yCFqIbY1AD5kD10b9zjYdqPGVuqTyJDTlsfGr0ZRtGwSyRfHk9WjqEkwfRCFNQopbZL89yvsCebadSWHixmFQWA8YzADAlUaIpxpYr/hzDTrW/GjndiCmSN+9f2ENi4M3ak1dQsOsluTWqRpFNhx35RjGcFajI9bYZ45Ke7abt+pFHko9dEpgMyN9g5Lcq22AOAdJFnrA6euvPhbDjyU69JrobJyGPVN/22GoZRcKJCQf4pf8xGGz9P521ZhIL1ZnqS3pYUsqfCQlaGnNhNtO/onqmhmXU1gbyVgDAy/J2fdPkePP7pgWLNfMdIV/10LA0mos2p
Message-ID-Hash: XTQZE6UCI7ZATLD5TB3XB7WWSTNCQJCP
X-Message-ID-Hash: XTQZE6UCI7ZATLD5TB3XB7WWSTNCQJCP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XTQZE6UCI7ZATLD5TB3XB7WWSTNCQJCP/>
Archived-At: 
 <https://lore.freedesktop.org/20260807205053.7000eef0@gandalf.local.home/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 28 Jul 2026 21:50:19 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Clean up coding style issues in trace_mmiotrace.c:
> - Remove redundant pr_debug() entries in tracer callbacks.
> - Fix opening brace placement for mmio_tracer.
> - Prefer 'unsigned int' to bare 'unsigned'.
> - Add missing blank lines after local variable declarations.
> 
> Assisted-by: Antigravity:gemini-3.6-flash
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  kernel/trace/trace_mmiotrace.c |   16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
> index 77120d467e11..ce16e1c53d12 100644
> --- a/kernel/trace/trace_mmiotrace.c
> +++ b/kernel/trace/trace_mmiotrace.c
> @@ -36,7 +36,6 @@ static void mmio_reset_data(struct trace_array *tr)
>  
>  static int mmio_trace_init(struct trace_array *tr)
>  {
> -	pr_debug("in %s\n", __func__);

So how are these redundant?

Are there pr_debug() prints elsewhere?

>  	mmio_trace_array = tr;
>  
>  	mmio_reset_data(tr);
> @@ -46,8 +45,6 @@ static int mmio_trace_init(struct trace_array *tr)
>  
>  static void mmio_trace_reset(struct trace_array *tr)
>  {
> -	pr_debug("in %s\n", __func__);
> -
>  	disable_mmiotrace();
>  	mmio_reset_data(tr);
>  	mmio_trace_array = NULL;
> @@ -55,7 +52,6 @@ static void mmio_trace_reset(struct trace_array *tr)
>  
>  static void mmio_trace_start(struct trace_array *tr)
>  {
> -	pr_debug("in %s\n", __func__);
>  	mmio_reset_data(tr);
>  }
>  
> @@ -113,6 +109,7 @@ static void mmio_pipe_open(struct trace_iterator *iter)
>  static void mmio_close(struct trace_iterator *iter)
>  {
>  	struct header_iter *hiter = iter->private;
> +
>  	destroy_header_iter(hiter);
>  	iter->private = NULL;
>  }

This is fine.

> @@ -170,7 +167,7 @@ static enum print_line_t mmio_print_rw(struct trace_iterator *iter)
>  	struct trace_seq *s	= &iter->seq;
>  	unsigned long long t	= ns2usecs(iter->ts);
>  	unsigned long usec_rem	= do_div(t, USEC_PER_SEC);
> -	unsigned secs		= (unsigned long)t;
> +	unsigned int secs	= (unsigned long)t;
>  

OK.

>  	trace_assign_type(field, entry);
>  	rw = &field->rw;
> @@ -215,7 +212,7 @@ static enum print_line_t mmio_print_map(struct trace_iterator *iter)
>  	struct trace_seq *s	= &iter->seq;
>  	unsigned long long t	= ns2usecs(iter->ts);
>  	unsigned long usec_rem	= do_div(t, USEC_PER_SEC);
> -	unsigned secs		= (unsigned long)t;
> +	unsigned int secs	= (unsigned long)t;
>  
>  	trace_assign_type(field, entry);
>  	m = &field->map;
> @@ -249,7 +246,7 @@ static enum print_line_t mmio_print_mark(struct trace_iterator *iter)
>  	struct trace_seq *s	= &iter->seq;
>  	unsigned long long t	= ns2usecs(iter->ts);
>  	unsigned long usec_rem	= do_div(t, USEC_PER_SEC);
> -	unsigned secs		= (unsigned long)t;
> +	unsigned int secs	= (unsigned long)t;
>  
>  	trace_assign_type(print, entry);
>  	msg = print->buf;
> @@ -274,8 +271,7 @@ static enum print_line_t mmio_print_line(struct trace_iterator *iter)
>  	}
>  }
>  
> -static struct tracer mmio_tracer __read_mostly =
> -{
> +static struct tracer mmio_tracer __read_mostly = {

OK.

>  	.name		= "mmiotrace",
>  	.init		= mmio_trace_init,
>  	.reset		= mmio_trace_reset,
> @@ -322,6 +318,7 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
>  void mmio_trace_rw(struct mmiotrace_rw *rw)
>  {
>  	struct trace_array *tr = mmio_trace_array;
> +
>  	__trace_mmiotrace_rw(tr, rw);
>  }
>  
> @@ -353,6 +350,7 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
>  void mmio_trace_mapping(struct mmiotrace_map *map)
>  {
>  	struct trace_array *tr = mmio_trace_array;
> +
>  	__trace_mmiotrace_map(tr, map);
>  }

Honestly, for one line functions like the above, I think it looks better
without that blank line.

-- Steve
