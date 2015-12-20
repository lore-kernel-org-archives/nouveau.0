From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93454] Can't build with LLVM/clang 3.7.0 - SSSE3
 instruction set not enabled
Date: Sun, 20 Dec 2015 01:54:14 +0000
Message-ID: <bug-93454-8800-PGyTcc3syR@http.bugs.freedesktop.org/>
References: <bug-93454-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0240198717=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93454-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0240198717==
Content-Type: multipart/alternative; boundary="1450576453.756f1.15107"; charset="UTF-8"


--1450576453.756f1.15107
Date: Sun, 20 Dec 2015 01:54:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93454

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Hmmm... this comes from

#if defined(PIPE_ARCH_SSSE3)

#include <tmmintrin.h>

Which in turn comes from, hilariously,

#if defined(PIPE_CC_GCC) && (__GNUC__ * 100 + __GNUC_MINOR__) < 409 &&
!defined(__SSSE3__)
/* #warning SSE3 support requires -msse3 compiler options before GCC 4.9 */
#else
#define PIPE_ARCH_SSSE3
#endif

I'm guessing that was meant to be

#if defined(PIPE_CC_GCC) && (__GNUC__ * 100 + __GNUC_MINOR__) < 409 ||
!defined(__SSSE3__)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1450576453.756f1.15107
Date: Sun, 20 Dec 2015 01:54:13 +0000
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
   title="NEW - Can't build with LLVM/clang 3.7.0 - SSSE3 instruction set not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93454#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Can't build with LLVM/clang 3.7.0 - SSSE3 instruction set not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93454">bug 93454</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Hmmm... this comes from

#if defined(PIPE_ARCH_SSSE3)

#include &lt;tmmintrin.h&gt;

Which in turn comes from, hilariously,

#if defined(PIPE_CC_GCC) &amp;&amp; (__GNUC__ * 100 + __GNUC_MINOR__) &lt; 409 &amp;&amp;
!defined(__SSSE3__)
/* #warning SSE3 support requires -msse3 compiler options before GCC 4.9 */
#else
#define PIPE_ARCH_SSSE3
#endif

I'm guessing that was meant to be

#if defined(PIPE_CC_GCC) &amp;&amp; (__GNUC__ * 100 + __GNUC_MINOR__) &lt; 409 ||
!defined(__SSSE3__)</pre>
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

--1450576453.756f1.15107--

--===============0240198717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0240198717==--
