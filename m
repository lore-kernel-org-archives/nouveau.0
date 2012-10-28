From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56474] New: 3D app segfaults on NV46
Date: Sun, 28 Oct 2012 01:18:56 +0000
Message-ID: <bug-56474-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1330201713=="
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


--===============1330201713==
Content-Type: multipart/alternative; boundary="1351387136.377ad4e0.10858"; charset="us-ascii"


--1351387136.377ad4e0.10858
Date: Sun, 28 Oct 2012 01:18:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56474

          Priority: medium
            Bug ID: 56474
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: 3D app segfaults on NV46
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: 1o5g4r8o-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: 9.0
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 69169
  --> https://bugs.freedesktop.org/attachment.cgi?id=69169&action=edit
dmesg

Debian Wheezy i386
Mesa 9.0-1
libdrm 2.4.39-1
xserver-xorg-video-nouveau 1.0.3
Attached dmesg.

supertuxkart segfaults on Debian. Attached backtrace.

21:16 < joi> try: "up; print res"
21:17 < gg0> (gdb) up
21:17 < gg0> #1  nv30_vbo_validate (nv30=0x94c2658) at nv30_vbo.c:239
21:17 < gg0> 239I      PUSH_RESRC(push, NV30_3D(VTXBUF(i)), user ? 
             BUFCTX_VTXTMP : BUFCTX_VTXBUF,
21:17 < gg0> (gdb) print res
21:17 < gg0> $4 = (struct nv04_resource *) 0x0

21:35 < joi> gg0: try this one: http://bpaste.net/show/54017/

diff --git a/src/gallium/drivers/nv30/nv30_vbo.c
b/src/gallium/drivers/nv30/nv30_vbo.c
index 128457f..94febc3 100644
--- a/src/gallium/drivers/nv30/nv30_vbo.c
+++ b/src/gallium/drivers/nv30/nv30_vbo.c
@@ -226,6 +226,8 @@ nv30_vbo_validate(struct nv30_context *nv30)
       user = (nv30->vbo_user & (1 << ve->vertex_buffer_index));

       res = nv04_resource(vb->buffer);
+      if (!res)
+         continue;

       if (nv30->vbo_fifo || unlikely(vb->stride == 0)) {
          if (!nv30->vbo_fifo)

With patch above, stk doesn't produce core anymore and Xorg freezes.

So far, mesa 8 is better. I could use it even if often it crashes during kart
races. With mesa 9, races can't even start.

Further backtraces and system info available at http://bugs.debian.org/691292
Bug describes how it behaves on current Debian wheezy, Mesa 8.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351387136.377ad4e0.10858
Date: Sun, 28 Oct 2012 01:18:56 +0000
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
   title="NEW --- - 3D app segfaults on NV46"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56474">56474</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>3D app segfaults on NV46
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
          <td>1o5g4r8o&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>9.0
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=69169" name="attach_69169" title="dmesg">attachment 69169</a> <a href="attachment.cgi?id=69169&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Debian Wheezy i386
Mesa 9.0-1
libdrm 2.4.39-1
xserver-xorg-video-nouveau 1.0.3
Attached dmesg.

supertuxkart segfaults on Debian. Attached backtrace.

21:16 &lt; joi&gt; try: &quot;up; print res&quot;
21:17 &lt; gg0&gt; (gdb) up
21:17 &lt; gg0&gt; #1  nv30_vbo_validate (nv30=0x94c2658) at nv30_vbo.c:239
21:17 &lt; gg0&gt; 239I      PUSH_RESRC(push, NV30_3D(VTXBUF(i)), user ? 
             BUFCTX_VTXTMP : BUFCTX_VTXBUF,
21:17 &lt; gg0&gt; (gdb) print res
21:17 &lt; gg0&gt; $4 = (struct nv04_resource *) 0x0

21:35 &lt; joi&gt; gg0: try this one: <a href="http://bpaste.net/show/54017/">http://bpaste.net/show/54017/</a>

diff --git a/src/gallium/drivers/nv30/nv30_vbo.c
b/src/gallium/drivers/nv30/nv30_vbo.c
index 128457f..94febc3 100644
--- a/src/gallium/drivers/nv30/nv30_vbo.c
+++ b/src/gallium/drivers/nv30/nv30_vbo.c
&#64;&#64; -226,6 +226,8 &#64;&#64; nv30_vbo_validate(struct nv30_context *nv30)
       user = (nv30-&gt;vbo_user &amp; (1 &lt;&lt; ve-&gt;vertex_buffer_index));

       res = nv04_resource(vb-&gt;buffer);
+      if (!res)
+         continue;

       if (nv30-&gt;vbo_fifo || unlikely(vb-&gt;stride == 0)) {
          if (!nv30-&gt;vbo_fifo)

With patch above, stk doesn't produce core anymore and Xorg freezes.

So far, mesa 8 is better. I could use it even if often it crashes during kart
races. With mesa 9, races can't even start.

Further backtraces and system info available at <a href="http://bugs.debian.org/691292">http://bugs.debian.org/691292</a>
Bug describes how it behaves on current Debian wheezy, Mesa 8.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351387136.377ad4e0.10858--

--===============1330201713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1330201713==--
