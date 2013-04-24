From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] Distorted graphics on NVIDIA GeForce 8400M G
 after upgrade the kernel to 3.7.0 version
Date: Wed, 24 Apr 2013 10:01:53 +0000
Message-ID: <bug-58378-8800-1giOKfB9oQ@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2058399774=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2058399774==
Content-Type: multipart/alternative; boundary="1366797713.dEC24.15710"; charset="us-ascii"


--1366797713.dEC24.15710
Date: Wed, 24 Apr 2013 10:01:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #11 from Paulo Castro <pauloedgarcastro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
After further investigation, this issue only seems to happen to applications
using the gtk libs.
In my case at least ...

After triggering the bug, any app which is using the GTK libs will be affected.
It does not seem to affect other app's ( not using gtk ) rendering process.

Also, the same issue doesn't happen whilst using the NVIDIA drivers, which are
just impossible to use as in my case the system is just unusable slow.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1366797713.dEC24.15710
Date: Wed, 24 Apr 2013 10:01:53 +0000
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
   title="NEW --- - Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:pauloedgarcastro&#64;gmail.com" title="Paulo Castro &lt;pauloedgarcastro&#64;gmail.com&gt;"> <span class="fn">Paulo Castro</span></a>
</span></b>
        <pre>After further investigation, this issue only seems to happen to applications
using the gtk libs.
In my case at least ...

After triggering the bug, any app which is using the GTK libs will be affected.
It does not seem to affect other app's ( not using gtk ) rendering process.

Also, the same issue doesn't happen whilst using the NVIDIA drivers, which are
just impossible to use as in my case the system is just unusable slow.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1366797713.dEC24.15710--

--===============2058399774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2058399774==--
