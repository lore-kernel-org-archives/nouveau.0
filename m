From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98629] OpenGL applications warns "MESA-LOADER:
 failed to retrieve device information"
Date: Tue, 08 Nov 2016 15:44:23 +0000
Message-ID: <bug-98629-8800-PqM7Y4GC9u@http.bugs.freedesktop.org/>
References: <bug-98629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0307781223=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0307781223==
Content-Type: multipart/alternative; boundary="14786198620.f7686d.14197";
 charset="UTF-8"


--14786198620.f7686d.14197
Date: Tue, 8 Nov 2016 15:44:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98629

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org
                   |rg                          |org
          Component|Drivers/DRI/nouveau         |Mesa core
         QA Contact|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org
                   |rg                          |org

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
[Moving to 'core' since it's not really nouveau specific]

Does this happen with glxinfo/glxgears as well ? If so can you attach the
output of $strace glxinfo

If glxinfo works fine, while $program does not, attach the output of
$DL_DEBUG=3Dlibs $program

Thanks

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14786198620.f7686d.14197
Date: Tue, 8 Nov 2016 15:44:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:emil.l.ve=
likov&#64;gmail.com" title=3D"Emil Velikov &lt;emil.l.velikov&#64;gmail.com=
&gt;"> <span class=3D"fn">Emil Velikov</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - OpenGL applications warns &quot;MESA-LOADER: failed to re=
trieve device information&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98629">bug 98629<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Drivers/DRI/nouveau
           </td>
           <td>Mesa core
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - OpenGL applications warns &quot;MESA-LOADER: failed to re=
trieve device information&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98629#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - OpenGL applications warns &quot;MESA-LOADER: failed to re=
trieve device information&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98629">bug 98629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
emil.l.velikov&#64;gmail.com" title=3D"Emil Velikov &lt;emil.l.velikov&#64;=
gmail.com&gt;"> <span class=3D"fn">Emil Velikov</span></a>
</span></b>
        <pre>[Moving to 'core' since it's not really nouveau specific]

Does this happen with glxinfo/glxgears as well ? If so can you attach the
output of $strace glxinfo

If glxinfo works fine, while $program does not, attach the output of
$DL_DEBUG=3Dlibs $program

Thanks</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14786198620.f7686d.14197--

--===============0307781223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0307781223==--
