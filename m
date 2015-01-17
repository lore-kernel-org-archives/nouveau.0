From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68348] [piglit] shaders/glsl-array-bounds-02 (+even
 nrs) produces TRAP , TRAP_MP - TP0: Unhandled ustatus 0x00000001
Date: Sat, 17 Jan 2015 01:03:41 +0000
Message-ID: <bug-68348-8800-wcYpeSGjii@http.bugs.freedesktop.org/>
References: <bug-68348-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0647510381=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68348-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0647510381==
Content-Type: multipart/alternative; boundary="1421456620.6bF372.31599"; charset="UTF-8"


--1421456620.6bF372.31599
Date: Sat, 17 Jan 2015 01:03:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68348

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The piglit test got changed in the meanwhile. It's an out-of-bounds access, I
think the error in dmesg is legit...ish. Not sure. We could turn off error
reporting, which afaik is what the blob does.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421456620.6bF372.31599
Date: Sat, 17 Jan 2015 01:03:40 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO - [piglit] shaders/glsl-array-bounds-02 (+even nrs) produces TRAP , TRAP_MP - TP0: Unhandled ustatus 0x00000001"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68348#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - [piglit] shaders/glsl-array-bounds-02 (+even nrs) produces TRAP , TRAP_MP - TP0: Unhandled ustatus 0x00000001"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68348">bug 68348</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The piglit test got changed in the meanwhile. It's an out-of-bounds access, I
think the error in dmesg is legit...ish. Not sure. We could turn off error
reporting, which afaik is what the blob does.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421456620.6bF372.31599--

--===============0647510381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0647510381==--
