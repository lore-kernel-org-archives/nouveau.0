From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: RFC: Fixing nv30 fbo attachments
Date: Tue, 20 May 2014 15:58:57 -0400
Message-ID: <CAKb7UvgWickCwgdCa-HzwrGeJTkJbNaq0=6TeqOSLUssJ6pmog@mail.gmail.com>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello,

I attempted doing this a while back, before I really understood what
was going on. I got some advice that went totally over my head, and I
dropped the issue. I think I'm much better-prepared to tackle the
issue this time around.

To recap, nv30 (and nv40) hw can't handle certain color/depth format
combinations. Specifically, a 16-bit color format must be paired with
a 16-bit depth format, and a 32-bit color format must be paired with a
32-bit depth format (well, Z24S8). This HW also can't handle different
per-attachment sizes, and also the "linearity" of all the attachments
must be the same. (Whether a surface is linear or not is _generally_
dictated by its w/h, but not always -- POT textures can sometimes end
up allocated linearly by e.g. the ddx, or something else.) The
different sizes are handled by not exposing ARB_fbo. However the rest
of the cases remain.

Now that I kinda understand how things are structured, I was thinking
of doing the following:

When rendering (i.e. draw_vbo & co) and the fbo has changed (and has
one of the problems above), I would instead put in a temporary texture
as the depth attachment. Before actually drawing, I would blit from
the real target texture into the temporary texture, and then when
rendering is done, blit back from the temp texture back into the
target. This deals with the target texture getting modified between
draws with various blits/mapping/whatever.

This means that you'll only get 16 bits of depth even if you ask for
24 with a 16-bit color format, but the alternative seems too
complex/costly.

So there are a few questions from this approach:

1. Where do I get the temporary texture from? (And more importantly --
when... what happens if allocation fails?)

2. Having to blit the depth texture back and forth on every draw seems
_really_ wasteful... anything I can do about that?

Thanks,

  -ilia
