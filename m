From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65827] computer often fails to boot with nouveau and
 GeForce GT 425M on newest Linux kernel
Date: Sat, 27 Jul 2013 00:17:52 +0000
Message-ID: <bug-65827-8800-W2OrOVEk0u@http.bugs.freedesktop.org/>
References: <bug-65827-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1368646537=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-65827-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1368646537==
Content-Type: multipart/alternative; boundary="1374884272.60AD802b1.5634"; charset="us-ascii"


--1374884272.60AD802b1.5634
Date: Sat, 27 Jul 2013 00:17:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65827

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi there

First and foremost what is your experience with 3.10.x kernels ? There has been
quite a few issues addressed, and a few other in the 3.11-rc2+. Can you try
them both ?

(In reply to comment #0)
> Created attachment 80911 [details]
> screen shot of my screen on boot
> 
> When I turn my computer on, at some point of the booting process I get an
> endless cascade of almost-identical error messages like "[   45.935830]
> nouveau E(   PFIFO][0000:01:00.0] SUBFIFO0: (unknown bits 0x00004000)" (see
> image attached). Apparently the computer doesn't respond to any input, so
> the only thing I can do is force it to shut down by pressing the power
> button long.
> 
Does the system respond to REISUB, ssh ?

> Most of the times, the system boots OK at the second try, but not even
> always. If I'm not successful after several attempts, I choose the LTS
> kernel (3.0.82 instead of 3.9.6) from my GRUB and then this won't happen.
> 
Would be great if you can attach dmesg of 3.0.82 and 3.9.6

> It looks like these error logs messages are not properly kept as log files,
> probably because I have to interrupt the boot process this way. A 'grep -R
> "unknown bits"' from /var/log only finds matches in five *.journal binary
> files in the directory /var/log/journal. This is why I attach a real-world
> picture of my screen instead of a log file.
> 
journal is kind of funny on my system wrt correctly storing the logs :\ 

You can filter journal to display messages, coming from the kernel by using
"journalctl _TRANSPORT=kernel"

> One of the last times that I managed to boot with the 3.9 kernel, I noticed
> that in the file /proc/fb I only had "0 inteldrmfb". Now I am on the 3.0
> kernel and I have
> "0 inteldrmfb
> 1 nouveaufb"
> 
> On the other hand, the command 'lspci -v | grep VGA' returns similar output
> on both kernels:
> - On 3.9 kernel:
> 00:02.0 VGA compatible controller: Intel Corporation Core Processor
> Integrated Graphics Controller (rev 02) (prog-if 00 [VGA controller])
> 01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT
> 425M] (rev ff) (prog-if ff)
> 
The above looks a bit interesting. Seems like lspci cannot read the full data
of the device, thus the 0xff's. Maybe the device is switched off and/or not
initialised by the kernel

> - And on 3.0 kernel:
> 00:02.0 VGA compatible controller: Intel Corporation Core Processor
> Integrated Graphics Controller (rev 02) (prog-if 00 [VGA controller])
> 01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT
> 425M] (rev a1) (prog-if 00 [VGA controller])
> 
> This has been happening for several months already, so the problem didn't
> start with kernel 3.9 but earlier.
> 
Would be great if you can be more specific. If 3.10 and 3.11 still fails on
your system would be appreciated if you can bisect the commit that introduced
this issue

> All this said, even if I manage to boot, it looks like my NVIDIA card is
> never used by any program, only the Intel one. GPU never seems to be
> available.
I'm assuming that that this is an optimus laptop, is that correct ?

I would target the kernel module issue first and then work on on "how to make
my optimus laptop work under linux" :P

Cheers
Emil

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374884272.60AD802b1.5634
Date: Sat, 27 Jul 2013 00:17:52 +0000
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
   title="NEW --- - computer often fails to boot with nouveau and GeForce GT 425M on newest Linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65827#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - computer often fails to boot with nouveau and GeForce GT 425M on newest Linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65827">bug 65827</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi there

