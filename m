From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Nvidia regs (Re: need help relating your post on
	freedesktop)
Date: Sun, 5 Oct 2008 17:29:55 +0300
Message-ID: <20081005172955.13083587@daedalus.pq.iki.fi>
References: <871354732.1547461223071397198.JavaMail.root@mail6.gatech.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <871354732.1547461223071397198.JavaMail.root-+uv3tkLL0AUsTUYHLfqkUA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "Kolakkar, Pranay B" <pranay.kolakkar-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 3 Oct 2008 18:03:17 -0400 (EDT)
"Kolakkar, Pranay B" <pranay.kolakkar-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org> wrote:

> Hi Paalanen,
> 
> I am a graduate student for Computer Science at Georgia tech and I came
> across your page on freedesktop.org/~pq/rules-ng
> 
> It was interesting that you had listed all the registers and addresses of
> the nvidia gpu. Please let me know as to where can I find out what does
> each of the parameters mean.
> 
> Thanking you in anticipation and awaiting your response.
> 
> Regards,
> Pranay.

Hi Pranay,

I didn't create the page, I only wrote the tools that generate it,
and the Nouveau developers have gathered the names and addresses
from various sources and reverse engineering efforts. The list is
not by any means complete, and likely contains some mistakes.

Mind you, the page has not been updated for a while, and most of the
"variants" information is bad on the web pages. That's due to my
generator being a bit broken.

There is no real documentation for the registers available, Nvidia
keeps that as their secret. The best you can get is reading the
Nouveau source code. Not even the Nouveau developers know the
meaning of a large portion of the regs, they just observe how
the proprietary driver pokes them, and try to guess how they should
be used.

I'm CC'ing the Nouveau mailing list, where you can ask further
questions. Also, please take a look at the wiki
http://nouveau.freedesktop.org/wiki/

May I ask why you are interested? The Nouveau project could use
some help, especially if you are thinking about writing code for
Nvidia grapchis hardware ;-)

According to your home page http://www.cc.gatech.edu/~kolakkar/
you are interested in virtualization and resource monitoring
for multicore systems and also GPUs. It would be very cool if
Nouveau would support those. I don't think anyone has yet
reverse engineered the performance registers. OTOH, the 3D
support, too, is still brewing, so there probably isn't too
much to monitor. But 2D acceleration does use the card's 3D
engine.

Do you know about Gallium3D? If not, you should definitely take
a look: http://www.tungstengraphics.com/technologies/gallium3d.html
And think about it on the virtualization perspective. I don't know
how much work has already been done on that, but I bet the people
on the Nouveau mailing list know who to contact, if you get
interested.


Cheers,
pq

-- 
Pekka Paalanen
http://www.iki.fi/pq/
