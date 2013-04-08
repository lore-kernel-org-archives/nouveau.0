From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63263] New: X server crash in
 nouveau_xv.c:NVPutImage (NVCopyNV12ColorPlanes)
Date: Mon, 08 Apr 2013 12:01:30 +0000
Message-ID: <bug-63263-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1244495669=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1244495669==
Content-Type: multipart/alternative; boundary="1365422490.FB1bd1.12592"; charset="us-ascii"


--1365422490.FB1bd1.12592
Date: Mon, 8 Apr 2013 12:01:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63263

          Priority: medium
            Bug ID: 63263
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: X server crash in nouveau_xv.c:NVPutImage
                    (NVCopyNV12ColorPlanes)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I'm not 100% sure what triggers the bug, but I think every time there has been
some sort of window movement involved, potentially across desktops (I use
WindowMaker, with drag window to move to other desktop option enabled). Often
it is an mplayer window (but perhaps not 100% of the time, not sure). I've seen
this issue multiple times over the past few months. (Always when there's some
sort of video activity though.)

[521319.093] (EE) Backtrace:
[521319.097] (EE) 0: /usr/bin/X (xorg_backtrace+0x34) [0x5970c4]
[521319.097] (EE) 1: /usr/bin/X (0x400000+0x19aef9) [0x59aef9]
[521319.097] (EE) 2: /lib64/libpthread.so.0 (0x7f5ff8670000+0x10410)
[0x7f5ff8680410]
[521319.097] (EE) 3: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(0x7f5ff6149000+0xa644) [0x7f5ff6153644]
[521319.098] (EE) 4: /usr/bin/X (0x400000+0x95a9e) [0x495a9e]
[521319.098] (EE) 5: /usr/bin/X (0x400000+0xe1ed2) [0x4e1ed2]
[521319.098] (EE) 6: /usr/bin/X (0x400000+0x3b1b1) [0x43b1b1]
[521319.098] (EE) 7: /usr/bin/X (0x400000+0x29c7a) [0x429c7a]
[521319.098] (EE) 8: /lib64/libc.so.6 (__libc_start_main+0xfd) [0x7f5ff72f64bd]
[521319.098] (EE) 9: /usr/bin/X (0x400000+0x29fd1) [0x429fd1]
[521319.098] (EE) 
[521319.098] (EE) Segmentation fault at address 0x7f5ff36a1001

Decoding nouveau_drv.so 0xa644 gets me:
NVPutImage:
...
   0x000000000000a627 <+4887>:  mov    %rdx,%r11
   0x000000000000a62a <+4890>:  mov    %eax,%r10d
   0x000000000000a62d <+4893>:  nopl   (%rax)
   0x000000000000a630 <+4896>:  lea    (%rsi,%r13,1),%rdi
   0x000000000000a634 <+4900>:  xor    %edx,%edx
   0x000000000000a636 <+4902>:  test   %r9d,%r9d
   0x000000000000a639 <+4905>:  jle    0xaa2a <NVPutImage+5914>
   0x000000000000a63f <+4911>:  nop
   0x000000000000a640 <+4912>:  movzbl (%rdi,%rdx,2),%eax
-->   0x000000000000a644 <+4916>:  movzbl 0x1(%rsi,%rdx,2),%ecx
   0x000000000000a649 <+4921>:  shl    $0x8,%eax
   0x000000000000a64c <+4924>:  shl    $0x10,%ecx
   0x000000000000a64f <+4927>:  or     %ecx,%eax
   0x000000000000a651 <+4929>:  movzbl (%rsi,%rdx,2),%ecx
   0x000000000000a655 <+4933>:  or     %ecx,%eax
   0x000000000000a657 <+4935>:  movzbl 0x1(%rdi,%rdx,2),%ecx
   0x000000000000a65c <+4940>:  shl    $0x18,%ecx
   0x000000000000a65f <+4943>:  or     %ecx,%eax
   0x000000000000a661 <+4945>:  mov    %eax,(%r8,%rdx,4)
   0x000000000000a665 <+4949>:  add    $0x1,%rdx
   0x000000000000a669 <+4953>:  cmp    %edx,%r9d
   0x000000000000a66c <+4956>:  jg     0xa640 <NVPutImage+4912>
   0x000000000000a66e <+4958>:  lea    0x0(%r13,%rbp,1),%rdi

And doing a compile of nouveau_xv.c with -g -ggdb lets me track this down to
NVCopyNV12ColorPlanes, specifically:

*vuvud++ = vs[0] | (us[0]<<8) | (vs[1]<<16) | (us[1]<<24);

Even though it's inlined, gcc is quite clever and it's unclear which of the two
invocations from NVPutImage it really is (it just jumps from both invocations
to the same-ish place).

What's really odd is that it's the load of vs[1] that's breaking. Looking
closely, it seems like vs[1] is accessed before vs[0] though, so the entire vs
pointer may be wrong.

It looks like both vs and us are offsets into the buf passed into NVPutImage...
but I don't see a length, perhaps there's a way to tell if we've gone too far?

Here are some versions of some things I'm running:

x11-drivers/xf86-video-nouveau-1.0.4
x11-base/xorg-server-1.13.1
media-libs/mesa-9.0.1

