From: Pouar <thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Virtualbox 3D accel broken in xf86-video-nouveau 1.0.3
Date: Thu, 01 Nov 2012 11:13:03 -0500
Message-ID: <50929F8F.2020704@gmail.com>
References: <ae50d07e2ee8ebb3be8f6c1277aaa895@www.spursdown.info>
	<50901C68.7020605@gmail.com> <50901CDD.7050008@gmail.com>
	<20121031222714.GA4464@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1632225350=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20121031222714.GA4464-OI9uyE9O0yo@public.gmane.org>
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

This is a multi-part message in MIME format.
--===============1632225350==
Content-Type: multipart/alternative;
 boundary="------------010907090409080206070003"

This is a multi-part message in MIME format.
--------------010907090409080206070003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012/10/31 17:27, Marcin Slusarz wrote:
> On Tue, Oct 30, 2012 at 01:30:53PM -0500, Pouar wrote:
>>     On 10/30/2012 01:28 PM, Pouar wrote:
>>
>>     On 10/28/2012 01:21 PM, Pouar wrote:
>>
>>     On 10/28/2012 01:18 PM, Emil Velikov wrote:
>>
>>       On Sun, 28 Oct 2012 01:15:54 -0000, Pouar wrote:
>>
>>       there's a regression in the xf86-video-nouveau driver that came up
>>       in
>>       1.0.3 that causes the desktop to bounce around in virtualbox
>>       whenever
>>       using HW acceleration in cinnamon and gnome 3, but not in fallback
>>       or
>>       cinnamon 2d, only happens in virtualbox and not the host, I've
>>       confirmed
>>       it was the graphics driver on the host because it happened with the
>>       1.0.3 driver but not the 1.0.2.
>>       anyone else having this problem? I'm using GeForce GTX 560 Ti
>>
>>       Hi Pouar
>>       Can you open a bug, following these instructions [1]
>>       Ideally you can try bisecting the issue - there are only 10 changes
>>       that may have caused the issue
>>       Cheers
>>       Emil
>>       [1] [1]http://nouveau.freedesktop.org/wiki/Bugs
>>
>>       I just did
>>
>>     --
>>     Pouar
>>
>>       by I just did I meant the bug report, not the bisecting, I have zero
>>       experience with driver programming, much less graphics driver
>>       programming, so I wouldn't know what to look for, I signed up for
>>       this mailing list to keep track of the different driver issues and
>>       bugs and their progress
> You don't need to have any experience in driver programming to bisect this bug.
>
> git clone git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau/
> cd xf86-video-nouveau/
> ./autogen.sh
> make
>
> If you can compile successfully, do:
>
> 1) git bisect start xf86-video-nouveau-1.0.3 xf86-video-nouveau-1.0.2
> 2) make && sudo rm /usr/lib/xorg/modules/drivers/nouveau_drv.so && sudo cp src/.libs/nouveau_drv.so /usr/lib/xorg/modules/drivers
> 3) Restart X. Try to reproduce the bug.
> 4) If you can't reproduce it - do "git bisect good", if you can - do "git bisect bad".
> 5) Go to 2). After ~4 compiles it will tell you about first bad commit - this
> is what we want to see.
>
> Marcin
Did the bisect today. Here's what I got:

297fd0d0755bda698be1d0b30cc60a41d7673c0b is the first bad commit
commit 297fd0d0755bda698be1d0b30cc60a41d7673c0b
Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Tue Oct 16 16:15:16 2012 +1000

     nouveau/dri2: fix pixmap/window offset calcs.

     This should fix prime rendering under kwin, and not break it under the
     others.

     Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 10860842c2d9ff579e3e0b46b1edfc332d40b311 
886ca8b5c05779ee410c6d14575b4805016b71af M    src
-- 
Pouar

