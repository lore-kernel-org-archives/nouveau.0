From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69155] [NV50 gallium] [piglit]
 bin/varying-packing-simple triggers memory corruption/failures
Date: Sun, 01 Dec 2013 08:03:21 +0000
Message-ID: <bug-69155-8800-zGWkRmSCxO@http.bugs.freedesktop.org/>
References: <bug-69155-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1248585606=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69155-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1248585606==
Content-Type: multipart/alternative; boundary="1385885001.E8573f1.3573"; charset="us-ascii"


--1385885001.E8573f1.3573
Date: Sun, 1 Dec 2013 08:03:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69155

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|codegen/nv50_ir_emit_nv50.c |[NV50 gallium] [piglit]
                   |pp:169:srcAddr8: Assertion  |bin/varying-packing-simple
                   |`(offset <= 0x1fc || offset |triggers memory
                   |== 0x3fc) && !(offset &     |corruption/failures
                   |0x3)' failed.               |

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so there are a few problems here, not the least of which is that there's
memory corruption in the program logic because nv50_program only has 16 in/out
varyings, but it reports support for a lot more than that.

Once you fix that, there's another incorrect assert. Fixing that makes the test
run, but it fails. For posterity, here is the patch that makes the test
not-completely-die. I'll look into what the test is doing and why it's failing
later.

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 762b48f..167d228 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -223,9 +223,7 @@ nv50_screen_get_shader_param(struct pipe_screen *pscreen,
unsigned shader,
    case PIPE_SHADER_CAP_MAX_CONTROL_FLOW_DEPTH:
       return 4;
    case PIPE_SHADER_CAP_MAX_INPUTS:
-      if (shader == PIPE_SHADER_VERTEX)
-         return 32;
-      return 0x300 / 16;
+      return 16;
    case PIPE_SHADER_CAP_MAX_CONSTS:
       return 65536 / 16;
    case PIPE_SHADER_CAP_MAX_CONST_BUFFERS:
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
index ba4f592..a7f7a36 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
@@ -443,14 +443,15 @@ nv50_fp_linkage_validate(struct nv50_context *nv50)
    }

    n = (m + 3) / 4;
-   assert(m <= 64);

    if (unlikely(nv50->gmtyprog)) {
+      assert(n <= 33);
       BEGIN_NV04(push, NV50_3D(GP_RESULT_MAP_SIZE), 1);
       PUSH_DATA (push, m);
       BEGIN_NV04(push, NV50_3D(GP_RESULT_MAP(0)), n);
       PUSH_DATAp(push, map, n);
    } else {
+      assert(n <= 17); // XXX use the nva3+ ALT version?
       BEGIN_NV04(push, NV50_3D(VP_GP_BUILTIN_ATTR_EN), 1);
       PUSH_DATA (push, vp->vp.attrs[2]);

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385885001.E8573f1.3573
Date: Sun, 1 Dec 2013 08:03:21 +0000
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
   title="NEW --- - [NV50 gallium] [piglit] bin/varying-packing-simple triggers memory corruption/failures"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69155">bug 69155</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>codegen/nv50_ir_emit_nv50.cpp:169:srcAddr8: Assertion `(offset &lt;= 0x1fc || offset == 0x3fc) &amp;&amp; !(offset &amp; 0x3)' failed.
           </td>
           <td>[NV50 gallium] [piglit] bin/varying-packing-simple triggers memory corruption/failures
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] [piglit] bin/varying-packing-simple triggers memory corruption/failures"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69155#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] [piglit] bin/varying-packing-simple triggers memory corruption/failures"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69155">bug 69155</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so there are a few problems here, not the least of which is that there's
memory corruption in the program logic because nv50_program only has 16 in/out
varyings, but it reports support for a lot more than that.

Once you fix that, there's another incorrect assert. Fixing that makes the test
run, but it fails. For posterity, here is the patch that makes the test
not-completely-die. I'll look into what the test is doing and why it's failing
later.

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 762b48f..167d228 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
&#64;&#64; -223,9 +223,7 &#64;&#64; nv50_screen_get_shader_param(struct pipe_screen *pscreen,
unsigned shader,
    case PIPE_SHADER_CAP_MAX_CONTROL_FLOW_DEPTH:
       return 4;
    case PIPE_SHADER_CAP_MAX_INPUTS:
-      if (shader == PIPE_SHADER_VERTEX)
-         return 32;
-      return 0x300 / 16;
+      return 16;
    case PIPE_SHADER_CAP_MAX_CONSTS:
       return 65536 / 16;
    case PIPE_SHADER_CAP_MAX_CONST_BUFFERS:
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
index ba4f592..a7f7a36 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
&#64;&#64; -443,14 +443,15 &#64;&#64; nv50_fp_linkage_validate(struct nv50_context *nv50)
    }

    n = (m + 3) / 4;
-   assert(m &lt;= 64);

    if (unlikely(nv50-&gt;gmtyprog)) {
+      assert(n &lt;= 33);
       BEGIN_NV04(push, NV50_3D(GP_RESULT_MAP_SIZE), 1);
       PUSH_DATA (push, m);
       BEGIN_NV04(push, NV50_3D(GP_RESULT_MAP(0)), n);
       PUSH_DATAp(push, map, n);
    } else {
+      assert(n &lt;= 17); // XXX use the nva3+ ALT version?
       BEGIN_NV04(push, NV50_3D(VP_GP_BUILTIN_ATTR_EN), 1);
       PUSH_DATA (push, vp-&gt;vp.attrs[2]);</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385885001.E8573f1.3573--

--===============1248585606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1248585606==--
