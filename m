From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65576] [NV11] no EGL with nouveau_vieux_dri - no
	DRI_IMAGE
Date: Sun, 09 Jun 2013 17:44:40 +0000
Message-ID: <bug-65576-8800-0Z0ol5PpBF@http.bugs.freedesktop.org/>
References: <bug-65576-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0824050165=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-65576-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0824050165==
Content-Type: multipart/alternative; boundary="1370799880.557a1.22069"; charset="us-ascii"


--1370799880.557a1.22069
Date: Sun, 9 Jun 2013 17:44:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65576

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Chris

The first advice in general would be to try the latest kernel/mesa from git,
although in your case that would be useless

Surprisingly enough I was just checking over nouveau_vieux and how much effort
it would be to bring it up-to speed with the dri/core changes introduced by
Intel, don't get too excited though

With that said afaik no one is working on nouveau_vieux overall so it may be
faster to give it a stab yourself. The intel driver may be a good
start/reference point

Cheers
Emil

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1370799880.557a1.22069
Date: Sun, 9 Jun 2013 17:44:40 +0000
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
   title="NEW --- - [NV11] no EGL with nouveau_vieux_dri - no DRI_IMAGE"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65576#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV11] no EGL with nouveau_vieux_dri - no DRI_IMAGE"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65576">bug 65576</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Chris

The first advice in general would be to try the latest kernel/mesa from git,
although in your case that would be useless

Surprisingly enough I was just checking over nouveau_vieux and how much effort
it would be to bring it up-to speed with the dri/core changes introduced by
Intel, don't get too excited though

With that said afaik no one is working on nouveau_vieux overall so it may be
faster to give it a stab yourself. The intel driver may be a good
start/reference point

Cheers
Emil</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1370799880.557a1.22069--

--===============0824050165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0824050165==--
