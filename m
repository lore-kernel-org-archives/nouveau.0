From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56340] [Ubuntu 10.04.4 LTS 32-bit] Severe
 instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2
 M64 graphics
Date: Mon, 05 Nov 2012 04:06:58 +0000
Message-ID: <bug-56340-8800-FwUqWUsXPB@http.bugs.freedesktop.org/>
References: <bug-56340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1959371213=="
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


--===============1959371213==
Content-Type: multipart/alternative; boundary="1352088418.5FDeaB71.30525"; charset="us-ascii"


--1352088418.5FDeaB71.30525
Date: Mon, 5 Nov 2012 04:06:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56340

--- Comment #4 from mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org ---
(In reply to comment #3)

Hi Emil,

I have done a little more testing with 3 NVIDIA RIVA TNT2 64-based graphics
cards and 1 Vanta-based graphics card.
Before I share that information, I will respond to your comments.


> To be honest it sounds like your motherboard is dying, not an issue caused
> by nouveau

I have tested this mainboard with many many, NVIDIA, ATI Technologies, Matrox,
and SiS graphics cards, and they all boot fine with FIC VA-503+ mainboard.
I honestly don't think that the mainboard is dying based on this observation.
I don't have another mainboard with Apollo MVP3 chipset to do comparison,
either.


> 
> Nevertheless there are a few thing you can try
> 
> * Try the proprietary driver (aka the blob)? Do you have similar issue with
> it?
> Note: Not too sure if your card is supported

You are right that NVIDIA binary device driver doesn't exist for Linux this
new.
Nouveau is the only choice I have for RIVA TNT2 64.


> 
> 
> Ubuntu 10.04 uses quite (almost 3 years) old kernel - 2.6.32

Yes, I do understand that.
But Canonical still supports Ubuntu 10.04 LTS so I am trying to get the bug
fixes incorporated before support goes out.
I also don't like the views many Linux developers have, which is that old code
is useless, and it is okay to keep the bugs there.
Even if the kernel is old, and cannot support the lastest hardware, I still
want the bugs in the older software to be fixed.


> * Can you try a distro based on a newer kernel. The best choice would be a
> Fedora LiveCD
> 

Strangely, FIC VA-503+ mainboard doesn't even boot with Ubuntu 12.04 LTS due to
some new bug of their boot loader code.
I assume it has some issue with VIA Technologies Apollo MVP3 chipset and its
southbridge VT82C586B.
I did have to install a non-PAE version of the 32-bit kernel to a hard driver
even be able to have a chance to boot with this mainboard, and it won't
currently boot.
The same hard drive will boot with another ASUS mainboard with VIA Technologies
chipset (ASUS A7V266-E mainboard with VIA Technologies KT266A chipset) without
any issues.
I am planning to file a bug report regarding this issue soon.


> If you're still having those issues with nouveau and not with the blob
> 
> Issue 1. Take an image of the boot messages, during bootup if your system
> crashes and the logs are not retrieveable
> 

I believe I attached a .tar.gz file to this bug report.
I had to do it this way because there are 12+ log files in there, and it was
impractical to upload that many log files to Bugzilla.
It just takes too much time to upload that many log files.
If you want me to upload individual log files to Bugzilla, I will do it, but I
don't want to.
That's why I put all of them into 1 archive file.
If you can download that and analyze it, I will appreciate.


> Issue 2. Try and tiangulate what causes the freeze, specific program,
> suspend/resume cycle etc.
> 

The mainboard is so old that its ACPI doesn't support S3 State.
I am not even sure it even supports S1 State.
Although VIA Technologies "claims" to support Suspend to RAM in Apollo MVP3 and
VT82C586B Southbridge (Refer to Apollo MVP3 and VT82C586B datasheet floating
around the Internet.), I don't know any company that ever bothered to support
this nice feature.
This is typical of mainboards made around 1998 to 2001.
I believe I have done enough testing to be able to reproduce the freeze very
reliably.


> In either case retrieve the logs [1] when the issue occurs
> (ssh/serialconsole may help)
> 
> 
> [1] http://nouveau.freedesktop.org/wiki/Bugs

I let Ubuntu's ubuntu-bug upload number of log files for a bug report I
reported to its launchpad.net bug report site.
If you don't want to open a .tar.gz file, you can view the log files here.

https://bugs.launchpad.net/ubuntu/+source/xorg/+bug/1065300


Note that I do put a lot of effort writing these bug reports, trying to get
Linux developers to fix bugs, and I do my best with my current limited
knowledge of Linux to provide whatever information the developer needs.

Regards,

fpgahardwareengineer

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352088418.5FDeaB71.30525
Date: Mon, 5 Nov 2012 04:06:58 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340">bug 56340</a>
              from <span class="vcard"><a class="email" href="mailto:mypersonalmailbox1&#64;mail.com" title="mypersonalmailbox1&#64;mail.com">mypersonalmailbox1&#64;mail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=56340#c3">comment #3</a>)

Hi Emil,

I have done a little more testing with 3 NVIDIA RIVA TNT2 64-based graphics
cards and 1 Vanta-based graphics card.
Before I share that information, I will respond to your comments.


<span class="quote">&gt; To be honest it sounds like your motherboard is dying, not an issue caused
&gt; by nouveau</span >

I have tested this mainboard with many many, NVIDIA, ATI Technologies, Matrox,
and SiS graphics cards, and they all boot fine with FIC VA-503+ mainboard.
I honestly don't think that the mainboard is dying based on this observation.
I don't have another mainboard with Apollo MVP3 chipset to do comparison,
either.


<span class="quote">&gt; 
&gt; Nevertheless there are a few thing you can try
&gt; 
&gt; * Try the proprietary driver (aka the blob)? Do you have similar issue with
&gt; it?
&gt; Note: Not too sure if your card is supported</span >

You are right that NVIDIA binary device driver doesn't exist for Linux this
new.
Nouveau is the only choice I have for RIVA TNT2 64.


<span class="quote">&gt; 
&gt; 
&gt; Ubuntu 10.04 uses quite (almost 3 years) old kernel - 2.6.32</span >

Yes, I do understand that.
But Canonical still supports Ubuntu 10.04 LTS so I am trying to get the bug
fixes incorporated before support goes out.
I also don't like the views many Linux developers have, which is that old code
is useless, and it is okay to keep the bugs there.
Even if the kernel is old, and cannot support the lastest hardware, I still
want the bugs in the older software to be fixed.


<span class="quote">&gt; * Can you try a distro based on a newer kernel. The best choice would be a
&gt; Fedora LiveCD
&gt; </span >

Strangely, FIC VA-503+ mainboard doesn't even boot with Ubuntu 12.04 LTS due to
some new bug of their boot loader code.
I assume it has some issue with VIA Technologies Apollo MVP3 chipset and its
southbridge VT82C586B.
I did have to install a non-PAE version of the 32-bit kernel to a hard driver
even be able to have a chance to boot with this mainboard, and it won't
currently boot.
The same hard drive will boot with another ASUS mainboard with VIA Technologies
chipset (ASUS A7V266-E mainboard with VIA Technologies KT266A chipset) without
any issues.
I am planning to file a bug report regarding this issue soon.


<span class="quote">&gt; If you're still having those issues with nouveau and not with the blob
&gt; 
&gt; Issue 1. Take an image of the boot messages, during bootup if your system
&gt; crashes and the logs are not retrieveable
&gt; </span >

I believe I attached a .tar.gz file to this bug report.
I had to do it this way because there are 12+ log files in there, and it was
impractical to upload that many log files to Bugzilla.
It just takes too much time to upload that many log files.
If you want me to upload individual log files to Bugzilla, I will do it, but I
don't want to.
That's why I put all of them into 1 archive file.
If you can download that and analyze it, I will appreciate.


<span class="quote">&gt; Issue 2. Try and tiangulate what causes the freeze, specific program,
&gt; suspend/resume cycle etc.
&gt; </span >

The mainboard is so old that its ACPI doesn't support S3 State.
I am not even sure it even supports S1 State.
Although VIA Technologies &quot;claims&quot; to support Suspend to RAM in Apollo MVP3 and
VT82C586B Southbridge (Refer to Apollo MVP3 and VT82C586B datasheet floating
around the Internet.), I don't know any company that ever bothered to support
this nice feature.
This is typical of mainboards made around 1998 to 2001.
I believe I have done enough testing to be able to reproduce the freeze very
reliably.


<span class="quote">&gt; In either case retrieve the logs [1] when the issue occurs
&gt; (ssh/serialconsole may help)
&gt; 
&gt; 
&gt; [1] <a href="http://nouveau.freedesktop.org/wiki/Bugs">http://nouveau.freedesktop.org/wiki/Bugs</a></span >

I let Ubuntu's ubuntu-bug upload number of log files for a bug report I
reported to its launchpad.net bug report site.
If you don't want to open a .tar.gz file, you can view the log files here.

<a href="https://bugs.launchpad.net/ubuntu/+source/xorg/+bug/1065300">https://bugs.launchpad.net/ubuntu/+source/xorg/+bug/1065300</a>


Note that I do put a lot of effort writing these bug reports, trying to get
Linux developers to fix bugs, and I do my best with my current limited
knowledge of Linux to provide whatever information the developer needs.

Regards,

fpgahardwareengineer</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352088418.5FDeaB71.30525--

--===============1959371213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1959371213==--