I know that there are later xf86-video-nouveau drivers, but there don't appear
to have been any changes to nouveau_xv.c.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365422490.FB1bd1.12592
Date: Mon, 8 Apr 2013 12:01:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X server crash in nouveau_xv.c:NVPutImage (NVCopyNV12ColorPlanes)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63263">63263</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X server crash in nouveau_xv.c:NVPutImage (NVCopyNV12ColorPlanes)
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>imirkin&#64;alum.mit.edu
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm not 100% sure what triggers the bug, but I think every time there has been
some sort of window movement involved, potentially across desktops (I use
WindowMaker, with drag window to move to other desktop option enabled). Often
it is an mplayer window (but perhaps not 100% of the time, not sure). I've seen
this issue multiple times over the past few months. (Always when there's some
sort of video activity though.)

[521319.093] (EE) Backtrace:
[521319.097] (EE) 0: /usr/bin/X (xorg_backtrace+0x34) [0x5970c4]
[521319.097] (EE) 1: /usr/bin/X (0x400000+0x19aef9) [0x59aef9]
[521319.097] (EE) 2: /lib64/libpthread.so.0 (0x7f5ff8670000+0x10410)
[0x7f5ff8680410]
[521319.097] (EE) 3: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(0x7f5ff6149000+0xa644) [0x7f5ff6153644]
[521319.098] (EE) 4: /usr/bin/X (0x400000+0x95a9e) [0x495a9e]
[521319.098] (EE) 5: /usr/bin/X (0x400000+0xe1ed2) [0x4e1ed2]
[521319.098] (EE) 6: /usr/bin/X (0x400000+0x3b1b1) [0x43b1b1]
[521319.098] (EE) 7: /usr/bin/X (0x400000+0x29c7a) [0x429c7a]
[521319.098] (EE) 8: /lib64/libc.so.6 (__libc_start_main+0xfd) [0x7f5ff72f64bd]
[521319.098] (EE) 9: /usr/bin/X (0x400000+0x29fd1) [0x429fd1]
[521319.098] (EE) 
[521319.098] (EE) Segmentation fault at address 0x7f5ff36a1001

Decoding nouveau_drv.so 0xa644 gets me:
NVPutImage:
...
   0x000000000000a627 &lt;+4887&gt;:  mov    %rdx,%r11
   0x000000000000a62a &lt;+4890&gt;:  mov    %eax,%r10d
   0x000000000000a62d &lt;+4893&gt;:  nopl   (%rax)
   0x000000000000a630 &lt;+4896&gt;:  lea    (%rsi,%r13,1),%rdi
   0x000000000000a634 &lt;+4900&gt;:  xor    %edx,%edx
   0x000000000000a636 &lt;+4902&gt;:  test   %r9d,%r9d
   0x000000000000a639 &lt;+4905&gt;:  jle    0xaa2a &lt;NVPutImage+5914&gt;
   0x000000000000a63f &lt;+4911&gt;:  nop
   0x000000000000a640 &lt;+4912&gt;:  movzbl (%rdi,%rdx,2),%eax
--&gt;   0x000000000000a644 &lt;+4916&gt;:  movzbl 0x1(%rsi,%rdx,2),%ecx
   0x000000000000a649 &lt;+4921&gt;:  shl    $0x8,%eax
   0x000000000000a64c &lt;+4924&gt;:  shl    $0x10,%ecx
   0x000000000000a64f &lt;+4927&gt;:  or     %ecx,%eax
   0x000000000000a651 &lt;+4929&gt;:  movzbl (%rsi,%rdx,2),%ecx
   0x000000000000a655 &lt;+4933&gt;:  or     %ecx,%eax
   0x000000000000a657 &lt;+4935&gt;:  movzbl 0x1(%rdi,%rdx,2),%ecx
   0x000000000000a65c &lt;+4940&gt;:  shl    $0x18,%ecx
   0x000000000000a65f &lt;+4943&gt;:  or     %ecx,%eax
   0x000000000000a661 &lt;+4945&gt;:  mov    %eax,(%r8,%rdx,4)
   0x000000000000a665 &lt;+4949&gt;:  add    $0x1,%rdx
   0x000000000000a669 &lt;+4953&gt;:  cmp    %edx,%r9d
   0x000000000000a66c &lt;+4956&gt;:  jg     0xa640 &lt;NVPutImage+4912&gt;
   0x000000000000a66e &lt;+4958&gt;:  lea    0x0(%r13,%rbp,1),%rdi

And doing a compile of nouveau_xv.c with -g -ggdb lets me track this down to
NVCopyNV12ColorPlanes, specifically:

*vuvud++ = vs[0] | (us[0]&lt;&lt;8) | (vs[1]&lt;&lt;16) | (us[1]&lt;&lt;24);

Even though it's inlined, gcc is quite clever and it's unclear which of the two
invocations from NVPutImage it really is (it just jumps from both invocations
to the same-ish place).

What's really odd is that it's the load of vs[1] that's breaking. Looking
closely, it seems like vs[1] is accessed before vs[0] though, so the entire vs
pointer may be wrong.

It looks like both vs and us are offsets into the buf passed into NVPutImage...
but I don't see a length, perhaps there's a way to tell if we've gone too far?

Here are some versions of some things I'm running:

x11-drivers/xf86-video-nouveau-1.0.4
x11-base/xorg-server-1.13.1
media-libs/mesa-9.0.1

I know that there are later xf86-video-nouveau drivers, but there don't appear
to have been any changes to nouveau_xv.c.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365422490.FB1bd1.12592--

--===============1244495669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1244495669==--
