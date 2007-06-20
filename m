From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Access to add a r300_reg database to rules-ng?
Date: Thu, 21 Jun 2007 00:17:59 +0300
Message-ID: <20070621001759.765a79a4@daedalus.pq.iki.fi>
References: <62cc563b0706200723k117433d2w9a28e35aa3bc2f16@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <62cc563b0706200723k117433d2w9a28e35aa3bc2f16-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 20 Jun 2007 10:23:54 -0400
"Phillip Ezolt" <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi,
>   I'm working with Oliver McFadden to create a rules-ng database for
> the Radeon R300 (and beyond..)  I've taken some of the work that he
> had done, and have been slowly adding more Radeon registers.  I also
> created a new 'test-r300' app based on the one included in the
> static-db to test the decode of radeon registers.

Cool :-)

> I would like this to be under version control, and the rules-ng cvs
> tree seems the best place to put it.

Yeah, I think we can manage that. The directory structure so far has no
project specific directories. I have XML databases in one dir, python
scripts in another, and staticdb stuff in third dir.

Is it only the test app or would you put also the radeon XML files in
Rules-ng CVS?
Do you think they could all live together mixed with Nouveau files?
Maybe we could even use partially the same XML files, e.g. the standard
VGA registers, that are accessed via indexed registers?
Are those not the same for both radeon and Nouveau?
I also assume that at some point you want (if not already done so) fork
some of the tools or python scripts to do the style your project uses.

> If this is cool with the nouveau developers, could I have commit
> access so that I can submit it, and update it as I add more stuff?

I do not have rights to give that. Marcheu?
It is ok with me.

> (I can send you my changes as a patch if you would rather I did
> that..)

Whatever you add yourself new files, play as you wish. If you need to
modify the common tools or something else, I'd like to know in advance.

-- 
Pekka "PQ" Paalanen
http://www.iki.fi/pq/
