From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77674] [NVE7] "failed to read DPCD" on wake up with
 external monitor
Date: Tue, 24 Jun 2014 18:07:34 +0000
Message-ID: <bug-77674-8800-541TRyJEAP@http.bugs.freedesktop.org/>
References: <bug-77674-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1104740614=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77674-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1104740614==
Content-Type: multipart/alternative; boundary="1403633253.AB01CD2.30625"; charset="us-ascii"


--1403633253.AB01CD2.30625
Date: Tue, 24 Jun 2014 18:07:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77674

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #5)
> switched to Nvidia drivers because I needed WebGL). Let me try the new
> kernel.

Definitely give 3.16-rc2 a shot.

> What config to put the "nouveau.debug=VBIOS=trace,PDISP=trace drm.debug=0xe"
> line?

If it doesn't work, add

nouveau.debug=VBIOS=trace,PDISP=trace,I2C=trace drm.debug=0xe

to the kernel command line, and report back with the dmesg generated. Not sure
how your distro works... I use GRUB, and configure it via /boot/grub/menu.lst

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403633253.AB01CD2.30625
Date: Tue, 24 Jun 2014 18:07:33 +0000
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
   title="NEW --- - [NVE7] &quot;failed to read DPCD&quot; on wake up with external monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77674#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] &quot;failed to read DPCD&quot; on wake up with external monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77674">bug 77674</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77674#c5">comment #5</a>)
<span class="quote">&gt; switched to Nvidia drivers because I needed WebGL). Let me try the new
&gt; kernel.</span >

Definitely give 3.16-rc2 a shot.

<span class="quote">&gt; What config to put the &quot;nouveau.debug=VBIOS=trace,PDISP=trace drm.debug=0xe&quot;
&gt; line?</span >

If it doesn't work, add

nouveau.debug=VBIOS=trace,PDISP=trace,I2C=trace drm.debug=0xe

to the kernel command line, and report back with the dmesg generated. Not sure
how your distro works... I use GRUB, and configure it via /boot/grub/menu.lst</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403633253.AB01CD2.30625--

--===============1104740614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1104740614==--
