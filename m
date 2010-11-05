From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: Nouveau driver broke my video card?
Date: Fri, 05 Nov 2010 23:12:11 +0100
Message-ID: <1288995131.2334.21.camel@workstation>
References: <20101105125900.GC2135@fujiko>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101105125900.GC2135@fujiko>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francesco Allertsen <fallertsen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Francesco,

you have most probably a hardware defect. Either your vram is defunct or
your gpu has a bounding problem, which is not uncommon on nv50 class
laptop chips.

So I think it doesn't make sense to search a bug on the nouveau side.

-- Lucas

Am Freitag, den 05.11.2010, 13:59 +0100 schrieb Francesco Allertsen: 
> I've used the nouveau drivers for the last few months and worked very
> well, since yesturday!
> 
> Yesturday I was working with my laptop using the external monitor and
> then (doing nothing special) all the video start to render something
> really strange (don't know exactly how to describe it), and at the
> beginning the mouse was working, after some seconds it stops moving and
> everything was frozen.
> 
> I had to reboot my machine with the power on button, and after that at
> the bios I got some strange "red dots" somewhere in the screen during
> the black screen.  After that the lilo started and I cannot see anything
> from the frame buffer (but in the background it was working great).
> 
> I've stopped trying yesturday because I didn't have time, and this
> morning I started again.
> Now I'm not using anymore the -git kernel but the default Slackware
> kernel (2.6.35.7), and I'm using the vesa drivers.
> 
[...] 
> Now, I want to know if it's a nouveau bug or a hardware failure or what
> else, and also whant to understand the "red dots" ad the beginning.
> 
> If you need more information just let me know, and please Cc me as I'm
> not subscribed to the lists.
> 
> Thanks
> 
> Bye
> Francesco
