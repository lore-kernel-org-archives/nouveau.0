From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] nouveau: rewrite nouveau_stateobj to use
	BEGIN_RING properly
Date: Tue, 5 Jan 2010 19:17:16 +0100
Message-ID: <6d4bc9fc1001051017t5f07efc8rfe013b3eb4bdae26@mail.gmail.com>
References: <1262209002-10778-1-git-send-email-madman2003@gmail.com>
	<1262209002-10778-2-git-send-email-madman2003@gmail.com>
	<1262209002-10778-3-git-send-email-madman2003@gmail.com>
	<586c2acd1001041819q3f0662d4q84a5da7f57edf14f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd1001041819q3f0662d4q84a5da7f57edf14f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Pushed after conformation that nv3x and nv4x work.

On Tue, Jan 5, 2010 at 3:19 AM, Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Dec 30, 2009 at 4:36 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> - The previous solution was hacky and didn't do subchannel autobinding.
>> - The beheaviour should match what libdrm_nouveau does closely.
>> - There appears to be a minor performance loss, probably due to having multiple
>> memcpy's instead of one.
>> - The solution remains statically sized, but when debugging is on it will check
>> for abuse.
>> - The values for nv30/nv40 may be off, but this should be easily caught with
>> DEBUG on.
>
> Tried a few levels of xmoto, worked fine.
>
