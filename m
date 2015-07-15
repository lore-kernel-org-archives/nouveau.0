From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91247] Tomb Raider: Underworld renders lots of
 artefacts on models and objects
Date: Wed, 15 Jul 2015 03:30:25 +0000
Message-ID: <bug-91247-8800-BMcSPmcCj6@http.bugs.freedesktop.org/>
References: <bug-91247-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0416104670=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91247-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0416104670==
Content-Type: multipart/alternative; boundary="1436931025.AdDd1.21302"; charset="UTF-8"


--1436931025.AdDd1.21302
Date: Wed, 15 Jul 2015 03:30:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91247

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 117125
  --> https://bugs.freedesktop.org/attachment.cgi?id=117125&action=edit
vert shader at failing call

OK, so in my trimmed trace,

http://people.freedesktop.org/~imirkin/traces/tru-trim.trace.xz

it seems like things start going wrong on API call 424136 (I ran apitrace
dump-images with '*/draw' and then did the diff-images thing).

Coincidentally, right before this happens, it does glDepthFunc(GL_EQUAL) [which
is *nuts*] and glDepthRange(0, 0.98).

I need to see if nuking that glDepthRange call causes llvmpipe to generate the
same image for that draw call. Also see if there are any funny depth-related
bits we know about... ugh.

Still bothering me is that apitrace is returning broken-looking depth surfaces.

The previous draws all had glDepthRange(0.98, 1)... coincidence? And the shader
will end up generating very negative z values, which will map to a depth range
of 0.98 I guess?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436931025.AdDd1.21302
Date: Wed, 15 Jul 2015 03:30:25 +0000
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
   title="NEW - Tomb Raider: Underworld renders lots of artefacts on models and objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91247#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Tomb Raider: Underworld renders lots of artefacts on models and objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91247">bug 91247</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=117125" name="attach_117125" title="vert shader at failing call">attachment 117125</a> <a href="attachment.cgi?id=117125&amp;action=edit" title="vert shader at failing call">[details]</a></span>
vert shader at failing call

OK, so in my trimmed trace,

<a href="http://people.freedesktop.org/~imirkin/traces/tru-trim.trace.xz">http://people.freedesktop.org/~imirkin/traces/tru-trim.trace.xz</a>

it seems like things start going wrong on API call 424136 (I ran apitrace
dump-images with '*/draw' and then did the diff-images thing).

Coincidentally, right before this happens, it does glDepthFunc(GL_EQUAL) [which
is *nuts*] and glDepthRange(0, 0.98).

I need to see if nuking that glDepthRange call causes llvmpipe to generate the
same image for that draw call. Also see if there are any funny depth-related
bits we know about... ugh.

Still bothering me is that apitrace is returning broken-looking depth surfaces.

The previous draws all had glDepthRange(0.98, 1)... coincidence? And the shader
will end up generating very negative z values, which will map to a depth range
of 0.98 I guess?</pre>
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

--1436931025.AdDd1.21302--

--===============0416104670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0416104670==--
