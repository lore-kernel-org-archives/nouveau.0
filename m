From: "Phillip Ezolt" <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Access to add a r300_reg database to rules-ng?
Date: Wed, 27 Jun 2007 14:25:58 -0400
Message-ID: <62cc563b0706271125j148a30f9mc2eba11cba14f1b3@mail.gmail.com>
References: <62cc563b0706200723k117433d2w9a28e35aa3bc2f16@mail.gmail.com>
	<20070621001759.765a79a4@daedalus.pq.iki.fi>
	<62cc563b0706201847l593f86acyde83b1aab74727d2@mail.gmail.com>
	<20070621155428.67c98e98@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20070621155428.67c98e98-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Pekka,

>
> And a note about kmmio trace: I expect a redesign of the binary log
> format in the next weeks. The binary dumps are easier to handle
> automatically and the current format is just broken. Once the new
> format is in place, we can write new cool tools, and most
> importantly, share binary dumps without problems ;-)
>

In your redesign of the binary dump format, could you add the ability
to store multiple PCs per sample? (ie, so that I can do backtraces (4
frames deep?) ) rather than just a single PC?

About 3-4 months ago, I hacked some code for kmmio which would walk
the stack and record the pc X frames above the current register
access.  Since I didn't figure out how to record multiple PCs per
sample, I hardcoded how far up the stack I would walk, and did
multiple runs (while changing the frame by recompiling) to get 3
frames deep.
(run 1 => current PC )
(run 2 => one frame up)
(run 3 => two frames up)
Etc.

I would then combine the runs by hand, and turn the addresses into
frames by using '/proc/kallsyms'.  It was very useful info, but
tedious..

Since fglrx actually has useful symbols in the kernel module, I was
able to determine the meaning of some of the register accesses by
looking at the stack trace.  (It wasn't enough to just look at the PC,
since it was in some generic 'do_mmio' function... I needed the frame
above it.)   I would like to do this again for some of the other
registers that I don't know the meaning of yet..

This might be useful for nvidia as well.

BTW. I can send you the patch if you want, but it is very i386
specific & (if I remember) it requires framepointers.

> --
> Pekka "PQ" Paalanen
> http://www.iki.fi/pq/
>

Cheers,
--Phil
