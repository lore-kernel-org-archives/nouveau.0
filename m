From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61953] arbitrary memory access corrupts kernel
 memory, eventually crashing the kernel
Date: Fri, 12 Apr 2013 10:59:04 +0000
Message-ID: <bug-61953-8800-OkovC7xD9D@http.bugs.freedesktop.org/>
References: <bug-61953-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1088562932=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61953-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1088562932==
Content-Type: multipart/alternative; boundary="1365764344.62d82.20787"; charset="us-ascii"


--1365764344.62d82.20787
Date: Fri, 12 Apr 2013 10:59:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61953

--- Comment #8 from Adrian Knoth <adi-5gjw4BGRu82yAo/rNOIehoJPQCENF9+z@public.gmane.org> ---

> A short test with the NVIDIA blob did not exhibit this issue, but I'd need
> to run for several days to be sure.

Unlike nouveau, the NVIDIA driver indeed does not crash the system.

More importantly, disabling the flash plugin in chromium leads to increased
uptime before the crash happens, thus indicating a negative correlation between
video memory activity and the time to crash: as said before, the more you run
ardour3 (or chromium with flash), the earlier your (here: my) system will
crash.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365764344.62d82.20787
Date: Fri, 12 Apr 2013 10:59:04 +0000
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
   title="NEW --- - arbitrary memory access corrupts kernel memory, eventually crashing the kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - arbitrary memory access corrupts kernel memory, eventually crashing the kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953">bug 61953</a>
              from <span class="vcard"><a class="email" href="mailto:adi&#64;drcomp.erfurt.thur.de" title="Adrian Knoth &lt;adi&#64;drcomp.erfurt.thur.de&gt;"> <span class="fn">Adrian Knoth</span></a>
</span></b>
        <pre>
<span class="quote">&gt; A short test with the NVIDIA blob did not exhibit this issue, but I'd need
&gt; to run for several days to be sure.</span >

Unlike nouveau, the NVIDIA driver indeed does not crash the system.

More importantly, disabling the flash plugin in chromium leads to increased
uptime before the crash happens, thus indicating a negative correlation between
video memory activity and the time to crash: as said before, the more you run
ardour3 (or chromium with flash), the earlier your (here: my) system will
crash.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365764344.62d82.20787--

--===============1088562932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1088562932==--
