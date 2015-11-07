From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92851] NV34: err: MEM_FAULT
Date: Sat, 07 Nov 2015 04:13:12 +0000
Message-ID: <bug-92851-8800-hJzhqY7XjZ@http.bugs.freedesktop.org/>
References: <bug-92851-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0716976930=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92851-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0716976930==
Content-Type: multipart/alternative; boundary="1446869591.Ad1eEa1.8317"; charset="UTF-8"


--1446869591.Ad1eEa1.8317
Date: Sat, 7 Nov 2015 04:13:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92851

--- Comment #2 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

How to reproduce:

Build, install and use Xfwm4 from git commit:
"compositor: Fix GL without ARB_texture_rectangle"
http://git.xfce.org/xfce/xfwm4/commit/?id=2cfac64

The problem applies to both, DRI3/XPresent and GLX, use_compositing true,
therefore build, install and use Xfwm4 configured:

- DRI3/XPresent - configure --disable-epoxy --enable-xpresent
   Build Configuration for xfwm4:
     Xpresent support:             yes
     Epoxy support:                no

- GLX - configure --disable-xpresent --enable-epoxy
   Build Configuration for xfwm4:
     Xpresent support:             no
     Epoxy support:                yes


1. Log in to xfce4-session

2. Make sure display compositing is enabled:
   $ xfconf-query --channel xfwm4 --property /general/use_compositing
   true

3. Suspend to disk:
   $ systemctl hibernate
   Of course, STD(S4) must be functional and correctly configured

4. RESUME(thaw) from S4

5. Disable display compositing:
   $ xfconf-query --channel xfwm4 --property /general/use_compositing --set
false
   $ xfconf-query --channel xfwm4 --property /general/use_compositing
   false

After this machine need reboot, shuffling multi-user.target & graphical.target
ain't helping.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446869591.Ad1eEa1.8317
Date: Sat, 7 Nov 2015 04:13:11 +0000
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
   title="NEW - NV34: err: MEM_FAULT"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92851#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV34: err: MEM_FAULT"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92851">bug 92851</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
How to reproduce:

Build, install and use Xfwm4 from git commit:
&quot;compositor: Fix GL without ARB_texture_rectangle&quot;
<a href="http://git.xfce.org/xfce/xfwm4/commit/?id=2cfac64">http://git.xfce.org/xfce/xfwm4/commit/?id=2cfac64</a>

The problem applies to both, DRI3/XPresent and GLX, use_compositing true,
therefore build, install and use Xfwm4 configured:

- DRI3/XPresent - configure --disable-epoxy --enable-xpresent
   Build Configuration for xfwm4:
     Xpresent support:             yes
     Epoxy support:                no

- GLX - configure --disable-xpresent --enable-epoxy
   Build Configuration for xfwm4:
     Xpresent support:             no
     Epoxy support:                yes


1. Log in to xfce4-session

2. Make sure display compositing is enabled:
   $ xfconf-query --channel xfwm4 --property /general/use_compositing
   true

3. Suspend to disk:
   $ systemctl hibernate
   Of course, STD(S4) must be functional and correctly configured

4. RESUME(thaw) from S4

5. Disable display compositing:
   $ xfconf-query --channel xfwm4 --property /general/use_compositing --set
false
   $ xfconf-query --channel xfwm4 --property /general/use_compositing
   false

After this machine need reboot, shuffling multi-user.target &amp; graphical.target
ain't helping.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446869591.Ad1eEa1.8317--

--===============0716976930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0716976930==--
