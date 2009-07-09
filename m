From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: SLI support for 8800 GTX?
Date: Thu, 9 Jul 2009 20:24:45 +0300
Message-ID: <20090709202445.1c185e0f@daedalus.pq.iki.fi>
References: <c5221b990906221315q4ecaa681s71342e5f4f63b17e@mail.gmail.com>
	<20090622233546.1af414e8@daedalus.pq.iki.fi>
	<20090708174351.GA3295@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090708174351.GA3295-2ev+ksY9ol182hYKe6nXyg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 8 Jul 2009 21:43:51 +0400
Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Mon, Jun 22, 2009 at 11:35:46PM +0300, Pekka Paalanen wrote:
> > To get SLI support, we would need to have a developer with SLI hardware.
> > I do not think there is a developer even with any two cards, since the bug
> > https://bugs.freedesktop.org/show_bug.cgi?id=16897
> > is still open. Someone with interest in multicard or SLI support should
> > join the project and write the code.
> > 
> > The current status is "not implemented" and as you found out, multicard
> > really does not work at all. SLI is another story after multicard
> > support.
> 
> What can be a first first "milestone" for multicard setup?

I got some comments on what's needed in irc:
- POSTing cards (i.e. cold boot without executing the x86 BIOS code)
- maybe not VGA arbiter, maybe yes...

< airlied> the only thing nouveau needs t oworry about vgaarb is if
           you can't disable VGA decodes
< airlied> or can't discover how to disable them
< airlied> in that case you need to provide a callback to disable IRQs or
           have a very resilient IRQ handler
< airlied> that can deal with memory/io space disappearing

< darktama_> the BIOS parser can cope with earlier cards apparently,
             I started looking at making G8x work today
< marcheu> yeah it works for resume, which is virtually the same
< marcheu> but since we have other bugs, we can't have multi-card support ATM :)

Since I'm not familiar with this topic, I leave the interpretation for you.
You can poke these guys on irc :-)

-- 
Pekka Paalanen
http://www.iki.fi/pq/
