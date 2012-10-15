From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55832] xf86-video-nouveau-1.0.2 - Xorg crashes once
 a week : segmentation fault in NVRefreshArea
Date: Mon, 15 Oct 2012 17:48:19 +0000
Message-ID: <bug-55832-8800-P4clerCHk4@http.bugs.freedesktop.org/>
References: <bug-55832-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0510997934=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55832-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0510997934==
Content-Type: multipart/alternative; boundary="1350323298.FbC8C1.6070"; charset="us-ascii"


--1350323298.FbC8C1.6070
Date: Mon, 15 Oct 2012 17:48:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55832

--- Comment #1 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Please attach full kernel and xserver logs as described here:
http://nouveau.freedesktop.org/wiki/Bugs#HowToReport

And next time it will crash, "print" (gdb command) as many variables from:
http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/tree/src/nv_shadow.c#n32
as possible, in particular pNv->scanout->map.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350323298.FbC8C1.6070
Date: Mon, 15 Oct 2012 17:48:18 +0000
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
   title="NEW --- - xf86-video-nouveau-1.0.2 - Xorg crashes once a week : segmentation fault in NVRefreshArea"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55832#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xf86-video-nouveau-1.0.2 - Xorg crashes once a week : segmentation fault in NVRefreshArea"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55832">bug 55832</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>Please attach full kernel and xserver logs as described here:
<a href="http://nouveau.freedesktop.org/wiki/Bugs#HowToReport">http://nouveau.freedesktop.org/wiki/Bugs#HowToReport</a>

And next time it will crash, &quot;print&quot; (gdb command) as many variables from:
<a href="http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/tree/src/nv_shadow.c#n32">http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/tree/src/nv_shadow.c#n32</a>
as possible, in particular pNv-&gt;scanout-&gt;map.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350323298.FbC8C1.6070--

--===============0510997934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0510997934==--
