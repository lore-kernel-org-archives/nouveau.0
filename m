From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76376] mesa does not build after nouveau loader
	changes
Date: Thu, 20 Mar 2014 11:27:33 +0000
Message-ID: <bug-76376-8800-3VYBV1sHjF@http.bugs.freedesktop.org/>
References: <bug-76376-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1904771751=="
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


--===============1904771751==
Content-Type: multipart/alternative; boundary="1395314852.b45DB1.3433"; charset="us-ascii"


--1395314852.b45DB1.3433
Date: Thu, 20 Mar 2014 11:27:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76376

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Do you have some funny patches to your libdrm? nouveau_drm.h should be
installed irrespective of whether nouveau is built or not. From
include/drm/Makefile.am:

klibdrmincludedir = ${includedir}/libdrm
klibdrminclude_HEADERS = \
        drm.h \
        drm_mode.h \
        drm_fourcc.h \
        drm_sarea.h \
        i915_drm.h \
        mga_drm.h \
        nouveau_drm.h \
        r128_drm.h \
        radeon_drm.h \
        savage_drm.h \
        sis_drm.h \
        via_drm.h \
        mach64_drm.h \
        qxl_drm.h

All of those should be getting installed, unless my automake-foo sucks (an
entirely plausible theory).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395314852.b45DB1.3433
Date: Thu, 20 Mar 2014 11:27:32 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - mesa does not build after nouveau loader changes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376">bug 76376</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Do you have some funny patches to your libdrm? nouveau_drm.h should be
installed irrespective of whether nouveau is built or not. From
include/drm/Makefile.am:

klibdrmincludedir = ${includedir}/libdrm
klibdrminclude_HEADERS = \
        drm.h \
        drm_mode.h \
        drm_fourcc.h \
        drm_sarea.h \
        i915_drm.h \
        mga_drm.h \
        nouveau_drm.h \
        r128_drm.h \
        radeon_drm.h \
        savage_drm.h \
        sis_drm.h \
        via_drm.h \
        mach64_drm.h \
        qxl_drm.h

All of those should be getting installed, unless my automake-foo sucks (an
entirely plausible theory).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395314852.b45DB1.3433--

--===============1904771751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1904771751==--
