From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66642] [nva5] Wrong provoking vertex is selected for
 flat attribute interpolation (clipping?)
Date: Sat, 24 Oct 2015 02:12:59 +0000
Message-ID: <bug-66642-8800-deMGgYXflw@http.bugs.freedesktop.org/>
References: <bug-66642-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0131189370=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66642-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0131189370==
Content-Type: multipart/alternative; boundary="1445652778.151d2.11446"; charset="UTF-8"


--1445652778.151d2.11446
Date: Sat, 24 Oct 2015 02:12:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66642

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so... I spent some time thinking about all this with my newfound
understanding of flatshading, and some of the nv50 family limitations around
all this. There are a few separate issues:

(a) shade model flat just totally didn't work, any tests that passed did so
largely by happy coincidence

I have a patch that fixes this that will be going out shortly. I believe this
should fix a lot of cases that are actually hit by real software. When
flat-shading, we have to mark the varying as non-perspective-divided.

(b) When forcing both primary and secondary color to smooth or flat, that
causes totally wrong data to be generated

This is easily fixable by moving the frontcolor varying to the non-interpolated
section of the map. Needs some more analysis, but should be entirely doable.
Probably need to be careful about not setting SHADE_MODEL = flat in this case.

(c) nv50 family gpu's are not set up to have front and back colors with
different interpolation parameters.

The issue is that the first and second color need to be adjacent to one another
in the result map in order for the back colors to replace the front colors.
However the way it works is that the result map is split into 3 pieces:

1. attributes invisible to frag shader (position, back color)
2. interpolated varyings (with a special allowance for the color varyings to be
flat-shaded when the shade model = flat)
3. non-interpolated varyings

So there are a few things we can do here. We can ignore the whole front/back
color thing and just use regular varyings and then use the faceness to
determine which face to use. If the first color is smooth and the second is
flat, we can probably place it at the interp/non-interp boundary. However for
the inverse, there is no clear way to handle this (i.e. first color is flat,
secondary color is smooth/noperspective).

The piglit test mentioned in this bug falls into category (b), which I plan on
fixing. I believe I'm going to leave category (c) unfixed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445652778.151d2.11446
Date: Sat, 24 Oct 2015 02:12:58 +0000
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
   title="NEW - [nva5] Wrong provoking vertex is selected for flat attribute interpolation (clipping?)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66642#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [nva5] Wrong provoking vertex is selected for flat attribute interpolation (clipping?)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66642">bug 66642</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so... I spent some time thinking about all this with my newfound
understanding of flatshading, and some of the nv50 family limitations around
all this. There are a few separate issues:

(a) shade model flat just totally didn't work, any tests that passed did so
largely by happy coincidence

I have a patch that fixes this that will be going out shortly. I believe this
should fix a lot of cases that are actually hit by real software. When
flat-shading, we have to mark the varying as non-perspective-divided.

(b) When forcing both primary and secondary color to smooth or flat, that
causes totally wrong data to be generated

This is easily fixable by moving the frontcolor varying to the non-interpolated
section of the map. Needs some more analysis, but should be entirely doable.
Probably need to be careful about not setting SHADE_MODEL = flat in this case.

(c) nv50 family gpu's are not set up to have front and back colors with
different interpolation parameters.

The issue is that the first and second color need to be adjacent to one another
in the result map in order for the back colors to replace the front colors.
However the way it works is that the result map is split into 3 pieces:

1. attributes invisible to frag shader (position, back color)
2. interpolated varyings (with a special allowance for the color varyings to be
flat-shaded when the shade model = flat)
3. non-interpolated varyings

So there are a few things we can do here. We can ignore the whole front/back
color thing and just use regular varyings and then use the faceness to
determine which face to use. If the first color is smooth and the second is
flat, we can probably place it at the interp/non-interp boundary. However for
the inverse, there is no clear way to handle this (i.e. first color is flat,
secondary color is smooth/noperspective).

The piglit test mentioned in this bug falls into category (b), which I plan on
fixing. I believe I'm going to leave category (c) unfixed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445652778.151d2.11446--

--===============0131189370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0131189370==--
