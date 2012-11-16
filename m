From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56340] [Ubuntu 10.04.4 LTS 32-bit] Severe
 instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2
 M64 graphics
Date: Fri, 16 Nov 2012 01:22:18 +0000
Message-ID: <bug-56340-8800-3nGa12n8V8@http.bugs.freedesktop.org/>
References: <bug-56340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2137671005=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56340-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2137671005==
Content-Type: multipart/alternative; boundary="1353028937.a1C8EC21.12061"; charset="us-ascii"


--1353028937.a1C8EC21.12061
Date: Fri, 16 Nov 2012 01:22:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56340

--- Comment #8 from mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org ---
(In reply to comment #7)

Hi Robert,

Yes, I do understand the "reputation" of VIA Technologies chipset with AGP from
1998 to around 2002 or so.
I remember that ALi was probably even worse at the time (i.e., ALi Alladin V
chipset for Socket 7).
Yet, to my surprise, almost all AGP graphics cards I tried were able to at
least boot Ubuntu with Apollo MVP3 chipset.
Since this NVIDIA RIVA TNT2 64 AGP graphics card from VisionTek does work fine
with other systems, including newer VIA Technologies chipsets, I suspect there
might be something wrong inside agpgart-via module specifically that causes
issues with Apollo MVP3 chipset.
I will try to obtain kern.log from this system so that someone can analyze it
further.

Regards,

fpgahardwareengineer


> (In reply to comment #5)
> > Regarding the reason for the freeze, I can think of the following.
> > 
> > - Is Nouveau is accessing the VGA BIOS of the card during boot, and the VGA
> > BIOS is a little buggy?
> > - Does the VGA BIOS's initialization code configuring RIVA TNT2 64 in a
> > certain way that contributes to the freeze with Apollo MVP3 chipset?
> 
> I would suspect the latter - these old VIA AGP implementations were
> notoriously unstable and problematic even in Windows and it's not unlikely
> that different BIOS versions may configure the card differently (AGP 2X/4X,
> AGP fast writes on/off, etc.)
> 
> You can also try updating the motherboard BIOS and try playing with any
> AGP-related BIOS settings to see if they change the situation.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1353028937.a1C8EC21.12061
Date: Fri, 16 Nov 2012 01:22:17 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340">bug 56340</a>
              from <span class="vcard"><a class="email" href="mailto:mypersonalmailbox1&#64;mail.com" title="mypersonalmailbox1&#64;mail.com">mypersonalmailbox1&#64;mail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=56340#c7">comment #7</a>)

Hi Robert,

Yes, I do understand the &quot;reputation&quot; of VIA Technologies chipset with AGP from
1998 to around 2002 or so.
I remember that ALi was probably even worse at the time (i.e., ALi Alladin V
chipset for Socket 7).
Yet, to my surprise, almost all AGP graphics cards I tried were able to at
least boot Ubuntu with Apollo MVP3 chipset.
Since this NVIDIA RIVA TNT2 64 AGP graphics card from VisionTek does work fine
with other systems, including newer VIA Technologies chipsets, I suspect there
might be something wrong inside agpgart-via module specifically that causes
issues with Apollo MVP3 chipset.
I will try to obtain kern.log from this system so that someone can analyze it
further.

Regards,

fpgahardwareengineer


<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=56340#c5">comment #5</a>)
&gt; &gt; Regarding the reason for the freeze, I can think of the following.
&gt; &gt; 
&gt; &gt; - Is Nouveau is accessing the VGA BIOS of the card during boot, and the VGA
&gt; &gt; BIOS is a little buggy?
&gt; &gt; - Does the VGA BIOS's initialization code configuring RIVA TNT2 64 in a
&gt; &gt; certain way that contributes to the freeze with Apollo MVP3 chipset?
&gt; 
&gt; I would suspect the latter - these old VIA AGP implementations were
&gt; notoriously unstable and problematic even in Windows and it's not unlikely
&gt; that different BIOS versions may configure the card differently (AGP 2X/4X,
&gt; AGP fast writes on/off, etc.)
&gt; 
&gt; You can also try updating the motherboard BIOS and try playing with any
&gt; AGP-related BIOS settings to see if they change the situation.</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1353028937.a1C8EC21.12061--

--===============2137671005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2137671005==--
