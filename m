From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] [NV31] lockup when using AGP. agpmode=0 fixes
	it.
Date: Fri, 27 Sep 2013 05:09:08 +0000
Message-ID: <bug-20341-8800-MUS33bkQHj@http.bugs.freedesktop.org/>
References: <bug-20341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0627350332=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0627350332==
Content-Type: multipart/alternative; boundary="1380258548.eE5D1.20063"; charset="us-ascii"


--1380258548.eE5D1.20063
Date: Fri, 27 Sep 2013 05:09:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=20341

--- Comment #24 from Jason Detring <detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ah, yeah, sorry about that.  This ticket got away from me.  I've got a small
pile of research and resources I'd promised myself to post Real Soon Now.  So I
guess I should.

I haven't reinstalled the blob, but from what I recall it did work without
problems last time it was loaded.  I don't remember if it left a console
message describing which AGP mode it was running at, but it likely had the 2x
limiter since those drivers were from 2009.

Answering the big question: yes.  Setting agpmode=2 makes things stable. 
Hooray.  But it is sort of a hollow victory to say things work great at
half-speed.  As fpgahardwareengineer said, the problem is likely in the KT133. 
The linked NVIDIA document points to the AGP signalling drive strength being
insufficent.



Following up on "AGP drive strength", I found copies of a document called the
"BIOS Optimization Guide" floating around the internet.  Parts of it are
reposted on various bulletin boards [1] [2] [3] [4] and websites [5] [6].  An
older version talks about upping the drive strength from 0xCA or 0xDA to 0xEA
or 0xEE when running GeForce boards.

[1]
http://forums.pcper.com/showthread.php?99837-A7M266-Infinite-Loop-Troubleshooting-(detailed)&p=681721#post681721
[2] http://www.rage3d.com/board/showpost.php?p=1331276579&postcount=2
[3]
http://www.scrigroup.com/calculatoare/tutorials/414/OPTIMIZING-WINDOWS-TIPS64128.php
[4] http://arstechnica.com/civis/viewtopic.php?f=8&t=737578
[5] http://hardwarehell.com/articles/videobios.htm
[6] http://archive.arstechnica.com/guide/building/bios/m-bios-3.html



It also sounds like ATI had a similiar problem and did a thorough investigation
at one point [7].  Their solution was to force down to 2x mode on a chipset
blacklist, and only allow 4x if the "VIA chipset driver" had been installed. 
The advisory document talks about something called the "AGP Read
Synchronization bit" needing set at register 0xAC[6].  I'm guessing this
chipset driver is some combination of this read synchronization register poke
or the abovementioned drive strength register poke.

[7] http://www.rage3d.com/board/showthread.php?p=1331422045#post1331422045



The ATI document is slightly at odds with the KT133(a) programmer's guide [8],
which lists 0xAC[6] as "CPU Stall on AGP command FIFO GART Address Request",
but I didn't see anything else remotely resembling a "Read synchronization
bit".

[8] http://gkernel.sourceforge.net/specs/via/KT133a.pdf.bz2



So, I tried testing these theories.  It didn't go so well.

1. My BIOS has a pretty spartan set of options since the PC is a mass-market
consumer box.  There was no option to adjust AGP drive strength.  Darn.

2. I tried to adjust the drive strength while Linux was running.  According to
the VIA doc, AGP drive strength is set from PCI register 0xB1[7-0].  It looks
like this entire register is the P Ctrl and N Ctrl values for drive strength. 
On the console with nouveau already loaded, I wrote 0xEA.  Nothing broke, so I
started X.  It had the same lockup as usual.  Darn.  I tried 0xEB through 0xEE
as well.  No good.

3. I tried to adjust the read synchronization bit.  It was already set.  So, no
use in that.

Presently, I'm stuck.  There's not a whole lot else I can think of that might
be worth trying.  Maybe there's some commit register or reinit procedure that
needs to take place after writing the drive strength?  I don't know enough
about AGP to figure out where to go next.



At this time, I agree with fpgahardwareengineer's assessment.  A quirk for
those chipsets listed in the ATI doc should be added to allow negotiation up to
AGP 2x maximum.  It is the safest option in all cases.  Maybe at the same time
leave a note in the dmesg describing "buggy chipset detected, defaulting to 2x,
please read fd.o bug 20341 for more information", and also allow agpmode=4 to
override the safe default. I'm not sure whether this quirk should be in nouveau
or in via-agp.ko, since it sounds like the problem affects all major vendors.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380258548.eE5D1.20063
Date: Fri, 27 Sep 2013 05:09:08 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
              from <span class="vcard"><a class="email" href="mailto:detringj&#64;gmail.com" title="Jason Detring &lt;detringj&#64;gmail.com&gt;"> <span class="fn">Jason Detring</span></a>
</span></b>
        <pre>Ah, yeah, sorry about that.  This ticket got away from me.  I've got a small
