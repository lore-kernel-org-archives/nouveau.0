From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86537] [NV96] Unable to handle page request from
 nv50_crtc_prepare
Date: Mon, 24 Nov 2014 13:02:59 +0000
Message-ID: <bug-86537-8800-7IoCETllHb@http.bugs.freedesktop.org/>
References: <bug-86537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1497142221=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86537-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1497142221==
Content-Type: multipart/alternative; boundary="1416834179.cFeD1.28948"; charset="UTF-8"


--1416834179.cFeD1.28948
Date: Mon, 24 Nov 2014 13:02:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86537

--- Comment #3 from l3iggs <j@greyltc.com> ---
Created attachment 109938
  --> https://bugs.freedesktop.org/attachment.cgi?id=109938&action=edit
journalctl when I modprobe nouveau

I've attached my journalctl output when I 'modprobe nouveau' on my MacBook Pro
5,1 which has GeForce 9400M and GeForce 9600M GPUs.

This bug generally occurs during the boot process which prevents the machine
from booting.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416834179.cFeD1.28948
Date: Mon, 24 Nov 2014 13:02:59 +0000
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
   title="NEW - [NV96] Unable to handle page request from nv50_crtc_prepare"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86537#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Unable to handle page request from nv50_crtc_prepare"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86537">bug 86537</a>
              from <span class="vcard"><a class="email" href="mailto:j&#64;greyltc.com" title="l3iggs &lt;j&#64;greyltc.com&gt;"> <span class="fn">l3iggs</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=109938" name="attach_109938" title="journalctl when I modprobe nouveau">attachment 109938</a> <a href="attachment.cgi?id=109938&amp;action=edit" title="journalctl when I modprobe nouveau">[details]</a></span>
journalctl when I modprobe nouveau

I've attached my journalctl output when I 'modprobe nouveau' on my MacBook Pro
5,1 which has GeForce 9400M and GeForce 9600M GPUs.

This bug generally occurs during the boot process which prevents the machine
from booting.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416834179.cFeD1.28948--

--===============1497142221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1497142221==--
