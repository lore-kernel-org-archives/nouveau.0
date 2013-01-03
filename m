From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58776] DRM NOUVEAU: cannot boot with kernel >=3.7
Date: Thu, 03 Jan 2013 14:00:17 +0000
Message-ID: <bug-58776-8800-FNHnw5amIU@http.bugs.freedesktop.org/>
References: <bug-58776-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1304333799=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58776-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1304333799==
Content-Type: multipart/alternative; boundary="1357221616.F8ac46301.15468"; charset="us-ascii"


--1357221616.F8ac46301.15468
Date: Thu, 3 Jan 2013 14:00:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58776

--- Comment #7 from gabriele balducci <balducci-KqplAB4qOuE@public.gmane.org> ---
Thanks a lot.

1) I cannot find (or I am not able to recognize) any option related to
   AGP/IOMMU in my BIOS menu.
   Following advice in
   http://www.kernel.org/doc/Documentation/x86/x86_64/boot-options.txt,
   I have booted with iommu=soft, which apparently makes the IOMMU
   complaint go away from demsg, but I don't know if this is really a
   solution...
   In any case, booting with (only) iommu=soft, does not make any
   difference: i.e. the machine freezes as above

2) The nouveau.vram_pushbuf=1 option allows me to boot fine (with or
   without the iommu=soft option above)!
   However, now X11 has problems.
   After starting X11, text in menus (e.g. emacs, firefox) and in
   window borders is made of unreadable black rectangles; text in
   windows (e.g. xterm text lines, text in emacs buffers etc) are fine, though.
   This problem goes away if I boot into X11 with
                    Option  "Accel"   "Off"
   i.e.: if I switch acceleration off, everything works nicely (but,
   of course, I have no acceleration)

I have attached dmesg for kernel 3.6.10 (which works perfectly), the
new dmesg for kernel 3.7.1 with iommu=soft and nouveau.vram_pushbuf=1,
my xorg.conf and xorg.0.log for kernel 3.6.10 and 3.7.1 (with/without
accel)

I'll be happy to send any other information which might help to
clarify this problem

thank you very much again

ciao
gabriele

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357221616.F8ac46301.15468
Date: Thu, 3 Jan 2013 14:00:16 +0000
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
   title="NEW --- - DRM NOUVEAU: cannot boot with kernel &gt;=3.7"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58776#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - DRM NOUVEAU: cannot boot with kernel &gt;=3.7"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58776">bug 58776</a>
              from <span class="vcard"><a class="email" href="mailto:balducci&#64;units.it" title="gabriele balducci &lt;balducci&#64;units.it&gt;"> <span class="fn">gabriele balducci</span></a>
</span></b>
        <pre>Thanks a lot.

1) I cannot find (or I am not able to recognize) any option related to
   AGP/IOMMU in my BIOS menu.
   Following advice in
   <a href="http://www.kernel.org/doc/Documentation/x86/x86_64/boot-options.txt">http://www.kernel.org/doc/Documentation/x86/x86_64/boot-options.txt</a>,
   I have booted with iommu=soft, which apparently makes the IOMMU
   complaint go away from demsg, but I don't know if this is really a
   solution...
   In any case, booting with (only) iommu=soft, does not make any
   difference: i.e. the machine freezes as above

2) The nouveau.vram_pushbuf=1 option allows me to boot fine (with or
   without the iommu=soft option above)!
   However, now X11 has problems.
   After starting X11, text in menus (e.g. emacs, firefox) and in
   window borders is made of unreadable black rectangles; text in
   windows (e.g. xterm text lines, text in emacs buffers etc) are fine, though.
   This problem goes away if I boot into X11 with
                    Option  &quot;Accel&quot;   &quot;Off&quot;
   i.e.: if I switch acceleration off, everything works nicely (but,
   of course, I have no acceleration)

I have attached dmesg for kernel 3.6.10 (which works perfectly), the
new dmesg for kernel 3.7.1 with iommu=soft and nouveau.vram_pushbuf=1,
my xorg.conf and xorg.0.log for kernel 3.6.10 and 3.7.1 (with/without
accel)

I'll be happy to send any other information which might help to
clarify this problem

thank you very much again

ciao
gabriele</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357221616.F8ac46301.15468--

--===============1304333799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1304333799==--
