From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63263] X server crash in nouveau_xv.c:NVPutImage
 (NVCopyNV12ColorPlanes)
Date: Mon, 29 Apr 2013 13:48:50 +0000
Message-ID: <bug-63263-8800-pDToMBHcsV@http.bugs.freedesktop.org/>
References: <bug-63263-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1569037607=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63263-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1569037607==
Content-Type: multipart/alternative; boundary="1367243330.C4320522.15681"; charset="us-ascii"


--1367243330.C4320522.15681
Date: Mon, 29 Apr 2013 13:48:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63263

--- Comment #4 from Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
You can leave the last few pixels uninitialized. The last few pixels already
contained garbage, and it's up to the implementation to make sure they're not
included when rendering the picture. :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1367243330.C4320522.15681
Date: Mon, 29 Apr 2013 13:48:50 +0000
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
   title="NEW --- - X server crash in nouveau_xv.c:NVPutImage (NVCopyNV12ColorPlanes)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63263#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X server crash in nouveau_xv.c:NVPutImage (NVCopyNV12ColorPlanes)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63263">bug 63263</a>
              from <span class="vcard"><a class="email" href="mailto:m.b.lankhorst&#64;gmail.com" title="Maarten Lankhorst &lt;m.b.lankhorst&#64;gmail.com&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>You can leave the last few pixels uninitialized. The last few pixels already
contained garbage, and it's up to the implementation to make sure they're not
included when rendering the picture. :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1367243330.C4320522.15681--

--===============1569037607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1569037607==--
