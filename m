From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56340] [Ubuntu 10.04.4 LTS 32-bit] Severe
 instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2
 M64 graphics
Date: Mon, 05 Nov 2012 11:50:45 +0000
Message-ID: <bug-56340-8800-w8zLhlvioV@http.bugs.freedesktop.org/>
References: <bug-56340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0617969119=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56340-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0617969119==
Content-Type: multipart/alternative; boundary="1352116245.c1Dc4a2.28991"; charset="us-ascii"


--1352116245.c1Dc4a2.28991
Date: Mon, 5 Nov 2012 11:50:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56340

--- Comment #6 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #4)
> (In reply to comment #3)
...
> I have tested this mainboard with many many, NVIDIA, ATI Technologies,
> ...
> I don't have another mainboard with Apollo MVP3 chipset to do comparison,
> either.
> 
Point taken

...
> But Canonical still supports Ubuntu 10.04 LTS so I am trying to get the bug
> ...
> want the bugs in the older software to be fixed.
> 
There has been approx 1630 commits since then, some of which may have sorted
your issue(s). Despite the fact that bugs for older kernels should be fixed,
atm nouveau does not have enough manpower do so.
iirc, we are trying to get 3.x kernels into decent shape 

If you insist on getting this bug sorted as part of your support contract with
Ubuntu, refer to them for further assistance

...
> > * Can you try a distro based on a newer kernel. The best choice would be a
> > Fedora LiveCD
> > 
>
> Strangely, FIC VA-503+ mainboard doesn't even boot with Ubuntu 12.04 LTS due
> ...
> I am planning to file a bug report regarding this issue soon.
> 
I have explicitly mentioned the Fedora images rather than Ubuntu
* You do not need an LTS distro for this
* It serves to find out if the issue is fixed or not, rather than replacing
your setup

General rule of thumb is, the newer the better

...
> > Issue 1. Take an image of the boot messages, during bootup if your system
> > crashes and the logs are not retrieve-able
> > 
> 
> I believe I attached a .tar.gz file to this bug report.
> ...
> If you can download that and analyze it, I will appreciate.
> 
The tar.gz is present but the logs do not indicate when they were retrieved
* Before, during or after the boot issue
* If the system freezes and cannot start X, consider using serial
console/taking a picture of the issue

...
> > Issue 2. Try and triangulate what causes the freeze, specific program,
> > suspend/resume cycle etc.
> > 
> 
> The mainboard is so old that its ACPI doesn't support S3 State.
> 
For the sake of me I cannot list all the things that can cause your issue

...
> I believe I have done enough testing to be able to reproduce the freeze very
> reliably.
> 
This would be useful. Consider using this format

ex.
1. Open up Firefox
2. Go to bbc.co.uk
3. Observe crash as the flash content is loaded
4. describe the crash, attach Xorg.log/picture if applicable

...
> If you don't want to open a .tar.gz file, you can view the log files here.
> 
OMG you got me

...
> Note that I do put a lot of effort writing these bug reports, trying to get
> Linux developers to fix bugs, and I do my best with my current limited
> knowledge of Linux to provide whatever information the developer needs.
> 
Thanks for taking the time

A few friendly notes
* Try to divide and concour - simplify the complex situation you're into
* Spend a couple of minutes reading through the link [1] provided. It indicated
what is relevant and what is not
* If you provide alot more or not enough information your chances and
decreasing rapidly. Skim through some Resolved/Fixed bugs, to get the general
idea

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352116245.c1Dc4a2.28991
Date: Mon, 5 Nov 2012 11:50:45 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340">bug 56340</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=56340#c4">comment #4</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=56340#c3">comment #3</a>)</span >
...
<span class="quote">&gt; I have tested this mainboard with many many, NVIDIA, ATI Technologies,
&gt; ...
&gt; I don't have another mainboard with Apollo MVP3 chipset to do comparison,
&gt; either.
&gt; </span >
Point taken

...
<span class="quote">&gt; But Canonical still supports Ubuntu 10.04 LTS so I am trying to get the bug
&gt; ...
&gt; want the bugs in the older software to be fixed.
&gt; </span >
There has been approx 1630 commits since then, some of which may have sorted
your issue(s). Despite the fact that bugs for older kernels should be fixed,
atm nouveau does not have enough manpower do so.
iirc, we are trying to get 3.x kernels into decent shape 

If you insist on getting this bug sorted as part of your support contract with
Ubuntu, refer to them for further assistance

...
<span class="quote">&gt; &gt; * Can you try a distro based on a newer kernel. The best choice would be a
&gt; &gt; Fedora LiveCD
&gt; &gt; </span >
&gt;
<span class="quote">&gt; Strangely, FIC VA-503+ mainboard doesn't even boot with Ubuntu 12.04 LTS due
&gt; ...
&gt; I am planning to file a bug report regarding this issue soon.
&gt; </span >
I have explicitly mentioned the Fedora images rather than Ubuntu
* You do not need an LTS distro for this
* It serves to find out if the issue is fixed or not, rather than replacing
your setup

General rule of thumb is, the newer the better

...
<span class="quote">&gt; &gt; Issue 1. Take an image of the boot messages, during bootup if your system
&gt; &gt; crashes and the logs are not retrieve-able
&gt; &gt; 
&gt; 
&gt; I believe I attached a .tar.gz file to this bug report.
&gt; ...
&gt; If you can download that and analyze it, I will appreciate.
&gt; </span >
The tar.gz is present but the logs do not indicate when they were retrieved
* Before, during or after the boot issue
* If the system freezes and cannot start X, consider using serial
console/taking a picture of the issue

...
<span class="quote">&gt; &gt; Issue 2. Try and triangulate what causes the freeze, specific program,
&gt; &gt; suspend/resume cycle etc.
&gt; &gt; 
&gt; 
&gt; The mainboard is so old that its ACPI doesn't support S3 State.
&gt; </span >
For the sake of me I cannot list all the things that can cause your issue

...
<span class="quote">&gt; I believe I have done enough testing to be able to reproduce the freeze very
&gt; reliably.
&gt; </span >
This would be useful. Consider using this format

ex.
1. Open up Firefox
2. Go to bbc.co.uk
3. Observe crash as the flash content is loaded
4. describe the crash, attach Xorg.log/picture if applicable

...
<span class="quote">&gt; If you don't want to open a .tar.gz file, you can view the log files here.
&gt; </span >
OMG you got me

...
<span class="quote">&gt; Note that I do put a lot of effort writing these bug reports, trying to get
&gt; Linux developers to fix bugs, and I do my best with my current limited
&gt; knowledge of Linux to provide whatever information the developer needs.
&gt; </span >
Thanks for taking the time

A few friendly notes
* Try to divide and concour - simplify the complex situation you're into
* Spend a couple of minutes reading through the link [1] provided. It indicated
what is relevant and what is not
* If you provide alot more or not enough information your chances and
decreasing rapidly. Skim through some Resolved/Fixed bugs, to get the general
idea</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352116245.c1Dc4a2.28991--

--===============0617969119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0617969119==--
