From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Thu, 16 Jan 2014 18:34:01 +0000
Message-ID: <bug-58378-8800-hzZ0MQgwRm@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0818563190=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0818563190==
Content-Type: multipart/alternative; boundary="1389897241.F62e7D3.6419"; charset="us-ascii"


--1389897241.F62e7D3.6419
Date: Thu, 16 Jan 2014 18:34:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #85 from Thomas <tomshere-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org> ---
(In reply to comment #82)
> > I also have these errors in dmesg 
> > 
> > [   18.985158] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
> > FAULT at 0x00fd94
> > [   18.986213] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
> > FAULT at 0x103d94
> > [   19.026027] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010
> > FAULT at 0x10200c
> 
> Hmm - your kernel and your nvapeek results clearly suggest you should be
> affected...
> 
> Have you enabled compiz(...)

No I don't think so.

> > [   18.984164] nouveau E[  PTHERM][0000:01:00.0] unhandled intr 0x00000161
> 
> This last "PTHERM" error seems to be a different, unrelated issue.
> 
> > When I use the kernel option nouveau.config=PCRYPT=0 it doesn't eliminate
> > the errors and X still hangs when resuming.
> 
> Hmm - interesting, as I clearly don't have any issues with suspend/resume.
> Which laptop do you have? Did you already update your BIOS to the latest
> available version?
> 
> > I was not sure if I have to set the parameter in quotes.
> 
> No, you don't (and AFAIK, you even must not). Ilia has already proposed the
> correct workaround for the distortion issue (until your distro of choice has
> integrated the new fix) - add this:
> 
> nouveau.config=PCRYPT=0,PVP=0,PBSP=0,PMPEG=0
> 
> to your grub kernel parameters. Having done so, all "MMIO write" errors in
> dmesg must be gone (they are for me!), otherwise something else is still
> wrong for you in addition.

Ok, now after adding the whole bunch to the kernel opts the three PBUS errors
are gone. For the resume failure I open a new issue.

How can I push the integration of such a fix into another distro?

Many thanks!
-Thomas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389897241.F62e7D3.6419
Date: Thu, 16 Jan 2014 18:34:01 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c85">Comment # 85</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:tomshere&#64;t-online.de" title="Thomas &lt;tomshere&#64;t-online.de&gt;"> <span class="fn">Thomas</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58378#c82">comment #82</a>)
<span class="quote">&gt; &gt; I also have these errors in dmesg 
&gt; &gt; 
&gt; &gt; [   18.985158] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
&gt; &gt; FAULT at 0x00fd94
&gt; &gt; [   18.986213] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
&gt; &gt; FAULT at 0x103d94
&gt; &gt; [   19.026027] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010
&gt; &gt; FAULT at 0x10200c
&gt; 
&gt; Hmm - your kernel and your nvapeek results clearly suggest you should be
&gt; affected...
&gt; 
&gt; Have you enabled compiz(...)</span >

No I don't think so.

<span class="quote">&gt; &gt; [   18.984164] nouveau E[  PTHERM][0000:01:00.0] unhandled intr 0x00000161
&gt; 
&gt; This last &quot;PTHERM&quot; error seems to be a different, unrelated issue.
&gt; 
&gt; &gt; When I use the kernel option nouveau.config=PCRYPT=0 it doesn't eliminate
&gt; &gt; the errors and X still hangs when resuming.
&gt; 
&gt; Hmm - interesting, as I clearly don't have any issues with suspend/resume.
&gt; Which laptop do you have? Did you already update your BIOS to the latest
&gt; available version?
&gt; 
&gt; &gt; I was not sure if I have to set the parameter in quotes.
&gt; 
&gt; No, you don't (and AFAIK, you even must not). Ilia has already proposed the
&gt; correct workaround for the distortion issue (until your distro of choice has
&gt; integrated the new fix) - add this:
&gt; 
&gt; nouveau.config=PCRYPT=0,PVP=0,PBSP=0,PMPEG=0
&gt; 
&gt; to your grub kernel parameters. Having done so, all &quot;MMIO write&quot; errors in
&gt; dmesg must be gone (they are for me!), otherwise something else is still
&gt; wrong for you in addition.</span >

Ok, now after adding the whole bunch to the kernel opts the three PBUS errors
are gone. For the resume failure I open a new issue.

How can I push the integration of such a fix into another distro?

Many thanks!
-Thomas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389897241.F62e7D3.6419--

--===============0818563190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0818563190==--
