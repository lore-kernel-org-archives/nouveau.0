From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89572] [NV86] Video playback corruption with nouveau,
	vdpau
Date: Fri, 13 Mar 2015 18:49:34 +0000
Message-ID: <bug-89572-8800-nhv43cQy48@http.bugs.freedesktop.org/>
References: <bug-89572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1445535918=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89572-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1445535918==
Content-Type: multipart/alternative; boundary="1426272573.4BAEd462.19647"; charset="UTF-8"


--1426272573.4BAEd462.19647
Date: Fri, 13 Mar 2015 18:49:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89572

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Unlikely that the errors are related to the corruption, but... possible. There
has always been some corruption in some h264 videos with VP2, but your
screenshot is rather extreme -- the one I'm thinking of is a few macroblocks
being wrong. For you it's like *all* macroblocks being wrong :) FTR your sample
video displays fine on my VP4.2 GF108 (nvc1).

Unfortunately I don't really have the
{time,motivation,interest,your-choice-of-excuse} to track this down, but if
that's something you'd be interested in, come over to #nouveau on freenode for
some advice on how to proceed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426272573.4BAEd462.19647
Date: Fri, 13 Mar 2015 18:49:33 +0000
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
   title="NEW - [NV86] Video playback corruption with nouveau, vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89572#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV86] Video playback corruption with nouveau, vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89572">bug 89572</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Unlikely that the errors are related to the corruption, but... possible. There
has always been some corruption in some h264 videos with VP2, but your
screenshot is rather extreme -- the one I'm thinking of is a few macroblocks
being wrong. For you it's like *all* macroblocks being wrong :) FTR your sample
video displays fine on my VP4.2 GF108 (nvc1).

Unfortunately I don't really have the
{time,motivation,interest,your-choice-of-excuse} to track this down, but if
that's something you'd be interested in, come over to #nouveau on freenode for
some advice on how to proceed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426272573.4BAEd462.19647--

--===============1445535918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1445535918==--
