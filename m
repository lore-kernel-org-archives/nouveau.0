From: Uwe Bugla <uwe.bugla-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Gallium driver and compatibility issues
Date: Fri, 12 Mar 2010 22:22:02 +0100
Message-ID: <1268428922.2920.0.camel@brian.bconsult.de>
References: <1268329369.2107.14.camel@brian.bconsult.de>
	<586c2acd1003111023y72ca711at32b69b88252673f3@mail.gmail.com>
	<1268336434.2397.3.camel@brian.bconsult.de>
	<20100312125239.4a29011c@farn>
	<1268401894.1759.59.camel@brian.bconsult.de>
	<20100312222541.131d8885@farn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100312222541.131d8885@farn>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

Am Freitag, den 12.03.2010, 22:25 +0200 schrieb Pekka Paalanen:
> On Fri, 12 Mar 2010 14:51:34 +0100
> Uwe Bugla <uwe.bugla-Mmb7MZpHnFY@public.gmane.org> wrote:
> 
> > "Note, that the Nvidia proprietary driver....."
> > Lapse No. 3:
> > Misleading usage of expressions.
> > Everybody talking about the "Nvidia proprietary driver" in the
> > graphic card context of Nvidia cards normallly means the blob
> > driver shipped by Nvidia (closed source driver!) which does not
> > have any problems with stuff like Compiz or other 3D
> > applications. I do not like blob drivers for a whole bunch of
> > reasons. As you are definitely using the wrong expression it
> > remains your personal secret what you are trying to express or
> > say.
> 
> One of the most common reasons for problems with Nouveau are
> the remnants of the proprietary driver. Since you did not
> provide kernel log, X log, nor glxinfo output, I of course
> assumed the most probable case. A stale libglx from the blob
> kills OpenGL, for instance.
> 
> Furthermore, you cannot have the Nvidia proprietary 3D
> driver running by default, and then use the Nouveau 3D driver
> on selected apps. If you use *any* part of Nouveau, you cannot
> have *any* part of the proprietary driver, and vice versa.
> They cannot live together at all.
> 
> I'm sorry I guessed your problem wrong. There was no real
> information to begin the diagnosis with.
> 
> > "Problems are expected on the OpenGL front....."
> > Lapse No. 4:
> > I did not mention nearly all driver parts of the Gallium drivers
> > carrying the "GL" in their names just by chance. I reflect while
> > I am typing messages. I explicitly mentioned that the versions of
> > the driver parts carrying the "GL" in their names are NOT
> > responsible for the breakage that I reported.
> > Thus it still remains your personal secret what you mean by
> > "OpenGL front".
> 
> Actually, they are. Mesa libGL will try to load nouveau_dri.so
> to provide hardware accelerated 3D rendering. At this time
> OpenGL (via Mesa) is the only real user of nouveau_dri.so.
> nouveau_dri.so may be loaded by the X server (AIGLX) or
> the application (direct rendering) when they load libGL.
> 
> In short, having nouveau_dri.so will break OpenGL and perhaps
> kill the X server in the AIGLX case.
> 
> > Lapse No. 6:
> > Instead of repeating the core message of my request for 4 times
> > in this mail (how insane!) I propose to change this page
> > http://nouveau.freedesktop.org/wiki/GalliumHowto
> > 
> > in the following way:
> > 
> > 1. Wipe off the following stupid idiotic crap:
> > 
> > "Warning : Nouveau's developers don't want people to build
> > gallium drivers now, and do not support it at all. They also
> > don't want bug reports on gallium ATM. This is code in rapid
> > development. Bug reports for this are useless, as it's known to
> > be broken."
> 
> That is rude on purpose. It is supposed to be crystal clear
> to everyone, that this is not yet for end users, but apparently
> it is not that clear. The time for end users will come, later.
> At that time the page will be rewritten to be polite. Right now
> it is just a cheatsheet for new developers.
> 
> > And once again: The error is not hidden in some library
> > file containing the "GL" in its name, and the versioning of those
> > GL files is also NOT the problem.
> > It's the sources of the nouveau_dri.so file that do contain the
> > bug.
> 
> True. nouveau_dri.so misses complete features and contains bugs.
> 
> I read your two first posts as nothing more than an elaborate
> "Fix everything, please". That really is what people are actually
> doing on their free time. Trying to kick their butt can only make
> them ignorant or angry.
> 


Yup! Good vibes!

a. I do not use parts of the Nvidia blob driver or the blob as whole.
b. Up to now I always loaded nouveau_dri.so via AIGLX plus minimal
xorg.conf plus nouveau kernel staging driver.
c. I can send you some xorg.0.log if you may wish.
What other log files could be useful please?
d. In fact the xorg server did not crash even once.
The only thing that is broken is the specific application (solitaire).
There do exist apps that are not broken.

That's it for now. If you need further info please tell me.
Otherwise I will stay away from Gallium from now on.

Cheers

Uwe
