From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69952] [NVAA] Xorg crash+restart after glxgears on
	3.12-rc2
Date: Fri, 22 Nov 2013 11:19:15 +0000
Message-ID: <bug-69952-8800-hKlKLqURak@http.bugs.freedesktop.org/>
References: <bug-69952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1571844496=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69952-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1571844496==
Content-Type: multipart/alternative; boundary="1385119155.340D6f1.523"; charset="us-ascii"


--1385119155.340D6f1.523
Date: Fri, 22 Nov 2013 11:19:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69952

--- Comment #4 from dirkneukirchen-S0/GAf8tV78@public.gmane.org ---
Created attachment 89628
  --> https://bugs.freedesktop.org/attachment.cgi?id=89628&action=edit
dmesg after crash of Xorg when running glxgears

the log contains more debug info; cmdline had "nouveau.debug=trace
drm.debug=14"

[  190.676020] nouveau E[glxgears[3270]] failed to idle channel 0xcccc0000
[glxgears[3270]]
[  205.676014] nouveau E[glxgears[3270]] failed to idle channel 0xcccc0000
[glxgears[3270]]
[  205.676119] nouveau E[     PFB][0000:02:00.0] trapped read at 0x0020012020
on channel 0x0000797f [unknown] SEMAPHORE_BG/PFIFO_READ/00 reason:
PAGE_NOT_PRESENT

after that many:
nouveau E[  PGRAPH][0000:02:00.0]  ILLEGAL_MTHD ILLEGAL_CLASS

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385119155.340D6f1.523
Date: Fri, 22 Nov 2013 11:19:15 +0000
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
   title="NEW --- - [NVAA] Xorg crash+restart after glxgears on 3.12-rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69952#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Xorg crash+restart after glxgears on 3.12-rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69952">bug 69952</a>
              from <span class="vcard"><a class="email" href="mailto:dirkneukirchen&#64;web.de" title="dirkneukirchen&#64;web.de">dirkneukirchen&#64;web.de</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=89628" name="attach_89628" title="dmesg after crash of Xorg when running glxgears">attachment 89628</a> <a href="attachment.cgi?id=89628&amp;action=edit" title="dmesg after crash of Xorg when running glxgears">[details]</a></span>
dmesg after crash of Xorg when running glxgears

the log contains more debug info; cmdline had &quot;nouveau.debug=trace
drm.debug=14&quot;

[  190.676020] nouveau E[glxgears[3270]] failed to idle channel 0xcccc0000
[glxgears[3270]]
[  205.676014] nouveau E[glxgears[3270]] failed to idle channel 0xcccc0000
[glxgears[3270]]
[  205.676119] nouveau E[     PFB][0000:02:00.0] trapped read at 0x0020012020
on channel 0x0000797f [unknown] SEMAPHORE_BG/PFIFO_READ/00 reason:
PAGE_NOT_PRESENT

after that many:
nouveau E[  PGRAPH][0000:02:00.0]  ILLEGAL_MTHD ILLEGAL_CLASS</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385119155.340D6f1.523--

--===============1571844496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1571844496==--
