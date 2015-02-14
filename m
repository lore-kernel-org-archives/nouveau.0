From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Sat, 14 Feb 2015 12:22:16 +0000
Message-ID: <bug-87819-8800-Oexc1LJkNP@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1002455967=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87819-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1002455967==
Content-Type: multipart/alternative; boundary="1423916536.2F3be1.15357"; charset="UTF-8"


--1423916536.2F3be1.15357
Date: Sat, 14 Feb 2015 12:22:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87819

--- Comment #14 from Stuart Longland <stuartl-3e+Fe6x+Dsh6S/UX/emfpkB+6BGkLq7r@public.gmane.org> ---
I cannot get this to build:

RC=0 stuartl@vk4msl-mb /usr/src/linux-2.6-stable $ make menuconfig
make: *** No rule to make target `menuconfig'.  Stop.
RC=2 stuartl@vk4msl-mb /usr/src/linux-2.6-stable $ git describe
fatal: No tags can describe 'e616d549c78c27b6b4d4da25a2369b32bb2a99db'.
Try --always, or create some tags.
RC=128 stuartl@vk4msl-mb /usr/src/linux-2.6-stable $ git log -1 | cat
commit e616d549c78c27b6b4d4da25a2369b32bb2a99db
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Fri Feb 6 09:36:12 2015 +1000

    lib: fix drm backend

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423916536.2F3be1.15357
Date: Sat, 14 Feb 2015 12:22:16 +0000
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
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819">bug 87819</a>
              from <span class="vcard"><a class="email" href="mailto:stuartl&#64;longlandclan.yi.org" title="Stuart Longland &lt;stuartl&#64;longlandclan.yi.org&gt;"> <span class="fn">Stuart Longland</span></a>
</span></b>
        <pre>I cannot get this to build:

RC=0 stuartl&#64;vk4msl-mb /usr/src/linux-2.6-stable $ make menuconfig
make: *** No rule to make target `menuconfig'.  Stop.
RC=2 stuartl&#64;vk4msl-mb /usr/src/linux-2.6-stable $ git describe
fatal: No tags can describe 'e616d549c78c27b6b4d4da25a2369b32bb2a99db'.
Try --always, or create some tags.
RC=128 stuartl&#64;vk4msl-mb /usr/src/linux-2.6-stable $ git log -1 | cat
commit e616d549c78c27b6b4d4da25a2369b32bb2a99db
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Fri Feb 6 09:36:12 2015 +1000

    lib: fix drm backend</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423916536.2F3be1.15357--

--===============1002455967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1002455967==--
