From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Macbook Pro 5,
 1 - nouveau works if proprietary drivers are loaded first, then unloaded
Date: Sat, 14 Aug 2010 19:54:50 +0200
Message-ID: <20100814175450.GA3171@joi.lan>
References: <gavc669iha8r2i0leg6d2gfu5sa869t45c@4ax.com>
	<4C66CEA7.7080500@comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4C66CEA7.7080500-Wuw85uim5zDR7s880joybQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jesse Johnson <garand555-Wuw85uim5zDR7s880joybQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Aug 14, 2010 at 11:13:11AM -0600, Jesse Johnson wrote:
>   Hello,
> 
> I have a Macbook Pro 5,1 and decided that I wanted to play around with Hardened 
> Gentoo for fun.  I have another Gentoo install on the same machine along side 
> Mac OS X (I keep an extra partition free for when I want to play around, and I 
> do like to play around.)  I have seen that other people have had problems with 
> the MBPs and booting with the nouveau drivers, but Hardened Gentoo really should 
> be run without any binary blobs, so the nvidia drivers are out.  The nvidia 
> drivers will work with x11's opengl, but there is no 3D acceleration.  That 
> means no desktop bling :(  What I have experienced with the nouveau drivers is a 
> little different than what I saw while searching bug lists and forums because I 
> did things a little different.
> 
> On my non-hardened Gentoo install, I decided to get the nouveau drivers working 
> there.  I followed the directions for using the git sources on the official 
> website, made sure my kernel was configured properly and installed.  Once I had 
> the kernel and the drivers built and installed, I rebooted, but without changing 
> my xorg.conf to load the nouveau drivers.  It booted up and loaded the nvidia 
> drivers when X started, then I went to removing and loading modules, changing 
> xorg.conf, etc...  Basically, I wanted to get it working without having to 
> reboot every time I changed something.  I never plan on getting something that I 
> haven't tried before right the first time.
> 
> Once I killed X, removed all modules pertaining to the graphics drivers, changed 
> my xorg.conf, then restarted X, the nouveau drivers were loaded and they 
> worked.  I played around a bit, seeing what kind of functionality there was (I 
> built mesa with the gallium flag enabled) and was pleasantly surprised that 
> despite the warnings about how the 3D accel is incomplete and not supported, 
> most of it worked with a little tweaking here and there.  Including my desktop 
> bling :)
> 
> Then the problems started.  I had a working nouveau setup - or so I thought.  
> After some proper blacklisting and whatnot to prevent the nvidia proprietary 
> drivers from loading, I rebooted to test how the nouveau drivers would load at 
> boot time.  It got to the part about populating dev and the screen just went 
> black.  This is similar to the problems that others were having.  I had push the 
> power button to restart.  Nothing with the display would work.
> 
> Then, I started up using a different kernel version that did not have anything 
> involving nouveau installed to fix things.  I blacklisted the nouveau drivers in 
> the hopes that letting X load the drivers would be different.  No dice.  Same 
> black screen and holding down the power button to restart, only later.  I hate 
> restarting like that because Linux hates restarting like that.
> 
> After some more fiddling around with it, here is the conclusion that I have come to:
> 
> If I start X with the nvidia proprietary drivers, then kill the X, unload all 
> video drivers, change my xorg.conf to load the nouveau drivers, then start X, 
> everything works as it should.  On the other hand, if the first time I try to 
> start X, the nouveau drivers are loaded, I get the black screen.  I'm guessing 
> that this has something to do with the second GPU in the machine that is not 
> enabled in Linux.  I could try to enable it via EFI, but I am not comfortable 
> with that because I am not familiar with messing with that stuff and don't even 
> know the potential consequences of a mistake.  Besides, that's only a guess.  I 
> could also write a script that is executed at startup that automates starting X 
> with nvidia's drivers, killing X, unloading modules, switching xorg.conf files, 
> etc...
> 
> Does anybody have another solution that has been tested and works?  Maybe I just 
> suck at google, but I could not find anything that will help.
> 
> FYI, the hardened install hangs at the same spot, but there is no black screen.  
> It just stops booting and does not log anything.  I have not tried blacklisting 
> the drivers on that install yet and letting X load what it needs.  That might 
> provide some useful info in the logs.  Nothing useful is logged in the 
> non-hardened install, but the hardened install tracks a lot more of what goes on 
> with the system.

You are probably hitting this bug:
https://bugs.freedesktop.org/show_bug.cgi?id=29171


Marcin
