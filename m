From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90569] [NV67] GUI freezes after startup of Ubuntu
 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at
 f84c8000]
Date: Mon, 26 Oct 2015 04:59:05 +0000
Message-ID: <bug-90569-8800-PVEt32eG8J@http.bugs.freedesktop.org/>
References: <bug-90569-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1367461444=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90569-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1367461444==
Content-Type: multipart/alternative; boundary="1445835545.C4F411.6797"; charset="UTF-8"


--1445835545.C4F411.6797
Date: Mon, 26 Oct 2015 04:59:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90569

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The patch in question should be included in kernels 4.2+ and potentially some
of the older stable trees. The upstream patch is:

commit d108142c0840ce389cd9898aa76943b3fb430b83
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Mon Jun 29 04:07:20 2015 -0400

    drm/nouveau/fbcon/nv11-: correctly account for ring space usage

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445835545.C4F411.6797
Date: Mon, 26 Oct 2015 04:59:05 +0000
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
   title="NEW - [NV67] GUI freezes after startup of Ubuntu 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90569#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV67] GUI freezes after startup of Ubuntu 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90569">bug 90569</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The patch in question should be included in kernels 4.2+ and potentially some
of the older stable trees. The upstream patch is:

commit d108142c0840ce389cd9898aa76943b3fb430b83
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Mon Jun 29 04:07:20 2015 -0400

    drm/nouveau/fbcon/nv11-: correctly account for ring space usage</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445835545.C4F411.6797--

--===============1367461444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1367461444==--
