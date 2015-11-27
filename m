From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93110] [NVE4] textureSize() and textureQueryLevels()
 uses a texture bound during the previous draw call
Date: Fri, 27 Nov 2015 22:03:20 +0000
Message-ID: <bug-93110-8800-qGbMgxkcou@http.bugs.freedesktop.org/>
References: <bug-93110-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0597212460=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93110-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0597212460==
Content-Type: multipart/alternative; boundary="1448661800.cFd8A1.19217"; charset="UTF-8"


--1448661800.cFd8A1.19217
Date: Fri, 27 Nov 2015 22:03:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93110

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I did a reverse-bisect, and found this is what fixed it:

commit 5877a594d54fdd2b3aa329f4d35b3491a7ee8a33
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Thu Sep 10 23:58:17 2015 -0400

    nvc0/ir: start offset at texBindBase for txq, like regular texturing

    Curiously this has no actual effect. I think it's because the first 8
    textures are bound in multiple slots for some reason. However seems
    prudent to use these the same way as regular texturing, esp in the case
    where there are more than 8 textures bound.

    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>

I really couldn't find an effect that it practically had at the time. I could
spend time thinking about what the difference is, but... I'm insufficiently
interested. I'll ask for a cherry-pick to the 11.0 branch.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448661800.cFd8A1.19217
Date: Fri, 27 Nov 2015 22:03:20 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE4] textureSize() and textureQueryLevels() uses a texture bound during the previous draw call"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93110#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE4] textureSize() and textureQueryLevels() uses a texture bound during the previous draw call"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93110">bug 93110</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I did a reverse-bisect, and found this is what fixed it:

commit 5877a594d54fdd2b3aa329f4d35b3491a7ee8a33
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Thu Sep 10 23:58:17 2015 -0400

    nvc0/ir: start offset at texBindBase for txq, like regular texturing

    Curiously this has no actual effect. I think it's because the first 8
    textures are bound in multiple slots for some reason. However seems
    prudent to use these the same way as regular texturing, esp in the case
    where there are more than 8 textures bound.

    Signed-off-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;

I really couldn't find an effect that it practically had at the time. I could
spend time thinking about what the difference is, but... I'm insufficiently
interested. I'll ask for a cherry-pick to the 11.0 branch.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448661800.cFd8A1.19217--

--===============0597212460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0597212460==--
