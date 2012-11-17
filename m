From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56340] [Ubuntu 10.04.4 LTS 32-bit] Severe
 instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2
 M64 graphics
Date: Sat, 17 Nov 2012 07:21:00 +0000
Message-ID: <bug-56340-8800-oT9WIzNcu4@http.bugs.freedesktop.org/>
References: <bug-56340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0937310363=="
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


--===============0937310363==
Content-Type: multipart/alternative; boundary="1353136860.E17fAA1.3441"; charset="us-ascii"


--1353136860.E17fAA1.3441
Date: Sat, 17 Nov 2012 07:21:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56340

--- Comment #12 from mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org ---
(In reply to comment #11)

Hi Robert,

Yeah, I will speculate that VIA Technologies screwed up their AGP related
timings like setup time in their actual silicon.
I believe NVIDIA has mentioned in their binary Linux device driver
documentation that ALi Alladin V chipset's AGP suffers from timing and signal
integrity issues.
They also mentioned that Apollo Pro133A (VT82C694X) and KT266 chipsets' AGP 4X
Mode is quite buggy, and their device driver turn off AGP 4X Mode, but they
never mentioned issues with Apollo MVP3 chipset.
I still remember from 1998 to 1999 that many computer enthusiasts complained
about Apollo MVP3 and Alladin V chipsets' AGP were buggy, especially when AGP
specific features get utilized (i.e., Side Band Addressing) during 3D games.
Considering that, I guess I should not be too surprised that turning off AGP 2X
Mode stabilized the problem.
Still, I am surprised that many newer generation graphics cards like GeForce FX
(see my previous post) have worked with this somewhat buggy chipset's AGP, and
I believe AGP 2X Mode was on.
        Robert, you are right that some VIA Technologies chipset do have AGP
driving value that can be altered in the BIOS setup.
If I remember correctly, I have seen this in several Apollo
Pro133A/P4M266A/KT266A-based mainboards.
NVIDIA also mentions this in their aforementioned documentation.
The FIC VA-503+ mainboard doesn't have this feature in their BIOS setup.
Anyway, do you know if there is a way to obtain a log file from Nouveau itself?
Whenever FIC VA-503+ crashes due to this instability of AGP 2X Mode, the
previously mentioned GPU lockup error message doesn't seem to get recorded
inside kern.log.
I did managed to take somewhat low quality digital camera screen shot of the
error message, but it doesn't get recorded inside kern.log.

Regards,

fpgahardwareengineer


> Most likely in 2X mode some of the data transfers to/from the card are
> getting corrupted somehow, causing the GPU to not respond as expected and
> causing the lockup detection.
> 
> I believe that for AGP problems on VIA chipsets, some people had luck with
> playing with the "AGP Driving Value" setting in the BIOS, if you have such
> an option you can try using different settings for this. (As I recall, most
> AGP chipsets would handle this setting automatically but the crappy VIA AGP
> implementation used a BIOS setting which sometimes required the user to
> enter a different value in the hope it would get the card to work properly.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1353136860.E17fAA1.3441
Date: Sat, 17 Nov 2012 07:21:00 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340">bug 56340</a>
              from <span class="vcard"><a class="email" href="mailto:mypersonalmailbox1&#64;mail.com" title="mypersonalmailbox1&#64;mail.com">mypersonalmailbox1&#64;mail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=56340#c11">comment #11</a>)

Hi Robert,

Yeah, I will speculate that VIA Technologies screwed up their AGP related
timings like setup time in their actual silicon.
I believe NVIDIA has mentioned in their binary Linux device driver
documentation that ALi Alladin V chipset's AGP suffers from timing and signal
integrity issues.
They also mentioned that Apollo Pro133A (VT82C694X) and KT266 chipsets' AGP 4X
Mode is quite buggy, and their device driver turn off AGP 4X Mode, but they
never mentioned issues with Apollo MVP3 chipset.
I still remember from 1998 to 1999 that many computer enthusiasts complained
about Apollo MVP3 and Alladin V chipsets' AGP were buggy, especially when AGP
specific features get utilized (i.e., Side Band Addressing) during 3D games.
Considering that, I guess I should not be too surprised that turning off AGP 2X
Mode stabilized the problem.
Still, I am surprised that many newer generation graphics cards like GeForce FX
(see my previous post) have worked with this somewhat buggy chipset's AGP, and
I believe AGP 2X Mode was on.
        Robert, you are right that some VIA Technologies chipset do have AGP
driving value that can be altered in the BIOS setup.
If I remember correctly, I have seen this in several Apollo
Pro133A/P4M266A/KT266A-based mainboards.
NVIDIA also mentions this in their aforementioned documentation.
The FIC VA-503+ mainboard doesn't have this feature in their BIOS setup.
Anyway, do you know if there is a way to obtain a log file from Nouveau itself?
Whenever FIC VA-503+ crashes due to this instability of AGP 2X Mode, the
previously mentioned GPU lockup error message doesn't seem to get recorded
inside kern.log.
I did managed to take somewhat low quality digital camera screen shot of the
error message, but it doesn't get recorded inside kern.log.

Regards,

fpgahardwareengineer


<span class="quote">&gt; Most likely in 2X mode some of the data transfers to/from the card are
&gt; getting corrupted somehow, causing the GPU to not respond as expected and
&gt; causing the lockup detection.
&gt; 
&gt; I believe that for AGP problems on VIA chipsets, some people had luck with
&gt; playing with the &quot;AGP Driving Value&quot; setting in the BIOS, if you have such
&gt; an option you can try using different settings for this. (As I recall, most
&gt; AGP chipsets would handle this setting automatically but the crappy VIA AGP
&gt; implementation used a BIOS setting which sometimes required the user to
&gt; enter a different value in the hope it would get the card to work properly.)</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1353136860.E17fAA1.3441--

--===============0937310363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0937310363==--
