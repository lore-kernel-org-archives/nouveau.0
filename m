From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42384] X fails on NV11 with Error allocating scanout
	buffer: 0
Date: Sun, 30 Oct 2011 10:55:48 +0000
Message-ID: <bug-42384-8800-6tYp2JBAPo@http.bugs.freedesktop.org/>
References: <bug-42384-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-42384-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=42384

--- Comment #4 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-10-30 03:55:48 PDT ---
On Sat, Oct 29, 2011 at 11:26:59PM +0100, Chris Paulson-Ellis wrote:
> On 29/10/11 22:06, Chris Paulson-Ellis wrote:
> > On 29/10/11 14:10, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org wrote:
> >> https://bugs.freedesktop.org/show_bug.cgi?id=42384
> >>
> >> --- Comment #3 from Marcin Slusarz<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  
> >> 2011-10-29 13:10:12 UTC ---
> >> Does it work if you lower bpp/resolution for framebuffer and/or xserver?
> >>
> >
> > Can't get bugzilla to work for this comment at present,...

Then please CC bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org - mails will be automatically
appended to bugreport.

> > Yes. It works if I reduce the framebuffer and the X server to 800x600 
> > 16bpp. Just reducing to 16bpp doesn't work. Just changing the X server 
> > doesn't work, I have to change the framebuffer too.
> >
> > The card has 64MiB.

Nouveau detects only 16 MB of VRAM. Can you verify it by looking at the card?
According to http://www.nvidia.com/page/geforce2go.html there were 16, 32
and 64 MB versions of GeForce2 Go.

Very similar bug was reported few months ago:
http://lists.freedesktop.org/archives/nouveau/2011-July/008631.html

Can you test patch (hack) posted there?

> I can also get it to work using "NoAccel", including at full 1600x1200, 
> depth 24, although obviously with fbdev-like performance.

Note: that's almost half of your VRAM.

Marcin

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
