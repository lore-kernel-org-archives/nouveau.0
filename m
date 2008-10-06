From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: nouveau on opensuse 11 request for help
Date: Mon, 6 Oct 2008 21:49:17 +0300
Message-ID: <20081006214917.619084bf@daedalus.pq.iki.fi>
References: <5a0daeca0810051518k662ddb97l9dd856f3eca543c5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5a0daeca0810051518k662ddb97l9dd856f3eca543c5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Elle Stone <l.elle.stone-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 5 Oct 2008 18:18:47 -0400
"Elle Stone" <l.elle.stone-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi, all,

Hello

...
> My video card is a geforce 7600.
...
> I am interested in trying out the nouveau driver, but only if the end result
> stands a good chance of fixing a problem and adding a benefit.  I searched
> the opensuse forums and your archives, and googled around, and came up with
> not much information about using nouveau and opensuse.  I read through the
> documentation about how to install nouveau and was not comfortable just
> diving in and trying to follow the instructions.  My first stumbling block
> is that for some reason all of a sudden yast stubbornly refuses to allow me
> to add any new repositories.  I think I could get around this problem by
> downloading rpms to my local rpm repository.  However, my second stumbling
> block is that the very word "git" just makes me think I'm getting in over my
> head.

The latest openSUSE packages look like they are from August, that's not too
new. Git is the preferred way, and you only need those few given commands
to get the source tree.

> I have a NEC 2190uxi LCD, resolution 1600x1200 and an old Samsung Syncmaster
> 700s CRT, resolution 1280x1024, currently running a 2880x1200 desktop
> (Samsung below NEC) with twinview.  The NEC can physically rotate to
> portrait position.  The Samsung, obviously, doesn't rotate.
> 
> I don't play games on my computer.  I do a lot of 16-bit image processing,
> but strictly 2-D.  I do run google-earth, which probably uses 3-D.

Google Earth will likely suck, big time. As for 16-bit image processing,
I don't think the display driver has much effect, unless they really do
support 16-bit per channel images. I doubt that, and those monitors can't
show more than 8 bpc, anyway.

> Here's the problem:  The proprietary nvidia driver doesn't regulate the fan
> speed, so my fan runs at full speed all the time.  And the proprietary
> nvidia driver doesn't support randr 1.2.

Nouveau does not yet support any kind of fan, voltage or frequency control,
the settings will be as they were left by the VBIOS during boot. This might
be a lower performance mode, but also might not.
You would be changing those by hand with nvclock, provided it works.

Randr 1.2 is well supported.

> Here's the benefits that would make the pain of trying to get nouveau
> working on my computer worthwhile:  regulated fan speed and the ability to
> rotate the image on the NEC to portrait mode, while not rotating the image
> on the Samsung.
> 
> Can randr actually rotate the image on one screen, while not rotating the
> image on the other screen?

I think it should.

> Can nouveau work with randr to perform the above rotation with my video card
> on opensuse 11?

Randr, Nouveau and rotation should all be good and accelerated.

> If "yes" to the above questions, can someone on the nouveau mailing list
> help me get this stuff working?  I'm not a complete computer idiot - I
> designed and built my workstation (tyan, opteron, etc) myself.  I installed
> debian beginning with net install and a console-only minimal system.  I've
> built hugin and a few other packages from source/cvs.  But I don't really
> understand what I'm doing in linux (i'm just good at following directions)
> and as I said, the opensuse yast thing is painful.  And when I try to find
> how to do stuff in opensuse from the command line, half the time the
> information turns out to be no longer valid.  So if I try to use nouveau I
> would really need some assistance from someone much more knowledgeable than
> myself.

I don't use SUSE, so I can't help much with this. The basics are that you
need various development packages to be able to compile stuff for the
kernel and Xorg, and you need git to get the source.

Oh, and you don't want to install Mesa with Gallium3D. Stick to the Mesa
your distro provides. Nouveau's 3D support is still in heavy development.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