First and foremost what is your experience with 3.10.x kernels ? There has been
quite a few issues addressed, and a few other in the 3.11-rc2+. Can you try
them both ?

(In reply to <a href="show_bug.cgi?id=65827#c0">comment #0</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=80911" name="attach_80911" title="screen shot of my screen on boot">attachment 80911</a> <a href="attachment.cgi?id=80911&amp;action=edit" title="screen shot of my screen on boot">[details]</a></span>
&gt; screen shot of my screen on boot
&gt; 
&gt; When I turn my computer on, at some point of the booting process I get an
&gt; endless cascade of almost-identical error messages like &quot;[   45.935830]
&gt; nouveau E(   PFIFO][0000:01:00.0] SUBFIFO0: (unknown bits 0x00004000)&quot; (see
&gt; image attached). Apparently the computer doesn't respond to any input, so
&gt; the only thing I can do is force it to shut down by pressing the power
&gt; button long.
&gt; </span >
Does the system respond to REISUB, ssh ?

<span class="quote">&gt; Most of the times, the system boots OK at the second try, but not even
&gt; always. If I'm not successful after several attempts, I choose the LTS
&gt; kernel (3.0.82 instead of 3.9.6) from my GRUB and then this won't happen.
&gt; </span >
Would be great if you can attach dmesg of 3.0.82 and 3.9.6

<span class="quote">&gt; It looks like these error logs messages are not properly kept as log files,
&gt; probably because I have to interrupt the boot process this way. A 'grep -R
&gt; &quot;unknown bits&quot;' from /var/log only finds matches in five *.journal binary
&gt; files in the directory /var/log/journal. This is why I attach a real-world
&gt; picture of my screen instead of a log file.
&gt; </span >
journal is kind of funny on my system wrt correctly storing the logs :\ 

You can filter journal to display messages, coming from the kernel by using
&quot;journalctl _TRANSPORT=kernel&quot;

<span class="quote">&gt; One of the last times that I managed to boot with the 3.9 kernel, I noticed
&gt; that in the file /proc/fb I only had &quot;0 inteldrmfb&quot;. Now I am on the 3.0
&gt; kernel and I have
&gt; &quot;0 inteldrmfb
&gt; 1 nouveaufb&quot;
&gt; 
&gt; On the other hand, the command 'lspci -v | grep VGA' returns similar output
&gt; on both kernels:
&gt; - On 3.9 kernel:
&gt; 00:02.0 VGA compatible controller: Intel Corporation Core Processor
&gt; Integrated Graphics Controller (rev 02) (prog-if 00 [VGA controller])
&gt; 01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT
&gt; 425M] (rev ff) (prog-if ff)
&gt; </span >
The above looks a bit interesting. Seems like lspci cannot read the full data
of the device, thus the 0xff's. Maybe the device is switched off and/or not
initialised by the kernel

<span class="quote">&gt; - And on 3.0 kernel:
&gt; 00:02.0 VGA compatible controller: Intel Corporation Core Processor
&gt; Integrated Graphics Controller (rev 02) (prog-if 00 [VGA controller])
&gt; 01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT
&gt; 425M] (rev a1) (prog-if 00 [VGA controller])
&gt; 
&gt; This has been happening for several months already, so the problem didn't
&gt; start with kernel 3.9 but earlier.
&gt; </span >
Would be great if you can be more specific. If 3.10 and 3.11 still fails on
your system would be appreciated if you can bisect the commit that introduced
this issue

<span class="quote">&gt; All this said, even if I manage to boot, it looks like my NVIDIA card is
&gt; never used by any program, only the Intel one. GPU never seems to be
&gt; available.</span >
I'm assuming that that this is an optimus laptop, is that correct ?

I would target the kernel module issue first and then work on on &quot;how to make
my optimus laptop work under linux&quot; :P

Cheers
Emil</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374884272.60AD802b1.5634--

--===============1368646537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1368646537==--
