From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91526] World of Warcraft (on Wine) has UI corruption
 with nouveau
Date: Fri, 25 Mar 2016 23:36:14 +0000
Message-ID: <bug-91526-8800-dCC7gxx6RJ@http.bugs.freedesktop.org/>
References: <bug-91526-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0134422028=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91526-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0134422028==
Content-Type: multipart/alternative; boundary="14589489741.d998cB0b3.10970";
 charset="UTF-8"


--14589489741.d998cB0b3.10970
Date: Fri, 25 Mar 2016 23:36:14 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=91526

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
FTR, in the trace, things go wrong between call 722316 and 722358. In the
middle, a SRGB8_ALPHA8 texture is created, and receives an upload from GL_BGRA
+ 4_4_4_4_REV data. According to qapitrace, that data is not properly reflected
in the texture.

Running this with llvmpipe, the first glTexSubImage2D clears the data (all 0's)
while the second glTexSubImage2D uploads the font. Since the font texture
contains garbage, so does the remaining rendering. Need to figure out why the
texture upload fails with the data in question.

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14589489741.d998cB0b3.10970
Date: Fri, 25 Mar 2016 23:36:14 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526">bug 91526</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>FTR, in the trace, things go wrong between call 722316 and 722358. In the
middle, a SRGB8_ALPHA8 texture is created, and receives an upload from GL_BGRA
+ 4_4_4_4_REV data. According to qapitrace, that data is not properly reflected
in the texture.

Running this with llvmpipe, the first glTexSubImage2D clears the data (all 0's)
while the second glTexSubImage2D uploads the font. Since the font texture
contains garbage, so does the remaining rendering. Need to figure out why the
texture upload fails with the data in question.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14589489741.d998cB0b3.10970--

--===============0134422028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0134422028==--
