From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93613] 3D acceleration/OpenGL corrupts output on
 GeForce FX-5200
Date: Thu, 07 Jan 2016 10:58:41 +0000
Message-ID: <bug-93613-8800-JfHl45nyQ4@http.bugs.freedesktop.org/>
References: <bug-93613-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1187737257=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93613-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1187737257==
Content-Type: multipart/alternative; boundary="1452164321.d0A60.31634"; charset="UTF-8"


--1452164321.d0A60.31634
Date: Thu, 7 Jan 2016 10:58:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93613

--- Comment #2 from thor-zyMqRySHjtZMYopoZt5u/LNAH6kLmebB@public.gmane.org ---
Thanks for the suggestion. etracer has indeed a switch to force a bpp value
that is different from the current screen settings. However, this switch was
not set. I also tried enforcing the bpp value to 32 (the screen bpp) or 16
(which should not work), but I could not observe any difference in the
behavior. The screen just goes to all blue as soon as the game starts.

Note that simple glx test applications such as glxgears work correctly.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1452164321.d0A60.31634
Date: Thu, 7 Jan 2016 10:58:41 +0000
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
   title="NEW - 3D acceleration/OpenGL corrupts output on GeForce FX-5200"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93613#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - 3D acceleration/OpenGL corrupts output on GeForce FX-5200"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93613">bug 93613</a>
              from <span class="vcard"><a class="email" href="mailto:thor&#64;math.tu-berlin.de" title="thor&#64;math.tu-berlin.de">thor&#64;math.tu-berlin.de</a>
</span></b>
        <pre>Thanks for the suggestion. etracer has indeed a switch to force a bpp value
that is different from the current screen settings. However, this switch was
not set. I also tried enforcing the bpp value to 32 (the screen bpp) or 16
(which should not work), but I could not observe any difference in the
behavior. The screen just goes to all blue as soon as the game starts.

Note that simple glx test applications such as glxgears work correctly.</pre>
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

--1452164321.d0A60.31634--

--===============1187737257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1187737257==--
