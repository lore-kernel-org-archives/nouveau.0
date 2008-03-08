From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Current state - how to get gallium-stuff running?
Date: Sat, 8 Mar 2008 08:33:40 +0100
Message-ID: <6d4bc9fc0803072333h7947c5ddo3628c03a21f8144a@mail.gmail.com>
References: <200803072132.23321.hanno@hboeck.de>
	<1204932443.8406.21.camel@CowboyLaputopu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1204932443.8406.21.camel@CowboyLaputopu>
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
To: Christopher James Halse Rogers <chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 3/8/08, Christopher James Halse Rogers <chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, 2008-03-07 at 21:32 +0100, Hanno B=F6ck wrote:
>  > Hi,
>  >
>  > As the last tindc said something about 3d really working on nv4x, I wa=
nted to
>  > try that ( on a NV43). Built nouveau/mesa -> gallium-0.1 branch of mes=
a and
>  > git head of libdrm, kernel-drm and xf86-video-nouveau.
>  >
>
> First, the obligatory disclaimer: "really working" doesn't exactly
>  translate to "Wooo!  I can drop that annoying binary blob!".  You should
>  be able to get textured OpenGL support, and be able to run OpenArena at
>  reasonable framerates until it crashes, though :).
>
>
>  > glxinfo says:
>  > nouveau DRI driver expected DDX version 1-1.2.x but got version 0.0.10
>  >
>
>
> I've seen other people reporting this error.  I've never seen it myself,
>  which suggests to me that it's user error _somewhere_ :).  Can you
>  describe the exact steps you took, and their output.
>
>  For reference, after building & installing git head of libdrm &
>  xf86-video-nouveau, I can clone the
>  git://anongit.freedesktop.org/nouveau/mesa repository, check out the
>  gallium-0.1 branch and "make linux-dri-x86-64 DRI_DIRS=3Dnouveau" to
>  build.  Then exporting LD_LIBRARY_PATH and LIBGL_DRIVERS_PATH to point
>  to the mesa lib/ directory, I could run OpenArena, glxgears, etc.  Not
>  as of yesterday; it would die in emit_fence, but that's the right
>  process.

It may be that DRI_DIRS=3Dnouveau_winsys is needed.

>
>  _______________________________________________
>  Nouveau mailing list
>  Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>  http://lists.freedesktop.org/mailman/listinfo/nouveau
>
