From: "Phillip Ezolt" <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Access to add a r300_reg database to rules-ng?
Date: Wed, 20 Jun 2007 21:47:07 -0400
Message-ID: <62cc563b0706201847l593f86acyde83b1aab74727d2@mail.gmail.com>
References: <62cc563b0706200723k117433d2w9a28e35aa3bc2f16@mail.gmail.com>
	<20070621001759.765a79a4@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20070621001759.765a79a4-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
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

On 6/20/07, Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:
> On Wed, 20 Jun 2007 10:23:54 -0400
> "Phillip Ezolt" <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> > Hi,
> >   I'm working with Oliver McFadden to create a rules-ng database for
> > the Radeon R300 (and beyond..)  I've taken some of the work that he
> > had done, and have been slowly adding more Radeon registers.  I also
> > created a new 'test-r300' app based on the one included in the
> > static-db to test the decode of radeon registers.
>
> Cool :-)
>
> > I would like this to be under version control, and the rules-ng cvs
> > tree seems the best place to put it.
>
> Yeah, I think we can manage that. The directory structure so far has no
> project specific directories. I have XML databases in one dir, python
> scripts in another, and staticdb stuff in third dir.
>
> Is it only the test app or would you put also the radeon XML files in
> Rules-ng CVS?

I would like to checkin both the r300-regs.xml file, and my test app.
I also modified the makefile to generate a shared library (like nvidia
has) to hook up with kmmio.

> Do you think they could all live together mixed with Nouveau files?

Definitely.

> Maybe we could even use partially the same XML files, e.g. the standard
> VGA registers, that are accessed via indexed registers?
> Are those not the same for both radeon and Nouveau?

I think so, but I really haven't dabbled in the vga portion of the
card.  For now, I do link in the vga database with the R300 database.

> I also assume that at some point you want (if not already done so) fork
> some of the tools or python scripts to do the style your project uses.

That may happen in the future.  Right now, I am just trying to dump as
many of the radeon registers in the r300-regs.xml file as possible.

You guys have this nice mechanism to handle the variants, etc, but
right now, I'm just putting all of the stuff in a single file for the
RS480.  This will probably be restructured later to be more supportive
of all of the different radeon variants.  However, I just need to
start somewhere.  There are hundreds (?) of radeon registers, and for
the .xml file to be useful, I need to start adding them.

I think that ultimately Oliver wants to use this to generate the
header files, but right now, I just want something that I can use for
reverse engineering. (and playing with kmmio)  For this, it is ok that
things are incomplete.  In the future, when we're actually building
things with the headers generated from this, the r300-regs.xml file
will have to be completely filled in.

> > If this is cool with the nouveau developers, could I have commit
> > access so that I can submit it, and update it as I add more stuff?
>
> I do not have rights to give that. Marcheu?
> It is ok with me.
>

Thanks!

> > (I can send you my changes as a patch if you would rather I did
> > that..)
>
> Whatever you add yourself new files, play as you wish. If you need to
> modify the common tools or something else, I'd like to know in advance.
>
Ok. I just need to add ~4 files, and modify the makefile in staticdb
so that they are built.

I shouldn't have to modify anything else. If I do, I'll definitely talk to you.

There will probably be a flurry of checkins as I add new registers to
the xml file, but
I don't expect to change any of the core stuff.

> --
> Pekka "PQ" Paalanen
> http://www.iki.fi/pq/

Cheers & thanks,
--Phil
