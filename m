From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68768] [NV92] PTHERM unhandled intr error during boot
Date: Fri, 30 Aug 2013 19:38:38 +0000
Message-ID: <bug-68768-8800-jhbtIO8Vwt@http.bugs.freedesktop.org/>
References: <bug-68768-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1645246070=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68768-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1645246070==
Content-Type: multipart/alternative; boundary="1377891518.2fcD2.31909"; charset="us-ascii"


--1377891518.2fcD2.31909
Date: Fri, 30 Aug 2013 19:38:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68768

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[    8.796597] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled

If you want to enable it, take a look at
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/thermal/nouveau_thermal

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377891518.2fcD2.31909
Date: Fri, 30 Aug 2013 19:38:38 +0000
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
   title="NEW --- - [NV92] PTHERM unhandled intr error during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68768#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] PTHERM unhandled intr error during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68768">bug 68768</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[    8.796597] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled

If you want to enable it, take a look at
<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/thermal/nouveau_thermal">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/thermal/nouveau_thermal</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377891518.2fcD2.31909--

--===============1645246070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1645246070==--
