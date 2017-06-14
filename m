From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101418] New: Build failure in GNOME Continuous
Date: Wed, 14 Jun 2017 09:27:52 +0000
Message-ID: <bug-101418-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1479523689=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1479523689==
Content-Type: multipart/alternative; boundary="14974324720.dfefD34.21428";
 charset="UTF-8"


--14974324720.dfefD34.21428
Date: Wed, 14 Jun 2017 09:27:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101418

            Bug ID: 101418
           Summary: Build failure in GNOME Continuous
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ebassi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Mesa master branch is failing to build in the GNOME Continuous build servic=
e:

libtool: link: ( cd ".libs" && rm -f "libnouveau.la" && ln -s
"../libnouveau.la" "libnouveau.la" )
/bin/sh ../../../../libtool  --tag=3DCXX   --mode=3Dlink
x86_64-gnomeostree-linux-g++  -g -m64 -mtune=3Dgeneric -Wall -fno-math-errno
-fno-trapping-math    -o nouveau_compiler nouveau_compiler.o libnouveau.la
../../../../src/gallium/auxiliary/libgallium.la
../../../../src/util/libmesautil.la -lm    -lpthread -ldl -ldrm=20
libtool: link: x86_64-gnomeostree-linux-g++ -g -m64 -mtune=3Dgeneric -Wall
-fno-math-errno -fno-trapping-math -o nouveau_compiler nouveau_compiler.o=20
./.libs/libnouveau.a ../../../../src/gallium/auxiliary/.libs/libgallium.a
../../../../src/util/.libs/libmesautil.a -lz -lm -lpthread -ldl -ldrm
../../../../src/gallium/auxiliary/.libs/libgallium.a(tgsi_scan.o): In funct=
ion
`scan_instruction':
/ostbuild/source/mesa/_build/src/gallium/auxiliary/../../../../src/gallium/=
auxiliary/tgsi/tgsi_scan.c:402:
undefined reference to `tgsi_is_bindless_image_file'
/ostbuild/source/mesa/_build/src/gallium/auxiliary/../../../../src/gallium/=
auxiliary/tgsi/tgsi_scan.c:406:
undefined reference to `tgsi_is_bindless_image_file'
collect2: error: ld returned 1 exit status
Makefile:1128: recipe for target 'nouveau_compiler' failed
make[4]: *** [nouveau_compiler] Error 1

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14974324720.dfefD34.21428
Date: Wed, 14 Jun 2017 09:27:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Build failure in GNOME Continuous"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101418">101418</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Build failure in GNOME Continuous
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ebassi&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Mesa master branch is failing to build in the GNOME Continuous=
 build service:

libtool: link: ( cd &quot;.libs&quot; &amp;&amp; rm -f &quot;libnouveau.la&=
quot; &amp;&amp; ln -s
&quot;../libnouveau.la&quot; &quot;libnouveau.la&quot; )
/bin/sh ../../../../libtool  --tag=3DCXX   --mode=3Dlink
x86_64-gnomeostree-linux-g++  -g -m64 -mtune=3Dgeneric -Wall -fno-math-errno
-fno-trapping-math    -o nouveau_compiler nouveau_compiler.o libnouveau.la
../../../../src/gallium/auxiliary/libgallium.la
../../../../src/util/libmesautil.la -lm    -lpthread -ldl -ldrm=20
libtool: link: x86_64-gnomeostree-linux-g++ -g -m64 -mtune=3Dgeneric -Wall
-fno-math-errno -fno-trapping-math -o nouveau_compiler nouveau_compiler.o=20
./.libs/libnouveau.a ../../../../src/gallium/auxiliary/.libs/libgallium.a
../../../../src/util/.libs/libmesautil.a -lz -lm -lpthread -ldl -ldrm
../../../../src/gallium/auxiliary/.libs/libgallium.a(tgsi_scan.o): In funct=
ion
`scan_instruction':
/ostbuild/source/mesa/_build/src/gallium/auxiliary/../../../../src/gallium/=
auxiliary/tgsi/tgsi_scan.c:402:
undefined reference to `tgsi_is_bindless_image_file'
/ostbuild/source/mesa/_build/src/gallium/auxiliary/../../../../src/gallium/=
auxiliary/tgsi/tgsi_scan.c:406:
undefined reference to `tgsi_is_bindless_image_file'
collect2: error: ld returned 1 exit status
Makefile:1128: recipe for target 'nouveau_compiler' failed
make[4]: *** [nouveau_compiler] Error 1</pre>
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

--14974324720.dfefD34.21428--

--===============1479523689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1479523689==--
