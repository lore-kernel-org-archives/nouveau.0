From: "Younes Manton" <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Interested in helping Nouveau
Date: Tue, 19 Aug 2008 20:30:14 -0400
Message-ID: <586c2acd0808191730w79c181fek491abba3cba6a94e@mail.gmail.com>
References: <cad96db0808191037u42e9be1ene715b966881452ed@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <cad96db0808191037u42e9be1ene715b966881452ed-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Branan Riley <branan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

The first thing you might want to do is build and run the driver with
your current machine. The driver is made up of three parts: the DDX
driver (xf86-video-nouveau), the DRM driver (nouveau.ko), and the Mesa
driver (nouveau_dri.so). The minimum you need for X is the DDX and
DRM, the Mesa driver is for 3D. I suggest you start with the DDX
driver and make yourself familiar with that, since not many people
will be able to help you with the 3D stuff. You might find the XRender
parts of DDX of interest, since it makes use of the 3D engine to do
2D.

Useful stuff:

DDX source: git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau
DRM source: git://anongit.freedesktop.org/git/mesa/drm

You can drop by #nouveau on Freenode and hang around there also for
general info. From what I understand the Nouveau project has some
recent experience in mentoring people who are interested in
contributing.

On Tue, Aug 19, 2008 at 1:37 PM, Branan Riley <branan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi everyone,
>
> I know there's a TODO page on the wiki, but it's kind of old (may),
> and it doesn't really indicate priorities. So I thought I'd list my
> skillset and interests here, and let those who are experienced with
> nouveau development point me to a good place to start.
>
> I'm currently running a P4 (presler) with a GeForce 6600. The family
> gaming macine is being upgraded soon (hopefully before the end of the
> month, it keeps getting put off). When that happens, I'll have a Core
> 2 Quad (Kentsfield), and I've bought myself a GeForce 8600 (though I
> haven't set it up in my P4 system - waiting for the kentsfield).
>
> I'm self-taught in OpenGL, mostly in the programmable area rather than
> the old fixed-function pipeline. I can do FBOs, VBOs, and all three
> shader types with a certain amount of skill, and I understand the
> basics of instancing and transform feedback (though I've never used
> them except in experiments).
>
> I'm very interested in how low-level hardware programming works (I
> wrote a bootloader that set up protected-mode and created a scrollable
> text buffer, but never added enough to make it a real OS - got
> absorbed in graphics stuff).
>
> Ideally, I'd like to work on the lower-level stuff, if there are any
> good "get my feet wet" sort of tasks there, and if those of you who
> are familiar with the code are willing to put up with helping me
> figure out how it all works. If not, I'd love to contribute by writing
> OpenGL test cases, and by contributing MMIO traces and renouveau
> dumps.
>
> Branan
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
