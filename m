From: "Emil Velikov" <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [error] xf86-video-nouveau on OpenBSD
Date: Wed, 11 Apr 2012 19:34:04 +0100
Message-ID: <op.wcl5u2ji8t7z9u@arch-laptop>
References: <4F85C695.2070008@ymail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4F85C695.2070008-DaQTI0RpDDMAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: rustyBSD <cypherique-DaQTI0RpDDMAvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 11 Apr 2012 18:59:49 +0100, rustyBSD <cypherique-DaQTI0RpDDMAvxtiuMwx3w@public.gmane.org> wrote:

> Hi,
> I'm trying to compile nouveau on OpenBSD, but I always get an error  
> message.
Hello rusty

One thing that you should be aware is that you would need a drm(or ported)
kernel module as nouveau does provide KMS only

Secondly, take into account that I'm not a BSD person


>
> I have already compiled libdrm like this :
> echo "/usr/X11R6/share/aclocal" >> /usr/local/share/aclocal/dirlist
> ./configure --enable-nouveau-experimental-api
> make
> make install
By doing so you are installing everything to /usr/local


>
> There wasn't any problem.
>
> Then, I try to compile xf86-video-nouveau with :
> ./configure
> make
>
> But I get this error message :
>
>   CC     nvc0_exa.lo
>   CC     nvc0_xv.lo
>   CC     drmmode_display.lo
> drmmode_display.c: In function 'drmmode_page_flip':
> drmmode_display.c:1319: warning: implicit declaration of function
> 'drmModePageFlip'
'drmModePageFlip' is defined in xf86drmMode.h
Which in your case cannot be found due to being provided by libdrm
(located in /usr/local)
Or
The build system may be using outdated xf86drm* headers


> drmmode_display.c: In function 'drmmode_screen_init':
> drmmode_display.c:1476: error: 'drmEventContext' has no member named
> 'page_flip_handler'
> *** Error code 1
>
> Stop in /home/xf86-video-nouveau-0.0.10/xf86-video-nouveau/src (line 448
> of Makefile).
> *** Error code 1
>
> Stop in /home/xf86-video-nouveau-0.0.10/xf86-video-nouveau (line 373 of
> Makefile).
> *** Error code 1
>
> Stop in /home/xf86-video-nouveau-0.0.10/xf86-video-nouveau (line 282 of
> Makefile).
>
> Any idea ?Is there anybody who can help me ?
 From what I can see you have two options
* Install libdrm to /usr
...; ./configure --enable-nouveau-experimental-api --prefix=/usr/; ...

or
* Consult with OpenBSD/automake guys how to educate automake that the
headers are located in /us/local

Cheers,
Emil


>
> Thanks !
