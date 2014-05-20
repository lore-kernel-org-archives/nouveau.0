From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Subject: Re: RFC: Fixing nv30 fbo attachments
Date: Tue, 20 May 2014 22:51:15 +0200
Message-ID: <CAAxE2A6n37vZ324dH-jmJ7W5grGj73_85rcvegpr-rOwQJ3xDw@mail.gmail.com>
References: <CAKb7UvgWickCwgdCa-HzwrGeJTkJbNaq0=6TeqOSLUssJ6pmog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UvgWickCwgdCa-HzwrGeJTkJbNaq0=6TeqOSLUssJ6pmog@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Tue, May 20, 2014 at 9:58 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> Hello,
>
> I attempted doing this a while back, before I really understood what
> was going on. I got some advice that went totally over my head, and I
> dropped the issue. I think I'm much better-prepared to tackle the
> issue this time around.
>
> To recap, nv30 (and nv40) hw can't handle certain color/depth format
> combinations. Specifically, a 16-bit color format must be paired with
> a 16-bit depth format, and a 32-bit color format must be paired with a
> 32-bit depth format (well, Z24S8). This HW also can't handle different
> per-attachment sizes, and also the "linearity" of all the attachments
> must be the same. (Whether a surface is linear or not is _generally_
> dictated by its w/h, but not always -- POT textures can sometimes end
> up allocated linearly by e.g. the ddx, or something else.) The
> different sizes are handled by not exposing ARB_fbo. However the rest
> of the cases remain.
>
> Now that I kinda understand how things are structured, I was thinking
> of doing the following:
>
> When rendering (i.e. draw_vbo & co) and the fbo has changed (and has
> one of the problems above), I would instead put in a temporary texture
> as the depth attachment. Before actually drawing, I would blit from
> the real target texture into the temporary texture, and then when
> rendering is done, blit back from the temp texture back into the
> target. This deals with the target texture getting modified between
> draws with various blits/mapping/whatever.
>
> This means that you'll only get 16 bits of depth even if you ask for
> 24 with a 16-bit color format, but the alternative seems too
> complex/costly.
>
> So there are a few questions from this approach:
>
> 1. Where do I get the temporary texture from? (And more importantly --
> when... what happens if allocation fails?)
>
> 2. Having to blit the depth texture back and forth on every draw seems
> _really_ wasteful... anything I can do about that?

You can do that in set_framebuffer_state. When binding, blit to a
depth buffer which matches the colorbuffer format. When unbinding,
blit back.

You can also drop support for 16-bit formats.

What about rendering to R16F, RG16F, and RGBA16F? Does R16F have to be
coupled with a 16-bit depth buffer too?

Marek
