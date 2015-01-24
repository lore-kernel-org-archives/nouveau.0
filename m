From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88272] [NVAC] Flickering screen on 1920x1080 monitor
 with 9400M in MacbookPro 5, 5
Date: Sat, 24 Jan 2015 20:14:46 +0000
Message-ID: <bug-88272-8800-8tcVDjYrci@http.bugs.freedesktop.org/>
References: <bug-88272-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2104638018=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88272-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2104638018==
Content-Type: multipart/alternative; boundary="1422130486.a20f2.14311"; charset="UTF-8"


--1422130486.a20f2.14311
Date: Sat, 24 Jan 2015 20:14:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88272

--- Comment #3 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Tried again using an mDP -> HDMI adapter and I was able to reproduce it.

Level 03 and 05 give some weird display no matter what.
Level 0e and 0f display the desktop without flickering; it starts flickering
when running glxgears though.

I'll try to quickly solve some another bug and then come back to this one.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422130486.a20f2.14311
Date: Sat, 24 Jan 2015 20:14:46 +0000
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
          bz_status_ASSIGNED "
   title="ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9400M in MacbookPro 5,5"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88272#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9400M in MacbookPro 5,5"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88272">bug 88272</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Tried again using an mDP -&gt; HDMI adapter and I was able to reproduce it.

Level 03 and 05 give some weird display no matter what.
Level 0e and 0f display the desktop without flickering; it starts flickering
when running glxgears though.

I'll try to quickly solve some another bug and then come back to this one.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422130486.a20f2.14311--

--===============2104638018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2104638018==--
