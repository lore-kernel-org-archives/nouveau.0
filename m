From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51409] [NV05] when ubuntu tests the gnome
 environment the nouveau_vieux_dri (ver) segfaults
Date: Mon, 05 Nov 2012 12:10:56 +0000
Message-ID: <bug-51409-8800-fuGCwIfKxl@http.bugs.freedesktop.org/>
References: <bug-51409-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1325526098=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51409-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1325526098==
Content-Type: multipart/alternative; boundary="1352117456.02Bc621C2.31574"; charset="us-ascii"


--1352117456.02Bc621C2.31574
Date: Mon, 5 Nov 2012 12:10:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51409

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Gullik

As your crash indicates a segfault in unity_support_t/nouveau_vieux_dri.so

It (nouveau_vieux_dri.so) is part of the nouveau-dri (the mesa 3d driver),
which is not supported as of yet

The other issue mentioned may or maynot be related, pending on the data to be
provided

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352117456.02Bc621C2.31574
Date: Mon, 5 Nov 2012 12:10:56 +0000
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
   title="NEW --- - [NV05] when ubuntu tests the gnome environment the nouveau_vieux_dri (ver) segfaults"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51409#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV05] when ubuntu tests the gnome environment the nouveau_vieux_dri (ver) segfaults"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51409">bug 51409</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Gullik

As your crash indicates a segfault in unity_support_t/nouveau_vieux_dri.so

It (nouveau_vieux_dri.so) is part of the nouveau-dri (the mesa 3d driver),
which is not supported as of yet

The other issue mentioned may or maynot be related, pending on the data to be
provided</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352117456.02Bc621C2.31574--

--===============1325526098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1325526098==--
