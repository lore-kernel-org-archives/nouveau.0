From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69982] [NV86] GPU+system crash with nouveau and
	kernel 3.12-rc3
Date: Mon, 30 Sep 2013 20:39:16 +0000
Message-ID: <bug-69982-8800-qrMLcA3x4C@http.bugs.freedesktop.org/>
References: <bug-69982-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2076120232=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69982-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2076120232==
Content-Type: multipart/alternative; boundary="1380573556.F3Ec341.8596"; charset="us-ascii"


--1380573556.F3Ec341.8596
Date: Mon, 30 Sep 2013 20:39:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69982

--- Comment #7 from Mike C <mike.cloaked-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I added nouveau.config=NvMSI=0 to the kernel boot line and the system booted
fine so far, KDM gave a normal offer of login, and KDE login worked fine. I
tested the system for several minutes, running konsole, and the chrome browser
and so far there is no crash at all. I will attach the new kernel log that is
current for this configuration.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380573556.F3Ec341.8596
Date: Mon, 30 Sep 2013 20:39:16 +0000
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
   title="NEW --- - [NV86] GPU+system crash with nouveau and kernel 3.12-rc3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69982#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] GPU+system crash with nouveau and kernel 3.12-rc3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69982">bug 69982</a>
              from <span class="vcard"><a class="email" href="mailto:mike.cloaked&#64;gmail.com" title="Mike C &lt;mike.cloaked&#64;gmail.com&gt;"> <span class="fn">Mike C</span></a>
</span></b>
        <pre>I added nouveau.config=NvMSI=0 to the kernel boot line and the system booted
fine so far, KDM gave a normal offer of login, and KDE login worked fine. I
tested the system for several minutes, running konsole, and the chrome browser
and so far there is no crash at all. I will attach the new kernel log that is
current for this configuration.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380573556.F3Ec341.8596--

--===============2076120232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2076120232==--
