From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111167] New: Dividing zero by a uniform in loop
 header causes segfault in nv50_ir::NVC0LegalizeSSA::handleDIV
Date: Thu, 18 Jul 2019 15:38:38 +0000
Message-ID: <bug-111167-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0404695916=="
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


--===============0404695916==
Content-Type: multipart/alternative; boundary="15634643180.0dd4fe.15791"
Content-Transfer-Encoding: 7bit


--15634643180.0dd4fe.15791
Date: Thu, 18 Jul 2019 15:38:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111167

            Bug ID: 111167
           Summary: Dividing zero by a uniform in loop header causes
                    segfault in nv50_ir::NVC0LegalizeSSA::handleDIV
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: abelbriggs1-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 144815
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144815&action=3Dedit
Reproduction shader_test file, core dump of crash

The attached archive contains a shader that, on the build and PC specified
below, causes a segmentation fault in nouveau when run. A core dump of the
crash is supplied as well.

void main()
{
  for(int i =3D 1; 1 >=3D (0 / int((injectionSwitch.y))); 1)
  {
  }
}

The value of injectionSwitch is set to (0.0, 1.0) - so (0 /
int(injectionSwitch.y)) is equivalent to (0 / 1), which should evaluate to =
zero
and make the two conditions equal. Notably, if you remove injectionSwitch a=
nd
replace it with =E2=80=981=E2=80=99, no segfault occurs.

Steps to reproduce:
---------------------------------------------------------------------------=
----
1. Obtain and build piglit, the Mesa OpenGL test suite runner:=20
   https://gitlab.freedesktop.org/mesa/piglit
2. Download the attached archive.
3. From a terminal, execute the supplied test with the piglit GLES3 shader=
=20
   runner:=20
   $ bin/shader_runner_gles3 minimum_testcase.shader_test

Expected results:
---------------------------------------------------------------------------=
----
The shader should run without crashing (it=E2=80=99s an infinite loop that =
does
nothing, but it still shouldn=E2=80=99t crash).

Actual results:
---------------------------------------------------------------------------=
----
The shader causes nouveau to segfault.

Here is a backtrace obtained from using GDB on the core dump=20
(exact command: $ gdb shader_runner_gles3 core):

#0  std::_Deque_iterator<nv50_ir::ValueRef, nv50_ir::ValueRef&,
nv50_ir::ValueRef*>::_Deque_iterator (
    __x=3D<error reading variable: Cannot access memory at address 0xb0>,=20
    this=3D<synthetic pointer>) at /usr/include/c++/8/bits/stl_deque.h:1401
#1  std::_Deque_iterator<nv50_ir::ValueRef, nv50_ir::ValueRef&,
nv50_ir::ValueRef*>::operator+ (__n=3D0, this=3D0xb0) at
/usr/include/c++/8/bits/stl_deque.h:230
#2  std::_Deque_iterator<nv50_ir::ValueRef, nv50_ir::ValueRef&,
nv50_ir::ValueRef*>::operator[] (__n=3D0, this=3D0xb0) at
/usr/include/c++/8/bits/stl_deque.h:247
#3  std::deque<nv50_ir::ValueRef, std::allocator<nv50_ir::ValueRef>
>::operator[] (__n=3D0, this=3D0xa0) at /usr/include/c++/8/bits/stl_deque.h=
:1404
#4  nv50_ir::Instruction::getSrc (s=3D0, this=3D0x0)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir.h:827
#5  nv50_ir::NVC0LegalizeSSA::handleDIV (this=3D0x7ffd7753af60, i=3D0x55d2e=
1b132a0)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp:54
#6  0x00007fc7191cb4b3 in nv50_ir::NVC0LegalizeSSA::visit (
    this=3D0x7ffd7753af60, bb=3D<optimized out>)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp:334
#7  0x00007fc719111928 in nv50_ir::Pass::doRun (this=3D0x7ffd7753af60,=20
    func=3D<optimized out>, ordered=3D<optimized out>, skipPhi=3Dtrue)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:500
#8  0x00007fc7191119f4 in nv50_ir::Pass::doRun (this=3D0x7ffd7753af60,=20
    prog=3D<optimized out>, ordered=3Dfalse, skipPhi=3Dtrue)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_inlines.h:413

Build & PC specs:
---------------------------------------------------------------------------=
----
CPU: Intel Core i7-5820k=20
GPU: nVIDIA GTX 970

OS: Ubuntu 19.04
libdrm: git-5db0f7692d1fdf05f9f6c0c02ffa5a5f4379c1f3
Mesa: git-a110a8090d
Xf86-video-nouveau: 1.0.16
Linux kernel version: 5.0.0-16-generic

This bug was found with GraphicsFuzz: https://github.com/google/graphicsfuzz

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15634643180.0dd4fe.15791
Date: Thu, 18 Jul 2019 15:38:38 +0000
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
   title=3D"NEW - Dividing zero by a uniform in loop header causes segfault=
 in nv50_ir::NVC0LegalizeSSA::handleDIV"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111167">111167</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Dividing zero by a uniform in loop header causes segfault in =