--------------010907090409080206070003
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2012/10/31 17:27, Marcin Slusarz
      wrote:<br>
    </div>
    <blockquote cite="mid:20121031222714.GA4464-OI9uyE9O0yo@public.gmane.org" type="cite">
      <pre wrap="">On Tue, Oct 30, 2012 at 01:30:53PM -0500, Pouar wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">   On 10/30/2012 01:28 PM, Pouar wrote:

   On 10/28/2012 01:21 PM, Pouar wrote:

   On 10/28/2012 01:18 PM, Emil Velikov wrote:

     On Sun, 28 Oct 2012 01:15:54 -0000, Pouar wrote:

     there's a regression in the xf86-video-nouveau driver that came up
     in
     1.0.3 that causes the desktop to bounce around in virtualbox
     whenever
     using HW acceleration in cinnamon and gnome 3, but not in fallback
     or
     cinnamon 2d, only happens in virtualbox and not the host, I've
     confirmed
     it was the graphics driver on the host because it happened with the
     1.0.3 driver but not the 1.0.2.
     anyone else having this problem? I'm using GeForce GTX 560 Ti

     Hi Pouar
     Can you open a bug, following these instructions [1]
     Ideally you can try bisecting the issue - there are only 10 changes
     that may have caused the issue
     Cheers
     Emil
     [1] [1]<a class="moz-txt-link-freetext" href="http://nouveau.freedesktop.org/wiki/Bugs">http://nouveau.freedesktop.org/wiki/Bugs</a>

     I just did

   --
   Pouar

     by I just did I meant the bug report, not the bisecting, I have zero
     experience with driver programming, much less graphics driver
     programming, so I wouldn't know what to look for, I signed up for
     this mailing list to keep track of the different driver issues and
     bugs and their progress
</pre>
      </blockquote>
      <pre wrap="">
You don't need to have any experience in driver programming to bisect this bug.

git clone git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau/
cd xf86-video-nouveau/
./autogen.sh
make

If you can compile successfully, do:

1) git bisect start xf86-video-nouveau-1.0.3 xf86-video-nouveau-1.0.2
2) make &amp;&amp; sudo rm /usr/lib/xorg/modules/drivers/nouveau_drv.so &amp;&amp; sudo cp src/.libs/nouveau_drv.so /usr/lib/xorg/modules/drivers
3) Restart X. Try to reproduce the bug.
4) If you can't reproduce it - do "git bisect good", if you can - do "git bisect bad".
5) Go to 2). After ~4 compiles it will tell you about first bad commit - this
is what we want to see.

Marcin
</pre>
    </blockquote>
    Did the bisect today. Here's what I got:<br>
    <br>
    297fd0d0755bda698be1d0b30cc60a41d7673c0b is the first bad commit<br>
    commit 297fd0d0755bda698be1d0b30cc60a41d7673c0b<br>
    Author: Dave Airlie <a class="moz-txt-link-rfc2396E"
      href="mailto:airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">&lt;airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org&gt;</a><br>
    Date:&nbsp;&nbsp; Tue Oct 16 16:15:16 2012 +1000<br>
    <br>
    &nbsp;&nbsp;&nbsp; nouveau/dri2: fix pixmap/window offset calcs.<br>
    &nbsp;&nbsp;&nbsp; <br>
    &nbsp;&nbsp;&nbsp; This should fix prime rendering under kwin, and not break it
    under the<br>
    &nbsp;&nbsp;&nbsp; others.<br>
    &nbsp;&nbsp;&nbsp; <br>
    &nbsp;&nbsp;&nbsp; Signed-off-by: Dave Airlie <a class="moz-txt-link-rfc2396E"
      href="mailto:airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">&lt;airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org&gt;</a><br>
    <br>
    :040000 040000 10860842c2d9ff579e3e0b46b1edfc332d40b311
    886ca8b5c05779ee410c6d14575b4805016b71af M&nbsp;&nbsp;&nbsp; src<br>
    <div class="moz-signature">-- <br>
      <font color="000000">Pouar</font></div>
  </body>
</html>

--------------010907090409080206070003--

--===============1632225350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1632225350==--
