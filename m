From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85160] [NV94] INVALID_STATE error,
 X fails to start on GeForce 9600 GT with dual monitors,
 kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards
Date: Sun, 26 Oct 2014 00:50:38 +0000
Message-ID: <bug-85160-8800-X7QNyGZbPd@http.bugs.freedesktop.org/>
References: <bug-85160-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0314328704=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85160-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0314328704==
Content-Type: multipart/alternative; boundary="1414284637.7aD762.26980"; charset="UTF-8"


--1414284637.7aD762.26980
Date: Sun, 26 Oct 2014 00:50:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85160

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
A user on IRC bisected a failure that resulted in PDISP getting very unhappy
to:

commit 1dce6264045cd23e9c07574ed0bb31c7dce9354f
Author: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Date:   Fri Sep 12 18:00:13 2014 +0200

    drm/nv50/kms: Set VBLANK time in modeset script

    Solves blinking on reclocking memory. The value set is an underestimate,
but
    with non-reduced vblanking this should give us plenty of time

    Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

You should safely be able to revert this commit, see if that helps.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414284637.7aD762.26980
Date: Sun, 26 Oct 2014 00:50:37 +0000
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
   title="NEW - [NV94] INVALID_STATE error, X fails to start on GeForce 9600 GT with dual monitors, kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85160#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] INVALID_STATE error, X fails to start on GeForce 9600 GT with dual monitors, kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85160">bug 85160</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>A user on IRC bisected a failure that resulted in PDISP getting very unhappy
to:

commit 1dce6264045cd23e9c07574ed0bb31c7dce9354f
Author: Roy Spliet &lt;<a href="mailto:rspliet&#64;eclipso.eu">rspliet&#64;eclipso.eu</a>&gt;
Date:   Fri Sep 12 18:00:13 2014 +0200

    drm/nv50/kms: Set VBLANK time in modeset script

    Solves blinking on reclocking memory. The value set is an underestimate,
but
    with non-reduced vblanking this should give us plenty of time

    Signed-off-by: Roy Spliet &lt;<a href="mailto:rspliet&#64;eclipso.eu">rspliet&#64;eclipso.eu</a>&gt;
    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

You should safely be able to revert this commit, see if that helps.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414284637.7aD762.26980--

--===============0314328704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0314328704==--