nv50_ir::NVC0LegalizeSSA::handleDIV
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
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>minor
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
          <td>abelbriggs1&#64;hotmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144815=
" name=3D"attach_144815" title=3D"Reproduction shader_test file, core dump =
of crash">attachment 144815</a> <a href=3D"attachment.cgi?id=3D144815&amp;a=
ction=3Dedit" title=3D"Reproduction shader_test file, core dump of crash">[=
details]</a></span>
Reproduction shader_test file, core dump of crash

The attached archive contains a shader that, on the build and PC specified
below, causes a segmentation fault in nouveau when run. A core dump of the
crash is supplied as well.

void main()
{
  for(int i =3D 1; 1 &gt;=3D (0 / int((injectionSwitch.y))); 1)
  {
  }
}

The value of injectionSwitch is set to (0.0, 1.0) - so (0 /
int(injectionSwitch.y)) is equivalent to (0 / 1), which should evaluate to =
zero
and make the two conditions equal. Notably, if you remove injectionSwitch a=
nd
replace it with =E2=80=981=E2=80=99, no segfault occurs.

Steps to reproduce:
---------------------------------------------------------------------------=
----
1. Obtain and build piglit, the Mesa OpenGL test suite runner:=20
   <a href=3D"https://gitlab.freedesktop.org/mesa/piglit">https://gitlab.fr=
eedesktop.org/mesa/piglit</a>
2. Download the attached archive.
3. From a terminal, execute the supplied test with the piglit GLES3 shader=
=20
   runner:=20
   $ bin/shader_runner_gles3 minimum_testcase.shader_test

Expected results:
---------------------------------------------------------------------------=
----
The shader should run without crashing (it=E2=80=99s an infinite loop that =
does
nothing, but it still shouldn=E2=80=99t crash).

Actual results:
---------------------------------------------------------------------------=
----
The shader causes nouveau to segfault.

Here is a backtrace obtained from using GDB on the core dump=20
(exact command: $ gdb shader_runner_gles3 core):

#0  std::_Deque_iterator&lt;nv50_ir::ValueRef, nv50_ir::ValueRef&amp;,
nv50_ir::ValueRef*&gt;::_Deque_iterator (
    __x=3D&lt;error reading variable: Cannot access memory at address 0xb0&=
gt;,=20
    this=3D&lt;synthetic pointer&gt;) at /usr/include/c++/8/bits/stl_deque.=
h:1401
#1  std::_Deque_iterator&lt;nv50_ir::ValueRef, nv50_ir::ValueRef&amp;,
nv50_ir::ValueRef*&gt;::operator+ (__n=3D0, this=3D0xb0) at
/usr/include/c++/8/bits/stl_deque.h:230
#2  std::_Deque_iterator&lt;nv50_ir::ValueRef, nv50_ir::ValueRef&amp;,
nv50_ir::ValueRef*&gt;::operator[] (__n=3D0, this=3D0xb0) at
/usr/include/c++/8/bits/stl_deque.h:247
#3  std::deque&lt;nv50_ir::ValueRef, std::allocator&lt;nv50_ir::ValueRef&gt;
<span class=3D"quote">&gt;::operator[] (__n=3D0, this=3D0xa0) at /usr/inclu=
de/c++/8/bits/stl_deque.h:1404</span >
#4  nv50_ir::Instruction::getSrc (s=3D0, this=3D0x0)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir.h:827
#5  nv50_ir::NVC0LegalizeSSA::handleDIV (this=3D0x7ffd7753af60, i=3D0x55d2e=
1b132a0)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp:54
#6  0x00007fc7191cb4b3 in nv50_ir::NVC0LegalizeSSA::visit (
    this=3D0x7ffd7753af60, bb=3D&lt;optimized out&gt;)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp:334
#7  0x00007fc719111928 in nv50_ir::Pass::doRun (this=3D0x7ffd7753af60,=20
    func=3D&lt;optimized out&gt;, ordered=3D&lt;optimized out&gt;, skipPhi=
=3Dtrue)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:500
#8  0x00007fc7191119f4 in nv50_ir::Pass::doRun (this=3D0x7ffd7753af60,=20
    prog=3D&lt;optimized out&gt;, ordered=3Dfalse, skipPhi=3Dtrue)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_inlines.h:413

Build &amp; PC specs:
---------------------------------------------------------------------------=
----
CPU: Intel Core i7-5820k=20
GPU: nVIDIA GTX 970

OS: Ubuntu 19.04
libdrm: git-5db0f7692d1fdf05f9f6c0c02ffa5a5f4379c1f3
Mesa: git-a110a8090d
Xf86-video-nouveau: 1.0.16
Linux kernel version: 5.0.0-16-generic

This bug was found with GraphicsFuzz: <a href=3D"https://github.com/google/=
graphicsfuzz">https://github.com/google/graphicsfuzz</a></pre>
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

--15634643180.0dd4fe.15791--

--===============0404695916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0404695916==--
