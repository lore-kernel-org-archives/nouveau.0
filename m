From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91051] GT650M and Nouveau - NOUVEAU(0): [drm] failed
 to set drm interface version.
Date: Thu, 09 Jul 2015 22:17:22 +0000
Message-ID: <bug-91051-8800-DFRiBpS6Iz@http.bugs.freedesktop.org/>
References: <bug-91051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1752864744=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1752864744==
Content-Type: multipart/alternative; boundary="1436480242.FdF31.27895"; charset="UTF-8"


--1436480242.FdF31.27895
Date: Thu, 9 Jul 2015 22:17:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91051

--- Comment #12 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Seems like the short version was too brief, here is a longer one:

Bumblebee likes to disable/pull out the card from under the kernel driver to
safe power. On the userspace it uses a form of GL/GLX proxy.

If you're using recent kernel/mesa you don't need any part for Bumblebee, as
the kernel driver will automatically power up/down the device. On the
userspace, use $DRI_PRIME=1 glxgears to start glxgears with the "other"
(nvidia) card, or just $glxgears to use the integrated (intel) one.

nouveau.runpm=0 disables the automatic power up/down. You might want to
experiment if things work without it.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436480242.FdF31.27895
Date: Thu, 9 Jul 2015 22:17:22 +0000
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
   title="NEW - GT650M and Nouveau - NOUVEAU(0): [drm] failed to set drm interface version."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91051#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GT650M and Nouveau - NOUVEAU(0): [drm] failed to set drm interface version."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91051">bug 91051</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Seems like the short version was too brief, here is a longer one:

Bumblebee likes to disable/pull out the card from under the kernel driver to
safe power. On the userspace it uses a form of GL/GLX proxy.

If you're using recent kernel/mesa you don't need any part for Bumblebee, as
the kernel driver will automatically power up/down the device. On the
userspace, use $DRI_PRIME=1 glxgears to start glxgears with the &quot;other&quot;
(nvidia) card, or just $glxgears to use the integrated (intel) one.

nouveau.runpm=0 disables the automatic power up/down. You might want to
experiment if things work without it.</pre>
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

--1436480242.FdF31.27895--

--===============1752864744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1752864744==--
