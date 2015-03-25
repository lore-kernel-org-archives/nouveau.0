From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89759] WebGL OGL ES GLSL conformance test with mesa
 drivers fails
Date: Wed, 25 Mar 2015 14:32:32 +0000
Message-ID: <bug-89759-8800-HUHnzUS5Hv@http.bugs.freedesktop.org/>
References: <bug-89759-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0019448277=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89759-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0019448277==
Content-Type: multipart/alternative; boundary="1427293952.72C6062.18978"; charset="UTF-8"


--1427293952.72C6062.18978
Date: Wed, 25 Mar 2015 14:32:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89759

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Drivers/DRI/nouveau         |Mesa core
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org
                   |rg                          |org
         QA Contact|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org
                   |rg                          |org

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
These also fail on r600. This is probably a st/mesa-level or glsl ir-level
issue. Haven't gotten any confirmation from anyone using i965, but I'm
reassigning this to mesa core.

I suspect that the following is the cause of the trouble:

    b[1] = a[1];
    c[1] += d[1];
    a[1] += 1.0;

If the += 1 gets reordered to before the b[1] = a[1], then we're in trouble. I
get cyan as the output, with 182 for the first component, which means that

    if(b[1] == 1.0) q += 2.0;

is failing. Haven't quite figured out how to convert these webgl tests into
piglits quite yet, although this one should be easy since it's not
input-dependent.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1427293952.72C6062.18978
Date: Wed, 25 Mar 2015 14:32:32 +0000
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
   title="NEW - WebGL OGL ES GLSL conformance test with mesa drivers fails"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89759">bug 89759</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Drivers/DRI/nouveau
           </td>
           <td>Mesa core
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">QA Contact</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - WebGL OGL ES GLSL conformance test with mesa drivers fails"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89759#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - WebGL OGL ES GLSL conformance test with mesa drivers fails"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89759">bug 89759</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>These also fail on r600. This is probably a st/mesa-level or glsl ir-level
issue. Haven't gotten any confirmation from anyone using i965, but I'm
reassigning this to mesa core.

I suspect that the following is the cause of the trouble:

    b[1] = a[1];
    c[1] += d[1];
    a[1] += 1.0;

If the += 1 gets reordered to before the b[1] = a[1], then we're in trouble. I
get cyan as the output, with 182 for the first component, which means that

    if(b[1] == 1.0) q += 2.0;

is failing. Haven't quite figured out how to convert these webgl tests into
piglits quite yet, although this one should be easy since it's not
input-dependent.</pre>
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

--1427293952.72C6062.18978--

--===============0019448277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0019448277==--