pile of research and resources I'd promised myself to post Real Soon Now.  So I
guess I should.

I haven't reinstalled the blob, but from what I recall it did work without
problems last time it was loaded.  I don't remember if it left a console
message describing which AGP mode it was running at, but it likely had the 2x
limiter since those drivers were from 2009.

Answering the big question: yes.  Setting agpmode=2 makes things stable. 
Hooray.  But it is sort of a hollow victory to say things work great at
half-speed.  As fpgahardwareengineer said, the problem is likely in the KT133. 
The linked NVIDIA document points to the AGP signalling drive strength being
insufficent.



Following up on &quot;AGP drive strength&quot;, I found copies of a document called the
&quot;BIOS Optimization Guide&quot; floating around the internet.  Parts of it are
reposted on various bulletin boards [1] [2] [3] [4] and websites [5] [6].  An
older version talks about upping the drive strength from 0xCA or 0xDA to 0xEA
or 0xEE when running GeForce boards.

[1]
<a href="http://forums.pcper.com/showthread.php?99837-A7M266-Infinite-Loop-Troubleshooting-(detailed)&amp;p=681721#post681721">http://forums.pcper.com/showthread.php?99837-A7M266-Infinite-Loop-Troubleshooting-(detailed)&amp;p=681721#post681721</a>
[2] <a href="http://www.rage3d.com/board/showpost.php?p=1331276579&amp;postcount=2">http://www.rage3d.com/board/showpost.php?p=1331276579&amp;postcount=2</a>
[3]
<a href="http://www.scrigroup.com/calculatoare/tutorials/414/OPTIMIZING-WINDOWS-TIPS64128.php">http://www.scrigroup.com/calculatoare/tutorials/414/OPTIMIZING-WINDOWS-TIPS64128.php</a>
[4] <a href="http://arstechnica.com/civis/viewtopic.php?f=8&amp;t=737578">http://arstechnica.com/civis/viewtopic.php?f=8&amp;t=737578</a>
[5] <a href="http://hardwarehell.com/articles/videobios.htm">http://hardwarehell.com/articles/videobios.htm</a>
[6] <a href="http://archive.arstechnica.com/guide/building/bios/m-bios-3.html">http://archive.arstechnica.com/guide/building/bios/m-bios-3.html</a>



It also sounds like ATI had a similiar problem and did a thorough investigation
at one point [7].  Their solution was to force down to 2x mode on a chipset
blacklist, and only allow 4x if the &quot;VIA chipset driver&quot; had been installed. 
The advisory document talks about something called the &quot;AGP Read
Synchronization bit&quot; needing set at register 0xAC[6].  I'm guessing this
chipset driver is some combination of this read synchronization register poke
or the abovementioned drive strength register poke.

[7] <a href="http://www.rage3d.com/board/showthread.php?p=1331422045#post1331422045">http://www.rage3d.com/board/showthread.php?p=1331422045#post1331422045</a>



The ATI document is slightly at odds with the KT133(a) programmer's guide [8],
which lists 0xAC[6] as &quot;CPU Stall on AGP command FIFO GART Address Request&quot;,
but I didn't see anything else remotely resembling a &quot;Read synchronization
bit&quot;.

[8] <a href="http://gkernel.sourceforge.net/specs/via/KT133a.pdf.bz2">http://gkernel.sourceforge.net/specs/via/KT133a.pdf.bz2</a>



So, I tried testing these theories.  It didn't go so well.

1. My BIOS has a pretty spartan set of options since the PC is a mass-market
consumer box.  There was no option to adjust AGP drive strength.  Darn.

2. I tried to adjust the drive strength while Linux was running.  According to
the VIA doc, AGP drive strength is set from PCI register 0xB1[7-0].  It looks
like this entire register is the P Ctrl and N Ctrl values for drive strength. 
On the console with nouveau already loaded, I wrote 0xEA.  Nothing broke, so I
started X.  It had the same lockup as usual.  Darn.  I tried 0xEB through 0xEE
as well.  No good.

3. I tried to adjust the read synchronization bit.  It was already set.  So, no
use in that.

Presently, I'm stuck.  There's not a whole lot else I can think of that might
be worth trying.  Maybe there's some commit register or reinit procedure that
needs to take place after writing the drive strength?  I don't know enough
about AGP to figure out where to go next.



At this time, I agree with fpgahardwareengineer's assessment.  A quirk for
those chipsets listed in the ATI doc should be added to allow negotiation up to
AGP 2x maximum.  It is the safest option in all cases.  Maybe at the same time
leave a note in the dmesg describing &quot;buggy chipset detected, defaulting to 2x,
please read fd.o <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="show_bug.cgi?id=20341">bug 20341</a> for more information&quot;, and also allow agpmode=4 to
override the safe default. I'm not sure whether this quirk should be in nouveau
or in via-agp.ko, since it sounds like the problem affects all major vendors.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380258548.eE5D1.20063--

--===============0627350332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0627350332==--
