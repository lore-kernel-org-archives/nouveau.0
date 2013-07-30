From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Tue, 30 Jul 2013 18:44:51 +0000
Message-ID: <bug-67315-8800-YBme9Rv9oa@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0055263513=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0055263513==
Content-Type: multipart/alternative; boundary="1375209890.a1Edb2.6118"; charset="us-ascii"


--1375209890.a1Edb2.6118
Date: Tue, 30 Jul 2013 18:44:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #17 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #16)
> Oh, one additional thing...nouveau never seemed to work with this hardware.
Ouch, now that is interesting :)

> I do appreciate your help on this Emil. I just wanted you to know that and
> if I seem a bit, well, dense it's because I'm not that familiar with how the
> entire X mechanism works on this sort of hardware.
We all have our strengths and weaknesses :)

Looking at your latest dmesg, the pointer have changed from 0 to another
(probably invalid) value - 0xfe00ccc6

nouveau E[  PGRAPH][0000:02:00.0] ch 1 [0x0007cb0000 DRM] subc 3 class 0x502d
mthd 0x0860 data 0xfe00ccc6

Would be great if you can do the following

* Notice if the the value varies between reboots, or does it differ on kernel
version

example
       kernel version
       3.9.9   3.10.5
boot
1      0xbla0  0xbla1
2      0xbla2  0xbla3
3      0xbla4  0xbla5

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375209890.a1Edb2.6118
Date: Tue, 30 Jul 2013 18:44:50 +0000
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
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67315#c16">comment #16</a>)
<span class="quote">&gt; Oh, one additional thing...nouveau never seemed to work with this hardware.</span >
Ouch, now that is interesting :)

<span class="quote">&gt; I do appreciate your help on this Emil. I just wanted you to know that and
&gt; if I seem a bit, well, dense it's because I'm not that familiar with how the
&gt; entire X mechanism works on this sort of hardware.</span >
We all have our strengths and weaknesses :)

Looking at your latest dmesg, the pointer have changed from 0 to another
(probably invalid) value - 0xfe00ccc6

nouveau E[  PGRAPH][0000:02:00.0] ch 1 [0x0007cb0000 DRM] subc 3 class 0x502d
mthd 0x0860 data 0xfe00ccc6

Would be great if you can do the following

* Notice if the the value varies between reboots, or does it differ on kernel
version

example
       kernel version
       3.9.9   3.10.5
boot
1      0xbla0  0xbla1
2      0xbla2  0xbla3
3      0xbla4  0xbla5</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375209890.a1Edb2.6118--

--===============0055263513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0055263513==--
