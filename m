From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55450] [NV17] nouveau driver fails to restore screen
 content / video mode after resume from s2ram
Date: Wed, 16 Oct 2013 13:53:05 +0000
Message-ID: <bug-55450-8800-PkLlJCL8zk@http.bugs.freedesktop.org/>
References: <bug-55450-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1236244910=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55450-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1236244910==
Content-Type: multipart/alternative; boundary="1381931585.c3F71.2335"; charset="us-ascii"


--1381931585.c3F71.2335
Date: Wed, 16 Oct 2013 13:53:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55450

--- Comment #11 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
In deed, it is now a kernel issue (... and I doubt that it previously was)!
I have tried to s2ram from init=/bin/bash with mount -t sysfs none /sys:
* s2ram
  result: colorful stars; sysrq-keys are no more working
* s2ram -nofbsuspend
  result: bluescreen; sysrq-keys are not working
* nouveau.modeset=0; s2ram
  result: text console is restored and almost readable; however sysrq-keys are
still not working.

kernel-3.11.3-1.1-default

(I would wonder if you still needed libdrm, Mesa version by now; there will be
no pm-suspend dmesg on init=/bin/bash). Should I re-post on kernel.org?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381931585.c3F71.2335
Date: Wed, 16 Oct 2013 13:53:05 +0000
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
   title="REOPENED --- - [NV17] nouveau driver fails to restore screen content / video mode after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55450#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV17] nouveau driver fails to restore screen content / video mode after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55450">bug 55450</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>In deed, it is now a kernel issue (... and I doubt that it previously was)!
I have tried to s2ram from init=/bin/bash with mount -t sysfs none /sys:
* s2ram
  result: colorful stars; sysrq-keys are no more working
* s2ram -nofbsuspend
  result: bluescreen; sysrq-keys are not working
* nouveau.modeset=0; s2ram
  result: text console is restored and almost readable; however sysrq-keys are
still not working.

kernel-3.11.3-1.1-default

(I would wonder if you still needed libdrm, Mesa version by now; there will be
no pm-suspend dmesg on init=/bin/bash). Should I re-post on kernel.org?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381931585.c3F71.2335--

--===============1236244910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1236244910==--
