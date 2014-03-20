From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76376] mesa does not build after nouveau loader
	changes
Date: Thu, 20 Mar 2014 11:45:48 +0000
Message-ID: <bug-76376-8800-gtXxxw2xgn@http.bugs.freedesktop.org/>
References: <bug-76376-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1486405731=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76376-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1486405731==
Content-Type: multipart/alternative; boundary="1395315948.033BfE0.7372"; charset="us-ascii"


--1395315948.033BfE0.7372
Date: Thu, 20 Mar 2014 11:45:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76376

--- Comment #2 from Jonathan Gray <jsg-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org> ---
In OpenBSD we have a single set of shared kernel/userland drm headers.  Only
the headers for the supported drm drivers (i915 and radeon) are installed.  We
also use a seperate set of Makefiles for libdrm instead of autoconf.

I can propose adding the nouveau_drm.h to our kernel but I'd rather not do this
for the rest of the drm drivers we don't support.  The exynos code in libdrm
and exynos_drm.h for example is GPL licensed and we can't include any GPL
licensed code in the kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395315948.033BfE0.7372
Date: Thu, 20 Mar 2014 11:45:48 +0000
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
   title="NEW --- - mesa does not build after nouveau loader changes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - mesa does not build after nouveau loader changes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376">bug 76376</a>
              from <span class="vcard"><a class="email" href="mailto:jsg&#64;openbsd.org" title="Jonathan Gray &lt;jsg&#64;openbsd.org&gt;"> <span class="fn">Jonathan Gray</span></a>
</span></b>
        <pre>In OpenBSD we have a single set of shared kernel/userland drm headers.  Only
the headers for the supported drm drivers (i915 and radeon) are installed.  We
also use a seperate set of Makefiles for libdrm instead of autoconf.

I can propose adding the nouveau_drm.h to our kernel but I'd rather not do this
for the rest of the drm drivers we don't support.  The exynos code in libdrm
and exynos_drm.h for example is GPL licensed and we can't include any GPL
licensed code in the kernel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395315948.033BfE0.7372--

--===============1486405731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1486405731==--
