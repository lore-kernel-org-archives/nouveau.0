From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91526] World of Warcraft (on Wine) has UI corruption
 with nouveau
Date: Sat, 01 Aug 2015 19:58:18 +0000
Message-ID: <bug-91526-8800-ZlcYCad2zh@http.bugs.freedesktop.org/>
References: <bug-91526-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0369109620=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91526-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0369109620==
Content-Type: multipart/alternative; boundary="1438459098.B2De5aF1.10449"; charset="UTF-8"


--1438459098.B2De5aF1.10449
Date: Sat, 1 Aug 2015 19:58:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91526

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Reproduced on a fermi (GF108), although instead of corruption I just get that
whole render as black (i.e. your corrupted regions are just all black).
Disabling optimizations does not seem to have any effect.

Note that there is an outstanding wine bug
(https://bugs.winehq.org/show_bug.cgi?id=38869) where it uses uninitialized
values which could cause something like this... I had a patch somewhere that
worked around it (initializing values to 0,0,0,1) at
https://bugs.freedesktop.org/attachment.cgi?id=116966 .

Interesting, I applied the patch and it changed the output, so I suspected it
was related. However then futzing it caused no change, and going back to the
unpatched version still produced the changed thing. Not sure what to make of
it. I wouldn't rule an issue with wine out.

Out of curiousity, does this happen with st/nine?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1438459098.B2De5aF1.10449
Date: Sat, 1 Aug 2015 19:58:18 +0000
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
   title="NEW - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526">bug 91526</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Reproduced on a fermi (GF108), although instead of corruption I just get that
whole render as black (i.e. your corrupted regions are just all black).
Disabling optimizations does not seem to have any effect.

Note that there is an outstanding wine bug
(<a href="https://bugs.winehq.org/show_bug.cgi?id=38869">https://bugs.winehq.org/show_bug.cgi?id=38869</a>) where it uses uninitialized
values which could cause something like this... I had a patch somewhere that
worked around it (initializing values to 0,0,0,1) at
<a href="https://bugs.freedesktop.org/attachment.cgi?id=116966">https://bugs.freedesktop.org/attachment.cgi?id=116966</a> .

Interesting, I applied the patch and it changed the output, so I suspected it
was related. However then futzing it caused no change, and going back to the
unpatched version still produced the changed thing. Not sure what to make of
it. I wouldn't rule an issue with wine out.

Out of curiousity, does this happen with st/nine?</pre>
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

--1438459098.B2De5aF1.10449--

--===============0369109620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0369109620==--
