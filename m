From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Missing menus in windows after update
Date: Mon, 28 Apr 2014 14:07:56 -0400
Message-ID: <CAKb7Uvi=x26wZfb+NneywzPCHsjjSPLwH-j2LL-SEunMR9pF3w@mail.gmail.com>
References: <20140427194139.5a9d3594@Devil-Bonobo>
 <CAKb7UviNU=H=G2UarrW1FBZsHfcN2C4rePq290SEhkOKkwKWpg@mail.gmail.com>
 <20140427223301.34aa58d1@Devil-Bonobo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140427223301.34aa58d1@Devil-Bonobo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: John Jason Jordan <johnxj-Wuw85uim5zDR7s880joybQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Apr 28, 2014 at 1:33 AM, John Jason Jordan <johnxj-Wuw85uim5zDR7s880joybQ@public.gmane.org> wrote:
> On Sun, 27 Apr 2014 23:01:57 -0400 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> dijo:
>>On Sun, Apr 27, 2014 at 10:41 PM, John Jason Jordan <johnxj-Wuw85uim5zDR7s880joybQ@public.gmane.org> wrote:
> A couple of weeks ago the Update Manager announced that there were some
> updates. I do not recall exactly what packages were involved, but I
> remember that some of them involved nouveau. About a week ago I finally
> installed them, and that is when the problem began.

Would be great to figure out what all you updated, and what introduced
the regression. I believe package managers tend to keep logs of
things, not sure if the Ubuntu one does or where to find those logs.
I'm sure the internet knows though.

>
>>What kernel version are you using? What mesa version do you have
>>installed?
>
> jjj@Devil-Bonobo:~$ uname -a
> Linux Devil-Bonobo 3.11.0-20-generic #34-Ubuntu SMP Tue Apr 1 20:40:25
> UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
>
> Searching in Synaptic on 'mesa' yielded the following:
>
> mesa-common-dev 9.2.1-1ubuntu3
> libgl1-mesa-dev 9.2.1-1ubuntu3
> linglu1-mesa-dev 9.0.0-1
> libglapi-mesa 9.2.1-iubuntu3
> libgl1-mesa-glx 9.2.1-1ubuntu3
> libglu1-mesa 9.0.0-1
> libgl1-mesa-dri 9.2.1-1ubuntu3
> libtxc-dxtn-s2tc0 0-git20121227-1
> libopeng1-mesa 9.2.1-1ubuntu3
> libegl1-mesa 9.2.1-1ubuntu3
> xscreensaver-gl 5.15-3ubuntu1
> libwxgtk2.8-0 2.8.12.1-14ubuntu1
> libgbm1 9.2.1-1ubuntu3
> libgles2-mesa 9.2.1-1ubuntu3
> libegl1-mesa-drivers 9.2.1-1ubuntu3
>
>>Is this an optimus laptop? If so, do you have the intel card enabled
>>in the BIOS, or is it set to nvidia-only? In that case, unless you've
>>specifically set up GPU offloading, your issues would be with the
>>intel driver.
>
> I believe it is an optimus laptop, but I do not understand much about

Based on the information easily found online it actually doesn't
appear to be optimus. But it can be hard to tell.

> those things. I have never touched the BIOS, so it is at the default
> that System76 shipped it with. I do know that the nouveau driver is
> installed and loaded. I do not do gaming or anything that needs fancy
> high speed graphics.
>
>>Can you provide your dmesg + Xorg log? That will answer some of the
>>above questions.
>
> Both are really long documents. I did read through the Xorg.0.log file

We live in the future. Emails can be large now. Attach them, or
include them inline... either way. Just for giggles, also include
lspci -nn output.

> and found no real error messages. It also noted that the nouveau driver
> was loaded, and that it tried to load the nvidia driver but failed
> because it is not installed. There is no xorg.conf file.
>
>>Are you using a compositor? If so, what happens if you turn it off (or
>>tell it not to use OpenGL, if that's an option).
>
> I have never been interested in special effects, 3D, etc., so it is
> using only whatever is installed and set up by default.

Again, we live in the future. Apparently someone decided that everyone
loves special effects, and can't live without them, so they are often
turned on by default. [Much as they decided that the only use-case for
laptops is watching movies and so you can only get WS LCD's now, and
that brightness == quality, so you have to wear sunglasses when
looking at any modern displays, but I digress.] As I try to stay away
from ubuntu & co, I don't really know what the defaults are these
days. But if it includes gnome-shell, that definitely likes to use GL.
Not sure if you can tell it not to...

  -ilia
