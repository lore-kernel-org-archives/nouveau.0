From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89455] [NVC0/Gallium] Unigine Heaven black and white
	boxes
Date: Wed, 29 Apr 2015 00:18:45 +0000
Message-ID: <bug-89455-8800-BTiD3sJiP1@http.bugs.freedesktop.org/>
References: <bug-89455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1186844859=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1186844859==
Content-Type: multipart/alternative; boundary="1430266725.B8Ddb1.18639"; charset="UTF-8"


--1430266725.B8Ddb1.18639
Date: Wed, 29 Apr 2015 00:18:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89455

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This should be fixed by:

commit 6fe0d4f0354418c6e68dd352996e9891ddd4dfd6
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Tue Apr 28 03:30:08 2015 -0400

    nvc0/ir: flush denorms to zero in non-compute shaders

    This will set the FTZ flag (flush denorms to zero) on all opcodes that
    can take it.

    This resolves issues in Unigine Heaven 4.0 where there were solid-filled
    boxes popping up.

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=89455
    Cc: "10.4 10.5" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1430266725.B8Ddb1.18639
Date: Wed, 29 Apr 2015 00:18:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC0/Gallium] Unigine Heaven black and white boxes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89455">bug 89455</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC0/Gallium] Unigine Heaven black and white boxes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89455#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC0/Gallium] Unigine Heaven black and white boxes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89455">bug 89455</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This should be fixed by:

commit 6fe0d4f0354418c6e68dd352996e9891ddd4dfd6
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Tue Apr 28 03:30:08 2015 -0400

    nvc0/ir: flush denorms to zero in non-compute shaders

    This will set the FTZ flag (flush denorms to zero) on all opcodes that
    can take it.

    This resolves issues in Unigine Heaven 4.0 where there were solid-filled
    boxes popping up.

    Bugzilla: <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC0/Gallium] Unigine Heaven black and white boxes"
   href="show_bug.cgi?id=89455">https://bugs.freedesktop.org/show_bug.cgi?id=89455</a>
    Cc: &quot;10.4 10.5&quot; &lt;<a href="mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stable&#64;lists.freedesktop.org</a>&gt;
    Signed-off-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;</pre>
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

--1430266725.B8Ddb1.18639--

--===============1186844859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1186844859==--
