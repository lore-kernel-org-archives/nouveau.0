From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66696] Nouveau does DMA to/from unexpected address
Date: Mon, 08 Jul 2013 17:44:24 +0000
Message-ID: <bug-66696-8800-bmx3mJYMM1@http.bugs.freedesktop.org/>
References: <bug-66696-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1773485813=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66696-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1773485813==
Content-Type: multipart/alternative; boundary="1373305464.Cc5E76d2.12428"; charset="us-ascii"


--1373305464.Cc5E76d2.12428
Date: Mon, 8 Jul 2013 17:44:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66696

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looking at that redhat bug report, someone added comments about similar issues
on NV43 a while after it was closed. Since you have a NV4B, I expect that the
issue is the same.

Has this always been happening, or is this a new issue? (Guessing the
former...)

If it's a new issue, doing a kernel bisect would narrow down the commit that
broke things.

If it has always been like that, does this issue occur with the nvidia binary
driver? If not, doing an mmiotrace would be helpful (guide at
https://wiki.ubuntu.com/X/MMIOTracing). The register written to by 4eb3033c
only exists on NV50+ according to envytools.

Are all the errors the same (i.e. trying to read from address 0) or does it
vary?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373305464.Cc5E76d2.12428
Date: Mon, 8 Jul 2013 17:44:24 +0000
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
   title="NEW --- - Nouveau does DMA to/from unexpected address"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66696#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau does DMA to/from unexpected address"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66696">bug 66696</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looking at that redhat bug report, someone added comments about similar issues
on NV43 a while after it was closed. Since you have a NV4B, I expect that the
issue is the same.

Has this always been happening, or is this a new issue? (Guessing the
former...)

If it's a new issue, doing a kernel bisect would narrow down the commit that
broke things.

If it has always been like that, does this issue occur with the nvidia binary
driver? If not, doing an mmiotrace would be helpful (guide at
<a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a>). The register written to by 4eb3033c
only exists on NV50+ according to envytools.

Are all the errors the same (i.e. trying to read from address 0) or does it
vary?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373305464.Cc5E76d2.12428--

--===============1773485813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1773485813==--
