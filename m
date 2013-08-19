From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66642] [nva5] Wrong provoking vertex is selected for
 flat attribute interpolation (clipping?)
Date: Mon, 19 Aug 2013 19:27:49 +0000
Message-ID: <bug-66642-8800-zzc85EVmnK@http.bugs.freedesktop.org/>
References: <bug-66642-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0212374291=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66642-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0212374291==
Content-Type: multipart/alternative; boundary="1376940469.1034D0c2.4734"; charset="us-ascii"


--1376940469.1034D0c2.4734
Date: Mon, 19 Aug 2013 19:27:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66642

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 84289
  --> https://bugs.freedesktop.org/attachment.cgi?id=84289&action=edit
pushbuf dump of
generated_tests/spec/glsl-1.30/execution/interpolation/interpolation-flat-gl_BackColor-smooth-none.shader_test

calim and I looked at this briefly, he couldn't figure out the issue. (And I
know nowhere close to enough about it to even try.)

Some observations:

(a) I see the same problem on NV96.
(b) All the interpolation-flat-gl_*BackColor-smooth-* tests fail, the
FrontColor ones succeed.

Attached is a pushbuf dump of the program. Would be good to see what the blob
does on the same test.

"""
<calim> so, if you want to fix it completely you have to add shader variants,
if you just want to fix it partially you have to set SHADE_MODEL depending on
the shader instead of just the rasterizer state, or you ignore it because it's
an insignificant corner case no one cares about
<calim> ah yes, or you see if the blob knows a cheat around it
<calim> it would be good to know if it actually sets SHADE_MODEL to flat in
that test
"""

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376940469.1034D0c2.4734
Date: Mon, 19 Aug 2013 19:27:49 +0000
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
   title="NEW --- - [nva5] Wrong provoking vertex is selected for flat attribute interpolation (clipping?)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66642#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nva5] Wrong provoking vertex is selected for flat attribute interpolation (clipping?)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66642">bug 66642</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=84289" name="attach_84289" title="pushbuf dump of generated_tests/spec/glsl-1.30/execution/interpolation/interpolation-flat-gl_BackColor-smooth-none.shader_test">attachment 84289</a> <a href="attachment.cgi?id=84289&amp;action=edit" title="pushbuf dump of generated_tests/spec/glsl-1.30/execution/interpolation/interpolation-flat-gl_BackColor-smooth-none.shader_test">[details]</a></span>
pushbuf dump of
generated_tests/spec/glsl-1.30/execution/interpolation/interpolation-flat-gl_BackColor-smooth-none.shader_test

calim and I looked at this briefly, he couldn't figure out the issue. (And I
know nowhere close to enough about it to even try.)

Some observations:

(a) I see the same problem on NV96.
(b) All the interpolation-flat-gl_*BackColor-smooth-* tests fail, the
FrontColor ones succeed.

Attached is a pushbuf dump of the program. Would be good to see what the blob
does on the same test.

&quot;&quot;&quot;
&lt;calim&gt; so, if you want to fix it completely you have to add shader variants,
if you just want to fix it partially you have to set SHADE_MODEL depending on
the shader instead of just the rasterizer state, or you ignore it because it's
an insignificant corner case no one cares about
&lt;calim&gt; ah yes, or you see if the blob knows a cheat around it
&lt;calim&gt; it would be good to know if it actually sets SHADE_MODEL to flat in
that test
&quot;&quot;&quot;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376940469.1034D0c2.4734--

--===============0212374291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0212374291==--
