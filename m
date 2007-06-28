From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: kmmio dump log format
Date: Thu, 28 Jun 2007 17:10:27 +0300
Message-ID: <20070628171027.16a619bc@daedalus.pq.iki.fi>
References: <62cc563b0706200723k117433d2w9a28e35aa3bc2f16@mail.gmail.com>
	<20070621001759.765a79a4@daedalus.pq.iki.fi>
	<62cc563b0706201847l593f86acyde83b1aab74727d2@mail.gmail.com>
	<20070621155428.67c98e98@daedalus.pq.iki.fi>
	<62cc563b0706271125j148a30f9mc2eba11cba14f1b3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <62cc563b0706271125j148a30f9mc2eba11cba14f1b3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Phillip Ezolt <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 27 Jun 2007 14:25:58 -0400
"Phillip Ezolt" <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Pekka,
> 
> In your redesign of the binary dump format, could you add the ability
> to store multiple PCs per sample? (ie, so that I can do backtraces (4
> frames deep?) ) rather than just a single PC?

The new format will be packet based, so it will be extendable. Yes, we
can do this, I and Jeff just have to discuss how to do it exactly. And
Jeff seems to be very busy nowadays.

> About 3-4 months ago, I hacked some code for kmmio which would walk
> the stack and record the pc X frames above the current register
> access.  Since I didn't figure out how to record multiple PCs per
> sample, I hardcoded how far up the stack I would walk, and did
> multiple runs (while changing the frame by recompiling) to get 3
> frames deep.
> (run 1 => current PC )
> (run 2 => one frame up)
> (run 3 => two frames up)
> Etc.
> 
> I would then combine the runs by hand, and turn the addresses into
> frames by using '/proc/kallsyms'.  It was very useful info, but
> tedious..

Ouch.

> Since fglrx actually has useful symbols in the kernel module, I was
> able to determine the meaning of some of the register accesses by
> looking at the stack trace.  (It wasn't enough to just look at the PC,
> since it was in some generic 'do_mmio' function... I needed the frame
> above it.)   I would like to do this again for some of the other
> registers that I don't know the meaning of yet..

We can do it, I just hope you will not get any legal issues because of
doing it. I do not think Nouveau would ever use PC/stack recording, it
is a bit too deep into the gray area.

> BTW. I can send you the patch if you want, but it is very i386
> specific & (if I remember) it requires framepointers.

I would say that let's wait until the log format rework is done,
because it will inflict changes also to the kernel side. And to be
honest, I'd rather leave kernel stuff to other people. And my system is
64-bit.

-- 
Pekka "PQ" Paalanen
http://www.iki.fi/pq/
