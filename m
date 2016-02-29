From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86539] [NVAC] Trying to register nv_backlight after
	NV96 did it
Date: Mon, 29 Feb 2016 00:28:00 +0000
Message-ID: <bug-86539-8800-eGHzFE36Pj@http.bugs.freedesktop.org/>
References: <bug-86539-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1765194732=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86539-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1765194732==
Content-Type: multipart/alternative; boundary="14567056800.d8C13eee.9809";
 charset="UTF-8"


--14567056800.d8C13eee.9809
Date: Mon, 29 Feb 2016 00:28:00 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=86539

--- Comment #10 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Created attachment 122019
  --> https://bugs.freedesktop.org/attachment.cgi?id=122019&action=edit
Hack for registering multiple backlight interfaces

I hacked a little patch to add a counter to "nv_backlight", so that multiple
backlight interfaces won't conflict on registering the same file. If the
counter is 0, no number is added to "nv_backlight" to keep the current
behaviour.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14567056800.d8C13eee.9809
Date: Mon, 29 Feb 2016 00:28:00 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539">bug 86539</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=122019" name="attach_122019" title="Hack for registering multiple backlight interfaces">attachment 122019</a> <a href="attachment.cgi?id=122019&amp;action=edit" title="Hack for registering multiple backlight interfaces">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=86539&amp;attachment=122019'>[review]</a>
Hack for registering multiple backlight interfaces

I hacked a little patch to add a counter to &quot;nv_backlight&quot;, so that multiple
backlight interfaces won't conflict on registering the same file. If the
counter is 0, no number is added to &quot;nv_backlight&quot; to keep the current
behaviour.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14567056800.d8C13eee.9809--

--===============1765194732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1765194732==--
