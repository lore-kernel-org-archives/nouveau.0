From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91232] Torchlight 1&2 (in Wine): glitchy models when
 hardware skinning enabled
Date: Sun, 05 Jul 2015 17:18:00 +0000
Message-ID: <bug-91232-8800-Pxclyg6VxR@http.bugs.freedesktop.org/>
References: <bug-91232-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0663226951=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91232-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0663226951==
Content-Type: multipart/alternative; boundary="1436116680.C6cc01.17389"; charset="UTF-8"


--1436116680.C6cc01.17389
Date: Sun, 5 Jul 2015 17:18:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91232

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 116959
  --> https://bugs.freedesktop.org/attachment.cgi?id=116959&action=edit
shader_test that demonstrates the (?) issue

Looks like they use gl_SecondaryColor in the fragment shader, and the GLSL
linker, seeing no writes to gl_SecondaryFrontColor in the vertex shader,
creates this IR:

(declare (location=4 shader_in ) vec4 gl_in_TexCoord0)
(declare (location=5 shader_in ) vec4 gl_in_TexCoord1)
(declare (location=1 shader_in ) vec4 gl_Color)
(declare (temporary ) vec4 gl_in_FrontColor1_dummy)
(declare (location=3 shader_in ) float gl_FogFragCoord)
(declare (location=4 shader_out ) vec4 gl_out_TexCoord0)
(declare (temporary ) vec4 gl_out_TexCoord0)
(declare () vec4 ret)
(declare (location=0 uniform ) sampler2D ps_sampler0)
(declare (location=1 uniform ) samplerCube ps_sampler1)
(declare (location=2 uniform ) vec4 specular_enable)
(declare (location=3 uniform ) #anon_struct_0001@0x24cc5d0 ffp_fog)
(function main
  (signature void
    (parameters
    )
    (
      (declare (temporary ) vec4 textureCube_retval)
      (assign  (xyzw) (var_ref textureCube_retval)  (tex vec4 (var_ref
ps_sampler1)  (swiz xyz (var_ref gl_in_TexCoord1) ) 0 1 () )) 
      (assign  (xyzw) (var_ref ret)  (expression vec4 * (tex vec4 (var_ref
ps_sampler0)  (swiz xy (var_ref gl_in_TexCoord0) ) 0 1 () )(var_ref gl_Color) )
) 
      (assign  (xyz) (var_ref ret)  (expression vec3 sat (expression vec3 +
(swiz xyz (var_ref textureCube_retval) )(swiz xyz (var_ref ret) )) ) ) 
      (assign  (w) (var_ref ret)  (expression float * (swiz w (var_ref
textureCube_retval) )(swiz w (var_ref ret) )) ) 
      (assign  (xyzw) (var_ref gl_out_TexCoord0)  (expression vec4 +
(expression vec4 * (var_ref gl_in_FrontColor1_dummy) (var_ref specular_enable)
) (var_ref ret) ) ) 
      (assign  (xyz) (var_ref gl_out_TexCoord0)  (expression vec3 lrp (swiz xyz
(record_ref (var_ref ffp_fog)  color) )(swiz xyz (var_ref gl_out_TexCoord0)
)(expression float sat (expression float * (expression float + (record_ref
(var_ref ffp_fog)  end) (expression float neg (var_ref gl_FogFragCoord) ) )
(record_ref (var_ref ffp_fog)  scale) ) ) ) ) 
      (assign  (xyzw) (var_ref gl_out_TexCoord0@64)  (var_ref gl_out_TexCoord0)
) 
    ))

)

This in turn becomes an uninitialized read from TEMP[3] in the TGSI, and
nouveau doesn't 0-initialize such vars. specular_enable happens to be (1, 1, 1,
0) here.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436116680.C6cc01.17389
Date: Sun, 5 Jul 2015 17:18:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Torchlight 1&amp;2 (in Wine): glitchy models when hardware skinning enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91232#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Torchlight 1&amp;2 (in Wine): glitchy models when hardware skinning enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91232">bug 91232</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=116959" name="attach_116959" title="shader_test that demonstrates the (?) issue">attachment 116959</a> <a href="attachment.cgi?id=116959&amp;action=edit" title="shader_test that demonstrates the (?) issue">[details]</a></span>
shader_test that demonstrates the (?) issue

Looks like they use gl_SecondaryColor in the fragment shader, and the GLSL
linker, seeing no writes to gl_SecondaryFrontColor in the vertex shader,
creates this IR:

(declare (location=4 shader_in ) vec4 gl_in_TexCoord0)
(declare (location=5 shader_in ) vec4 gl_in_TexCoord1)
(declare (location=1 shader_in ) vec4 gl_Color)
(declare (temporary ) vec4 gl_in_FrontColor1_dummy)
(declare (location=3 shader_in ) float gl_FogFragCoord)
(declare (location=4 shader_out ) vec4 gl_out_TexCoord0)
(declare (temporary ) vec4 gl_out_TexCoord0)
(declare () vec4 ret)
(declare (location=0 uniform ) sampler2D ps_sampler0)
(declare (location=1 uniform ) samplerCube ps_sampler1)
(declare (location=2 uniform ) vec4 specular_enable)
(declare (location=3 uniform ) #anon_struct_0001&#64;0x24cc5d0 ffp_fog)
(function main
  (signature void
    (parameters
    )
    (
      (declare (temporary ) vec4 textureCube_retval)
      (assign  (xyzw) (var_ref textureCube_retval)  (tex vec4 (var_ref
ps_sampler1)  (swiz xyz (var_ref gl_in_TexCoord1) ) 0 1 () )) 
      (assign  (xyzw) (var_ref ret)  (expression vec4 * (tex vec4 (var_ref
ps_sampler0)  (swiz xy (var_ref gl_in_TexCoord0) ) 0 1 () )(var_ref gl_Color) )
) 
      (assign  (xyz) (var_ref ret)  (expression vec3 sat (expression vec3 +
(swiz xyz (var_ref textureCube_retval) )(swiz xyz (var_ref ret) )) ) ) 
      (assign  (w) (var_ref ret)  (expression float * (swiz w (var_ref
textureCube_retval) )(swiz w (var_ref ret) )) ) 
      (assign  (xyzw) (var_ref gl_out_TexCoord0)  (expression vec4 +
(expression vec4 * (var_ref gl_in_FrontColor1_dummy) (var_ref specular_enable)
) (var_ref ret) ) ) 
      (assign  (xyz) (var_ref gl_out_TexCoord0)  (expression vec3 lrp (swiz xyz
(record_ref (var_ref ffp_fog)  color) )(swiz xyz (var_ref gl_out_TexCoord0)
)(expression float sat (expression float * (expression float + (record_ref
(var_ref ffp_fog)  end) (expression float neg (var_ref gl_FogFragCoord) ) )
(record_ref (var_ref ffp_fog)  scale) ) ) ) ) 
      (assign  (xyzw) (var_ref gl_out_TexCoord0&#64;64)  (var_ref gl_out_TexCoord0)
) 
    ))

)

This in turn becomes an uninitialized read from TEMP[3] in the TGSI, and
nouveau doesn't 0-initialize such vars. specular_enable happens to be (1, 1, 1,
0) here.</pre>
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

--1436116680.C6cc01.17389--

--===============0663226951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0663226951==--
