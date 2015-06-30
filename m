From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91056] The Bard's Tale (2005,
	native)  has rendering issues
Date: Tue, 30 Jun 2015 05:37:45 +0000
Message-ID: <bug-91056-8800-A4OkKdtl3l@http.bugs.freedesktop.org/>
References: <bug-91056-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1538567309=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91056-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1538567309==
Content-Type: multipart/alternative; boundary="1435642665.7Eb8b1.13528"; charset="UTF-8"


--1435642665.7Eb8b1.13528
Date: Tue, 30 Jun 2015 05:37:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91056

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #4)
> Created attachment 116707 [details] [review]
> provisional fix
> 
> OK, so this patch appears to fix it. The shaders at the end of that opt
> trace have
> 
> 00000028: b5000409 08000780     add rn f32 $r2 $r2 neg c0[$a1]
> 00000040: b500060d 08004780     add rn f32 $r3 $r3 neg c0[$a1+0x4]
> 
> etc in them. Which seems innocuous enough, but... something about it is bad.
> Perhaps the neg + indirect. Perhaps just indirect. Perhaps... who knows.
> Needs testing.

uniform vec4 colors[4];
uniform int index;
void main() { gl_FragColor = -vec4(0.2, 0.2, 0.2, 0) - colors[index]; }

generates

00000000: 10002001 2400c780     ld $r0 b32 c0[0x40]
00000008: 100d8009 0be4cccf     mov b32 $r2 0xbe4ccccd
00000010: 00040005 c0000780     shl $a1 $r0 0x4
00000018: b5000401 08000780     add rn f32 $r0 $r2 neg c0[$a1]
00000020: b5000405 08004780     add rn f32 $r1 $r2 neg c0[$a1+0x4]
00000028: b5000409 08008780     add rn f32 $r2 $r2 neg c0[$a1+0x8]
00000030: 1400060d 2400c780     ld $r3 b32 c0[$a1+0xc]

Which works fine. There's something even more subtle going on :(

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435642665.7Eb8b1.13528
Date: Tue, 30 Jun 2015 05:37:45 +0000
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
   title="NEW - The Bard's Tale (2005, native) has rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91056#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - The Bard's Tale (2005, native) has rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91056">bug 91056</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=91056#c4">comment #4</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=116707" name="attach_116707" title="provisional fix">attachment 116707</a> <a href="attachment.cgi?id=116707&amp;action=edit" title="provisional fix">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=91056&amp;attachment=116707'>[review]</a> [review]
&gt; provisional fix
&gt; 
&gt; OK, so this patch appears to fix it. The shaders at the end of that opt
&gt; trace have
&gt; 
&gt; 00000028: b5000409 08000780     add rn f32 $r2 $r2 neg c0[$a1]
&gt; 00000040: b500060d 08004780     add rn f32 $r3 $r3 neg c0[$a1+0x4]
&gt; 
&gt; etc in them. Which seems innocuous enough, but... something about it is bad.
&gt; Perhaps the neg + indirect. Perhaps just indirect. Perhaps... who knows.
&gt; Needs testing.</span >

uniform vec4 colors[4];
uniform int index;
void main() { gl_FragColor = -vec4(0.2, 0.2, 0.2, 0) - colors[index]; }

generates

00000000: 10002001 2400c780     ld $r0 b32 c0[0x40]
00000008: 100d8009 0be4cccf     mov b32 $r2 0xbe4ccccd
00000010: 00040005 c0000780     shl $a1 $r0 0x4
00000018: b5000401 08000780     add rn f32 $r0 $r2 neg c0[$a1]
00000020: b5000405 08004780     add rn f32 $r1 $r2 neg c0[$a1+0x4]
00000028: b5000409 08008780     add rn f32 $r2 $r2 neg c0[$a1+0x8]
00000030: 1400060d 2400c780     ld $r3 b32 c0[$a1+0xc]

Which works fine. There's something even more subtle going on :(</pre>
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

--1435642665.7Eb8b1.13528--

--===============1538567309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1538567309==--
