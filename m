From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91284] xf86-video-nouveau fails to build with latest
	xorg
Date: Thu, 09 Jul 2015 21:30:14 +0000
Message-ID: <bug-91284-8800-2XTOtYx5TY@http.bugs.freedesktop.org/>
References: <bug-91284-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1599112662=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91284-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1599112662==
Content-Type: multipart/alternative; boundary="1436477414.efca1.13096"; charset="UTF-8"


--1436477414.efca1.13096
Date: Thu, 9 Jul 2015 21:30:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91284

--- Comment #2 from Vadim Rutkovsky <vrutkovs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
Created attachment 117020
  --> https://bugs.freedesktop.org/attachment.cgi?id=117020&action=edit
Adapt to a new dirty tracking API (v2)

Thanks, this worked, fixed drmmode_set_scanout_pixmap too

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436477414.efca1.13096
Date: Thu, 9 Jul 2015 21:30:14 +0000
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
   title="NEW - xf86-video-nouveau fails to build with latest xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91284#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - xf86-video-nouveau fails to build with latest xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91284">bug 91284</a>
              from <span class="vcard"><a class="email" href="mailto:vrutkovs&#64;redhat.com" title="Vadim Rutkovsky &lt;vrutkovs&#64;redhat.com&gt;"> <span class="fn">Vadim Rutkovsky</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=117020" name="attach_117020" title="Adapt to a new dirty tracking API (v2)">attachment 117020</a> <a href="attachment.cgi?id=117020&amp;action=edit" title="Adapt to a new dirty tracking API (v2)">[details]</a></span>
Adapt to a new dirty tracking API (v2)

Thanks, this worked, fixed drmmode_set_scanout_pixmap too</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436477414.efca1.13096--

--===============1599112662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1599112662==--
