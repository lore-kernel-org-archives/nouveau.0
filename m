From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Wed, 15 Jan 2014 23:57:27 +0000
Message-ID: <bug-58378-8800-UXBjw5OZ8a@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1227737305=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1227737305==
Content-Type: multipart/alternative; boundary="1389830247.FFE4A33.23579"; charset="us-ascii"


--1389830247.FFE4A33.23579
Date: Wed, 15 Jan 2014 23:57:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #82 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hi Thomas,

> I have the same NVIDIA GeForce NVS 130M with the disabled functions.
> I checked with nvapeek:
> 0000154c: 0000009c
> 00001540: b1010001

great - finally somebody who confirms this issue.

> uname -a delivers
> Linux mobuntu 3.11.0-15-generic #23-Ubuntu SMP Mon Dec 9 18:17:04 UTC 2013
> x86_64 x86_64 x86_64 GNU/Linux

> I do not have any issues with distorted graphics during normal usage but my
> problem is that resume from suspend mode makes X hang.

> I also have these errors in dmesg 
> 
> [   18.985158] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
> FAULT at 0x00fd94
> [   18.986213] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
> FAULT at 0x103d94
> [   19.026027] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010
> FAULT at 0x10200c

Hmm - your kernel and your nvapeek results clearly suggest you should be
affected...

Have you enabled compiz (i.e. OpenGL-based 3D acceleration features)? I assume
that so far, you haven't (it does not seem to be active in Ubuntu by default),
which most likely is the only reason why you are not seeing the distortion
issue (so far).

See e.g.

http://www.howtoforge.com/install-compiz-on-the-unity-desktop-on-ubuntu-12.04-precise-pangolin

(depending on your particular Ubuntu version) on how to enable compiz. I am
almost certain that once you have done so, you will also run see the distorted
graphics, but you now already know the fix... ;-)

> [   18.984164] nouveau E[  PTHERM][0000:01:00.0] unhandled intr 0x00000161

This last "PTHERM" error seems to be a different, unrelated issue.

> When I use the kernel option nouveau.config=PCRYPT=0 it doesn't eliminate
> the errors and X still hangs when resuming.

Hmm - interesting, as I clearly don't have any issues with suspend/resume.
Which laptop do you have? Did you already update your BIOS to the latest
available version?

> I was not sure if I have to set the parameter in quotes.

No, you don't (and AFAIK, you even must not). Ilia has already proposed the
correct workaround for the distortion issue (until your distro of choice has
integrated the new fix) - add this:

nouveau.config=PCRYPT=0,PVP=0,PBSP=0,PMPEG=0

to your grub kernel parameters. Having done so, all "MMIO write" errors in
dmesg must be gone (they are for me!), otherwise something else is still wrong
for you in addition.

Hope this helps & best regards,
Andreas


BTW @ Ilia:
Did you already have a chance to contact Ben Skeggs about applying the fix to
mainline RHEL 6.5 (and above) kernels?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389830247.FFE4A33.23579
Date: Wed, 15 Jan 2014 23:57:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c82">Comment # 82</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hi Thomas,

<span class="quote">&gt; I have the same NVIDIA GeForce NVS 130M with the disabled functions.
&gt; I checked with nvapeek:
&gt; 0000154c: 0000009c
&gt; 00001540: b1010001</span >

great - finally somebody who confirms this issue.

<span class="quote">&gt; uname -a delivers
&gt; Linux mobuntu 3.11.0-15-generic #23-Ubuntu SMP Mon Dec 9 18:17:04 UTC 2013
&gt; x86_64 x86_64 x86_64 GNU/Linux</span >

<span class="quote">&gt; I do not have any issues with distorted graphics during normal usage but my
&gt; problem is that resume from suspend mode makes X hang.</span >

<span class="quote">&gt; I also have these errors in dmesg 
&gt; 
&gt; [   18.985158] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
&gt; FAULT at 0x00fd94
&gt; [   18.986213] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
&gt; FAULT at 0x103d94
&gt; [   19.026027] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010
&gt; FAULT at 0x10200c</span >

Hmm - your kernel and your nvapeek results clearly suggest you should be
affected...

Have you enabled compiz (i.e. OpenGL-based 3D acceleration features)? I assume
that so far, you haven't (it does not seem to be active in Ubuntu by default),
which most likely is the only reason why you are not seeing the distortion
issue (so far).

See e.g.

<a href="http://www.howtoforge.com/install-compiz-on-the-unity-desktop-on-ubuntu-12.04-precise-pangolin">http://www.howtoforge.com/install-compiz-on-the-unity-desktop-on-ubuntu-12.04-precise-pangolin</a>

(depending on your particular Ubuntu version) on how to enable compiz. I am
almost certain that once you have done so, you will also run see the distorted
graphics, but you now already know the fix... ;-)

<span class="quote">&gt; [   18.984164] nouveau E[  PTHERM][0000:01:00.0] unhandled intr 0x00000161</span >

This last &quot;PTHERM&quot; error seems to be a different, unrelated issue.

<span class="quote">&gt; When I use the kernel option nouveau.config=PCRYPT=0 it doesn't eliminate
&gt; the errors and X still hangs when resuming.</span >

Hmm - interesting, as I clearly don't have any issues with suspend/resume.
Which laptop do you have? Did you already update your BIOS to the latest
available version?

<span class="quote">&gt; I was not sure if I have to set the parameter in quotes.</span >

No, you don't (and AFAIK, you even must not). Ilia has already proposed the
correct workaround for the distortion issue (until your distro of choice has
integrated the new fix) - add this:

nouveau.config=PCRYPT=0,PVP=0,PBSP=0,PMPEG=0

to your grub kernel parameters. Having done so, all &quot;MMIO write&quot; errors in
dmesg must be gone (they are for me!), otherwise something else is still wrong
for you in addition.

Hope this helps &amp; best regards,
Andreas


BTW &#64; Ilia:
Did you already have a chance to contact Ben Skeggs about applying the fix to
mainline RHEL 6.5 (and above) kernels?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389830247.FFE4A33.23579--

--===============1227737305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1227737305==--
