From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: ARB_depth_texture regression on nouveau since 9.1
Date: Wed, 5 Mar 2014 04:57:02 -0500
Message-ID: <CAKb7UvjJTcP38QALXtwCM9B2J+oh0OzABFmmMqTvvmm_hFv5RQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello,

I've been tracking down a regression in fbo-generatemipmap-formats
with ARB_depth_texture on nouveau (nv50 and nvc0 are affected) since
http://cgit.freedesktop.org/mesa/mesa/commit/?id=0a1479c829ed34a65e60c6619a8164e1b079aaee

FTR, the test I'm running is:

bin/fbo-generatemipmap-formats GL_ARB_depth_texture -fbo -auto

Looking at the displayed output (without -fbo -auto), it looks like
level 0 is fine, but all the subsequent levels are variously mangled.
(For anyone trying to repro this, there's a _really_ annoying effect
that allocations are relatively constant across runs, so running a
working version can cause a broken version to appear to work. Running
max-texture-size clears it up nicely.)

As you might expect, making format == GL_DEPTH_COMPONENT go to the
fallback in st_TexSubImage at HEAD fixes it too, but I don't think
that's desired. This ends up taking the blit_3d path in
nv50_surface.c.

Of note is that on nva0+, GL_DEPTH_COMPONENT16 seems to work fine,
which is also where the Z16_MSX_LSR storage type appeared, so probably
not a coincidence. But a bit surprising is that on nva0+ it does work
for Z16, but still not for the other ones. Makes me think this is a
storage type/tiling-related situation. The blit code has this:

/* Since shaders cannot export stencil, we cannot copy stencil values when
 * rendering to ZETA, so we attach the ZS surface to a colour render target.
 */
static INLINE enum pipe_format
nv50_blit_zeta_to_colour_format(enum pipe_format format)

Getting rid of that conversion naturally breaks stuff... by also
hacking up nv50_blit_select_mode, I can restore it to a very similar
broken mode as without the hackery (adding further hackery to force it
to use zsbuf instead of cbuf breaks everything, but I suspect even
more hackery could be performed to make it work). Unfortunately I
don't know enough about this storage type business, and what effect it
has on things like render targets, esp if you're lying about the type
(i.e. it's trying to render to a Z24X8 texture/memtype as if it were
RGBA8).

Any ideas/suggestions appreciated.

  -ilia
