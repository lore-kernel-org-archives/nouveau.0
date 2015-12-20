From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93454] Can't build with LLVM/clang 3.7.0 - SSSE3
 instruction set not enabled
Date: Sun, 20 Dec 2015 03:03:10 +0000
Message-ID: <bug-93454-8800-93Z7U52IzR@http.bugs.freedesktop.org/>
References: <bug-93454-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0304233678=="
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


--===============0304233678==
Content-Type: multipart/alternative; boundary="1450580589.35cFa61.30581"; charset="UTF-8"


--1450580589.35cFa61.30581
Date: Sun, 20 Dec 2015 03:03:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93454

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This logic was last altered in the change below... My copy of clang 3.5
purports to be gcc 4.2.1. What does clang 3.7 report?

clang -E -dM - < /dev/null | grep GNUC

commit eb643db30e1bdf5171d0a012674016c317925b6e
Author: Jose Fonseca <jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Date:   Sun Aug 9 11:21:03 2015 +0100

    gallium: GCC 4.9 allows to include tmmintrin.h without -msse3.

    Fixes build with MinGW x86_64 build with GCC 4.9, due to conflicting
    definition _mm_shuffle_epi8 of u_sse.h and system headers.

    Trivial.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1450580589.35cFa61.30581
Date: Sun, 20 Dec 2015 03:03:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Can't build with LLVM/clang 3.7.0 - SSSE3 instruction set not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93454">bug 93454</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>jfonseca&#64;vmware.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Can't build with LLVM/clang 3.7.0 - SSSE3 instruction set not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93454#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Can't build with LLVM/clang 3.7.0 - SSSE3 instruction set not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93454">bug 93454</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This logic was last altered in the change below... My copy of clang 3.5
purports to be gcc 4.2.1. What does clang 3.7 report?

clang -E -dM - &lt; /dev/null | grep GNUC

commit eb643db30e1bdf5171d0a012674016c317925b6e
Author: Jose Fonseca &lt;<a href="mailto:jfonseca&#64;vmware.com">jfonseca&#64;vmware.com</a>&gt;
Date:   Sun Aug 9 11:21:03 2015 +0100

    gallium: GCC 4.9 allows to include tmmintrin.h without -msse3.

    Fixes build with MinGW x86_64 build with GCC 4.9, due to conflicting
    definition _mm_shuffle_epi8 of u_sse.h and system headers.

    Trivial.</pre>
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

--1450580589.35cFa61.30581--

--===============0304233678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0304233678==--
