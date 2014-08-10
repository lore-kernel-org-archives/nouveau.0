From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81283] Icons are misrendered when rgb font hinting
 is activated [NV18]
Date: Sun, 10 Aug 2014 06:27:49 +0000
Message-ID: <bug-81283-8800-77js0oHxSk@http.bugs.freedesktop.org/>
References: <bug-81283-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1344489303=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81283-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1344489303==
Content-Type: multipart/alternative; boundary="1407652068.3BCd082B1.20549"; charset="us-ascii"


--1407652068.3BCd082B1.20549
Date: Sun, 10 Aug 2014 06:27:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81283

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I just sent a bunch of patches to the list... two of the patches are no-ops,
but these two actually change functionality:

http://lists.freedesktop.org/archives/nouveau/2014-August/018270.html
http://lists.freedesktop.org/archives/nouveau/2014-August/018271.html

please see if applying these fixes the issue for you.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407652068.3BCd082B1.20549
Date: Sun, 10 Aug 2014 06:27:48 +0000
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
   title="NEW --- - Icons are misrendered when rgb font hinting is activated [NV18]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81283#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Icons are misrendered when rgb font hinting is activated [NV18]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81283">bug 81283</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I just sent a bunch of patches to the list... two of the patches are no-ops,
but these two actually change functionality:

<a href="http://lists.freedesktop.org/archives/nouveau/2014-August/018270.html">http://lists.freedesktop.org/archives/nouveau/2014-August/018270.html</a>
<a href="http://lists.freedesktop.org/archives/nouveau/2014-August/018271.html">http://lists.freedesktop.org/archives/nouveau/2014-August/018271.html</a>

please see if applying these fixes the issue for you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407652068.3BCd082B1.20549--

--===============1344489303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1344489303==--
