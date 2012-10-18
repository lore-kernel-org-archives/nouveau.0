From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55832] xf86-video-nouveau-1.0.2 - Xorg crashes once
 a week : segmentation fault in NVRefreshArea
Date: Thu, 18 Oct 2012 17:56:17 +0000
Message-ID: <bug-55832-8800-psCBIdFJoC@http.bugs.freedesktop.org/>
References: <bug-55832-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1771873115=="
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


--===============1771873115==
Content-Type: multipart/alternative; boundary="1350582977.35c6E041.3537"; charset="us-ascii"


--1350582977.35c6E041.3537
Date: Thu, 18 Oct 2012 17:56:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55832

--- Comment #2 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
It might be fixed by:
http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=01c9a9cff7d6232ca6eafa59dd60833a0d9cdc5b

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350582977.35c6E041.3537
Date: Thu, 18 Oct 2012 17:56:17 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55832#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xf86-video-nouveau-1.0.2 - Xorg crashes once a week : segmentation fault in NVRefreshArea"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55832">bug 55832</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>It might be fixed by:
<a href="http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=01c9a9cff7d6232ca6eafa59dd60833a0d9cdc5b">http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=01c9a9cff7d6232ca6eafa59dd60833a0d9cdc5b</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350582977.35c6E041.3537--

--===============1771873115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1771873115==--
