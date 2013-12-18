From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Wed, 18 Dec 2013 18:57:06 +0000
Message-ID: <bug-58378-8800-isek6ccvnq@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2046862869=="
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


--===============2046862869==
Content-Type: multipart/alternative; boundary="1387393026.d6D4eEd15.14178"; charset="us-ascii"


--1387393026.d6D4eEd15.14178
Date: Wed, 18 Dec 2013 18:57:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #52 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hello again, Ilia,

> Can you grab envytools (https://github.com/envytools/envytools) and run

bad news (or maybe expected from what we have been seeing earlier): 

[aloew@aloew-lap envytools-master]$ ./nva/nvapeek 10200c
WARN: Can't probe 0000:01:00.0
PCI init failure!

[aloew@aloew-lap envytools-master]$ ./nva/nvapoke 10200c 10
WARN: Can't probe 0000:01:00.0
PCI init failure!

> and see what's in dmesg?

No additional output in dmesg - probably because of the "PCI init failure"...

> Do you see additional MMIO read/write failures, or is it 
> all good?  What does the peek return? (I'm wondering if it's an initialization 
> order issue or something.)

As above - and additionally, during the boot process, I also see the following
messages in dmesg:

nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x00fd94
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x103d94
(...)
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT at 0x10200c

> What issues are you seeing with the blob driver? 

As stated earlier: Every more recent version of NVidia's driver after their
295.09 causes unpredictable complete hangs at some point in time - sooner or
later, but consistently (especially on GUI actions that initiate screen changes
like closing windows or using the scrollbar). Fan runs at 100% and the only
thing I can still do is a hard power-off...

> I'd also still be interested in knowing whether a previously-known-good 
> version of the blob still works.

I am 99.9% certain it does, as my Windows install with NVidia 285.09 driver
also still runs fine, while any more recent Windows driver from NVidia hangs
with the same symptoms as their Linux "blob" - I had just checked this last
week with their latest Windows version 331.82, once again without any luck.

Will try to do a new install of old RHEL 6.1 or 6.2 onto a USB HDD either later
today or tomorrow night and report back about this.

Is there anything else that we can try to find out why the above memory
addresses seemingly cannot be accessed on my card?

Could this be a motherboard layout issue by Toshiba or some defective chips
that NVidia has sold anyway to OEM manufacturers?

Maybe indeed you could ask your new friends/contacts at NVidia about this?

And please let me know if I shall check some other commands using the
"envytools" (nice name!)...

Many thanks one more time & best regards,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387393026.d6D4eEd15.14178
Date: Wed, 18 Dec 2013 18:57:06 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c52">Comment # 52</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hello again, Ilia,

<span class="quote">&gt; Can you grab envytools (<a href="https://github.com/envytools/envytools">https://github.com/envytools/envytools</a>) and run</span >

bad news (or maybe expected from what we have been seeing earlier): 

[aloew&#64;aloew-lap envytools-master]$ ./nva/nvapeek 10200c
WARN: Can't probe 0000:01:00.0
PCI init failure!

[aloew&#64;aloew-lap envytools-master]$ ./nva/nvapoke 10200c 10
WARN: Can't probe 0000:01:00.0
PCI init failure!

<span class="quote">&gt; and see what's in dmesg?</span >

No additional output in dmesg - probably because of the &quot;PCI init failure&quot;...

<span class="quote">&gt; Do you see additional MMIO read/write failures, or is it 
&gt; all good?  What does the peek return? (I'm wondering if it's an initialization 
&gt; order issue or something.)</span >

As above - and additionally, during the boot process, I also see the following
messages in dmesg:

nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x00fd94
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x103d94
(...)
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT at 0x10200c

<span class="quote">&gt; What issues are you seeing with the blob driver? </span >

As stated earlier: Every more recent version of NVidia's driver after their
295.09 causes unpredictable complete hangs at some point in time - sooner or
later, but consistently (especially on GUI actions that initiate screen changes
like closing windows or using the scrollbar). Fan runs at 100% and the only
thing I can still do is a hard power-off...

<span class="quote">&gt; I'd also still be interested in knowing whether a previously-known-good 
&gt; version of the blob still works.</span >

I am 99.9% certain it does, as my Windows install with NVidia 285.09 driver
also still runs fine, while any more recent Windows driver from NVidia hangs
with the same symptoms as their Linux &quot;blob&quot; - I had just checked this last
week with their latest Windows version 331.82, once again without any luck.

Will try to do a new install of old RHEL 6.1 or 6.2 onto a USB HDD either later
today or tomorrow night and report back about this.

Is there anything else that we can try to find out why the above memory
addresses seemingly cannot be accessed on my card?

Could this be a motherboard layout issue by Toshiba or some defective chips
that NVidia has sold anyway to OEM manufacturers?

Maybe indeed you could ask your new friends/contacts at NVidia about this?

And please let me know if I shall check some other commands using the
&quot;envytools&quot; (nice name!)...

Many thanks one more time &amp; best regards,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387393026.d6D4eEd15.14178--

--===============2046862869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2046862869==--
