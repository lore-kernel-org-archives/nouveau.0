From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86618] New: [NV96] neg modifiers not working in MIN
 and MAX operations
Date: Sun, 23 Nov 2014 11:17:05 +0000
Message-ID: <bug-86618-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2015647033=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============2015647033==
Content-Type: multipart/alternative; boundary="1416741425.66F1a4e0.9049"; charset="UTF-8"


--1416741425.66F1a4e0.9049
Date: Sun, 23 Nov 2014 11:17:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86618

            Bug ID: 86618
           Summary: [NV96] neg modifiers not working in MIN and MAX
                    operations
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gzregozrw-5tc4TXWwyLM@public.gmane.org

Neg modifier for source in MIN and MAX ops is ignored.
Tested on git 89b9ef9.
I tested it only on NV96.

shader with:
float x = -sin(uv.x);
float d = max(0.0, x);
generates:
EMIT: presin f32 $r0 $r0 (8)
EMIT: sin f32 $r0 $r0 (8)
EMIT: mov u32 $r1 0x00000000 (8)
EMIT: max f32 $r2 neg $r0 $r1 (8)

Shader output is identical to version without unary minus.
Only difference is lack of neg modifier.

After disabling modifiers shader works as expected:

--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
@@ -85,8 +85,8 @@ static const struct opProperties _initProps[] =
    { OP_ADD,    0x3, 0x0, 0x0, 0x8, 0x2, 0x1, 0x1, 0x2 },
    { OP_SUB,    0x3, 0x0, 0x0, 0x0, 0x2, 0x1, 0x1, 0x2 },
    { OP_MUL,    0x3, 0x0, 0x0, 0x0, 0x2, 0x1, 0x1, 0x2 },
-   { OP_MAX,    0x3, 0x3, 0x0, 0x0, 0x2, 0x1, 0x1, 0x0 },
-   { OP_MIN,    0x3, 0x3, 0x0, 0x0, 0x2, 0x1, 0x1, 0x0 },
+   { OP_MAX,    0x0, 0x3, 0x0, 0x0, 0x2, 0x1, 0x1, 0x0 },
+   { OP_MIN,    0x0, 0x3, 0x0, 0x0, 0x2, 0x1, 0x1, 0x0 },
    { OP_MAD,    0x7, 0x0, 0x0, 0x0, 0x6, 0x1, 0x1, 0x0 }, // special
constraint
    { OP_ABS,    0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x1, 0x0 },
    { OP_NEG,    0x0, 0x1, 0x0, 0x0, 0x0, 0x1, 0x1, 0x0 },

After this change:
EMIT: presin f32 $r0 $r0 (8)
EMIT: sin f32 $r0 $r0 (8)
EMIT: mov u32 $r1 0x00000000 (8)
EMIT: neg f32 $r0 $r0 (8)
EMIT: max f32 $r2 $r0 $r1 (8)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416741425.66F1a4e0.9049
Date: Sun, 23 Nov 2014 11:17:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] neg modifiers not working in MIN and MAX operations"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86618">86618</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV96] neg modifiers not working in MIN and MAX operations
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
          <td>gzregozrw&#64;wp.pl
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Neg modifier for source in MIN and MAX ops is ignored.
Tested on git 89b9ef9.
I tested it only on NV96.

shader with:
float x = -sin(uv.x);
float d = max(0.0, x);
generates:
EMIT: presin f32 $r0 $r0 (8)
EMIT: sin f32 $r0 $r0 (8)
EMIT: mov u32 $r1 0x00000000 (8)
EMIT: max f32 $r2 neg $r0 $r1 (8)

Shader output is identical to version without unary minus.
Only difference is lack of neg modifier.

After disabling modifiers shader works as expected:

--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
&#64;&#64; -85,8 +85,8 &#64;&#64; static const struct opProperties _initProps[] =
    { OP_ADD,    0x3, 0x0, 0x0, 0x8, 0x2, 0x1, 0x1, 0x2 },
    { OP_SUB,    0x3, 0x0, 0x0, 0x0, 0x2, 0x1, 0x1, 0x2 },
    { OP_MUL,    0x3, 0x0, 0x0, 0x0, 0x2, 0x1, 0x1, 0x2 },
-   { OP_MAX,    0x3, 0x3, 0x0, 0x0, 0x2, 0x1, 0x1, 0x0 },
-   { OP_MIN,    0x3, 0x3, 0x0, 0x0, 0x2, 0x1, 0x1, 0x0 },
+   { OP_MAX,    0x0, 0x3, 0x0, 0x0, 0x2, 0x1, 0x1, 0x0 },
+   { OP_MIN,    0x0, 0x3, 0x0, 0x0, 0x2, 0x1, 0x1, 0x0 },
    { OP_MAD,    0x7, 0x0, 0x0, 0x0, 0x6, 0x1, 0x1, 0x0 }, // special
constraint
    { OP_ABS,    0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x1, 0x0 },
    { OP_NEG,    0x0, 0x1, 0x0, 0x0, 0x0, 0x1, 0x1, 0x0 },

After this change:
EMIT: presin f32 $r0 $r0 (8)
EMIT: sin f32 $r0 $r0 (8)
EMIT: mov u32 $r1 0x00000000 (8)
EMIT: neg f32 $r0 $r0 (8)
EMIT: max f32 $r2 $r0 $r1 (8)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416741425.66F1a4e0.9049--

--===============2015647033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2015647033==--
