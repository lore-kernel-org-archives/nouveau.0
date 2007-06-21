From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Access to add a r300_reg database to rules-ng?
Date: Thu, 21 Jun 2007 15:54:28 +0300
Message-ID: <20070621155428.67c98e98@daedalus.pq.iki.fi>
References: <62cc563b0706200723k117433d2w9a28e35aa3bc2f16@mail.gmail.com>
	<20070621001759.765a79a4@daedalus.pq.iki.fi>
	<62cc563b0706201847l593f86acyde83b1aab74727d2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <62cc563b0706201847l593f86acyde83b1aab74727d2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Wed, 20 Jun 2007 21:47:07 -0400
"Phillip Ezolt" <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Pekka,
> 
> On 6/20/07, Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:

> I would like to checkin both the r300-regs.xml file, and my test app.
> I also modified the makefile to generate a shared library (like nvidia
> has) to hook up with kmmio.
> 
> > Do you think they could all live together mixed with Nouveau files?
> 
> Definitely.

> You guys have this nice mechanism to handle the variants, etc, but
> right now, I'm just putting all of the stuff in a single file for the
> RS480.  This will probably be restructured later to be more supportive
> of all of the different radeon variants.  However, I just need to
> start somewhere.  There are hundreds (?) of radeon registers, and for
> the .xml file to be useful, I need to start adding them.

I tried to design the layout of the XML file to be quite free, creating
groups and alike, but of course the file may get big. If it gets too
big and it would be beneficial to add an include directive, we should
think about it.

> I think that ultimately Oliver wants to use this to generate the
> header files, but right now, I just want something that I can use for
> reverse engineering. (and playing with kmmio)  For this, it is ok that
> things are incomplete.  In the future, when we're actually building
> things with the headers generated from this, the r300-regs.xml file
> will have to be completely filled in.

Yes, the header file generation is a goal for Nouveau, too, but I have
been doing other stuff.

> Ok. I just need to add ~4 files, and modify the makefile in staticdb
> so that they are built.

Fire away! :-)

And a note about kmmio trace: I expect a redesign of the binary log
format in the next weeks. The binary dumps are easier to handle
automatically and the current format is just broken. Once the new
format is in place, we can write new cool tools, and most
importantly, share binary dumps without problems ;-)

-- 
Pekka "PQ" Paalanen
http://www.iki.fi/pq/
