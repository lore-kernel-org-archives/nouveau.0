From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88272] [NVAC] Flickering screen on 1920x1080 monitor
 with 9400M in MacbookPro 5, 5
Date: Thu, 03 Sep 2015 23:24:53 +0000
Message-ID: <bug-88272-8800-2RCVIjxRsl@http.bugs.freedesktop.org/>
References: <bug-88272-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1015912152=="
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


--===============1015912152==
Content-Type: multipart/alternative; boundary="1441322693.E0B188D2.14954"; charset="UTF-8"


--1441322693.E0B188D2.14954
Date: Thu, 3 Sep 2015 23:24:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88272

--- Comment #4 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
I managed to solve the other bug (notice how quick it was... --"), so back to
this one. :)

There was a regression that happened between 4.2 and current HEAD, so I'm
tracking it down but I should have it by tomorrow. Otherwise, running 4.2 or
3.19, I experience something else than what I reported in my last comment.

Using a mDP -> HDMI (I'm not sure whether this one is active or not; I have
both, so I could try both):
- Desktop displays fine, even while running glxgears on levels 05 to 0f;
- Weird display on level 03 but I guess some clock is just too low, as even the
blob uses at least level 05 or even 0e;
- LVDS screen starts flickering after turning off the external screen using
`xrandr --output DP-2 --off`.

Using a mDP -> VGA:
- Screen receives a signal but stays blank.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441322693.E0B188D2.14954
Date: Thu, 3 Sep 2015 23:24:53 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88272#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9400M in MacbookPro 5,5"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88272">bug 88272</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>I managed to solve the other bug (notice how quick it was... --&quot;), so back to
this one. :)

There was a regression that happened between 4.2 and current HEAD, so I'm
tracking it down but I should have it by tomorrow. Otherwise, running 4.2 or
3.19, I experience something else than what I reported in my last comment.

Using a mDP -&gt; HDMI (I'm not sure whether this one is active or not; I have
both, so I could try both):
- Desktop displays fine, even while running glxgears on levels 05 to 0f;
- Weird display on level 03 but I guess some clock is just too low, as even the
blob uses at least level 05 or even 0e;
- LVDS screen starts flickering after turning off the external screen using
`xrandr --output DP-2 --off`.

Using a mDP -&gt; VGA:
- Screen receives a signal but stays blank.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441322693.E0B188D2.14954--

--===============1015912152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1015912152==--
